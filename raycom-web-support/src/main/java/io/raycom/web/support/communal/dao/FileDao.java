package io.raycom.web.support.communal.dao;

import java.util.List;

import io.raycom.core.collection.RData;
import io.raycom.web.persistence.CrudDao;
import io.raycom.web.persistence.annotation.MyBatisDao;

/**
 * FileDao
 * @author caoshengquan
 * @version 2014-05-16
 */
@MyBatisDao
public interface FileDao extends CrudDao {

	public void addFile(RData rdata);
	
	public RData getFile(RData rdata);
	
	public List<RData> getFiles(RData rdata);
	
	
}
