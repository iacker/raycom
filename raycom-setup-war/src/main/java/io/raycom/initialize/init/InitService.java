package io.raycom.initialize.init;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import io.raycom.common.service.BaseService;
import io.raycom.common.utils.FreeMarkers;
import io.raycom.common.utils.file.FileUtils;
import io.raycom.common.utils.properties.PropertiesLoader;
import io.raycom.system.framework.collection.RData;

/**
 * 一键部署
 * @author caoshengquan
 * @date 2017-08-22
 * @version 1.0.0
 */
@Service
public class InitService extends BaseService {
	
	private static Logger log = LoggerFactory.getLogger(InitService.class);
	
	private static PropertiesLoader loader = new PropertiesLoader("raycom.properties","raycom-jms.properties");
	
	private static String DB_TYPE_ORACLE = "oracle";
	private static String DB_TYPE_ORACLE_TEMPLATE = "jdbc:oracle:thin:@${dbip}:${dbPort}:${dbName}";
	private static String DB_TYPE_MYSQL = "mysql";
	private static String DB_TYPE_MYSQL_TEMPLATE = "jdbc:mysql://${dbip}:${dbPort}/${dbName}?useUnicode=true&characterEncoding=utf-8";

	@Async
	public void processProperties(RData rdata) {
		Properties p = loader.getProperties();
		setDBProperties(rdata,p);
		setOtherProperties(rdata,p);
		Resource res=new ClassPathResource("raycom.properties");
		Resource webRes=new ClassPathResource("init/web.xml");
		try {
			InitProcessStatic.setRunning();
			List<String> fileCreateList  = getFileList("init/sql/create");
			List<String> fileDataList  = getFileList("init/sql/data");
			InitProcessStatic.setTableTotalProcessNo(fileCreateList.size());
			InitProcessStatic.setDataTotalProcessNo(fileDataList.size());
			p.store(new FileOutputStream(res.getFile()), "");
			InitProcessStatic.setFileProcessNo(1);
			FileUtils.copyFileCover(webRes.getFile().getAbsolutePath(),
					webRes.getFile().getParentFile().getParentFile().getParent()+File.separator+FileUtils.path("web.xml"),
					true); 
			InitProcessStatic.setFileProcessNo(2);
			InitDao.createDB(fileCreateList, fileDataList, p);
			InitProcessStatic.setRunned();
		} catch (FileNotFoundException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			InitProcessStatic.initRun();
		} catch (IOException e) {
			log.error(e.getMessage());
			e.printStackTrace();
			InitProcessStatic.initRun();
		}
	 
	}
	
	private List<String> getFileList(String filePath) throws IOException {
		List<String> fileList = new ArrayList<String>();
        File f = new ClassPathResource(filePath).getFile();
        File fa[] = f.listFiles();
        for (int i = 0; i < fa.length; i++) {
            File fs = fa[i];
            if (fs.isFile()&&fs.getName().endsWith("sql")) {
            	fileList.add(filePath+"/"+fs.getName());
            } 
        }
        return fileList;
	}
	
	private void setDBProperties(RData rdata,Properties p) {
		String driver = "";
		String url = "";
		
		RData dbConfig = new RData();
		dbConfig.set("dbip",  rdata.getString("dbip"));
		dbConfig.set("dbPort",  rdata.getString("dbPort"));
		dbConfig.set("dbName",  rdata.getString("dbName"));
		if(DB_TYPE_ORACLE.equals(rdata.getString("dbType"))) {
			url = FreeMarkers.renderString(DB_TYPE_ORACLE_TEMPLATE, dbConfig);
			driver = "oracle.jdbc.driver.OracleDriver";
		}else if(DB_TYPE_MYSQL.equals(rdata.getString("dbType"))) {
			url = FreeMarkers.renderString(DB_TYPE_MYSQL_TEMPLATE, dbConfig);
			driver = "com.mysql.jdbc.Driver";
		}
		p.setProperty("jdbc.type", rdata.getString("dbType"));
		p.setProperty("jdbc.driver", driver);
		p.setProperty("jdbc.url", url);
		p.setProperty("jdbc.username", rdata.getString("dbUser"));
		p.setProperty("jdbc.password", rdata.getString("dbPasswd"));
	}
	
	private void setOtherProperties(RData rdata,Properties p) {
		p.setProperty("productName", rdata.getString("productName"));
		p.setProperty("init.finish", "Y");
		p.setProperty("uploadPath", rdata.getString("productFile"));
		p.setProperty("log4j.home", rdata.getString("productLogFile"));
		
		p.setProperty("mq.run", rdata.getString("mqIsRun"));
		p.setProperty("mq.model", rdata.getString("mqModel"));
		p.setProperty("tcpAddress", rdata.getString("mqAddress"));
		
		p.setProperty("base.usc.url", rdata.getString("upsUrl"));
		
		p.setProperty("email.host", rdata.getString("emailHost"));
		p.setProperty("email.port", rdata.getString("emailPort"));
		p.setProperty("email.password", rdata.getString("emailPasswd"));
		p.setProperty("email.username", rdata.getString("emailUsername"));
		p.setProperty("email.sendFrom", rdata.getString("emailSendFrom"));
		p.setProperty("email.account", rdata.getString("emailAccount"));
	}
	
}
