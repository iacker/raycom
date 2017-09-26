package io.raycom.context.bean;

import io.raycom.core.collection.RData;

public interface MsgBean {

	public void init(RData rdata);
	
	public RData toRData();
}
