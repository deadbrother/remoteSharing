package com.bonc.common.utils;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "web", ignoreUnknownFields = false)
public class WebConfigurationProperties {

	/**
	 * 登录不拦截的路径
	 */
	private String filterPaths;
	
	/**
	 * 登录不拦截的路径
	 */
	private String excludedPages;

	public String getFilterPaths() {
		return filterPaths;
	}

	public void setFilterPaths(String filterPaths) {
		this.filterPaths = filterPaths;
	}

	public String getExcludedPages() {
		return excludedPages;
	}

	public void setExcludedPages(String excludedPages) {
		this.excludedPages = excludedPages;
	}
	
}
