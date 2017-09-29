package io.raycom.modules.sys.menu;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import io.raycom.core.collection.RData;
import io.raycom.web.support.mvc.controller.BaseController;

/**
 * 菜单管理
 * @author 杨刘斌
 * @date 2016-04-14
 * @version 1.0.0
 */
@Controller
@RequestMapping(value = "${adminPath}/menu")
public class MenuController extends BaseController {

	@Autowired
	private MenuService menuService;
	/**
	 *   进入菜单页面
	 * @return
	 */
	@RequestMapping(value = {"list", ""})
	public String list() {
		return "sys/menu/menuList";
	}
	
	/**
	 * 更新或者新增菜单，其中:
	 * 1：存在菜单ID，则进行更新。不存在，则进新增
	 * 2：新增时，根据其父菜单的ID，查询出当前需要新增菜单的所有父级菜单编号，之后再进行新增
	 * @return
	 */
	@RequestMapping(value="update")
	@ResponseBody
	public String updateMenu(){
		if(rdata.containsKey("menuId")&&!"".equals(rdata.getString("menuId"))){//更新
			menuService.updateMenu(rdata);
		}else{//新增
			menuService.searchPIds(rdata);
			menuService.addMenu(rdata);
			mdata.modifyString("menuId", 0,rdata.getString("menuId"));
		}
		menuService.addButton(mdata);
		return "saveOk";
	}
	
	/**
	 * 删除菜单，同时删除当前菜单相关的权限。菜单删除方式为del_flag='Y',权限则直接删除，同时删除该菜单里的所有按钮del_flag='Y'
	 * @return
	 */
	@RequestMapping(value="del")
	public String delMenu(){
		menuService.delMenu(rdata);
		return "redirect:" + adminPath+"/menu";
	}
	
	/**
	 * 获取所有菜单，用于树形显示
	 * @return
	 */
	@RequestMapping(value ="getAllNode")
	@ResponseBody
	public List<RData> getAllNode(){
		return menuService.menuList();
	}
	
	/**
	 * 根据菜单ID获取菜单详情
	 * @return
	 */
	@RequestMapping(value ="searchById")
	@ResponseBody
	public RData searchMenuById(){
		return menuService.searchMenuById(rdata);	
	}
	
	/**
	 * 获取该菜单下所有的按钮
	 * @return
	 */
	@RequestMapping(value ="selectButton")
	@ResponseBody
	public ArrayList<RData> selectButton(Model model){
		ArrayList<RData> list=menuService.selectButton( rdata);
		model.addAttribute("button", list);
		return list;
	}
	
	/**
	 * 删除按钮
	 */
	@RequestMapping(value="delButton")
	@ResponseBody
	public void delButton(){
		menuService.delButtonAlone(rdata);
	}

}
