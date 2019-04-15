package io.raycom.web.bean;

import java.io.Serializable;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import io.raycom.context.bean.SystemRole;
import io.raycom.context.bean.SystemUser;

/**
	 * 授权用户信息
	 */
public class Principal implements Serializable {

		private static final long serialVersionUID = 1L;
		
		private String id; // 编号
		private String loginName; // 登录名
		private String name; // 姓名
		private String loginFailPath; // 登录退出低值
		private boolean mobileLogin; // 是否手机登录
		private boolean appLogin; // 是否手机登录
		private List<SystemRole> role; // 是否手机登录

		public Principal(SystemUser user, boolean mobileLogin,List<SystemRole> role, boolean appLogin,String loginFailPath) {
			this.id = user.getId();
			this.loginName = user.getLoginName();
			this.name = user.getName();
			this.mobileLogin = mobileLogin;
			this.appLogin = appLogin;
			this.role = role;
			this.loginFailPath = loginFailPath;
		}

		public List<SystemRole> getRole() {
			return role;
		}

		public void setRole(List<SystemRole> role) {
			this.role = role;
		}


		public String getId() {
			return id;
		}

		public String getLoginName() {
			return loginName;
		}

		public String getName() {
			return name;
		}

		public boolean isMobileLogin() {
			return mobileLogin;
		}
		
		public void setMobileLogin(boolean mobileLogin) {
			this.mobileLogin=mobileLogin;
		}

		public boolean isAppLogin() {
			return appLogin;
		}

		public void setAppLogin(boolean appLogin) {
			this.appLogin = appLogin;
		}

		public String getLoginFailPath() {
			return loginFailPath;
		}

		public void setLoginFailPath(String loginFailPath) {
			this.loginFailPath = loginFailPath;
		}

		/**
		 * 获取SESSIONID
		 */
		public String getSessionid() {
			try{
				return (String) getSession().getId();
			}catch (Exception e) {
				return "";
			}
		}
		
		public static Session getSession(){
			try{
				Subject subject = SecurityUtils.getSubject();
				Session session = subject.getSession(false);
				if (session == null){
					session = subject.getSession();
				}
				if (session != null){
					return session;
				}
			}catch (InvalidSessionException e){
				
			}
			return null;
		}
		
		@Override
		public String toString() {
			return id;
		}

	}