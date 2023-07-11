package com.foke.demo.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

import lombok.Getter;

@ConfigurationProperties(prefix = "mail")
@Getter
public class MailProperties {
    private String host;
    private int port;
    private String username;
    private String password;
    
    public MailProperties() {
		this.host = "smtp.naver.com";
		this.port = 465;
		this.username = "p0kepok3@naver.com";
		this.password = "vhzpvhzp33!";
	}
}