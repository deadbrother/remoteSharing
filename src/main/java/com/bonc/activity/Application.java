package com.bonc.activity;

import org.mybatis.spring.annotation.*;
import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.boot.builder.*;
import org.springframework.boot.context.embedded.*;
import org.springframework.boot.context.properties.*;
import org.springframework.boot.context.web.*;
import org.springframework.boot.web.servlet.*;
import org.springframework.context.annotation.*;
import org.springframework.http.*;
import org.springframework.transaction.annotation.*;

import com.bonc.common.utils.*;

@EnableTransactionManagement
@SpringBootApplication
//@EnableAspectJAutoProxy
//@Import(DynamicDataSourceRegister.class)
//@EnableScheduling
@MapperScan("com.bonc.activity.dao")
@ComponentScan(basePackages = "com.bonc.common,com.bonc.activity")
@ServletComponentScan(basePackages = "com.bonc.common,com.bonc.activity")
@EnableConfigurationProperties({ FrameConfigurationProperties.class, JodisProperties.class })
public class Application extends SpringBootServletInitializer {

	public Application() {
		super();
		setRegisterErrorPageFilter(false); // <- this one
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Application.class);
	}

	//@Bean
	public EmbeddedServletContainerCustomizer containerCustomizer() {

		return new EmbeddedServletContainerCustomizer() {
			@Override
			public void customize(ConfigurableEmbeddedServletContainer container) {

				ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/401.html");
				ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/404.html");
				ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500.html");

				container.addErrorPages(error401Page, error404Page, error500Page);
			}
		};
	}

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}
