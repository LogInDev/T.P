package com.foke.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan(basePackages = "com.foke.demo")
public class FokefokeApplication {

	public static void main(String[] args) {
		SpringApplication.run(FokefokeApplication.class, args);
	}

}
