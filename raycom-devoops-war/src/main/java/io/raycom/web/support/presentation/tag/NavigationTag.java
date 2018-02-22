package io.raycom.web.support.presentation.tag;

import java.io.IOException;
import java.io.StringReader;
import java.util.Iterator;
import java.util.List;

import javax.servlet.jsp.JspTagException;

import freemarker.template.Configuration;
import freemarker.template.Template;
import io.raycom.common.config.Constant;
import io.raycom.common.config.Global;
import io.raycom.core.application.SpringContextHolder;
import io.raycom.core.collection.RData;
import io.raycom.utils.string.FreeMarkers;
import io.raycom.utils.string.StringUtils;
import io.raycom.web.support.communal.dao.SecurityDao;
import io.raycom.web.support.utils.user.UserUtils;

public class NavigationTag extends CTag {
	private static final long serialVersionUID = 1L;
	private static String navStr = "<div class=\"row\"> "
			  +"<div id=\"breadcrumb\" class=\"col-xs-12\"> "
		      +"<a href=\"#\" class=\"show-sidebar\"> <i class=\"fa fa-bars\"></i></a> "
		      +"<ol class=\"breadcrumb pull-left\">";
			
	private static String navEnd ="</ol></div></div>";	

	public NavigationTag() {
		super();
	}

	public void release() {
		super.release();
	}

	public int doEndTag() throws JspTagException {
		String menuId = (String)UserUtils.getCache(Constant.CACHE_MENU_CLICK);
		this.printTagString(getNavStr(menuId));
		return EVAL_PAGE;
	}
	
	public String getNavStr(String menuId) {
		if(StringUtils.isEmpty(menuId))
			return "";
		StringBuilder sb = new StringBuilder();
		RData rd = new RData();
		rd.set("menuId", menuId);
		rd.set("jdbcType", Global.getConfig("jdbc.type"));
		SecurityDao securityDao = SpringContextHolder.getBean(SecurityDao.class);
		List<RData> dataList = securityDao.getByParentIdsLike(rd);
			try {
				Template temp = new Template("nav", new StringReader(" <li><a href=\"${href}\">${menuName}</a></li>"), new Configuration());
				for (Iterator<RData> iterator = dataList.iterator(); iterator.hasNext();) {
					RData rdata = (RData) iterator.next();
					if(StringUtils.isEmpty(rdata.getString("href")))
						rdata.set("href","#");
					sb.append(FreeMarkers.renderTemplate(temp, rdata));
				}
			} catch (IOException e) {
				e.printStackTrace();
			}		
		return navStr +sb +navEnd;		
	}
	
}
