package io.raycom.context.event.listener;

import java.util.List;

import io.raycom.context.event.RayComEvent;

public interface IRayComEventListener {

	 /** 
     * 事件处理的方法 
     */  
    public void onRayComEvent(RayComEvent event);  
      
    /**  
     * 
     * @return list of event class name
     */
    public List<String> getEventClasses();  
}
