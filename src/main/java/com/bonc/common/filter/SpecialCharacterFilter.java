package com.bonc.common.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
/**
 * 传递参数特殊字符转义
 * @author Ice
 *
 */
public class SpecialCharacterFilter implements Filter {

	private String specialCharacters;
	private String[] skipUrls;
	private String[][] specialCharacterArray;

	public String getSpecialCharacters() {
		return specialCharacters;
	}

	public void setSpecialCharacters(String specialCharacters) {
		this.specialCharacters = specialCharacters;
	}

	public String[] getSkipUrls() {
		return skipUrls;
	}

	public void setSkipUrls(String[] skipUrls) {
		this.skipUrls = skipUrls;
	}

	public String[][] getSpecialCharacterArray() {
		return specialCharacterArray;
	}

	public void setSpecialCharacterArray(String[][] specialCharacterArray) {
		this.specialCharacterArray = specialCharacterArray;
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		//是否需要过滤
		if (preFilter(request, response)) {
			chain.doFilter(request, response);
		} else {
			chain.doFilter(new OpRequestWrap((HttpServletRequest) request), response);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
//		System.out.println("SpecialCharacterFilter>>>>int>>>>>>>>>>>>>>");
		//不过滤url信息
		String skipUrl = filterConfig.getInitParameter("skipUrls");
		if ((skipUrl != null) && (skipUrl.trim().length() > 0)) {
			this.skipUrls = skipUrl.split(",");
		}
		//特殊字符的转换信息
		specialCharacters = filterConfig.getInitParameter("specialCharacters");
		String[] str = specialCharacters.split(",");
		specialCharacterArray = new String[str.length][];
		for (int i = 0; i < str.length; i++) {
 			specialCharacterArray[i] = str[i].split(":");
		}
	}

	/**
	 * 判断是否需要过滤
	 * @param servletRequest
	 * @param servletResponse
	 * @return
	 */
	protected boolean preFilter(ServletRequest servletRequest,
			ServletResponse servletResponse) {
		boolean skip = false;
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();

		if (!"/".equals(contextPath)) {
			requestURI = requestURI.substring(contextPath.length());
		}

		if (this.skipUrls != null) {
			for (String s : this.skipUrls) {
				skip = Pattern.matches(s, requestURI);
				if (skip) {
					break;
				}
			}
		}
		return skip;
	}
	/**
	 * 重写HttpServletRequestWrapper，的获取参数变量方法，进行特殊字符转换
	 * @author Ice
	 *
	 */
	public class OpRequestWrap extends HttpServletRequestWrapper {

		public OpRequestWrap(HttpServletRequest request) {
			super(request);
			// TODO Auto-generated constructor stub
		}
		/**
		 * 特殊字符转换
		 * @param str
		 * @return
		 */
		private String speReplace(String str) {
			if (str != null && specialCharacterArray != null) {
				if(str.equals("")){
					str = null;
				}else{
					for (int i = 0; i < specialCharacterArray.length; i++) {
						str = str.replaceAll(specialCharacterArray[i][0],
								specialCharacterArray[i][1]);
					}
				}
			}
			return str;
		}
		 /**
	     *
	     * @param name
	     * @return
	     */
	    public Object getAttribute(String name) {
	        Object value = super.getAttribute(name);
	        if (value instanceof String) {
	            value = speReplace(String.valueOf(value));
	        }
	        return value;
	    }
	 
	    /**
	     * 重写getParameter方法
	     *
	     * @param name
	     * @return
	     */
	    public String getParameter(String name) {
	        String value = super.getParameter(name);
	        if (value == null)
	            return null;
	        return speReplace(value);
	    }
	 
	    /**
	     *
	     * @param name
	     * @return
	     */
	    public String[] getParameterValues(String name) {
	        String[] values = super.getParameterValues(name);
	        if (values != null) {
	            for (int i = 0; i < values.length; i++) {
	                values[i] = speReplace(values[i]);
	            }
	        }
	        return values;
	    }
	 
	    /**
	     * @return
	     */
	    public Map<String, String[]> getParameterMap() {
	        HashMap<String,String[]> paramMap = (HashMap<String,String[]>) super.getParameterMap();
	        paramMap = (HashMap<String,String[]>) paramMap.clone();
	        for (Iterator iterator = paramMap.entrySet().iterator(); iterator.hasNext(); ) {
	            Map.Entry<String,String[]> entry = (Map.Entry<String,String[]>) iterator.next();
	            String [] values = entry.getValue();
	            for (int i = 0; i < values.length; i++) {
	                if(values[i] instanceof String){
	                    values[i] = speReplace(values[i]);
	                }
	            }
	            entry.setValue(values);
	        }
	        return paramMap;
	    }
	}
}
