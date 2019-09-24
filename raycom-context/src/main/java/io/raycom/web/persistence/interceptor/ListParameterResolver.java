package io.raycom.web.persistence.interceptor;

import java.lang.reflect.Constructor;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.binding.MapperMethod;
import org.apache.ibatis.cache.CacheKey;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.ognl.Ognl;
import org.apache.ibatis.ognl.OgnlException;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.DefaultReflectorFactory;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.ReflectorFactory;
import org.apache.ibatis.reflection.factory.DefaultObjectFactory;
import org.apache.ibatis.reflection.factory.ObjectFactory;
import org.apache.ibatis.reflection.wrapper.DefaultObjectWrapperFactory;
import org.apache.ibatis.reflection.wrapper.ObjectWrapperFactory;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.type.JdbcType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.base.Throwables;

import io.raycom.utils.lang.Reflections;
import io.raycom.utils.string.StringUtils;

/**
 * 支持参数为list的插件实现
 * <p/>
 * 在使用in语句时,往往参数为集合或者数组,需要将mapper文件中写<forEach>,此插件
 * 的目的是为了将forEach从mapper文件中去掉,SQL直接支持in(#{list})
 * @see https://github.com/gaohanghbut/mybatis-list-param/blob/master/src/main/java/cn/yxffcode/mybatis/ListParameterResolver.java
 *
 * @author gaohang on 16/3/3.
 */
@Intercepts({
	@Signature(type = Executor.class, method = "query",
		args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class}),
	@Signature(type = Executor.class, method = "query",
    	args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class,CacheKey.class, BoundSql.class}),
	@Signature(type = Executor.class, method = "update",
		args = {MappedStatement.class, Object.class})
})
public class ListParameterResolver implements Interceptor {

    private static final Logger LOGGER = LoggerFactory.getLogger(ListParameterResolver.class);
    private static final ObjectFactory DEFAULT_OBJECT_FACTORY = new DefaultObjectFactory();  
    private static final ObjectWrapperFactory DEFAULT_OBJECT_WRAPPER_FACTORY = new DefaultObjectWrapperFactory();  
    private static final ReflectorFactory DEFAULT_REFLECTOR_FACTORY = new DefaultReflectorFactory();
 
    @Override public Object intercept(Invocation invocation) throws Throwable {
        final Object[] args = invocation.getArgs();
        MappedStatement ms = (MappedStatement) args[0];
        Object parameter = args[1];
        BoundSql boundSql = args[args.length - 1] instanceof BoundSql ?
                (BoundSql) args[args.length - 1] :
                ms.getBoundSql(parameter);
        //绑定参数
        List<ParameterMapping> parameterMappings =
                Collections.unmodifiableList(boundSql.getParameterMappings());
        if (parameterMappings == null || parameterMappings.isEmpty() || parameter == null) {
            return invocation.proceed();
        }
        MetaObject mo = MetaObject.forObject(parameter,DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY,DEFAULT_REFLECTOR_FACTORY);

        //先记录集合参数的位置
        List<ListParamWrapper> paramPositions =
                buildListParameterPositions(boundSql, parameterMappings, mo);

        if (paramPositions.isEmpty()) {
            return invocation.proceed();
        }

        Map<String, Object> paramMap = normalizeParameters(parameter, parameterMappings, mo);

        rebuildBoundSql(boundSql, parameterMappings, paramPositions, paramMap,parameter);

       // System.out.println(boundSql.getSql());
       // LOGGER.debug("rebuilded sql:{}", boundSql.getSql());

       // invocation.getArgs()[1] = paramMap;
        invocation.getArgs()[0] = MappedStatementUtils.copyMappedStatement(ms, boundSql);
        return invocation.proceed();
    }

    @Override public Object plugin(Object target) {
        if (target instanceof Executor) {
            return Plugin.wrap(target, this);
        }
        return target;
    }

    @Override public void setProperties(Properties properties) {
    }

