package io.raycom.context.event.listener;

import io.raycom.context.event.RayComEvent;
import io.raycom.core.application.SpringContextHolder;

public class RaycomEventPublisher {

	 public static RaycomEventListenerContent  eventListenerContent=SpringContextHolder.getBean(RaycomEventListenerContent.class);
	 /** 
     * 发布事件的静态方法 
     */  
    public static void publishEvent(RayComEvent event){  
    	eventListenerContent.publishEvent(event);
    }  
    
}
