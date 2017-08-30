package io.raycom.modules.sys.menu;

import java.util.ArrayList;

import io.raycom.system.framework.collection.RData;
import io.raycom.system.framework.persistence.annotation.MyBatisDao;

/**
 * 
 * @author 杨刘斌
 * @version 2016-04-14
 */
@MyBatisDao
public interface MenuDao{

	public ArrayList<RData> menuList();
	public void addMenu(RData rdata);
	public void updateMenu(RData rdata);
	public RData searchMenuById(RData rdata);
	public RData searchPIds(RData rdata);
	public void delMenu(RData rdata);
	public void delMenuRole(RData rdata);
	public void addButton(RData rdata);
	public ArrayList<RData> selectButton(RData rdata);
	public void updateButton(RData rdata);
	public void delButton(RData rdata);
	public void delMenuButton(RData rdata);
	public RData selectBut(RData rdata);
	public void delButtonAlone(RData rdata);
}
