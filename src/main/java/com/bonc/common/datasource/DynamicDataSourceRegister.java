package com.bonc.common.datasource;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.MutablePropertyValues;
import org.springframework.beans.PropertyValues;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.GenericBeanDefinition;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.bind.RelaxedDataBinder;
import org.springframework.boot.bind.RelaxedPropertyResolver;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.ImportBeanDefinitionRegistrar;
import org.springframework.core.convert.ConversionService;
import org.springframework.core.convert.support.DefaultConversionService;
import org.springframework.core.env.Environment;
import org.springframework.core.type.AnnotationMetadata;

/**
 * 动态数据源注册<br/>
 * 启动动态数据源请在启动类中（如SpringBootSampleApplication）
 * 添加 @Import(DynamicDataSourceRegister.class)
 */
public class DynamicDataSourceRegister
        implements ImportBeanDefinitionRegistrar, EnvironmentAware {

    private static final Logger logger = LoggerFactory.getLogger(DynamicDataSourceRegister.class);

    private ConversionService conversionService = new DefaultConversionService(); 
    private PropertyValues dataSourcePropertyValues;

    // 如配置文件中未指定数据源类型，使用该默认值
    //private static final Object DATASOURCE_TYPE_DEFAULT = "com.bonc.commons.jdbc.datasource.EncryptPooledDataSourcee";
    private static final Object DATASOURCE_TYPE_DEFAULT = "com.alibaba.druid.pool.DruidDataSource";
    // private static final Object DATASOURCE_TYPE_DEFAULT =
    // "com.zaxxer.hikari.HikariDataSource";

    // 数据源
    private DataSource defaultDataSource;
    private Map<String, DataSource> customDataSources = new HashMap<String, DataSource>();
    private String dataSourceType;

    @Override
    public void registerBeanDefinitions(AnnotationMetadata importingClassMetadata, BeanDefinitionRegistry registry) {
        Map<Object, Object> targetDataSources = new HashMap<Object, Object>();
        // 将主数据源添加到更多数据源中
        targetDataSources.put("dataSource", defaultDataSource);
        DynamicDataSourceContextHolder.dataSourceIds.add("dataSource");
        // 添加更多数据源
        targetDataSources.putAll(customDataSources);
        for (String key : customDataSources.keySet()) {
            DynamicDataSourceContextHolder.dataSourceIds.add(key);
        }

        // 创建DynamicDataSource
        GenericBeanDefinition beanDefinition = new GenericBeanDefinition();
        beanDefinition.setBeanClass(DynamicDataSource.class);
        beanDefinition.setSynthetic(true);
        MutablePropertyValues mpv = beanDefinition.getPropertyValues();
        mpv.addPropertyValue("defaultTargetDataSource", defaultDataSource);
        mpv.addPropertyValue("targetDataSources", targetDataSources);
        registry.registerBeanDefinition("dataSource", beanDefinition);

        logger.info("Dynamic DataSource Registry");
    }

    /**
     * 创建DataSource
     *
     * @param type
     * @param driverClassName
     * @param url
     * @param username
     * @param password
     * @return
     * @author SHANHY
     * @create 2016年1月24日
     */
    @SuppressWarnings("unchecked")
	public DataSource buildDataSource(Map<String, Object> dsMap) {
    	dataSourceType=dsMap.get("driver-class-name").toString();
        try {
            Object type = dsMap.get("type");
            if (type == null)
                type = DATASOURCE_TYPE_DEFAULT;// 默认DataSource

            Class<? extends DataSource> dataSourceType;
           

            String driverClassName = dsMap.get("driver-class-name").toString();
            String url = dsMap.get("url").toString();
            String username = dsMap.get("username").toString();
            String password = dsMap.get("password").toString();
//            if(driverClassName.equalsIgnoreCase("com.bonc.xcloud.jdbc.XCloudDriver")){
//            	dataSourceType = (Class<? extends DataSource>) Class.forName((String) DATASOURCE_TYPE_DEFAULT);
//            }else{
//            	dataSourceType = (Class<? extends DataSource>) Class.forName((String) type);
//            }
            
            dataSourceType = (Class<? extends DataSource>) Class.forName((String) type);
            

            DataSourceBuilder factory = DataSourceBuilder.create().driverClassName(driverClassName).url(url)
                    .username(username).password(password).type(dataSourceType);
            return factory.build();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 加载多数据源配置
     */
    @Override
    public void setEnvironment(Environment env) {
        initDefaultDataSource(env);
        initCustomDataSources(env);
    }

    /**
     * 初始化主数据源
     *
     * @author SHANHY
     * @create 2016年1月24日
     */
    private void initDefaultDataSource(Environment env) {
        // 读取主数据源
        RelaxedPropertyResolver propertyResolver = new RelaxedPropertyResolver(env, "spring.datasource.");
        Map<String, Object> dsMap = new HashMap<String, Object>();
        dsMap.put("type", propertyResolver.getProperty("type"));
        dsMap.put("driver-class-name", propertyResolver.getProperty("driver-class-name"));
        dsMap.put("url", propertyResolver.getProperty("url"));
        dsMap.put("username", propertyResolver.getProperty("username"));
        dsMap.put("password", propertyResolver.getProperty("password"));
        
        

        defaultDataSource = buildDataSource(dsMap);

        dataBinder(defaultDataSource, env);
    }

    /**
     * 为DataSource绑定更多数据
     *
     * @param dataSource
     * @param env
     * @author SHANHY
     * @create  2016年1月25日
     */
    private void dataBinder(DataSource dataSource, Environment env){
        RelaxedDataBinder dataBinder = new RelaxedDataBinder(dataSource);
        //dataBinder.setValidator(new LocalValidatorFactory().run(this.applicationContext));
        dataBinder.setConversionService(conversionService);
        dataBinder.setIgnoreNestedProperties(false);//false
        dataBinder.setIgnoreInvalidFields(false);//false
        dataBinder.setIgnoreUnknownFields(true);//true
        if(dataSourceType.equals("oracle.jdbc.driver.OracleDriver")){
       	 Map<String, Object> rpr = new RelaxedPropertyResolver(env, "spring.oracle.datasource").getSubProperties(".");
            Map<String, Object> values = new HashMap<>(rpr);
            // 排除已经设置的属性
            values.remove("type");
            values.remove("driver-class-name");
            values.remove("url");
            values.remove("username");
            values.remove("password");
            dataSourcePropertyValues = new MutablePropertyValues(values);
       }else if(dataSourceType.equals("com.bonc.xcloud.jdbc.XCloudDriver")){
       	 Map<String, Object> rpr = new RelaxedPropertyResolver(env, "spring.xcloud.datasource").getSubProperties(".");
            Map<String, Object> values = new HashMap<>(rpr);
            // 排除已经设置的属性
            values.remove("type");
            values.remove("driver-class-name");
            values.remove("url");
            values.remove("username");
            values.remove("password");
            dataSourcePropertyValues = new MutablePropertyValues(values);
       }else if(dataSourceType.equals("com.mysql.jdbc.Driver")){
       	Map<String, Object> rpr = new RelaxedPropertyResolver(env, "spring.mysql.datasource").getSubProperties(".");
           Map<String, Object> values = new HashMap<>(rpr);
           // 排除已经设置的属性
           values.remove("type");
           values.remove("driver-class-name");
           values.remove("url");
           values.remove("username");
           values.remove("password");
           dataSourcePropertyValues = new MutablePropertyValues(values);
       }else{
       	Map<String, Object> rpr = new RelaxedPropertyResolver(env, "spring.datasource").getSubProperties(".");
           Map<String, Object> values = new HashMap<>(rpr);
           // 排除已经设置的属性
           values.remove("type");
           values.remove("driver-class-name");
           values.remove("url");
           values.remove("username");
           values.remove("password");
           dataSourcePropertyValues = new MutablePropertyValues(values);
       }
        
        
//        if(dataSourcePropertyValues == null){
//            rpr = new RelaxedPropertyResolver(env, "spring.datasource").getSubProperties(".");
//            values = new HashMap<String, Object>(rpr);
//            // 排除已经设置的属性
//            values.remove("type");
//            values.remove("driver-class-name");
//            values.remove("url");
//            values.remove("username");
//            values.remove("password");
//            dataSourcePropertyValues = new MutablePropertyValues(values);
//        }
        
        
        
        
        dataBinder.bind(dataSourcePropertyValues);
    }

    /**
     * 初始化更多数据源
     *
     * @author SHANHY
     * @create 2016年1月24日
     */
    private void initCustomDataSources(Environment env) {
        // 读取配置文件获取更多数据源，也可以通过defaultDataSource读取数据库获取更多数据源
        RelaxedPropertyResolver propertyResolver = new RelaxedPropertyResolver(env, "custom.datasource.");
        String dsPrefixs = propertyResolver.getProperty("names");
        Map<String, Object> dsMap;
        DataSource ds;
        for (String dsPrefix : dsPrefixs.split(",")) {// 多个数据源
            dsMap = propertyResolver.getSubProperties(dsPrefix + ".");
            ds = buildDataSource(dsMap);
            customDataSources.put(dsPrefix, ds);
            dataBinder(ds, env);
        }
    }

}
