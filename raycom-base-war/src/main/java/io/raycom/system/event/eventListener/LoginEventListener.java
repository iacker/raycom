package io.raycom.system.event.eventListener;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import io.raycom.common.bean.SystemUser;
import io.raycom.components.context.event.RayComEvent;
import io.raycom.components.context.event.listener.IRayComEventListener;
import io.raycom.components.context.event.sysEvent.LoginEvent;
import io.raycom.system.web.dao.DictDao;

@Component
public class LoginEventListener implements IRayComEventListener{
	
	@Autowired
	DictDao dictDao;

	@Override
	public void onRayComEvent(RayComEvent event) {
		System.out.println("**************");
		System.out.println(((SystemUser)event.getSource()).getLoginName()+"登录成功,登录时间："+new Date());
		System.out.println("**************");
		SystemUser user = (SystemUser)event.getSource();
		/*RData rdata = new RData();
		if (!user.isSysData())
			rdata.set("userId", user.getId());
		List<RData> items = dictDao.findWHList(rdata);
		List<RData> office = dictDao.findOfficeList(rdata);
		user.setWhList(items);
		user.setRoleOfficeList(office);*/
	}

	@Override
	public List<String> getEventClasses() {
		List<String> className = new ArrayList<String>();
		className.add(LoginEvent.class.getName());
		return className;
	}

}
