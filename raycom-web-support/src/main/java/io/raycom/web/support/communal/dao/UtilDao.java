package io.raycom.web.support.communal.dao;

import java.util.List;

import io.raycom.context.bean.SystemRole;
import io.raycom.context.bean.SystemUser;
import io.raycom.web.persistence.BaseDao;
import io.raycom.web.persistence.annotation.MyBatisDao;

/**
 * 用于Util包访问数据库用
 * @author caoshengquan
 * @version 2014-05-16
 */
@MyBatisDao
public interface UtilDao extends BaseDao {

	public SystemUser getByLoginName(String loginName);
	
	public SystemUser getUser(String id);

	public List<SystemRole> getRoleListByUserId(String userId);
	
	public String getOfficeNameById(String officeId);
	

}
