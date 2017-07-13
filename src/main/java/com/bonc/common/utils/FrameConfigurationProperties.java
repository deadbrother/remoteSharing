package com.bonc.common.utils;

import org.springframework.boot.context.properties.ConfigurationProperties;

import lombok.Data;

@Data
@ConfigurationProperties(prefix = "base.platform", ignoreUnknownFields = false)
public class FrameConfigurationProperties {
	private String enable;
	private SSOFilterConfiguration sso;
	private LoginFilterConfiguration login;
	private TenantFilterConfiguration tenant;
	private AuthFilterConfiguration auth;
	private SpecialCharacterFilterConfiguration specialCharacter;
	private LogFilterConfiguration log;
	public String getEnable() {
		return enable;
	}

	public void setEnable(String enable) {
		this.enable = enable;
	}

	public LogFilterConfiguration getLog() {
		return log;
	}

	public void setLog(LogFilterConfiguration log) {
		this.log = log;
	}

	public SSOFilterConfiguration getSso() {
		return sso;
	}

	public void setSso(SSOFilterConfiguration sso) {
		this.sso = sso;
	}

	public LoginFilterConfiguration getLogin() {
		return login;
	}

	public void setLogin(LoginFilterConfiguration login) {
		this.login = login;
	}

	public TenantFilterConfiguration getTenant() {
		return tenant;
	}

	public void setTenant(TenantFilterConfiguration tenant) {
		this.tenant = tenant;
	}

	public AuthFilterConfiguration getAuth() {
		return auth;
	}

	public void setAuth(AuthFilterConfiguration auth) {
		this.auth = auth;
	}

	public SpecialCharacterFilterConfiguration getSpecialCharacter() {
		return specialCharacter;
	}

	public void setSpecialCharacter(
			SpecialCharacterFilterConfiguration specialCharacter) {
		this.specialCharacter = specialCharacter;
	}

	@Data
	public static class SSOFilterConfiguration {
		private String name;
		private String serverName;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getServerName() {
			return serverName;
		}
		public void setServerName(String serverName) {
			this.serverName = serverName;
		}
		public String getCasServerUrlPrefix() {
			return casServerUrlPrefix;
		}
		public void setCasServerUrlPrefix(String casServerUrlPrefix) {
			this.casServerUrlPrefix = casServerUrlPrefix;
		}
		public String getCasServerLoginUrl() {
			return casServerLoginUrl;
		}
		public void setCasServerLoginUrl(String casServerLoginUrl) {
			this.casServerLoginUrl = casServerLoginUrl;
		}
		public String getSingleSignOut() {
			return singleSignOut;
		}
		public void setSingleSignOut(String singleSignOut) {
			this.singleSignOut = singleSignOut;
		}
		public String getSkipUrls() {
			return skipUrls;
		}
		public void setSkipUrls(String skipUrls) {
			this.skipUrls = skipUrls;
		}
		public String getLoginUserHandle() {
			return loginUserHandle;
		}
		public void setLoginUserHandle(String loginUserHandle) {
			this.loginUserHandle = loginUserHandle;
		}
		public String getCharacterEncoding() {
			return characterEncoding;
		}
		public void setCharacterEncoding(String characterEncoding) {
			this.characterEncoding = characterEncoding;
		}
		public String getEncoding() {
			return encoding;
		}
		public void setEncoding(String encoding) {
			this.encoding = encoding;
		}
		public String getOrder() {
			return order;
		}
		public void setOrder(String order) {
			this.order = order;
		}
		private String casServerUrlPrefix;
		private String casServerLoginUrl;
		private String singleSignOut;
		private String skipUrls;
		private String loginUserHandle;
		private String characterEncoding;
		private String encoding;
		private String order;
	}
	
	@Data
	public static class LoginFilterConfiguration {
		private String name;
		private String loginUrl;
		private String defaultPage;
		private String order;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getLoginUrl() {
			return loginUrl;
		}
		public void setLoginUrl(String loginUrl) {
			this.loginUrl = loginUrl;
		}
		public String getDefaultPage() {
			return defaultPage;
		}
		public void setDefaultPage(String defaultPage) {
			this.defaultPage = defaultPage;
		}
		public String getOrder() {
			return order;
		}
		public void setOrder(String order) {
			this.order = order;
		}
		
	}
	
	@Data
	public static class TenantFilterConfiguration {
		private String name;
		private String order;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getOrder() {
			return order;
		}
		public void setOrder(String order) {
			this.order = order;
		}
		
	}
	
	@Data
	public static class AuthFilterConfiguration {
		private String name;
		private String skipUrls;
		private String errorPage;
		private String order;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getSkipUrls() {
			return skipUrls;
		}
		public void setSkipUrls(String skipUrls) {
			this.skipUrls = skipUrls;
		}
		public String getErrorPage() {
			return errorPage;
		}
		public void setErrorPage(String errorPage) {
			this.errorPage = errorPage;
		}
		public String getOrder() {
			return order;
		}
		public void setOrder(String order) {
			this.order = order;
		}
		
	}
	@Data
	public static class SpecialCharacterFilterConfiguration{
		private String name;
		private String specialCharacters;
		private String skipUrls;
		private String order;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getSpecialCharacters() {
			return specialCharacters;
		}
		public void setSpecialCharacters(String specialCharacters) {
			this.specialCharacters = specialCharacters;
		}
		public String getSkipUrls() {
			return skipUrls;
		}
		public void setSkipUrls(String skipUrls) {
			this.skipUrls = skipUrls;
		}
		public String getOrder() {
			return order;
		}
		public void setOrder(String order) {
			this.order = order;
		}
	} 
	@Data
	public static class LogFilterConfiguration {
		private String name;
		private String logUrl;
		private String order;
		private String skipUrls;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getLogUrl() {
			return logUrl;
		}
		public void setLogUrl(String logUrl) {
			this.logUrl = logUrl;
		}
		public String getOrder() {
			return order;
		}
		public void setOrder(String order) {
			this.order = order;
		}
		public String getSkipUrls() {
			return skipUrls;
		}
		public void setSkipUrls(String skipUrls) {
			this.skipUrls = skipUrls;
		}

		
	}
}
