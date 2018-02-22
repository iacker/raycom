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

public class MenuTag extends CTag {
	private static final long serialVersionUID = 1L;
	
	private String  ctxpath ;

	public MenuTag() {
		super();
	}

	public void release() {
		super.release();
	}

	public int doEndTag() throws JspTagException {
		try {
			RData rdata = new RData();
			HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
			ctxpath = req.getContextPath()+Global.getAdminPath();
			List<SystemMenu>  menuList =  getMenuList();
			this.printTagString(getMenuList(menuList,SystemMenu.getRootId(),rdata).toString());
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
	public String getMenuList(List<SystemMenu> 	 menuList,String parantId,RData rdata) {
		StringBuilder sb = new StringBuilder();
		for (SystemMenu menu : menuList) {
			if(menu.getParentId().equals(parantId)){
				if(menu.getParentId().equals(SystemMenu.getRootId())) {//一级菜单
					rdata.set(menu.getId(), menu);
					sb.append( "<div class=\"menu_dropdown bk_2\" style=\"display:none\">"
							+ getMenuList(menuList,menu.getId(),rdata)
							+ "</div>");
				}else if(menu.getHasChild().equals("0")){//二级或者三级菜单，无下级菜单
					rdata.set(menu.getId(), menu);
					if(((SystemMenu)rdata.get(menu.getParentId())).getParentId().equals(SystemMenu.getRootId())) {
						sb.append( "<ul>");
					}
					sb.append("<li><a data-href=\""+getMenuUrl(menu.getHref())+"\" data-menuId=\""+menu.getId()+"\" style=\"font-weight: inherit;\" data-title=\""+menu.getName()
						+"\" href=\"javascript:void(0)\">"+menu.getName()+"</a></li></ul>\r\n");
					if(((SystemMenu)rdata.get(menu.getParentId())).getParentId().equals(SystemMenu.getRootId())) {
						sb.append( "</ul>");
					}
				}else{//二级有下级菜单
					rdata.set(menu.getId(), menu);
					sb.append("<dl><dt>"+getMenuName(menu.getName(),menu.getIcon())+"<i class=\"Hui-iconfont menu_dropdown-arrow\">&#xe6d5;</i></dt><dd><ul>"
							+ getMenuList(menuList,menu.getId(),rdata)
							+"</ul></dd></dl>");
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
