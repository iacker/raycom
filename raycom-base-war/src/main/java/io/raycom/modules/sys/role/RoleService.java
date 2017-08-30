package io.raycom.modules.sys.role;

import io.raycom.common.service.BaseService;
import io.raycom.system.framework.collection.RData;
import io.raycom.system.framework.collection.RMultiData;
import io.raycom.system.framework.persistence.Page;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 角色权限管理
 * @author 孙连辉
 * @version 2016-04-16
 */
@Service
@Transactional(readOnly = true)
public class RoleService extends BaseService {
	
	@Autowired
	private RoleDao roleDao;
	 
	/**
	 * 查询所有角色
	 * @param page
	 */
	public void getAllRole(Page<RData> page){
		ArrayList<RData> rList = roleDao.getAllRole(page);
		page.setData(rList);
	}
	
	/**
	 * 新增角色及权限配置
	 * @param rData
	 */
	public String createRole(RData rData,RMultiData mData){
		//判断是否有角色
		RData hasRole = roleDao.checkName(rData);
		if (hasRole !=null) {//存在角色
			return "1";
		}else{
			roleDao.createRole(rData);//创建角色
			if(mData.getMaxDataCount()>0){
				String roleId = roleDao.queryByRoleName(rData.getString("roleName"));
				for (int i = 0; i < mData.getMaxDataCount(); i++) {
					RData rdata = mData.getRData(i);
					rdata.setString("roleId", roleId);						
					roleDao.addComRoleMenu(rdata);
				}					
			}
			return "0";
		}
	}
	
	/**
	 * 删除角色
	 * @param rData
	 */
	public void deleteRoleAndPercodes(RData rData){
		roleDao.deleteRole(rData);
		roleDao.deletePercodes(rData);
	}
	
	/**
	 * 删除角色时验证
	 * @param rData
	 */
	public String checkedUser(RData rData){
		String str = roleDao.checkedUser(rData);
		if (str != null) {
			return "canNotDelete";
		}
		return "canDelete";
	}
	
	/**
	 * 查看角色详情
	 * @param rData
	 */
	public RData queryDetail(RData rData){
		return roleDao.queryDetail(rData);
	}
	
	/**
	 * 修改角色
	 * @param rData
	 */
	public String updateRole(RData rData,RMultiData mData){
		//判断是否有角色
		RData hasRole = roleDao.checkNameInDetail(rData);
		if (hasRole != null) {// 存在角色
			return "1";
		} else {
			roleDao.updateRole(rData);// 修改角色
			roleDao.deleteByRoleId( rData.getString("roleId"));//删除已存在权限
			for (int i = 0; i < mData.getMaxDataCount(); i++) {
				roleDao.addComRoleMenu( mData.getRData(i));					
			}				
			return "0";
		}
	}
	
	/**
	 * 新增权限
	 * @return
	 */
	public ArrayList<RData> getAllMenu(){
		return roleDao.menuList();
	}
	
	/**
	 * 修改权限
	 * @return
	 */
	public ArrayList<RData> queryAllPermission(RData rdata) {
		return roleDao.queryAllPermission(rdata);
	}
	
}
