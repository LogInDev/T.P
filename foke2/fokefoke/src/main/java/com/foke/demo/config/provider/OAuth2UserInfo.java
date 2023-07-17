package com.foke.demo.config.provider;

public interface OAuth2UserInfo {
	String getProviderid();
	String getProvider();
	String getEmail();
	String getName();
}
