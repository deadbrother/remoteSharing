package com.bonc.common.filter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.bonc.common.env.EnvCondition;
import com.bonc.common.utils.FrameConfigurationProperties;
import com.bonc.security.web.AuthFilter;
import com.bonc.security.web.LogFilter;
import com.bonc.security.web.LoginFilter;
import com.bonc.security.web.TenantFilter;
import com.bonc.security.web.UIFilter;
@Component
@Conditional(EnvCondition.class)
public class SecurityFrameWorkFilters {
	@Autowired
	private FrameConfigurationProperties frameConfigurationProperties;
	
	@Bean	
    public FilterRegistrationBean ssoRegistrationBean() {
		System.out.println("参数配置="+JSON.toJSONString(frameConfigurationProperties));
        final FilterRegistrationBean registrationBean = new FilterRegistrationBean();        
        registrationBean.setFilter(new com.bonc.sso.client.SSOFilter());
        registrationBean.setName(frameConfigurationProperties.getSso().getName());
        registrationBean.addInitParameter("serverName", frameConfigurationProperties.getSso().getServerName());
        registrationBean.addInitParameter("casServerUrlPrefix", frameConfigurationProperties.getSso().getCasServerUrlPrefix());
        registrationBean.addInitParameter("casServerLoginUrl", frameConfigurationProperties.getSso().getCasServerLoginUrl());
        registrationBean.addInitParameter("singleSignOut", frameConfigurationProperties.getSso().getSingleSignOut());
        registrationBean.addInitParameter("skipUrls", frameConfigurationProperties.getSso().getSkipUrls());
        registrationBean.addInitParameter("loginUserHandle", frameConfigurationProperties.getSso().getLoginUserHandle());
        registrationBean.addInitParameter("characterEncoding", frameConfigurationProperties.getSso().getCharacterEncoding());
        registrationBean.addInitParameter("encoding", frameConfigurationProperties.getSso().getEncoding());
        //registrationBean.setOrder(Integer.parseInt(frameConfigurationProperties.getSso().getOrder()));
        registrationBean.setOrder(1);
        registrationBean.addUrlPatterns("/*");
        registrationBean.setOrder(1);
        return registrationBean;
    }
	@Bean
	public FilterRegistrationBean specialCharacterRegistrationBean(){
		final FilterRegistrationBean registrationBean = new FilterRegistrationBean(); 
		registrationBean.setFilter(new SpecialCharacterFilter());
		registrationBean.setName(frameConfigurationProperties.getSpecialCharacter().getName());
		registrationBean.addInitParameter("specialCharacters", frameConfigurationProperties.getSpecialCharacter().getSpecialCharacters());
		registrationBean.addInitParameter("skipUrls", frameConfigurationProperties.getSpecialCharacter().getSkipUrls());
//		registrationBean.addInitParameter("order", frameConfigurationProperties.getSpecialCharacter().getOrder());
		registrationBean.setOrder(6);
		return registrationBean;
	}
	
	@Bean 
   public FilterRegistrationBean loginRegistrationBean() {
       final FilterRegistrationBean registrationBean = new FilterRegistrationBean();
       
       registrationBean.setFilter(new LoginFilter());
       registrationBean.setName(frameConfigurationProperties.getLogin().getName());
       registrationBean.addInitParameter("loginUrl", frameConfigurationProperties.getLogin().getLoginUrl());
       registrationBean.addInitParameter("defaultPage", frameConfigurationProperties.getLogin().getDefaultPage());
       registrationBean.addInitParameter("skipUrls", frameConfigurationProperties.getSso().getSkipUrls());
       //registrationBean.setOrder(Integer.parseInt(frameConfigurationProperties.getLogin().getOrder()));
       registrationBean.addUrlPatterns("/*");
       registrationBean.setOrder(2);
       return registrationBean;
   }
	@Bean	 
   public FilterRegistrationBean tenantRegistrationBean() {
       final FilterRegistrationBean registrationBean = new FilterRegistrationBean();
       registrationBean.setFilter(new TenantFilter());
       registrationBean.setName(frameConfigurationProperties.getTenant().getName());
       //registrationBean.setOrder(Integer.parseInt(frameConfigurationProperties.getTenant().getOrder()));
       registrationBean.addUrlPatterns("/*");
       registrationBean.setOrder(3);
       return registrationBean;
   }

	@Bean	 
   public FilterRegistrationBean authRegistrationBean() {
       final FilterRegistrationBean registrationBean = new FilterRegistrationBean();
       
       registrationBean.setFilter(new AuthFilter());
       registrationBean.setName(frameConfigurationProperties.getAuth().getName());
       registrationBean.addInitParameter("skipUrls", frameConfigurationProperties.getAuth().getSkipUrls());
       registrationBean.addInitParameter("errorPage", frameConfigurationProperties.getAuth().getErrorPage());
     // registrationBean.setOrder(Integer.parseInt(frameConfigurationProperties.getAuth().getOrder()));
       //registrationBean.addUrlPatterns("/*");
       //registrationBean.addInitParameter("skipAjax", "true");
       registrationBean.addUrlPatterns("*.action","/rest/*","/WEB-INF/jsps/*");
       //registrationBean.addUrlPatterns( frameConfigurationProperties.getAuth().getUrlPattern().split(","));
       registrationBean.setOrder(4);
       return registrationBean;
  }

	//@Bean
	  public FilterRegistrationBean logRegistrationBean() {
	      final FilterRegistrationBean registrationBean = new FilterRegistrationBean();
	      
	      registrationBean.setFilter(new com.bonc.security.web.LogFilter());
	      registrationBean.addUrlPatterns(frameConfigurationProperties.getLog().getLogUrl());
	      registrationBean.addInitParameter("skipUrls", frameConfigurationProperties.getLog().getSkipUrls());
	      registrationBean.setName(frameConfigurationProperties.getLog().getName());
	      registrationBean.setOrder(5);
	      return registrationBean;
	  }
	//@Bean 
	  public FilterRegistrationBean uiRegistrationBean() {
	      final FilterRegistrationBean registrationBean = new FilterRegistrationBean();
	      registrationBean.setFilter(new UIFilter());
	      registrationBean.addUrlPatterns("/demo/*");
	      registrationBean.setOrder(6);
	      return registrationBean;
	  }
}
