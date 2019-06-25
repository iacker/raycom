package io.raycom.components.jms.helper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import io.raycom.components.jms.message.JmsRaycomTemple;
import io.raycom.core.application.SpringContextHolder;
/**
 * 使用示例：JmsHelper.sendAsyncMsg(obj,JmsConstant.COM_CODE_FR_USC);
 * @author lake
 *
 */
@Component
public class JmsRaycomHelper{
	
	private static JmsRaycomTemple jmsRaycomTemple;
	
	private static JmsRaycomTemple getJmsRaycomTemple(){
		if (jmsRaycomTemple ==  null){
			jmsRaycomTemple = SpringContextHolder.getBean("jmsTemplate");
		}
		return jmsRaycomTemple;
	}
	
	
	@Async
	public static void  sendAsyncMsg(Object obj,String destinationName){
		getJmsRaycomTemple().sendMessage(obj, destinationName);
	}
	
	public static void sendMsg(Object obj,String destinationName){
		getJmsRaycomTemple().sendMessage(obj, destinationName);
	}
}

