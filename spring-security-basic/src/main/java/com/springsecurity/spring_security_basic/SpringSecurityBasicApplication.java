package com.springsecurity.spring_security_basic;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import java.util.concurrent.Flow;

@SpringBootApplication
public class SpringSecurityBasicApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringSecurityBasicApplication.class, args);
	}

}

//After first request send Spring Security create JsessionId that's why we dont need to login again and again
//Check via the postman use basic auth and put id and password in it send request than remove  jsession from cookies .



//Flow
//						Autherntication
//							|
//	UserEnteredDetails ----->AuthenticationFilter -------->AuthenticationManager ------> AuthenticationProvider
//							|															|				|
//						SecurityContext										UserDetailsService       PasswordEncoder


//org.springframework.security.web.authentication.AuthenticationFilter (Class)
//org.springframework.security.authentication.AuthenticationManager (Interface)
//org.springframework.security.authentication.AuthenticationProvider (Interface)
//org.springframework.security.core.userdetails.UserDetailsService (Interface)
//org.springframework.security.crypto.password.PasswordEncoder (Interface)
//org.springframework.security.core.context.SecurityContext (Interface)
//org.springframework.security.core.Authentication (Interface)
