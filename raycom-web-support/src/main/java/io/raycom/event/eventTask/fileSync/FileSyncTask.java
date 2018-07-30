package io.raycom.event.eventTask.fileSync;

import java.io.File;
import java.lang.reflect.Field;
import java.nio.charset.Charset;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.support.AllEncompassingFormHttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import io.raycom.core.collection.RData;
import io.raycom.utils.string.StringUtils;

@Component
public class FileSyncTask {

	@Autowired
	public RestTemplate restTemplate;
	
	@Value("${base.rest.url}")
	private String url;
	
	private String urlPath="/fileSync/file";

	
	public String sync(RData rdata) {
		String fileUrl="";
		if(StringUtils.isEmpty(rdata.getString("url"))) {
			fileUrl = url + urlPath;
		}else {
			fileUrl = rdata.getString("url");
		}
	    return sendFile(fileUrl,rdata);  
	}
	
	private String sendFile(String fileUrl,RData rdata) {
		List<HttpMessageConverter<?>> messageConverter = restTemplate.getMessageConverters();
		
		StringHttpMessageConverter  stringHttpMessageConverter=null;
		StringHttpMessageConverter  stringPartHttpMessageConverter=null;
		List<HttpMessageConverter<?>> partConverter  =null;
		for (HttpMessageConverter<?> httpMessageConverter : messageConverter) {
			if(httpMessageConverter instanceof StringHttpMessageConverter){
				stringHttpMessageConverter = (StringHttpMessageConverter)httpMessageConverter;
			}
			if(httpMessageConverter instanceof AllEncompassingFormHttpMessageConverter){
				try {
					Field field = FormHttpMessageConverter.class.getDeclaredField("partConverters");
					field.setAccessible(true);
					List<HttpMessageConverter<?>> partConverters  = (List<HttpMessageConverter<?>>)field.get(httpMessageConverter);
					partConverter = partConverters;
					for (HttpMessageConverter<?> partMessageConverter : partConverters) {
						if(partMessageConverter instanceof StringHttpMessageConverter){
							stringPartHttpMessageConverter = (StringHttpMessageConverter)partMessageConverter;
						}
					}
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (NoSuchFieldException e) {
					e.printStackTrace();
				} catch (SecurityException e) {
					e.printStackTrace();
				}
			}
		}
		
		if(stringHttpMessageConverter!=null){
			messageConverter.remove(stringHttpMessageConverter);
			messageConverter.add(new StringHttpMessageConverter(Charset.forName("UTF-8")));
		}
		
		if(partConverter!=null&&stringPartHttpMessageConverter!=null){
			partConverter.remove(stringPartHttpMessageConverter);
			StringHttpMessageConverter httpConverter = new StringHttpMessageConverter(Charset.forName("UTF-8"));
			httpConverter.setWriteAcceptCharset(false);
			partConverter.add(httpConverter);
		}
		String fileUploadDir = rdata.getString("fileUploadDir");
		String fileUploadPath = rdata.getString("fileUploadPath");
		
		FileSystemResource resource = new FileSystemResource(new File(fileUploadDir+fileUploadPath));  
		MultiValueMap<String, Object> param = new LinkedMultiValueMap<String, Object>();  
		param.add("file", resource);  
		param.add("OriginalFilename", rdata.getString("OriginalFilename"));  
		param.add("fileId", rdata.getString("fileId"));  
		param.add("fileName", rdata.getString("fileName"));  
		
		return restTemplate.postForObject(fileUrl, param, String.class);  
	}
	

	

}
