/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/csq/raycom">Raycom</a> All rights reserved.
 */
package io.raycom.web.support.security.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.raycom.common.config.Global;
import io.raycom.common.mapper.JsonMapper;
import io.raycom.utils.string.StringUtils;
import io.raycom.web.support.security.shiro.token.JwtToken;
import io.raycom.web.support.security.shiro.token.UsernamePasswordToken;
import io.raycom.web.support.security.shiro.util.Commons;

/**
 * 表单验证（包含验证码）过滤类
 * @author caoshengquan
 * @version 2014-5-19
 */
public class FormAuthenticationFilter extends org.apache.shiro.web.filter.authc.FormAuthenticationFilter {

	public static final String DEFAULT_CAPTCHA_PARAM = "validateCode";
	public static final String DEFAULT_MOBILE_PARAM = "mobileLogin";
	public static final String DEFAULT_APP_PARAM = "appLogin";
	public static final String DEFAULT_MESSAGE_PARAM = "message";
	public static final String DEFAULT_JWT_PARAM = "Authorization";
	public static final String DEFAULT_HOST_PARAM = "deviceID";
	public static final String DEFAULT_LOGIN_ORG_PARAM = "loginOrgId";
	public static final String DEFAULT_LOGIN_FAIL_PATH_PARAM = "loginFailPath";


	private String captchaParam = DEFAULT_CAPTCHA_PARAM;
	private String mobileLoginParam = DEFAULT_MOBILE_PARAM;
	private String appLoginParam = DEFAULT_APP_PARAM;
	private String messageParam = DEFAULT_MESSAGE_PARAM;
	private String loginOrgParam = DEFAULT_LOGIN_ORG_PARAM;
	
    private static final Logger log = LoggerFactory.getLogger(FormAuthenticationFilter.class);

	protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
		String sysOrgId = getSysOrgId(request);
		Global.setSysLocalOrgId(sysOrgId);
		
		AuthenticationToken atoken=null;
		String jwt = ((HttpServletRequest)request).getHeader(DEFAULT_JWT_PARAM);
		if(StringUtils.isEmpty(jwt)) {
			String username = getUsername(request);
			String password = getPassword(request);
			if (password==null){
				password = "";
			}
			boolean rememberMe = isRememberMe(request);
			String host = StringUtils.getRemoteAddr((HttpServletRequest)request);
			String captcha = getCaptcha(request);
			String loginFailPath = getLoginFailPath(request);
			boolean mobile = isMobileLogin(request);
			boolean appLogin = isAppLogin(request);
			atoken =  new UsernamePasswordToken(username, password.toCharArray(), rememberMe, host, captcha, mobile,appLogin,loginFailPath);
		}else {
			String host = ((HttpServletRequest)request).getHeader(DEFAULT_HOST_PARAM);
			atoken =  new JwtToken(host,jwt);
		}
		return atoken;
		
	}

	public String getCaptchaParam() {
		return captchaParam;
	}

	public String getLoginOrgParam() {
		return loginOrgParam;
	}

	protected String getCaptcha(ServletRequest request) {
		return WebUtils.getCleanParam(request, getCaptchaParam());
	}
	
	protected String getLoginFailPath(ServletRequest request) {
		return WebUtils.getCleanParam(request, DEFAULT_LOGIN_FAIL_PATH_PARAM);
	}
	
	protected String getSysOrgId(ServletRequest request) {
		return WebUtils.getCleanParam(request, getLoginOrgParam());
	}

	public String getMobileLoginParam() {
		return mobileLoginParam;
	}
	
	public String getAppLoginParam() {
		return appLoginParam;
	}
	
	protected boolean isMobileLogin(ServletRequest request) {
        return WebUtils.isTrue(request, getMobileLoginParam());
    }
	protected boolean isAppLogin(ServletRequest request) {
		return WebUtils.isTrue(request, getAppLoginParam());
	}
	
	public String getMessageParam() {
		return messageParam;
	}
	
	/**
	 * 登录成功之后跳转URL
	 */
	public String getSuccessUrl() {
		return super.getSuccessUrl();
	}
	
	@Override
	protected void issueSuccessRedirect(ServletRequest request,
			ServletResponse response) throws Exception {
		WebUtils.issueRedirect(request, response, getSuccessUrl(), null, true);
	}
	
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
		if (null != getSubject(request, response) 
				&& getSubject(request, response).isAuthenticated()) {
			return true;
		}
		return false;
	}
	
	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		if (isLoginRequest(request, response)) {
			if (isLoginSubmission(request, response)) {
				if (log.isTraceEnabled()) {
					log.trace("Login submission detected.  Attempting to execute login.");
				}
				return executeLogin(request, response);
			} else {
				if (log.isTraceEnabled()) {
					log.trace("Login page view.");
				}
				// allow them to see the login page ;)
				return true;
			}
		} else {
			if (log.isTraceEnabled()) {
				log.trace("Attempting to access a path which requires authentication.  Forwarding to the "
						+ "Authentication url [" + getLoginUrl() + "]");
			}
			if (Commons.isAjax((HttpServletRequest)request)) {//session失效
				response.setCharacterEncoding("UTF-8");
				response.reset();
		        response.setContentType("application/json");
		        response.setCharacterEncoding("utf-8");
				response.getWriter().print(JsonMapper.toJsonString("-1"));
			} else {// 不是ajax请求
				saveRequestAndRedirectToLogin(request, response);
			}
			return false;
		}
	}

	/**
	 * 登录失败调用事件
	 */
	@Override
	protected boolean onLoginFailure(AuthenticationToken token,
			AuthenticationException e, ServletRequest request, ServletResponse response) {
		String className = e.getClass().getName(), message = "";
		if (IncorrectCredentialsException.class.getName().equals(className)
				|| UnknownAccountException.class.getName().equals(className)){
			message = "用户或密码错误, 请重试.";
		}
		else if (e.getMessage() != null && StringUtils.startsWith(e.getMessage(), "msg:")){
			message = StringUtils.replace(e.getMessage(), "msg:", "");
		}
		else{
			message = "系统出现问题，请稍后再试！";
			e.printStackTrace(); // 输出到控制台
		}
        request.setAttribute(getFailureKeyAttribute(), className);
        request.setAttribute(getMessageParam(), message);
        return true;
	}
	
}