package io.raycom.event.eventListener;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import io.raycom.context.event.RayComEvent;
import io.raycom.context.event.listener.IRayComEventListener;
import io.raycom.context.event.sysEvent.FileUploadEvent;
import io.raycom.core.collection.RData;
import io.raycom.event.eventTask.fileSync.FileSyncTask;

@Component
public class FileUploadEventListener implements IRayComEventListener{

	@Autowired
	public FileSyncTask fileSyncTask;

	@Override
	public void onRayComEvent(RayComEvent event) {
		fileSyncTask.sync((RData)event.getSource());
	}

	@Override
	public List<String> getEventClasses() {
		List<String> className = new ArrayList<String>();
		className.add(FileUploadEvent.class.getName());
		return className;
	}

}
