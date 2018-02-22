package io.raycom.web.support.presentation.tag;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspTagException;

import io.raycom.common.config.Global;
import io.raycom.context.bean.SystemMenu;
import io.raycom.core.application.SpringContextHolder;
import io.raycom.core.collection.RData;
import io.raycom.web.support.communal.dao.SecurityDao;
import io.raycom.web.support.utils.user.UserUtils;

public class TopMenuTag extends CTag {
	private static final long serialVersionUID = 1L;
	
	private String  ctxpath ;

	public TopMenuTag() {
		super();
	}

	public void release() {
		super.release();
	}

	public int doEndTag() throws JspTagException {
		try {
			HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
			ctxpath = req.getContextPath()+Global.getAdminPath();
			List<SystemMenu>  menuList =  getMenuList();
			this.printTagString(getMenuList(menuList,SystemMenu.getRootId()).toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
	
	/**
	 * 约束，只允许菜单是2级到3级。
	 * @param menuList
	 * @param parantId
	 * @return
	 */
	public String getMenuList(List<SystemMenu> 	 menuList,String parantId) {
		StringBuilder sb = new StringBuilder();
		for (SystemMenu menu : menuList) {
			if(menu.getParentId().equals(parantId)){
				if(menu.getParentId().equals(SystemMenu.getRootId())) {//一级菜单
					sb.append( "<li class=\"navbar-levelone\"><a href=\"javascript:;\" style=\"padding-left: 12px;padding-right: 12px;\">"
							+ menu.getName()
							+ "</a></li>");
				}
			}
		}
		return sb.toString();
	}
	
	public List<SystemMenu> getMenuList() { 
		List<SystemMenu>  menuList;
		SecurityDao securityDao = SpringContextHolder.getBean(SecurityDao.class);
		RData rd = new RData();
		
		rd.set("jdbcType", Global.getConfig("jdbc.type"));
		if(UserUtils.getUser().isAdmin()){
			menuList = securityDao.getAllMenuList(rd);
		}
		else{
			rd.set("userId", UserUtils.getUser().getId());
			menuList = securityDao.getMenuByUserId(rd);
		}
		return menuList;
	}
	
	
	public String getMenuUrl(String menuUrl) { 
		if(menuUrl==null||"#".equals(menuUrl)){
			return "#";
		}else{
			return ctxpath +menuUrl;
		}
	}
	
	public String getMenuName(String menuName,String icon) {
		if(icon==null){
			return menuName;
		}else{
			return "<i class=\""+icon+"\">&#xe616;</i>"+menuName;
		}
	}

}