    private void rebuildBoundSql(BoundSql boundSql, List<ParameterMapping> parameterMappings,
                                 List<ListParamWrapper> paramPositions,
                                 Map<String, Object> paramMap,Object parameter) {
        String sql = boundSql.getSql();
        int lastAppended = -1;
        StringBuilder newSql = new StringBuilder();

        //copy ParameterMappings, because of the ParameterMapping list is shared by SqlSource, copy a
        // list is commanded.
        List<ParameterMapping> newParameterMappings = new ArrayList<>();

       
        int parameterAppendIndex = 0;
        for (ListParamWrapper paramPosition : paramPositions) {
            for (int i = parameterAppendIndex; i < paramPosition.mappingPosition; i++) {
                newParameterMappings.add(parameterMappings.get(i));
            }
            //不再需要原始参数,所以第paramPosition.mappingPosition个参数不需要加入新的参数列表
            parameterAppendIndex = paramPosition.mappingPosition + 1;
            int sqlPosition = paramPosition.sqlPosition;
            newSql.append(sql.substring(++lastAppended, sqlPosition));
            //拼问号
            int count = 0;
            String hasContent = "";
            for (Object obj : paramPosition.params) {
            	hasContent="Y";
                newSql.append('?').append(',');
                String newProperty = paramPosition.paramName + count;
                paramMap.put(newProperty, obj);
                	

                ParameterMapping npm = copyParameterMappingForNewProperty(
                        paramPosition, obj, newProperty);
                try {
					Ognl.setValue(newProperty, parameter, obj);
				} catch (OgnlException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                newParameterMappings.add(npm);
                count++;
            }
            //如果是空list。则构造空参数
            if(StringUtils.isEmpty(hasContent)) {
            	newSql.append('?').append(',');
            	 String newProperty = paramPosition.paramName + count;
                paramMap.put(newProperty, null);
                	
                ParameterMapping npm = copyParameterVarcharMappingForNewProperty(
                        paramPosition, null, newProperty);
                
                try {
					Ognl.setValue(newProperty, parameter, null);
				} catch (OgnlException e) {
					e.printStackTrace();
				}
                newParameterMappings.add(npm);
                count++;
            }
            
            if (newSql.charAt(newSql.length() - 1) == ',') {
                newSql.deleteCharAt(newSql.length() - 1);
            }
            //因为遍历iterable的时候已经append了?,所以原始SQL中的?应该丢弃
            lastAppended = sqlPosition;
        }

        newSql.append(sql.substring(lastAppended + 1));

        for (int i = parameterAppendIndex; i < parameterMappings.size(); i++) {
            newParameterMappings.add(parameterMappings.get(i));
        }
        
        
       Reflections.setFieldValue(boundSql, "parameterMappings", newParameterMappings);
        Reflections.setFieldValue(boundSql, "sql", newSql.toString());
    }

    private Map<String, Object> normalizeParameters(Object parameter,
                                                    List<ParameterMapping> parameterMappings,
                                                    MetaObject mo) {
        Map<String, Object> paramMap = null;
        //注意参数的处理,参数可能是map,也可能是普通对象,当参数是普通对象时,需要转换成map
        if (parameter != null && parameter instanceof Map) {
            paramMap = (Map<String, Object>) parameter;
        }
        if (paramMap == null) {
            paramMap = new MapperMethod.ParamMap<>();
            for (ParameterMapping pm : parameterMappings) {
                paramMap.put(pm.getProperty(), mo.getValue(pm.getProperty()));
            }
        }
        return paramMap;
    }

    private ParameterMapping copyParameterMappingForNewProperty(
            ListParamWrapper paramPosition, Object param, String newProperty) {
        try {
            ParameterMapping pm = paramPosition.parameterMapping;
            MetaObject pmmo = MetaObject.forObject(pm,DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY,DEFAULT_REFLECTOR_FACTORY);
            Constructor<ParameterMapping> constructor = ParameterMapping.class.getDeclaredConstructor();
            constructor.setAccessible(true);
            ParameterMapping npm = constructor.newInstance();
            MetaObject npmmo = MetaObject.forObject(npm,DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY,DEFAULT_REFLECTOR_FACTORY);
            //copy
            Configuration configuration = (Configuration) pmmo.getValue("configuration");
            npmmo.setValue("configuration", configuration);
            npmmo.setValue("property", newProperty);
            npmmo.setValue("mode", pmmo.getValue("mode"));
            npmmo.setValue("javaType", pmmo.getValue("javaType"));
            npmmo.setValue("jdbcType", pmmo.getValue("jdbcType"));
            npmmo.setValue("numericScale", pmmo.getValue("numericScale"));
            Object typeHandler = pmmo.getValue("typeHandler");
            if (typeHandler == null) {
                typeHandler = configuration.getTypeHandlerRegistry().getTypeHandler(param.getClass());
            }
            npmmo.setValue("typeHandler", typeHandler);
            npmmo.setValue("resultMapId", pmmo.getValue("resultMapId"));
            npmmo.setValue("jdbcTypeName", pmmo.getValue("jdbcTypeName"));
            return npm;
        } catch (Exception e) {
            Throwables.propagate(e);
            return null;
        }
    }
    private ParameterMapping copyParameterVarcharMappingForNewProperty(
    		ListParamWrapper paramPosition, Object param, String newProperty) {
    	try {
    		ParameterMapping pm = paramPosition.parameterMapping;
    		MetaObject pmmo = MetaObject.forObject(pm,DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY,DEFAULT_REFLECTOR_FACTORY);
    		Constructor<ParameterMapping> constructor = ParameterMapping.class.getDeclaredConstructor();
    		constructor.setAccessible(true);
    		ParameterMapping npm = constructor.newInstance();
    		MetaObject npmmo = MetaObject.forObject(npm,DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY,DEFAULT_REFLECTOR_FACTORY);
    		//copy
    		Configuration configuration = (Configuration) pmmo.getValue("configuration");
    		npmmo.setValue("configuration", configuration);
    		npmmo.setValue("property", newProperty);
    		npmmo.setValue("mode", pmmo.getValue("mode"));
    		npmmo.setValue("javaType", pmmo.getValue("javaType"));
    		npmmo.setValue("jdbcType", JdbcType.VARCHAR);
    		npmmo.setValue("numericScale", pmmo.getValue("numericScale"));
    		Object typeHandler = pmmo.getValue("typeHandler");
    		if (typeHandler == null) {
    			typeHandler = configuration.getTypeHandlerRegistry().getTypeHandler(param.getClass());
    		}
    		npmmo.setValue("typeHandler", typeHandler);
    		npmmo.setValue("resultMapId", pmmo.getValue("resultMapId"));
    		npmmo.setValue("jdbcTypeName", pmmo.getValue("jdbcTypeName"));
    		return npm;
    	} catch (Exception e) {
    		Throwables.propagate(e);
    		return null;
    	}
    }

    private List<ListParamWrapper> buildListParameterPositions(BoundSql boundSql,
                                                               List<ParameterMapping> parameterMappings,
                                                               MetaObject mo) {
        List<ListParamWrapper> positionMap = new ArrayList<>(2);
        for (int i = 0, j = parameterMappings.size(); i < j; i++) {
            ParameterMapping parameterMapping = parameterMappings.get(i);
            if (!mo.hasGetter(parameterMapping.getProperty())) {
                continue;
            }
            final Object value = mo.getValue(parameterMapping.getProperty());
            if (value == null) {
                continue;
            }
            if (!(value instanceof Iterable) && !value.getClass().isArray()) {
                continue;
            }
            Iterable<?> iterable;
            if (value instanceof Iterable) {
                //找到第i+1个?的位置修改SQL
                iterable = (Iterable<?>) value;
                
                //如果list是空的 ，则初始化未空string数组
                String hasContent = "";
                for (Object obj : iterable) {
                	hasContent="Y";
                	break;
                }
                if(StringUtils.isEmpty(hasContent)) {
                	iterable = new AbstractList<Object>() {
                		String[] array = {};

                        @Override public Object get(int index) {
                            return array[index];
                        }

                        @Override public int size() {
                            return array.length;
                        }
                    };
                }
            } else {
                iterable = new AbstractList<Object>() {
                    Object[] array = (Object[]) value;

                    @Override public Object get(int index) {
                        return array[index];
                    }

                    @Override public int size() {
                        return array.length;
                    }
                };
            }

            String sql = boundSql.getSql();
            int paramIndex = 0;
            for (int k = 0, s = sql.length(); k < s; k++) {
                char c = sql.charAt(k);
                if (c == '?') {
                    ++paramIndex;
                    if (paramIndex == i + 1) {//第i个参数的位置为k
                        positionMap.add(new ListParamWrapper(iterable, k, parameterMapping.getProperty(), i,
                                parameterMapping));
                    }
                }
            }
        }
        return positionMap;
    }

    private static final class ListParamWrapper {
        private final Iterable<?> params;
        private final int sqlPosition;
        private final String paramName;
        private final int mappingPosition;
        private final ParameterMapping parameterMapping;

        public ListParamWrapper(Iterable<?> params, int sqlPosition, String paramName,
                                int mappingPosition, ParameterMapping parameterMapping) {
            this.params = params;
            this.sqlPosition = sqlPosition;
            this.paramName = paramName;
            this.mappingPosition = mappingPosition;
            this.parameterMapping = parameterMapping;
        }
    }
}