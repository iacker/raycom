package io.raycom.event.eventTask.fileSync;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import io.raycom.utils.date.DateUtils;
import io.raycom.utils.file.FileUtils;
import io.raycom.utils.string.StringUtils;
import io.raycom.web.support.communal.dao.FileDao;
import io.raycom.web.support.mvc.controller.BaseController;

/**
 * 工具类，将按钮权限导入到按钮权限表中
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "${restPath}/fileSync")
public class FileRestController extends BaseController {
	
	@Value("${uploadPath}")
	protected String fileUploadDir;
	
	@Autowired
	private FileDao fileDao;
	
	
	@ResponseBody  
	@RequestMapping(value = "file", method = RequestMethod.POST)  
	public String upload(String fileName,String fileId,String OriginalFilename, MultipartFile file) {  
		
		fileName= unescapeHtml4(fileName);
		fileId= unescapeHtml4(fileId);
		OriginalFilename= unescapeHtml4(OriginalFilename);
		fileName = fileName.substring(0,fileName.length()-1);
		fileId = fileId.substring(0,fileId.length()-1);
		OriginalFilename = OriginalFilename.substring(0,OriginalFilename.length()-1);
		String fileUploadPath="/extend"+"/"+DateUtils.getDate()+"/"+fileName;
		
	    fileUploadDir=FileUtils.path(fileUploadDir);
	    FileUtils.createDirectory(fileUploadDir+"/extend"+"/"+DateUtils.getDate());//创建上传文件夹
	    
	    rdata.set("fileId", fileId);
	    rdata.set("OriginalFilename", OriginalFilename);
	    rdata.set("fileName", fileName);
	    rdata.set("fileSize", file.getSize());	
	    rdata.set("fileUploadDir", fileUploadDir);
	    rdata.set("fileUploadPath", fileUploadPath);
	    rdata.set("createDate", new Date());
	    rdata.set("error","");
	    
        File f=new File(fileUploadDir+fileUploadPath);  
        try {  
            FileUtils.copyInputStreamToFile(file.getInputStream(),f );  
            fileDao.addFile(rdata);
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
           
	    return "OK";  
	}
	
	public String unescapeHtml4(String input){
		if(StringUtils.isEmpty(input)) return "";
		String  translate  = StringEscapeUtils.unescapeHtml4(input).replaceFirst("\"", "").replaceFirst("&quot;", "").replaceFirst("&quot", "");
		
		return translate;
	}
	
	
	    
		static void changeFile(java.io.File f) throws Exception {
	        if (f.isFile()) {//如果是文件，直接更名
	        	
	        	String fileName= StringEscapeUtils.unescapeHtml4(f.getName()).replaceFirst("\"", "");
	        	fileName = fileName.substring(0,fileName.length()-1);
	        	System.out.println(fileName);
	            f.renameTo(new java.io.File("d:/11/"+ fileName));
	        } else {//如果是文件夹，
	            java.io.File[] fs = f.listFiles();//得到文件夹下的所有文件列表。
	            for (java.io.File f3 : fs)//foreach循环，取文件
	                changeFile(f3);//递归
	        }
	    }
	
}
