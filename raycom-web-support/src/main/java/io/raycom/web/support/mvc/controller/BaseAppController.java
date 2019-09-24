/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/csq/raycom">Raycom</a> All rights reserved.
 */
package io.raycom.web.support.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JavaType;

import io.raycom.common.config.Constant;
import io.raycom.common.config.Global;
import io.raycom.common.mapper.JsonMapper;
import io.raycom.core.collection.RData;
import io.raycom.core.collection.RMultiData;
import io.raycom.web.bean.Page;
import io.raycom.web.controller.RaycomController;
import io.raycom.web.support.utils.user.UserUtils;

/**
 * 控制器支持类
 * @author caoshengquan
 * @version 2013-3-23
 */
public abstract class BaseAppController extends RaycomController{

	@ModelAttribute
	public void getRdata(@RequestParam HashMap<String, String> map,HttpServletRequest request,@RequestParam HashMap<String, String[]> maplist) {
		rdata = new RData();
		page = null;
		rdata.putAll(map);
		String sysOrgId = map.get("sysOrgId");
		Global.setSysLocalOrgId(sysOrgId);//切换数据源
		rdata.put("currentUser",  map.get("userId"));
		rdata.put("currentOrgId", sysOrgId);
		
		if(rdata.containsKey("draw")){
			page= new Page<RData>(rdata);
			processPageData(request.getRequestURI());
		}
		
		if(rdata.containsKey("urlAction")){
			processUrlActionData(request.getRequestURI());
		}
		
		Map<String, String[]> parameterMap = request.getParameterMap();
		mdata = new RMultiData();
		for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
			for (int i = 0; i <entry.getValue().length; i++) {
				mdata.add(entry.getKey(), entry.getValue()[i]);
			}
		}
	}
	
	private void processUrlActionData(String uri){
		UserUtils.putCache(Constant.CACHE_ACTION_URL+uri, rdata.getString("urlAction"));
		UserUtils.putCache(Constant.CACHE_PRE_URL, uri);
	}
	
	private void processPageData(String uri){
		if(page.param!=null){
			if(rdata.getBoolean("isDtRealQuest")){//采用页面传输数据，则将查询条件保存到缓存中
				UserUtils.putCache("isDtRealQuest"+uri, rdata.clone());
			}else{
				RData sessionRdata = (RData)UserUtils.getCache("isDtRealQuest"+uri);
				String preUrl = (String)UserUtils.getCache(Constant.CACHE_PRE_URL);
				String preUrlAction = (String)UserUtils.getCache(Constant.CACHE_ACTION_URL+preUrl);
				if(sessionRdata!=null){
					if("cancel".equals(preUrlAction)){
						UserUtils.removeCache(Constant.CACHE_PRE_URL);
						if(sessionRdata.containsKey("start"))
							page.setStart(sessionRdata.getInt("start"));
						if(sessionRdata.containsKey("draw"))
							page.setDraw(sessionRdata.getInt("draw"));
						if(sessionRdata.containsKey("length"))
							page.setLength(sessionRdata.getInt("length"));
					}else{
						sessionRdata.remove("start");
						sessionRdata.remove("draw");
						sessionRdata.remove("length");
					}
					
					page.sessionRdata = sessionRdata.clone();
					page.param = sessionRdata;
					rdata= sessionRdata;
				}
				
			}
		}
	}
	
	protected void getMDataByJsonDt() {
		String jsonDt = rdata.getString("jsonDt");
		mdata.remove("jsonDt");
		JsonMapper js =JsonMapper.getInstance();
		JavaType jt = js.createCollectionType(ArrayList.class,HashMap.class);
		ArrayList<HashMap<String, String>> s = (ArrayList<HashMap<String, String>>)js.fromJson(jsonDt,jt);
		for (HashMap<String, String> map : s) {
			Set<String> set =  map.keySet();
			for (String str : set) {
				mdata.add(str, map.get(str));
			}
		}
		mdata.add("currentUser", UserUtils.getUser().getId());
		rdata = mdata.getRData(0);
	}
	
}
