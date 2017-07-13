package com.bonc.common.utils;


import org.springframework.boot.context.properties.ConfigurationProperties;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Jodis 连接池配置信息
 *
 * @author yangdx
 * @version 1.0.0
 */
@ConfigurationProperties("spring.jodis")
public class JodisProperties {

    /**
     * zookeeper 地址
     */
    private String zkPath;

    /**
     * zookeeper超时时间
     */
    private int zkTimeout = 3000;

    /**
     * 产品名称
     */
    private String product;

    /**
     * 连接redis密码
     */
    private String password;

    /**
     * 连接池最大连接数
     */
    private int poolTotal = JedisPoolConfig.DEFAULT_MAX_TOTAL;

    /**
     * 最大空闲数
     */
    private int poolMaxIdle = JedisPoolConfig.DEFAULT_MAX_IDLE;

    /**
     * 最小空闲数
     */
    private int poolMinIdle = JedisPoolConfig.DEFAULT_MIN_IDLE;

    private String zkProxyDir;
    
    public String getZkProxyDir() {
		return zkProxyDir;
	}

	public void setZkProxyDir(String zkProxyDir) {
		this.zkProxyDir = zkProxyDir;
	}

	public String getZkPath() {
        return zkPath;
    }

    public void setZkPath(String zkPath) {
        this.zkPath = zkPath;
    }

    public int getZkTimeout() {
        return zkTimeout;
    }

    public void setZkTimeout(int zkTimeout) {
        this.zkTimeout = zkTimeout;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPoolTotal() {
        return poolTotal;
    }

    public void setPoolTotal(int poolTotal) {
        this.poolTotal = poolTotal;
    }

    public int getPoolMaxIdle() {
        return poolMaxIdle;
    }

    public void setPoolMaxIdle(int poolMaxIdle) {
        this.poolMaxIdle = poolMaxIdle;
    }

    public int getPoolMinIdle() {
        return poolMinIdle;
    }

    public void setPoolMinIdle(int poolMinIdle) {
        this.poolMinIdle = poolMinIdle;
    }
}
