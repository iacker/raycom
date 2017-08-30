package io.raycom.modules.sys.role;

import io.raycom.common.web.BaseController;
import io.raycom.system.framework.collection.RData;
import io.raycom.system.framework.collection.RMultiData;
import io.raycom.system.framework.persistence.Page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 角色Controller
 * @author sunlianhui
 * @version 2016-04-16
 */
@Controller
@RequestMapping(value = "${adminPath}/role")
public class RoleController extends BaseController {

	@Autowired
	private RoleService roleService;
	
	/** 
	 * 进入列表页面
	 * @return
	 */
	@RequestMapping(value = {"list", ""})
	public String list() {
		return "sys/role/roleList";
	}
	
	/**
	 * 进入新增页面
	 * @return
	 */
	@RequestMapping(value ="add")
	public String add() {
		return "sys/role/roleAdd";
	}
	
	/**
	 * 角色权限新增保存
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value ="createRole")
	@ResponseBody
	public String createRole() {
		getMDataByJsonDt();
		RMultiData mData= new RMultiData();
		RData permission  = new RData();
		
		for (int i = 0; i < mdata.getDataCount("menuPid"); i++) {
			String pid = mdata.getString("menuPid",i);
			permission.put(pid,
					permission.getString(pid)+
					","+
					mdata.getString("permissionCode",i)
					);//拼接按钮，结果：menuId:,xxxx,xxx,xxx	
		}

		for (int i = 0; i < mdata.getDataCount("menuId"); i++) {
			String menuId = mdata.getString("menuId", i);
			mData.add("menuId", menuId);
			mData.add("permissionCode", permission.getString(menuId));
			mData.add("currentUser", rdata.getString("currentUser"));
		}
		String msg = roleService.createRole(rdata,mData);
		return msg;
	}

	/**
	 * 角色列表显示
	 * @return
	 */
	@RequestMapping(value = "queryRoleList")
	@ResponseBody
	public Page<RData> queryRoleList() {
		roleService.getAllRole(page);
		return page;	
	}
	
	/**
	 * 删除
	 * @return
	 */
	@RequestMapping(value = "deleteRoleAndPercodes")
	public String deleteRoleAndPercodes(){
		roleService.deleteRoleAndPercodes(rdata);
		return "redirect:" + adminPath + "/role";
	}
	
	/**
	 * 验证用户关联
	 * @return
	 */
	@RequestMapping(value ="checkedUser")
	@ResponseBody
	public String checkedUser(){
		return roleService.checkedUser(rdata);
	}
	
	/**
	 * 进入角色权限修改页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "queryDetail")
	public String detail(Model model){
		RData data = roleService.queryDetail(rdata);
		model.addAttribute("data", data);
		return "sys/role/roleDetail";
	}
	
	/**
	 * 角色权限修改保存
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "updateRole")
	@ResponseBody
	public String updateRole(){
		getMDataByJsonDt();
		RMultiData mData = new RMultiData();
		RData permission  = new RData();
		
		for (int i = 0; i < mdata.getDataCount("menuPid"); i++) {
			String pid = mdata.getString("menuPid",i);
			permission.put(pid,
					permission.getString(pid)+
					","+
					mdata.getString("permissionCode",i)
					);//拼接按钮，结果：menuId:,xxxx,xxx,xxx
		}
		
		for (int i = 0; i < mdata.getDataCount("menuId"); i++) {
			String menuId = mdata.getString("menuId", i);
			mData.add("roleId", rdata.getString("roleId"));
			mData.add("menuId", menuId);
			mData.add("permissionCode", permission.getString(menuId));	
			mData.add("currentUser", rdata.getString("currentUser"));
		}
		
		String msg = roleService.updateRole(rdata,mData);
		return msg;
	}
	
	/**
	 * 空菜单及按钮显示
	 * @return
	 */
	@RequestMapping(value= "getAllMenu")
	@ResponseBody
	public List<RData> getAllMenu(){
		return roleService.getAllMenu();
	}
	
	/**
	 * 菜单及存在按钮显示
	 * @return
	 */
	@RequestMapping(value= "queryAllPermission")
	@ResponseBody
	public List<RData> queryAllPermission(){
		return roleService.queryAllPermission(rdata);
	}
	
}
