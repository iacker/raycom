package io.raycom.initialize.init;

import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.raycom.common.utils.file.FileUtils;

public class InitDao{
	private static Logger log = LoggerFactory.getLogger(InitDao.class);

	private static Connection getConn(Properties p) {
		
	    String driver = p.getProperty("jdbc.driver");
	    String url =  p.getProperty("jdbc.url");
	    String username =  p.getProperty("jdbc.username");
	    String password =  p.getProperty("jdbc.password");
	    Connection conn = null;
	    try {
	        Class.forName(driver); //classLoader,加载对应驱动
	        conn = (Connection) DriverManager.getConnection(url, username, password);
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return conn;
	}
	
	public static void createDB(List<String> fileCreateList,List<String> fileDataList,Properties p) {  
        try {
            Connection conn =getConn(p);
            ScriptRunner runner = new ScriptRunner(conn);
            Resources.setCharset(Charset.forName("UTF-8"));   
            runner.setLogWriter(null);//设置是否输出日志
            int i=0;
            for (String fileName : fileCreateList) {
            	runner.runScript(Resources.getResourceAsReader(fileName));
            	InitProcessStatic.setTableProcessNo(++i);
			}
            i=0;
            for (String fileName : fileDataList) {
            	runner.runScript(Resources.getResourceAsReader(fileName));
            	InitProcessStatic.setDataProcessNo(++i);
            }
            runner.closeConnection();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

	}  
	
}