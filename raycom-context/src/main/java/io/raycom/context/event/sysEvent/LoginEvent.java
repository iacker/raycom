package io.raycom.context.event.sysEvent;

import io.raycom.context.event.RayComEvent;

/**
 * 登录时间类型
 * @author Administrator
 *
 */
public class LoginEvent extends RayComEvent {

	public LoginEvent(Object source) {  
        super(source);  
    }  
	public LoginEvent() { }  
}
