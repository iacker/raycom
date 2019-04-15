/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/csq/raycom">Raycom</a> All rights reserved.
 */
package io.raycom.web.support.security.shiro.token;

/**
 * 用户和密码（包含验证码）令牌类
 * @author caoshengquan
 * @version 2013-5-19
 */
public class UsernamePasswordToken extends org.apache.shiro.authc.UsernamePasswordToken {

	private static final long serialVersionUID = 1L;

	private String captcha;
	private boolean mobileLogin;
	private boolean appLogin;
	private String loginFailPath; // 登录退出低值
	
	public UsernamePasswordToken() {
		super();
	}

	public UsernamePasswordToken(String username, char[] password,
			boolean rememberMe, String host, String captcha, boolean mobileLogin) {
		super(username, password, rememberMe, host);
		this.captcha = captcha;
		this.mobileLogin = mobileLogin;
		this.appLogin = false;
	}
	public UsernamePasswordToken(String username, char[] password,
			boolean rememberMe, String host, String captcha, boolean mobileLogin, boolean appLogin,String loginFailPath) {
		super(username, password, rememberMe, host);
		this.captcha = captcha;
		this.mobileLogin = mobileLogin;
		this.appLogin = appLogin;
		this.loginFailPath = loginFailPath;
	}

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public boolean isMobileLogin() {
		return mobileLogin;
	}
	
	public boolean isAppLogin() {
		return appLogin;
	}

	public String getLoginFailPath() {
		return loginFailPath;
	}

	public void setLoginFailPath(String loginFailPath) {
		this.loginFailPath = loginFailPath;
	}
	
}