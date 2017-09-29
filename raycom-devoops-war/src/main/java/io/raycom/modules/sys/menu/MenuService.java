package io.raycom.modules.sys.menu;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.raycom.core.collection.RData;
import io.raycom.core.collection.RMultiData;
import io.raycom.utils.string.StringUtils;
import io.raycom.web.service.BaseService;
import io.raycom.web.support.utils.user.UserUtils;

/**
 * 
 * @author 杨刘斌
 * @version 2016-04-14
 */
@Service
@Transactional(readOnly = true)
public class MenuService extends BaseService {
	
	@Autowired
	private MenuDao menuDao;

	public ArrayList<RData> menuList() {
		return menuDao.menuList();
	}

	public RData searchMenuById(RData rdata) {
		return menuDao.searchMenuById(rdata);
	}

	public void addMenu(RData rdata) {
		menuDao.addMenu(rdata);
	}

	public void updateMenu(RData rdata) {
		menuDao.updateMenu(rdata);
	}
	
	public void delMenu(RData rdata) {
			menuDao.delMenu(rdata);
			menuDao.delMenuRole(rdata);
			menuDao.delMenuButton(rdata);
	}
    
	public void searchPIds(RData rdata) {
		RData rd =  menuDao.searchPIds(rdata);
		rdata.set("pids",rd.get("pids"));
	}

	public void addButton(RMultiData mdata) {
		String menuId = mdata.getString("menuId",0);
		menuDao.delButton(mdata.getRData(0));
		for (int i = 0; i < mdata.getMaxDataCount(); i++) {
			RData rdata = mdata.getRData(i);
			rdata.set("currentUser", UserUtils.getUser().getId());
			if(!StringUtils.isEmpty(rdata.getString("permissionCode"))){
				rdata.set("menuId",menuId);
				menuDao.addButton(rdata);
			}
		}
	}
	
	public ArrayList<RData> selectButton(RData rdata) {
		return menuDao.selectButton(rdata);
	}
	
	public void delButton(RData rdata) {
		menuDao.delButton(rdata);
	}
	
	public void delButtonAlone(RData rdata) {
		menuDao.delButtonAlone(rdata);
	}

	public RData selectBut(RData rdata) {
		return menuDao.selectBut(rdata);
	}
}
