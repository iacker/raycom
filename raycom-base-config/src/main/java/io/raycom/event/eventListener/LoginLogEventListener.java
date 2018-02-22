package io.raycom.event.eventListener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import io.raycom.components.util.log.util.LogUtils;
import io.raycom.context.event.RayComEvent;
import io.raycom.context.event.listener.IRayComEventListener;
import io.raycom.context.event.sysEvent.LoginLogEvent;

@Component
public class LoginLogEventListener implements IRayComEventListener{
	

	@Override
	public void onRayComEvent(RayComEvent event) {
		LogUtils.saveLog((HttpServletRequest)event.getSource(), "系统登录");  
	}

	@Override
	public List<String> getEventClasses() {
		List<String> className = new ArrayList<String>();
		className.add(LoginLogEvent.class.getName());
		return className;
	}

}
