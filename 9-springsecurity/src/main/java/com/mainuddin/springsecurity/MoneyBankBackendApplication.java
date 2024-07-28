package com.mainuddin.springsecurity;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

@SpringBootApplication
@EnableWebSecurity
public class MoneyBankBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(MoneyBankBackendApplication.class, args);
	}

}
