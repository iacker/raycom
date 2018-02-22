package io.raycom.modules.sys.role;

import java.util.ArrayList;

import io.raycom.core.collection.RData;
import io.raycom.web.bean.Page;
import io.raycom.web.persistence.annotation.MyBatisDao;

/**
 * 角色权限DAO接口
 * @author sunlianhui
 * @version 2016-04-15
 */
@MyBatisDao
public interface RoleDao{
	
	public ArrayList<RData> getAllRole(Page<RData> page);
	
	public void createRole(RData rdata);
	
	public String queryByRoleName(String str);
	 
	public void deleteRole(RData rData);
	
	public void deletePercodes(RData rData);
	
	public String checkedUser(RData rData);
	
	public RData queryDetail(RData rData);
	
	public void updateRole(RData rData);
	
	public ArrayList<String> queryByRoleId(String str);
	
	public void deleteByRoleId(String str);
	
	public RData checkName(RData rData);
	
	public ArrayList<RData> menuList();
	
	public void addComRoleMenu(RData rdata);
	
	public ArrayList<RData> queryAllPermission(RData rData);
	
	public RData checkNameInDetail(RData rData);
	
}
