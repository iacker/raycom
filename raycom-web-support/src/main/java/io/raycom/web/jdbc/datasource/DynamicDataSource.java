package io.raycom.web.jdbc.datasource;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import com.alibaba.druid.pool.DruidDataSource;

import io.raycom.common.config.Global;
import io.raycom.core.collection.RData;
import io.raycom.utils.string.StringUtils;
import io.raycom.web.support.utils.system.SystemCache;
import io.raycom.web.support.utils.user.UserUtils;

public class DynamicDataSource extends AbstractRoutingDataSource {
    
    protected DruidDataSource masterDataSource;
    
    // 保存动态创建的数据源
    private static final Map targetDataSource = new HashMap<>();
    
    @Override
    protected DataSource determineTargetDataSource() {
    	
        // 根据数据库选择方案，拿到要访问的数据库
        String dataSourceName = determineCurrentLookupKey();
        if("dataSource".equals(dataSourceName)) {
            // 访问默认主库
            return masterDataSource;
        }
        // 根据数据库名字，从已创建的数据库中获取要访问的数据库
        DataSource dataSource = (DataSource) targetDataSource.get(dataSourceName);
        if(null == dataSource) {
            // 从已创建的数据库中获取要访问的数据库，如果没有则创建一个
            dataSource = this.selectDataSource(dataSourceName);
        }
        return dataSource;
    }
    
    @Override
    protected String determineCurrentLookupKey() {
    	
    	String dataSourceName =UserUtils.getSysOrgId();
        if (StringUtils.isEmpty(dataSourceName)|| "1000".equals(dataSourceName )) {
            // 默认的数据源名字
            dataSourceName = "dataSource";
        }
        return dataSourceName;
    }


    public void addTargetDataSource(String key, DruidDataSource dataSource) {
        this.targetDataSource.put(key, dataSource);
    }

    
    /**
     * 该方法为同步方法，防止并发创建两个相同的数据库
     * 使用双检锁的方式，防止并发
     * @param dbType
     * @return
     */
    private synchronized DataSource selectDataSource(String dbType) {
        // 再次从数据库中获取，双检锁
        DataSource obj = (DataSource)this.targetDataSource.get(dbType);
        if (null != obj) {
            return obj;
        } 
        // 为空则创建数据库
        DruidDataSource dataSource = this.getDataSource(dbType);
        if (null != dataSource) {
            // 将新创建的数据库保存到map中
            this.setDataSource(dbType, dataSource);
            return dataSource;
        }
        return dataSource;
    }
    
    /**
     * 查询对应数据库的信息
     * @param dbtype
     * @return
     */
    private DruidDataSource getDataSource(String dbtype) {
    	RData rdata = SystemCache.getDynamicDataSourceById(dbtype);
    	if(rdata.isEmpty()) return masterDataSource;
    	String driverClassName = rdata.getString("driverClass");
        String url = rdata.getString("url");
        String username = rdata.getString("username");
        String password = rdata.getString("password");
        DruidDataSource dataSource = createDataSource(driverClassName,url,username,password);
        
        return dataSource;
    }
    
    //创建数据源
    private DruidDataSource createDataSource(String driverClassName, String url,
            String username, String password) {
        DruidDataSource druidDataSource = null;
        try {
        	druidDataSource = (DruidDataSource) masterDataSource.clone();
            druidDataSource.setDriverClassName(driverClassName);
            druidDataSource.setUrl(url);
            druidDataSource.setUsername(username);
            druidDataSource.setPassword(password);
            druidDataSource.setTestWhileIdle(true);
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }

        return druidDataSource;
    }

    public void setDataSource(String type, DruidDataSource dataSource) {
        this.addTargetDataSource(type, dataSource);
        Global.setSysLocalOrgId(type);
    }

    
    
    /**
     * 该方法重写为空，因为AbstractRoutingDataSource类中会通过此方法将，targetDataSources变量中保存的数据源交给resolvedDefaultDataSource变量
     * 在本方案中动态创建的数据源保存在了本类的targetDataSource变量中。如果不重写该方法为空，会因为targetDataSources变量为空报错
     * 如果仍然想要使用AbstractRoutingDataSource类中的变量保存数据源，则需要在每次数据源变更时，调用此方法来为resolvedDefaultDataSource变量更新
     */
    @Override
    public void afterPropertiesSet() {
    }

    public DataSource getMasterDataSource() {
        return masterDataSource;
    }

    public static Map getTargetdatasource() {
		return targetDataSource;
	}

	public void setMasterDataSource(DruidDataSource masterDataSource) {
		this.masterDataSource = masterDataSource;
	}

    
}