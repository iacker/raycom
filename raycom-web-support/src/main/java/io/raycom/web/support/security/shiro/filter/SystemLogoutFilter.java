package io.raycom.web.support.security.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;

import io.raycom.utils.string.StringUtils;
import io.raycom.web.bean.Principal;

public class SystemLogoutFilter extends LogoutFilter {
    
    @Override
    protected String getRedirectUrl(ServletRequest request, ServletResponse response, Subject subject) {
    	
    	Principal principal = (Principal)subject.getPrincipal();
    	String loginFailPathSession="";
    	if (principal != null){
    		loginFailPathSession = principal.getLoginFailPath();
		}
    	
		if (!StringUtils.isEmpty(loginFailPathSession)){
			if ( StringUtils.startsWith(loginFailPathSession, "redirect:")){
				loginFailPathSession = StringUtils.replace(loginFailPathSession, "redirect:", "");
			}
			return loginFailPathSession ;
		}
        return getRedirectUrl();
    }
}