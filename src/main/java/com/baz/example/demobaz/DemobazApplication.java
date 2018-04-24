package com.baz.example.demobaz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@ComponentScan("com.baz.example.*")
@SpringBootApplication
@EnableAutoConfiguration
@Configuration
public class DemobazApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemobazApplication.class, args);
	}
}
