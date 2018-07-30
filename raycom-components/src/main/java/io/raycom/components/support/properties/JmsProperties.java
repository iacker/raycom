package io.raycom.components.support.properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class JmsProperties {

	@Value("${mq.model}")
	public String mqModel;
	
	@Value("${machine.mq.name}")
	public String machineName;
	
	@Value("${mq.run}")
	public String isRun;
	
	@Value("${mq.run.include}")
	public String include;
	
	@Value("${mq.run.exclude}")
	public String exclude;
}
