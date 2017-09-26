package io.raycom.web.support.presentation.tag.form;

import java.util.List;

import io.raycom.core.collection.RData;

public interface SelectTagExtender{
	
	public String getComCode();
	public String getItemLabel();
	public String getItemValue();
	
	public List<RData> getItems();
}