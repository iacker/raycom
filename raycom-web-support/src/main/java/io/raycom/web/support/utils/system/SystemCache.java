/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/csq/raycom">Raycom</a> All rights reserved.
 */
package io.raycom.web.support.utils.system;
	
import java.util.ArrayList;

import io.raycom.common.cache.CacheUtils;
import io.raycom.common.config.Constant;
import io.raycom.common.config.Global;
import io.raycom.core.application.SpringContextHolder;
import io.raycom.core.collection.RData;
import io.raycom.web.support.communal.dao.UtilDao;

/**
 * 用户工具类
 * @author caoshengquan
 * @version 2013-12-05
 */
public class SystemCache {

	private static UtilDao utilDao ;
	

	private static UtilDao getUtilDao(){
		if (utilDao ==  null){
			utilDao = SpringContextHolder.getBean(UtilDao.class);
		}
		return utilDao;
	}
	
	
	/**
	 * @return 取不到返回 new SystemUser()
	 */
	public static ArrayList<RData> getDynamicDataSource(){
		ArrayList<RData> dataSourceList = (ArrayList<RData>)CacheUtils.get(Constant.SYS_DATASOURCE);
    	
		if (dataSourceList ==  null||dataSourceList.size()==0){
	    	Global.setSysOrgId("1000");
	    	dataSourceList = getUtilDao().getDynamicDataSource();
	    	Global.clearSysOrgId();
	    	
			CacheUtils.put(Constant.SYS_DATASOURCE, dataSourceList);
		}
    	
    	
		return dataSourceList;
	}
	/**
	 * @return 取不到返回 new SystemUser()
	 */
	public static String getDynamicDataSourceNameById(String orgId){
		RData data = getDynamicDataSourceById(orgId);
		
		
		return data.getString("dbName");
	}
	
	public static RData getDynamicDataSourceById(String orgId){
		if("1000".equals(orgId)) return new RData();
		
		ArrayList<RData> dataSourceList = getDynamicDataSource();
    	for (RData data : dataSourceList) {
			if(orgId.equals(data.getString("dbId"))) {
				return data;
			}
		}
		return getDynamicDataSourceByDatabase(orgId);
	}
	
	private static RData getDynamicDataSourceByDatabase(String orgId){
		updatetDynamicDataSource();
		ArrayList<RData> dataSourceList = getDynamicDataSource();
		for (RData data : dataSourceList) {
			if(orgId.equals(data.getString("dbId"))) {
				System.out.println("缓存换数据源为"+orgId);
				return data;
			}
		}
		System.out.println("缓存换数据源为空数据源");
		return new RData();
	}
	
	/**
	 * @return 取不到返回 new SystemUser()
	 */
	public static void updatetDynamicDataSource(){
		CacheUtils.remove(Constant.SYS_DATASOURCE);
		
		Global.setSysOrgId("1000");
		ArrayList<RData> dataSourceList = getUtilDao().getDynamicDataSource();
		Global.clearSysOrgId();
		CacheUtils.put(Constant.SYS_DATASOURCE, dataSourceList);
	}

	
	
}
