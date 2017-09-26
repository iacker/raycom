package io.raycom.web.support.communal.dao;

import java.util.List;

import io.raycom.context.bean.SystemMenu;
import io.raycom.context.bean.SystemRole;
import io.raycom.context.bean.SystemUser;
import io.raycom.core.collection.RData;
import io.raycom.web.persistence.BaseDao;
import io.raycom.web.persistence.annotation.MyBatisDao;

/**
 * 
 * @ClassName: SecurityDao  <BR>
 * class description:  系统级信息查询，主要包括用户，权限和菜单<BR>
 * @version 1.00 2015年11月12日
 * @author csq
 */
@MyBatisDao
public interface SecurityDao extends BaseDao {
	
	public SystemUser getByLoginName(String loginName);
	
	public SystemUser getUser(String id);

	public SystemRole getRoleByName(String name);
	
	public SystemRole getRole(String id);

	public SystemMenu getMenu(String id);
	
	public List<SystemRole> getRoleListByUserId(String userId);
	
	public List<SystemRole> getAllRoleList();
	
	public List<RData> getByParentIdsLike(RData menuId);
	
	public List<RData> getPermissionByUserId(String userId);
	
	public List<SystemMenu> getAllMenuList(RData menuId);
	
	public List<SystemMenu> getMenuByUserId(RData menuId);
	
	/**
	 * 更新登录信息，如：登录IP、登录时间
	 * @param user
	 * @return
	 */
	public int updateLoginInfo(SystemUser user);
	
	
}
