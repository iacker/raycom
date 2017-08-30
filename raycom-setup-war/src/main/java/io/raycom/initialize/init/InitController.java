package io.raycom.initialize.init;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import io.raycom.common.web.BaseController;
import io.raycom.system.framework.collection.RData;

/**
 * 一键部署
 * @author caoshengquan
 * @date 2017-08-22
 * @version 1.0.0
 */
@Controller
@RequestMapping(value = "${adminPath}/init")
public class InitController extends BaseController {

	@Autowired
	private InitService initService;
	
	/**
	 *   进入共同代码管理页面
	 * @return
	 */
	@RequestMapping(value = "")
	public String list(Model model) {
		if("N".equals(InitProcessStatic.getIsRun())) {
			return "init/init";
		}else {
			return "init/initFinish";
		}
	}
	
	/**
	 * 进入共同代码新增页面
	 * @return
	 */
	@RequestMapping(value = "initDo")
	public String initDo(){
		initService.processProperties(rdata);
		return "init/initFinish";
	}
	
	/**
	 * 进入共同代码新增页面
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "initStatic")
	public RData initStatic(){
		rdata.set("fileProcess", InitProcessStatic.getFileProcessNo());
		rdata.set("tableProcess", InitProcessStatic.getTableProcessNo());
		rdata.set("dataProcess", InitProcessStatic.getDataProcessNo());
		rdata.set("tableTotalProcess", InitProcessStatic.getTableTotalProcessNo());
		rdata.set("dataTotalProcess", InitProcessStatic.getDataTotalProcessNo());
		rdata.set("runFlag", InitProcessStatic.getIsRun());
		return rdata;
	}
	/*private void test(){
		InitProcessStatic.setRunning();
		InitProcessStatic.setFileProcessNo(2);
		InitProcessStatic.setDataProcessNo(1);
		InitProcessStatic.setDataTotalProcessNo(2);
		InitProcessStatic.setTableProcessNo(1);
		InitProcessStatic.setTableTotalProcessNo(2);
	}*/
	

}
