/**
 * 
 */
package com.bonc.activity.utils.config;

import java.util.Map;

import javax.management.Query;

/**
 * <p>Title:QueryConfig </p>
 * <p>Description: </p>
 * <p>Company:BONC </p> 
 * @author wangwenqiang
 * @date 2017年6月19日 上午9:41:22*/
public class QueryConfig {
	private Map<String,String> queryConfig;
	private static QueryConfig instance = null;
	public static synchronized QueryConfig getInstance(){
		if(instance == null){
			instance = new QueryConfig();
		}
		return instance;
	}
	
	public void clearQueryConfig(){
		queryConfig = null;
	}
	
	public Map<String,String> getQueryConfig(){
		return queryConfig;
	}
	
	public void setQueryConfig(Map<String,String> queryConfig){
		this.queryConfig = queryConfig;
	}
}
