package com.baz.example.demobaz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan("com.baz.example.*")
@SpringBootApplication
@EnableCircuitBreaker
public class DemobazApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemobazApplication.class, args);
	}
}
