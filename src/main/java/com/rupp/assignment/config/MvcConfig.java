package com.rupp.assignment.config;

import java.text.SimpleDateFormat;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableWebMvc
@Configuration
@ComponentScan(basePackages = "com.rupp.assignment")
@EnableTransactionManagement
@ImportResource(value = { "classpath:/persistence-db.xml" })
@MapperScan("com.rupp.assignment.dao")
@PropertySource(name = "application", value = { "classpath:/application.properties" })
@Lazy
@EnableSwagger2 // for swagger annotation

public class MvcConfig extends WebMvcConfigurerAdapter {

	// -------------- Services -----------------------

	// -------------- Message Converters ----------------------

	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		SkipNullObjectMapper skipNullMapper = new SkipNullObjectMapper();
		skipNullMapper.init();
		MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
		converter.setObjectMapper(skipNullMapper);

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		skipNullMapper.setDateFormat(formatter);

		converters.add(converter);
	}

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/api/**").allowedOrigins("http://domain2.com") // put
																			// *
																			// for
																			// all
				.allowedMethods("PUT", "DELETE").allowedHeaders("header1", "header2", "header3") // Content-Language
																									// ,
																									// put
																									// *
																									// for
																									// all
				.exposedHeaders("header1", "header2").allowCredentials(false).maxAge(3600);
	}
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("swagger-ui.html")
          .addResourceLocations("classpath:/META-INF/resources/");
     
        registry.addResourceHandler("/webjars/**")
          .addResourceLocations("classpath:/META-INF/resources/webjars/");
    }
    

    
    @Bean
    public Docket api() { 
        return new Docket(DocumentationType.SWAGGER_2)
          .ignoredParameterTypes(AuthenticationPrincipal.class)
          .apiInfo(getApiInfoForVersion("1"))
          .select()                                  
          .apis(RequestHandlerSelectors.any())
          .paths(PathSelectors.any())
          .build();
    }
    

    
    private ApiInfo getApiInfoForVersion(String version) {
        Contact defaultContact = new Contact("Company", "https://github.com/ngsophal/student-management-system", "");
        return new ApiInfo("Version " + version, "Api Documentation. Each REST-API Request must start with /api. ", version, "urn:tos",
            defaultContact, "Restricted usage", "https://github.com/ngsophal/student-management-system");
    }
}
