package io.raycom.modules.sys.user;

import io.raycom.system.framework.collection.RData;
import io.raycom.system.framework.persistence.Page;
import io.raycom.system.framework.persistence.annotation.MyBatisDao;

import java.util.ArrayList;
import java.util.List;
/**
 * 用户Dao接口
 * @author wx
 *
 */
@MyBatisDao
public interface UserDao {
	
	public ArrayList<RData> getAllUser(Page<RData> page);
	public ArrayList<RData> getOfficeList();
	public ArrayList<RData> getAllRole();
	public ArrayList<RData> getRoleList();
	public ArrayList<RData> getExceptRoleList(RData rdata);
	public ArrayList<RData> getUserRole(RData rdata);
	public RData getUser(RData rdata);
	public void createUserDo(RData rdata);
	public void createUserRole(RData rdata);
	public void updateUser(RData rdata);
	public RData checkLoginName(RData rdata);
	public void deleteUser(RData rdata);
	public void deleteUserRole (RData rdata);
	public void resetPwd (RData rdata);
	public RData queryUserName(RData rdata);
	public void savePwd(RData rdata);
	public String queryUserPwd(RData rdata);
	public ArrayList<RData> getAllUserForPopup(Page<RData> page);
	public ArrayList<RData> querOfficeList();
	public RData getUserName(RData rdata);
	public RData queryUserLoginName(RData rdata);
	public void updatedMobile(RData rdata);
	
}
