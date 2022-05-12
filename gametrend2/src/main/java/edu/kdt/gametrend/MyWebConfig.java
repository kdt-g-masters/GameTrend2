package edu.kdt.gametrend;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 현재 파일 웹 설정 포함 파일
@Configuration
public class MyWebConfig implements WebMvcConfigurer {

	// <resources mapping="/resources/**" location="/resources/" />
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**")
		.addResourceLocations("classpath:static/images/");
	}
	
	// 1024 byte -> 1kb
	// 1024 kb -> 1mb

}
