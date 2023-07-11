package com.foke.demo.service;

import java.io.UnsupportedEncodingException;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

//mail 서비스 interface
public interface MailServiceInter {

	// 인증 메일 내용 작성
	MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException;

	// 랜덤 인증 코드 전송
	String createKey();
	
	// 인증 메일 발송
	String sendSimpleMessage(String to) throws Exception;

}