package io.raycom.modules.sys.dbBackup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import io.raycom.web.support.mvc.controller.BaseController;

/**
 * 数据库备份
 * @author guojianmin
 * @date 2016-04-11
 * @version 1.0.0
 */
@Controller
@RequestMapping(value="${adminPath}/dbBackup")
public class DbBackupController extends BaseController{
	
	@Autowired
	private DbBackupService dbBackupService;
	
	@Value("${expFilePath}")
	private  String expFilePath; // 导出文件路径
	
	@Value("${expFilePrefix}")
	private String expFilePrefix;
	
	@Value("${dbConn}")
	private String dbConn;
	
	@Value("${otherCommand}")
	private String otherCommand;
	
	
	/**
	 *   进入数据库备份页面
	 * @return
	 */
	@RequestMapping(value = {"list", ""})
	public String list(Model model) {
		model.addAttribute("newFile",expFilePrefix+dbBackupService.getNowTime("yyyyMMddhhmmss"));
		model.addAttribute("file", expFilePath);
		return "sys/dbBackup/dbBackup";
	}
	
	/**
	 *   数据库备份
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "update")
	public String backUp() throws Exception {
		dbBackupService.backup(rdata.getString("bakFile"));
		return "redirect:" + adminPath+"/dbBackup";
	}
	
}
