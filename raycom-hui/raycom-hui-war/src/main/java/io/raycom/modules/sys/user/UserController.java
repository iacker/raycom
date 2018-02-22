package io.raycom.modules.sys.user;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import io.raycom.core.collection.RData;
import io.raycom.web.bean.Page;
import io.raycom.web.support.mvc.controller.BaseController;
import io.raycom.web.support.security.service.SecurityService;


/**
 * 用户Controller
 * @author wx 
 * @data 2016-4-14
 */
@Controller
@RequestMapping(value = "${adminPath}/user")
public class UserController extends BaseController{
	@Autowired
	private UserService userService;
	
	/**
	 * 进入初始界面
	 */
	@RequestMapping(value = {"list", ""})
	public String list(Model model) {
		ArrayList<RData> roleList=userService.getRoleList();
		model.addAttribute("role", roleList);
		return "sys/user/userList";
	}
	
	/**
	 * 查询用户列表
	 * @return
	 */
	@RequestMapping(value = "queryUserList")
	@ResponseBody
	public Page<RData> queryUserList() {
		userService.getAllUser(page);
		return page;
	}
	
	/**
	 * 查询用户列表
	 * @return
	 */
	@RequestMapping(value = "queryUserListForPopup")
	@ResponseBody
	public Page<RData> getAllUserForPopup() {
		userService.getAllUserForPopup(page);
		return page;
	}

	/**
	 * 获取所有部门，用于树形显示
	 * 
	 */
	@RequestMapping(value ="getAllOfficeNodes")
	@ResponseBody
	public List<RData> getAllOfficeNodes(){
		return userService.getOfficeList();
	}
	
	/**
	 * 进入新增界面
	 */
	@RequestMapping(value ="add")
	public String add(Model model) {
		ArrayList<RData> roleList=userService.getRoleList();
		model.addAttribute("role", roleList);
		model.addAttribute("querOfficeList", userService.querOfficeList());
		return "sys/user/userAdd";
	}
	
	/**
	 * 新增用户
	 */
	@RequestMapping(value ="createUserDo")
	@ResponseBody
	public String createUserDo() {
		String password = SecurityService.entryptPassword(rdata.getString("password"));
		rdata.set("password", password);
		if(rdata.getString("roleId").equals("null")){
			rdata.setString("roleId", "");
		}
		return userService.createUserDo(rdata);
	}
	
		
	/**
	 * 重置密码
	 */
	@RequestMapping(value ="resetPass")
	@ResponseBody
	public String resetPass() {
		String password = SecurityService.entryptPassword("123456");
		rdata.set("password", password);
		userService.resetPwd(rdata);
		return "重置成功！";
	}
	/**
	 * 进入修改界面
	 */
	@RequestMapping(value ="update")
	public String update(Model model) {
		ArrayList<RData> userRole = userService.getUserRole(rdata);
		String roleId="";
		if(userRole != null && userRole.size() > 0){
			for (Iterator iterator = userRole.iterator(); iterator.hasNext();) {
				RData rData = (RData) iterator.next();
				roleId+=(rData.getString("roleId")+",");
			}
			roleId = roleId.substring(0,roleId.length()-1);
		}

		RData  user=userService.getUser(rdata);
		ArrayList<RData> roleList=userService.getRoleList();
		model.addAttribute("querOfficeList", userService.querOfficeList());
		model.addAttribute("role", roleList);
		model.addAttribute("userRole", roleId);
		model.addAttribute("user", user);
		return "sys/user/userUpdate";
	}
	
	
	/**
	 * 修改用户信息
	 */
	@RequestMapping(value ="updateUserDo")
	@ResponseBody
	public void updateUserDo() {
		if(rdata.getString("roleId").equals("null")){
			rdata.setString("roleId", "");
		}
		userService.updateUserDo(rdata);
	}
	
	/**
	 * 删除用户以及角色
	 */
	@RequestMapping(value ="deleteUserDo")
	public String deleteUserDo() {
		userService.deleteUser(rdata);
		userService.deleteUserRole(rdata);
		return "sys/user/userList";
	}
	
	/**
	 * 用户模态窗口
	 * @return
	 */
	@RequestMapping(value="userInfo")
	public String userInfo(Model model){
		model.addAttribute("rdata", rdata);
		return "sys/user/userInfoP";
	}
	
	/**
	 * 用户模态窗口带参数
	 * @return
	 */
	@RequestMapping(value="userInfoParameter")
	public String userInfoParameter(Model model){
		RData rData=userService.queryUserLoginName(rdata);
		rdata.setString("userName", rData.getString("userName"));
		model.addAttribute("rdata", rdata);
		return "sys/user/userInfoParameter";
	}
	
	/**
	 * 用户模态窗口
	 * @return
	 */
	@RequestMapping(value="userImport")
	public String userImport(Model model){
		model.addAttribute("rdata", rdata);
		return "sys/user/userImport";
	}
	
	
	/**
	 * 修改密码
	 * @return
	 */
	@RequestMapping(value="updatePwd")
	public String updatePwd(Model model){
		model.addAttribute("user",userService.queryUserName(rdata));
		return "/sys/user/pwdUpdate";
	}
	
	/**
	 * 保存修改的密码
	 * @return
	 */
	@RequestMapping(value="saveUpdatedPwd")
	@ResponseBody
	public String saveUpdatedPwd(){
		if (SecurityService.validatePassword(rdata.getString("oldPassword"), userService.queryUserPwd(rdata))) {
			//修改密码
			rdata.setString("newPassword", SecurityService.entryptPassword(rdata.getString("newPassword")));
			return userService.saveUpdatedPwd(rdata);
		}else {
			//原密码错误
			return "oldPasswordError";
		}
	}
	
	/**
	 * 进入更新联系人弹窗页面 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="updateMobile")
	public String stockDeviceAdd(Model model){
		RData  user = null ;
		try {
			String userName = new String(rdata.getString("userName").getBytes("ISO-8859-1"), "utf-8");
			rdata.put("userName", userName);
			rdata.put("userId", rdata.get("userId"));
			user =userService.getUser(rdata);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("rdata", rdata);
		model.addAttribute("user", user);
		return "sys/user/updateMobile";
	}
	/**
	 * 保存修改的联系方式
	 * @return
	 */
	@RequestMapping(value="saveUpdatedMobile")
	@ResponseBody
	public String saveUpdatedMobile(){
		try{
			userService.saveUpdatedMobile(rdata);
			return "success";
		}catch(Exception e){
			return "failure";
		}
		
		
	}
}
