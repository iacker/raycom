package io.raycom.modules.sys.dbBackup;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.raycom.utils.string.StringUtils;
import io.raycom.web.service.BaseService;

/**
 * @author guojianmin
 * @version 2014-04-11
 * @version 1.0.0
 */
@Service
@Transactional(readOnly = true)
public class DbBackupService extends BaseService {
	
	@Value("${expFilePath}")
	private  String expFilePath; // 导出文件路径
	@Value("${expFilePrefix}")
	private String expFilePrefix;
	@Value("${dbConn}")
	private String dbConn;
	@Value("${otherCommand}")
	private String otherCommand;
	
	public int backup(String bakFile) throws Exception {

		try {

			File file = new File(expFilePath);
			if (!file.exists())
				file.mkdir();
			
			String fileName = file.toString() + File.separator;
			
			if (StringUtils.isEmpty(bakFile ))
				fileName += this.getNowTime("yyyy-MM-dd") + ".dmp";
			else
				fileName += bakFile;


			String command = "EXP " + dbConn + " " 
							+ "FILE=" + "\""  + fileName + "\" "
							+ otherCommand
							+ " LOG=\""  + fileName + ".exp.log\"";
			
			return this.RunCommand(command);

		} catch (Exception ex) {
			ex.printStackTrace();
			return 1;
		}
	}  

	public int autoBackup() throws Exception {
		return backup("HRP_" + this.getNowTime("yyyyMMddHHmmss")+ ".dmp");
	}

	//内部类
	class StreamThread extends Thread {
		InputStream is;
		String type;
		StreamThread(InputStream is, String type) {
			this.is = is;
			this.type = type;
		}
		public void run() {
			try {
				InputStreamReader isr = new InputStreamReader(is);
				BufferedReader br = new BufferedReader(isr);
				String line = null;
				while ((line = br.readLine()) != null) {
					System.out.println(type + ">" + line);
				}
			} catch (IOException ioe) {
			}
		}
	}


	public int RunCommand(String command) {
		try {
			Process process = Runtime.getRuntime().exec(command);
			new StreamThread(process.getInputStream(), "INFO").start();
			new StreamThread(process.getErrorStream(), "INFO").start();
			int status = process.waitFor();
			return status;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return 2;
	}

	// 获取当天时间
	public String getNowTime(String dateformat) {
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat(dateformat);
		String dateStr = dateFormat.format(now);
		return dateStr;
	}
}
