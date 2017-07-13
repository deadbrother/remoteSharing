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

/**
 * <p>Title: BONC - JedisPoolConfiguration </p>
 * <p>
 * <p>Description: JedisPool Spring boot 自动构建类</p>
 * <p>
 * <p>Copyright: Copyright BONC(c) 2013 - 2025 </p>
 * <p>
 * <p>Company: 北京东方国信科技股份有限公司 </p>
 *
 * @author yangdx
 * @version 1.0.0
 */
//@Configuration
//@ConditionalOnClass(JedisResourcePool.class)
public class JodisPoolAutoConfiguration  {

    private final static Logger LOG = LoggerFactory.getLogger(JodisPoolAutoConfiguration.class);

    /**
     * 配置信息
     */
    //@Autowired
    private JodisProperties jodisProperties;


    @Bean
    @ConditionalOnMissingBean
    public JedisResourcePool createJedisPool() {
    	/*jodisProperties.setZkPath("192.168.31.11:2181");
    	jodisProperties.setProduct("bonc_test");
    	jodisProperties.setPassword("bonctest");
    	jodisProperties.setZkProxyDir("/jodis/codis_test");*/
    	
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
        if(jodisProperties.getPassword()== null || jodisProperties.getPassword().equals("")){
        	return RoundRobinJedisPool.create()
                    .curatorClient(jodisProperties.getZkPath(), jodisProperties.getZkTimeout())
                    .zkProxyDir(jodisProperties.getZkProxyDir())
                    .poolConfig(jedisPoolConfig)
                    .build();
        }else{
	        return RoundRobinJedisPool.create()
	                .curatorClient(jodisProperties.getZkPath(), jodisProperties.getZkTimeout())
	                .zkProxyDir(jodisProperties.getZkProxyDir())
	                .password(jodisProperties.getPassword())
	                .poolConfig(jedisPoolConfig)
	                .build();
        }
    }
    public static void main(String[] args) throws InterruptedException {
    	JodisPoolAutoConfiguration jp = new JodisPoolAutoConfiguration();
    	Jedis jedis = jp.createJedisPool().getResource();
    	jedis.set("test", "test");
    	
		jedis.setex("test", 3, "123");
		Thread.sleep(2000);
		System.out.println("get info "+jedis.get("test"));
		jedis.del("test");
    	
	}

}
