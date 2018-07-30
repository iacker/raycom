/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/csq/raycom">Raycom</a> All rights reserved.
 */
package io.raycom.web.support.utils.user;
	
import java.util.ArrayList;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import io.raycom.common.cache.CacheUtils;
import io.raycom.common.config.Constant;
import io.raycom.context.bean.SystemUser;
import io.raycom.core.application.SpringContextHolder;
import io.raycom.core.collection.RData;
import io.raycom.utils.string.StringUtils;
import io.raycom.web.bean.Principal;
import io.raycom.web.support.communal.dao.SecurityDao;
import io.raycom.web.support.communal.dao.UtilDao;
import io.raycom.web.support.security.service.SecurityService;

/**
 * 用户工具类
 * @author caoshengquan
 * @version 2013-12-05
 */
public class UserUtils {

	private static UtilDao utilDao ;
	

	private static UtilDao getUtilDao(){
		if (utilDao ==  null){
			utilDao = SpringContextHolder.getBean(UtilDao.class);
		}
		return utilDao;
	}
	
	/**
	 * 根据ID获取用户
	 * @param id
	 * @return 取不到返回null
	 */
	public static SystemUser get(String id){
		SystemUser user = (SystemUser)CacheUtils.get(Constant.USER_CACHE, Constant.USER_CACHE_ID_ + id);
		if (user ==  null){
			user = getUtilDao().getUser(id);
			if (user == null){
				return null;
			}
			user.setRoleList(getUtilDao().getRoleListByUserId(id));
			CacheUtils.put(Constant.USER_CACHE, Constant.USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(Constant.USER_CACHE, Constant.USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}
	
	/**
	 * 根据登录名获取用户
	 * @param loginName
	 * @return 取不到返回null
	 */
	public static SystemUser getByLoginName(String loginName){
		SystemUser user = (SystemUser)CacheUtils.get(Constant.USER_CACHE, Constant.USER_CACHE_LOGIN_NAME_ + loginName);
		if (user == null){
			user = getUtilDao().getByLoginName(loginName);
			if (user == null){
				return null;
			}
			user.setRoleList(getUtilDao().getRoleListByUserId(user.getId()));
			CacheUtils.put(Constant.USER_CACHE, Constant.USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(Constant.USER_CACHE, Constant.USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}
	
	/**
	 * 根据登录名获取用户
	 * @param loginName
	 * @return 取不到返回null
	 */
	public static String getOfficeNameById(String officeId){
		if(officeId==null)
			officeId = getUser().getOfficeId();
		if(StringUtils.isEmpty(officeId)) return "";
		
		String officeName = (String)CacheUtils.get(Constant.USER_CACHE, Constant.USER_CACHE_OFFICE_ID_ + officeId);
		if (officeName == null){
			officeName = getUtilDao().getOfficeNameById(officeId);
			if (officeName == null){
				return "";
			}
			CacheUtils.put(Constant.USER_CACHE, Constant.USER_CACHE_OFFICE_ID_ + officeId, officeName);
		}
		return officeName;
	}
	public static String getOfficeName(){
		return getOfficeNameById(null);
	}

	/**
	 * 将资源数据存储到session中，结构如下：
	 * 1：缓存key：userResource
	 * 2：内部数据（k-v）：
	 *      1：dataCode
	 *      2：arrayList存放具体数据
	 * 3:内部数据（k-v）
	 *      1：dataCode_list
	 *      2:arrayList存放具体value数据
	 * 4:内部数据（k-v）
	 *      1:dataCode_str
	 *      2:逗号分隔存放value数据
	 */
	public static RData getResourceCache(){
		RData resource = (RData)UserUtils.getCache(Constant.USER_CACHE_RESOURCE);
		if(resource==null) {
			RData  rdata = new RData();
			rdata.put("orgId", getUser().getCompanyId());
			rdata.put("userId", getUser().getId());
			rdata.put("roleId", String.join(",", getUser().getRoleIdList()));
			ArrayList<RData>  staticResource;
			ArrayList<RData>  dynamicResource;
			
			if(UserUtils.getUser().isAdmin()) {
				staticResource = getUtilDao().getStaticResourceAll(rdata);
				dynamicResource = getUtilDao().getDynamicResourceAll(rdata);
			}else {
				staticResource = getUtilDao().getStaticResourceByUserId(rdata);
				dynamicResource = getUtilDao().getDynamicResourceByUserId(rdata);
			}
			
			if(staticResource==null) {
				staticResource  =new ArrayList<RData>();
			}
			
			for (RData dynamic : dynamicResource) {
			String dynamicSql = dynamic.getString("value")
											.replaceAll("#{orgId}", rdata.getString("orgId"))
											.replaceAll("#{userId}", rdata.getString("userId"))
											.replaceAll("#{roleId}", rdata.getString("roleId"));
				ArrayList<RData>  DynamicResourceTmp = getUtilDao().dynamicSql(dynamicSql);
				for (RData temp : DynamicResourceTmp) {
					temp.set("dataCode", dynamic.get("dataCode"));
					staticResource.add(temp);
					
				}
			}
			
			ArrayList<RData>  resourceDetail =new ArrayList<RData>();
			ArrayList<String>  resourceList = new ArrayList<String>();
			String  resourceStr;
			resource = new RData();
			UserUtils.putCache(Constant.USER_CACHE_RESOURCE, resource);
			for (RData resourceTmp : staticResource) {
				if(!resource.containsKey(resourceTmp.get("dataCode"))){
					resourceDetail = new ArrayList<RData>();
					resourceList = new ArrayList<String>();
					resourceStr="";
					resource.set(resourceTmp.get("dataCode"), resourceDetail);
					resource.set(resourceTmp.get("dataCode")+Constant.USER_CACHE_RESOURCE_lIST, resourceList);
				}else {
					resourceDetail = (ArrayList<RData>)resource.get(resourceTmp.get("dataCode"));
					resourceList = (ArrayList<String>)resource.get(resourceTmp.get("dataCode")+Constant.USER_CACHE_RESOURCE_lIST);
					resourceStr = resource.getString(resourceTmp.get("dataCode")+Constant.USER_CACHE_RESOURCE_STR);
				}
				resourceDetail.add(resourceTmp);
				resourceList.add(resourceTmp.getString("value"));
				
				resourceStr = ","+resourceTmp.getString("value");
				resource.setString(resourceTmp.get("dataCode")+Constant.USER_CACHE_RESOURCE_STR, resourceStr);
			}
		
		}
		
		return resource;
	}
	/**
	 * 获取数据资源对象列表,name.value
	 */
	public static ArrayList<RData> getResource(String resourceData){
		ArrayList<RData>  resourceDetail =new ArrayList<RData>();
		RData resource = getResourceCache();
		if(resource!=null) {
			resourceDetail =  (ArrayList<RData>)resource.get(resourceData);
		}
		if(resourceDetail==null||resourceDetail.isEmpty())
			return getResourceCodeById(resourceData);
		
		return resourceDetail;
	}
	
	/**
	 * 获取数据资源对象列表
	 */
	public static ArrayList<String> getResourceCodeList(String resourceData){
		ArrayList<String>  resourceDetail =new ArrayList<String>();
		RData resource = getResourceCache();
		if(resource!=null) {
			resourceDetail =  (ArrayList<String>)resource.get(resourceData+Constant.USER_CACHE_RESOURCE_lIST);
		}
		if(resourceDetail==null||resourceDetail.isEmpty()) {
			resourceDetail =new ArrayList<String>();
			ArrayList<RData>  dataList = getResourceCodeById(resourceData);
			for (RData data : dataList) {
				resourceDetail.add(data.getString("value"));
			}
		}
		if(resourceDetail==null||resourceDetail.isEmpty()) {
			resourceDetail.add("null");
		}
		return resourceDetail;
	}
	
	/**
	 * 获取数据资源对象列表
	 */
	public static String getResourceStr(String resourceData){
		RData resource = getResourceCache();
		String resourceStr="";
		if(resource!=null) {
			resourceStr =  resource.getString(resourceData+Constant.USER_CACHE_RESOURCE_STR);
		}
		
		if(StringUtils.isEmpty(resourceStr)) {
			resourceStr="";
			ArrayList<RData>  dataList = getResourceCodeById(resourceData);
			for (RData data : dataList) {
				resourceStr = ","+data.getString("value");
			}
		}
		
		return resourceStr;
	}
	
	private static ArrayList<RData> getResourceCodeById(String resourceData){
		ArrayList<RData> dataList = (ArrayList<RData>)CacheUtils.get(Constant.USER_CACHE_RESOURCE_KEY+resourceData);
		if(dataList==null) {
			dataList = getUtilDao().getStaticResourceByDataKey(resourceData);
			ArrayList<RData>  dynamicResource = getUtilDao().getDynamicResourceByDataKey(resourceData);
			if(dataList==null) {
				dataList  =new ArrayList<RData>();
			}
			for (RData dynamic : dynamicResource) {
				String dynamicSql =  dynamic.getString("value");
				ArrayList<RData>  dynamicResourceTmp = getUtilDao().dynamicSql(dynamicSql);
				for (RData temp : dynamicResourceTmp) {
					temp.set("dataCode", dynamic.get("dataCode"));
					dataList.add(temp);
				}
			}
			CacheUtils.put(Constant.USER_CACHE_RESOURCE_KEY+resourceData, dataList);
			
		}
		return dataList;
	}
	
	public static void setResourceCodeAuthority(RData params,String... resourceData){
		for (String str : resourceData) {
			params.set(str, getResourceCodeList(str));
		}
	}
	
	
	public static void clearResourceCodeCache(String resourceData){
		CacheUtils.remove(Constant.USER_CACHE_RESOURCE_KEY+resourceData);
	}
	
	/**
	 * 清除当前用户缓存
	 */
	public static void clearCache(){
		removeCache(Constant.CACHE_ROLE_LIST);
		removeCache(Constant.CACHE_MENU_LIST);
		removeCache(Constant.CACHE_AREA_LIST);
		UserUtils.clearCache(getUser());
	}
	
	/**
	 * 清除指定用户缓存
	 * @param user
	 */
	public static void clearCache(SystemUser user){
		CacheUtils.remove(Constant.USER_CACHE, Constant.USER_CACHE_ID_ + user.getId());
		CacheUtils.remove(Constant.USER_CACHE, Constant.USER_CACHE_LOGIN_NAME_ + user.getLoginName());
	}
	/**
	 * 获取当前用户
	 * @return 取不到返回 new SystemUser()
	 */
	public static SystemUser getUser(){
		Principal principal = getPrincipal();
		if (principal!=null){
			SystemUser user = get(principal.getId());
			if (user != null){
				return user;
			}
			return new SystemUser();
		}
		// 如果没有登录，则返回实例化空的User对象。
		return new SystemUser();
	}

	
	/**
	 * 获取授权主要对象
	 */
	public static Subject getSubject(){
		return SecurityUtils.getSubject();
	}
	
	/**
	 * 获取当前登录者对象
	 */
	public static Principal getPrincipal(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Principal principal = (Principal)subject.getPrincipal();
			if (principal != null){
				return principal;
			}
		}catch (UnavailableSecurityManagerException e) {
			
		}catch (InvalidSessionException e){
			
		}
		return null;
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
	
	// ============== SystemUser Cache ==============
	
	public static Object getCache(String key) {
		return getCache(key, null);
	}
	
	public static Object getCache(String key, Object defaultValue) {
		Object obj = getSession().getAttribute(key);
		return obj==null?defaultValue:obj;
	}

	public static void putCache(String key, Object value) {
		getSession().setAttribute(key, value);
	}

	public static void removeCache(String key) {
		getSession().removeAttribute(key);
	}
	
	
}
