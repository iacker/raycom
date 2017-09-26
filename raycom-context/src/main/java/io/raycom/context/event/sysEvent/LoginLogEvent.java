package io.raycom.context.event.sysEvent;

import io.raycom.context.event.RayComEvent;

/**
 * 登录时间类型
 * @author Administrator
 *
 */
public class LoginLogEvent extends RayComEvent {

	public LoginLogEvent(Object source) {  
        super(source);  
    }  
	public LoginLogEvent() { }  
}
