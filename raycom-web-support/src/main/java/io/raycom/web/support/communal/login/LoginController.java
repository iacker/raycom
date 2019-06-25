package io.raycom.web.support.communal.login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;

import io.raycom.common.cache.CacheUtils;
import io.raycom.common.config.Constant;
import io.raycom.common.config.Global;
import io.raycom.context.bean.SystemUser;
import io.raycom.utils.lang.CookieUtils;
import io.raycom.utils.string.IdGen;
import io.raycom.utils.string.StringUtils;
import io.raycom.web.bean.Principal;
import io.raycom.web.servlet.ValidateCodeServlet;
import io.raycom.web.support.mvc.controller.BaseController;
import io.raycom.web.support.security.LoginValidater;
import io.raycom.web.support.security.shiro.filter.FormAuthenticationFilter;
import io.raycom.web.support.security.shiro.session.SessionDAO;
import io.raycom.web.support.utils.user.UserUtils;

/**
 * 
 * @author caoshengquan
 * @version   
 *       1.0, 2015年10月6日 下午12:16:00
 */
@Controller
public class LoginController extends BaseController{
	
	@Autowired
	private SessionDAO sessionDAO;
	
	@Value("${loginPage}")
	private String loginPage;
	
	@Value("${mainPage}")
	private String mainPage;
	
