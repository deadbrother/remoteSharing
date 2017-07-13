package com.bonc.common.utils;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

public class WebUtils {

	/**
	 * 
	 * @param request
	 * @return
	 */
	public static boolean isFilter(HttpServletRequest request,WebConfigurationProperties webConfig) {
		String url = request.getRequestURI();
		if (WebUtils.isExcludedPage(url, webConfig.getExcludedPages()) || isFilterPath(url, webConfig.getFilterPaths())) {// 登录页不拦截
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * /login路径不拦截
	 * 
	 * @param url
	 * @return
	 */
	public static boolean isFilterPath(String path, String filterPaths) {
		String[] filterPathArray =  filterPaths.split(",");
		if (filterPathArray.length > 0) {
			for(String arr : filterPathArray)
				if (arr.equals(path)) {
					return true;
				}
		}
		return false;
	}

	/**
	 * js，css，img等包不拦截
	 * 
	 * @param url
	 * @return
	 */
	public static boolean isExcludedPage(String url, String excludedPages) {
		if (StringUtils.isNotEmpty(url) && url.length() > 4) {
			url = url.substring(1);
			if (url.indexOf("/") > 0) {
				String path = url.substring(0, url.indexOf("/"));
				if (excludedPages.contains(path)) {
					return true;
				}
			}
		}
		return false;
	}
}
