package io.raycom.web.support.mvc.listener;

import javax.servlet.ServletContext;

import org.springframework.web.context.WebApplicationContext;

import io.raycom.web.support.security.service.SecurityService;

public class WebContextListener extends org.springframework.web.context.ContextLoaderListener {
	
	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
		if (!SecurityService.printKeyLoadMessage()){
			return null;
		}
		return super.initWebApplicationContext(servletContext);
	}
}
