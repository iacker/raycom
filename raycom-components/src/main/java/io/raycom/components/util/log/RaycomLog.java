package io.raycom.components.util.log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import io.raycom.common.config.Global;
import io.raycom.common.mapper.JsonMapper;
import io.raycom.components.util.log.bean.Log;
import io.raycom.components.util.log.dao.LogDao;
import io.raycom.web.support.utils.user.UserUtils;
/**
 * 消息日志类
 * @author Administrator
 *
 */
@Component
public class RaycomLog {
	@Autowired
	private LogDao logdao;
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * rest日志
	 * @param msgBean
	 * @param title
	 * @param method
	 */
	public void insertRestLog(String msgBean,String title,String method){
		Log log = getLogBean(Log.TYPE_REST,msgBean,title,method,"");
		logdao.insert(log);
	}
	
	public void insertLog(String type,String msgBean,String title,String method){
		Log log = getLogBean(type,msgBean,title,method,"");
		logdao.insert(log);
	}
	
	/**
	 * mq日志
	 * @param msgBean
	 * @param title
	 * @param method
	 */
	public void insertMQLog(String msgBean,String title,String method){
		Log log = getLogBean(Log.TYPE_MQ,msgBean,title,method,"");
		logdao.insert(log);
	}
	/**
	 * 邮件日志
	 * @param msgBean
	 * @param title
	 * @param method
	 */
	public void insertMalilLog(String msgBean,String title,String method){
		Log log = getLogBean(Log.TYPE_MSG_MAIL,msgBean,title,method,"");
		logdao.insert(log);
	}
	/**
	 * 短讯日志
	 * @param msgBean
	 * @param title
	 * @param method
	 */
	public void insertSmsLog(String msgBean,String title,String method){
		Log log = getLogBean(Log.TYPE_MSG_SMS,msgBean,title,method,"");
		logdao.insert(log);
	}
	/**
	 * 微信消息日志
	 * @param msgBean
	 * @param title
	 * @param method
	 */
	public void insertMpLog(String msgBean,String title,String method){
		Log log = getLogBean(Log.TYPE_MSG_MP,msgBean,title,method,"");
		logdao.insert(log);
	}
	/**
	 * 异常日志
	 * @param msgBean
	 * @param title
	 * @param method
	 */
	public void insertExceptionLog(String msgBean,String title,String method){
		Log log = getLogBean(Log.TYPE_EXCEPTION,msgBean,title,method,msgBean);
		logdao.insert(log);
	}
	
	/**
	 * 异常数据转为LOG对象
	 * @param restBean
	 * @param title
	 * @param method
	 * @return
	 */
	private Log getLogBean(String type,String content,String title,String method,String exception){
		Log log = new Log();
		log.setType(type);
		log.setParams(JsonMapper.getInstance().toJson(content));
		log.setTitle(title);
		log.setMethod(method);
		log.setException(exception);
		log.setIsNewRecord(true);
		log.setIp(Global.getConfig("machine.name"));
		log.preInsert();
		
		logger.info("日志写入: 类型：{} 标识：{}  内容: {}  主题：{} ", type,method,content,title);
		return log;
	}
	
	

}
