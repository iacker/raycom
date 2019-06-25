package io.raycom.components.jms.listener;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.connection.SingleConnectionFactory;
import org.springframework.jms.listener.DefaultMessageListenerContainer;

import io.raycom.common.config.Constant;
import io.raycom.components.jms.bean.JmsTask;
import io.raycom.components.jms.destination.RaycomDestinationFactory;
import io.raycom.components.support.properties.JmsProperties;
import io.raycom.components.util.log.RaycomLog;
import io.raycom.context.event.listener.RaycomEventPublisher;
import io.raycom.core.application.SpringContextHolder;
import io.raycom.core.collection.RData;
import io.raycom.utils.string.StringUtils;

public class RaycomMessageListenerContainer extends
		DefaultMessageListenerContainer implements MessageListener {
	
	@Autowired
	private RaycomDestinationFactory raycomDestination;
	
	public String destinationName="-1";
	
	public String taskClassName="";
	
	public String destinationDesc="";
	
	private JmsTask task;
	
	@Resource(name="connectionFactory")
	private SingleConnectionFactory connectionFactory;
	
	@Autowired
	private JmsProperties properties;
	
	@Autowired
	private RaycomLog msgLog;
	
	@Override
	public void onMessage(Message message) {
		TextMessage textMsg = (TextMessage) message;   
		try {
			msgLog.insertMQLog(textMsg.getText(), getRealDestinationName(), "MQ Receive");
		} catch (JMSException e) {
			msgLog.insertExceptionLog(e.getMessage(), getRealDestinationName(), "MQ Exception");
			e.printStackTrace();
		}
		messageHandle(textMsg);
	}
	
	public void messageHandle(TextMessage message) {
		if(task!=null) {
			String msg="";
		    try {
		    	msg=message.getText();
		    	task.messageHandle(msg);
			} catch (JMSException e) {
				e.printStackTrace();
			}catch (Exception e) {
				e.printStackTrace();
				msgLog.insertExceptionLog(msg,destinationDesc, destinationName);
				throw e;
			}
		}
	}
	
	@PostConstruct
	public void init() {
		try {
			if(StringUtils.isNotEmpty(taskClassName)) {
				task = (JmsTask)SpringContextHolder.getBean(Class.forName(taskClassName));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		setMessageListener(this);
		setDestination(raycomDestination.getMQQueue(getRealDestinationName()));
		setConnectionFactory(connectionFactory);
	}

	@Override
	public void afterPropertiesSet() {
		if(isShouldStop()){
			System.out.println("jms服务："+getRealDestinationName()+"关闭");
			stop();
		}else{
			super.afterPropertiesSet();
		}
	}
	
	public String getDestinationName() {
		return destinationName;
	}
	
	private String getRealDestinationName() {
		String destinationName=getDestinationName();
		if(Constant.MQ_MODEL_DEV.equals(properties.mqModel)){
			if(StringUtils.isEmpty(properties.machineName)||"${machine.name}".equals(properties.machineName)) {
				InetAddress addr;
				try {
					addr = InetAddress.getLocalHost();
					destinationName = addr.getHostAddress().toString()+getDestinationName();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
			}else {
				destinationName=properties.machineName+getDestinationName();
			}
			
		}
		return destinationName;
	}
	
	private boolean isShouldStop() {
		boolean stop = properties.include.indexOf(getDestinationName())<0;
		if(stop)
			stop =  Constant.N_VALUE.equals(properties.isRun)||properties.exclude.indexOf(getDestinationName())>0;
		return stop;
	}

	public void setDestinationName(String destinationName) {
		this.destinationName = destinationName;
	}

	public JmsTask getTask() {
		return task;
	}

	public void setTask(JmsTask task) {
		this.task = task;
	}

	public String getTaskClassName() {
		return taskClassName;
	}

	public void setTaskClassName(String taskClassName) {
		this.taskClassName = taskClassName;
	}
	
	public String getDestinationDesc() {
		return destinationDesc;
	}

	public void setDestinationDesc(String destinationDesc) {
		this.destinationDesc = destinationDesc;
	}

}
