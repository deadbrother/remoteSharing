package com.bonc.common.utils;


import io.codis.jodis.JedisResourcePool;
import io.codis.jodis.RoundRobinJedisPool;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.bind.RelaxedPropertyResolver;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.env.Environment;
import org.springframework.util.Assert;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;

import java.io.IOException;
import java.util.Iterator;
import java.util.Set;

/**
 * <p>Title: BONC - JedisPoolConfiguration </p>
 * <p>
 * <p>Description: JedisPool Spring boot 自动构建类</p>
 * <p>
 * <p>Copyright: Copyright BONC(c) 2013 - 2025 </p>
 * <p>
 * <p>Company: 北京东方国信科技股份有限公司 </p>
 *
 * @version 1.0.0
 */
//@Configuration
//@ConditionalOnClass(JedisResourcePool.class)
public class JodisPoolAutoTest  {

    private final static Logger LOG = LoggerFactory.getLogger(JodisPoolAutoTest.class);

    /**
     * 配置信息
     */
    @Autowired
    private JodisProperties jodisProperties;


    @Bean
    @ConditionalOnMissingBean
    public JedisResourcePool createJedisPool() {
    	jodisProperties = new JodisProperties();
//    	jodisProperties.setZkPath("192.168.31.11:2181");
//    	jodisProperties.setProduct("bonc_test");
//    	jodisProperties.setPassword("bonctest");
//    	jodisProperties.setZkProxyDir("/jodis/codis_test");
    	
    	jodisProperties.setZkPath("10.162.4.9:2181,10.162.4.10:2181,10.62.4.11:2181");
    	jodisProperties.setProduct("bonc");
    	jodisProperties.setZkProxyDir("/zk/codis/db_epm_re/proxy");
        LOG.debug("Configruing Redis Pool");

        Assert.notNull(jodisProperties.getZkPath(), "zk path not be null");
        Assert.notNull(jodisProperties.getProduct()
                , "product not be null");

        LOG.debug("zk:{}, product:{}", jodisProperties.getZkPath(), jodisProperties.getProduct());

        // Jedis 配置信息
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxTotal(jodisProperties.getPoolTotal());
        jedisPoolConfig.setMaxIdle(jodisProperties.getPoolMaxIdle());
        jedisPoolConfig.setMinIdle(jodisProperties.getPoolMinIdle());

        return RoundRobinJedisPool.create()
                .curatorClient(jodisProperties.getZkPath(), jodisProperties.getZkTimeout())
                .zkProxyDir(jodisProperties.getZkProxyDir())
                .password(jodisProperties.getPassword())
                .poolConfig(jedisPoolConfig)
                .build();
    }
    public static void main(String[] args) throws InterruptedException {
    	JodisPoolAutoTest jp = new JodisPoolAutoTest();
    	Jedis jedis = jp.createJedisPool().getResource();
    	for(int i=0;i<1000;i++){
    		
    	
	    	String[] sa = {"13252993266",
	    			"18639578831",
	    			"15639779915",
	    			"13243121126",
	    			"18638051808",
	    			"13051000283",
	    			"13233969567",
	    			"15639780064",
	    			"15012341234",
	    			"15639780267",
	    			"14012341234",
	    			"15639779617",
	    			"18012341234",
	    			"18638051957",
	    			"18639578958"};
	    	for(String s:sa){
	    		jedis.set("whb"+sa, "1");
	    	}
	    	for(String s:sa){
	    		if(jedis.get("whb"+sa)==null){
	    			System.out.println("whb"+sa +"is null");
	    		}
	    	}
	    	for(String s:sa){
	    		jedis.del("whb"+sa);
	    	}
//	    	System.out.println("run is end");
    	}
    	
	}

}
