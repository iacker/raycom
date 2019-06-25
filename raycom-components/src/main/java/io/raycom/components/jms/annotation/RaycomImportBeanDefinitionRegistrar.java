package io.raycom.components.jms.annotation;

import java.util.Map;

import org.springframework.beans.MutablePropertyValues;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.GenericBeanDefinition;
import org.springframework.context.annotation.ImportBeanDefinitionRegistrar;
import org.springframework.core.type.AnnotationMetadata;

import io.raycom.components.jms.listener.RaycomMessageListenerContainer;

/**
 * description
 *
 * @author 70KG
 * @date 2018/11/13
 */
public class RaycomImportBeanDefinitionRegistrar implements ImportBeanDefinitionRegistrar{
	
	@Override
	public void registerBeanDefinitions(AnnotationMetadata importingClassMetadata, BeanDefinitionRegistry registry) {

		//获取注解配置项
		Map<String, Object> annotationAttributes = importingClassMetadata.getAnnotationAttributes(RaycomJms.class.getName());
		String className = (String) importingClassMetadata.getClassName();

		GenericBeanDefinition beanDefinition = new GenericBeanDefinition();
		beanDefinition.setBeanClass(RaycomMessageListenerContainer.class);
		beanDefinition.setAutowireCandidate(true); 
		
		MutablePropertyValues mpv = beanDefinition.getPropertyValues();
		mpv.addPropertyValue("destinationName", annotationAttributes.get("value"));
		mpv.addPropertyValue("taskClassName", className);
		mpv.addPropertyValue("destinationDesc", annotationAttributes.get("desc"));
		
		registry.registerBeanDefinition("jms"+className.substring(className.lastIndexOf(".")+1), beanDefinition);

	}
}