	/**
	 * 管理登录
	 */
	@RequestMapping(value = "${adminPath}/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
		Principal principal = UserUtils.getPrincipal();
		logger.debug("principal, Principal {}",principal);
		if (logger.isDebugEnabled()){
			logger.debug("login, active session size: {}", sessionDAO.getActiveSessions(false).size());
		}
		
		// 如果已登录，再次访问主页，则退出原账号。
		if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))){
			CookieUtils.setCookie(response, "LOGINED", "false");
		}
		
		// 如果已经登录，则跳转到管理首页
		if(principal != null && !principal.isMobileLogin()&&!principal.isAppLogin()){
			logger.debug("principal, active session MobileLogin");
			return "redirect:" + adminPath;
		}
		if ("XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))) {
			logger.debug("principal, active session XMLHttpRequest");
			if(principal==null)
				return renderString(response, "LOGINED_TIME_OUT");
			else
				return renderString(response, principal);
		}
		
		if(principal != null &&principal.isAppLogin()) {
			return renderString(response, UserUtils.getCache("jwt"));
		}
		
		logger.debug("principal, active session loginPage");
		String loginpath = WebUtils.getCleanParam(request, "loginpath");
		if(!StringUtils.isEmpty(loginpath)) {
			return loginpath;
			
		}
		return loginPage;
	}

	/**
	 * 登录失败，真正登录的POST请求由Filter完成
	 */
	@RequestMapping(value = "${adminPath}/login", method = RequestMethod.POST)
	public String loginFail(HttpServletRequest request, HttpServletResponse response, Model model) {
		Principal principal = UserUtils.getPrincipal();
		
		// 如果已经登录，则跳转到管理首页
		if(principal != null){
			return "redirect:" + adminPath;
		}

		String username = WebUtils.getCleanParam(request, FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);
		String loginFailPath = WebUtils.getCleanParam(request, FormAuthenticationFilter.DEFAULT_LOGIN_FAIL_PATH_PARAM);
		boolean rememberMe = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM);
		boolean mobile = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_MOBILE_PARAM);
		String exception = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
		String message = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM);
		
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM, rememberMe);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_MOBILE_PARAM, mobile);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);
		
		if (StringUtils.isBlank(message) || StringUtils.equals(message, "null")){
			message = "用户或密码错误, 请重试.";
			request.setAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);
		}
		
		if (logger.isDebugEnabled()){
			logger.debug("login fail, active session size: {}, message: {}, exception: {}", 
					sessionDAO.getActiveSessions(false).size(), message, exception);
		}
		
		// 非授权异常，登录失败，验证码加1。
		if (!UnauthorizedException.class.getName().equals(exception)){
			model.addAttribute("isValidateCodeLogin", LoginValidater.isValidateCodeLogin(username, true, false));
		}
		
		// 验证失败清空验证码
		request.getSession().setAttribute(ValidateCodeServlet.VALIDATE_CODE, IdGen.uuid());
		
		//如果是手机登录，则返回JSON字符串
		if (mobile){
	        return renderString(response, model);
		}
		/*if(principal.isAppLogin()) {
			return renderString(response, UserUtils.getCache("jwt"));
		}*/
		
		/**
		 * 如果存在指定的登录路径，则跳转到指定的路径
		 */
		String loginFailPathSession =(String)request.getSession().getAttribute(FormAuthenticationFilter.DEFAULT_LOGIN_FAIL_PATH_PARAM);
		if (!StringUtils.isEmpty(loginFailPath)){
			return loginFailPath ;
		}
		
		if (!StringUtils.isEmpty(loginFailPathSession)){
			return loginFailPathSession ;
		}
		String loginpath = WebUtils.getCleanParam(request, "loginpath");
		
		if(!StringUtils.isEmpty(loginpath)) {
			return loginpath;
			
		}
		
		return loginPage;
	}

	/**
	 * 登录成功，进入管理首页
	 */
	@RequiresPermissions("user")
	@RequestMapping(value = "${adminPath}")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		Principal principal = UserUtils.getPrincipal();
		SystemUser user = UserUtils.getUser();
		// 登录成功后，验证码计算器清零
		LoginValidater.isValidateCodeLogin(principal.getLoginName(), false, true);
		
		if (logger.isDebugEnabled()){
			logger.debug("show index, active session size: {}", sessionDAO.getActiveSessions(false).size());
		}
		
		// 如果已登录，再次访问主页，则退出原账号。
		if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))){
			String logined = CookieUtils.getCookie(request, "LOGINED");
			if (StringUtils.isBlank(logined) || "false".equals(logined)){
				CookieUtils.setCookie(response, "LOGINED", "true");
			}else if (StringUtils.equals(logined, "true")){
				UserUtils.getSubject().logout();
				return "redirect:" + adminPath + "/login";
			}
		}
		//存在非法登录信息则推出
		if(!StringUtils.isEmpty(user.getInvalidLoginMsg())) {
			request.setAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, user.getInvalidLoginMsg());
			model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, user.getInvalidLoginMsg());
			UserUtils.getSubject().logout();
			String loginFailPathSession = principal.getLoginFailPath();
			if(!StringUtils.isEmpty(loginFailPathSession)) {
				return loginFailPathSession;
			}
			return "redirect:" + adminPath + "/login";
		}
		// 如果是手机登录，则返回JSON字符串
		if (principal.isMobileLogin()){
				return renderString(response, principal);
		}
		if(principal.isAppLogin()) {
			return renderString(response, UserUtils.getCache("jwt"));
		}
		return mainPage;
	}


	/**
	 * 移动端检测是否在线
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "${adminPath}/chkLogin")
	public String chklogin(HttpServletRequest request, HttpServletResponse response) {
		Principal principal = UserUtils.getPrincipal();

		return renderString(response, principal);
	}
	
	/**
	 * 移动端检测是否在线
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "${adminPath}/setMobileLogin")
	public String setMobileLogin(HttpServletRequest request, HttpServletResponse response) {
		Principal principal = UserUtils.getPrincipal();
		boolean mobile = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_MOBILE_PARAM);
		principal.setMobileLogin(mobile);
		return "";
	}
	
	/**
	 * 获取主题方案
	 *//*
	@RequestMapping(value = "/theme/{theme}")
	public String getThemeInCookie(@PathVariable String theme, HttpServletRequest request, HttpServletResponse response){
		if (StringUtils.isNotBlank(theme)){
			CookieUtils.setCookie(response, "theme", theme);
		}else{
			theme = CookieUtils.getCookie(request, "theme");
		}
		return "redirect:"+request.getParameter("url");
	}
	*/
	
	
	/**
	 * 是否是验证码登录
	 * @param useruame 用户名
	 * @param isFail 计数加1
	 * @param clean 计数清零
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static boolean isValidateCodeLogin(String useruame, boolean isFail, boolean clean){
		Map<String, Integer> loginFailMap = (Map<String, Integer>)CacheUtils.get("loginFailMap");
		if (loginFailMap==null){
			loginFailMap = Maps.newHashMap();
			CacheUtils.put("loginFailMap", loginFailMap);
		}
		Integer loginFailNum = loginFailMap.get(useruame);
		if (loginFailNum==null){
			loginFailNum = 0;
		}
		if (isFail){
			loginFailNum++;
			loginFailMap.put(useruame, loginFailNum);
		}
		if (clean){
			loginFailMap.remove(useruame);
		}
		//return loginFailNum >= 3;//取消验证码
		return false;
	}
	
	@RequestMapping(value = "${adminPath}/main/menuId/record")
	@ResponseBody
	public  String menuIdRecord(){
			UserUtils.putCache(Constant.CACHE_MENU_CLICK, rdata.getString("menuClickId"));
		return "";
	}
	
}
