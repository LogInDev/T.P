package com.foke.demo.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;

@Service
public class FindPwMailService implements MailServiceInter {

	@Autowired
	JavaMailSender emailsender; // Bean 등록해둔 MailConfig 를 emailsender 라는 이름으로 autowired

	private String nPw = ""; // 임시 비밀번호

	// 비번 메일 내용 작성
	@Override
	public MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException {
		System.out.println("보내는 대상 : " + to);
		System.out.println("임시 비번 : " + nPw);

		MimeMessage message = emailsender.createMimeMessage();

		message.addRecipients(RecipientType.TO, to);// 보내는 대상
		message.setSubject("[포케포케] 임시 비밀번호입니다.");// 제목

		String content = "";
		content += "<a href=" + "\"" + "http://localhost:8080/" + "\"" + ">";
		content += "<img src=" + "\"" + "https://i.imgur.com/XMK2u4x.png" + "\"" + ">";
		content += "</a>";
		content += "<br>";
		content += "<h3>임시 비밀번호가 발급되었습니다.</h3>";
		content += "<h1>" + nPw + "</h1>";
		content += "<br>";
		content += "로그인 후 비밀번호를 변경해주세요.";
		message.setText(content, "utf-8", "html");// 내용, charset 타입, subtype
		// 보내는 사람의 이메일 주소, 보내는 사람 이름
		message.setFrom(new InternetAddress("p0kepok3@naver.com", "포케포케"));// 보내는 사람

		return message;
	}

	// 랜덤 임시 비번 전송
	@Override	
	public String createKey() {
		String possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+~`{}[]:;<>?,./";
		StringBuilder text = new StringBuilder();
		Random random = new Random();

		for (int i = 0; i < 15; i++) {
			text.append(possible.charAt(random.nextInt(possible.length())));
		}

		nPw = text.toString(); // 임시 비밀번호
		return nPw;
	}

	// 비번 메일 발송
	@Override
	public String sendSimpleMessage(String to) throws Exception {
		nPw = createKey(); // 임시 비번

		MimeMessage message = createMessage(to); // 메일 발송
		try {// 예외처리
			emailsender.send(message);
		} catch (MailException es) {
			es.printStackTrace();
			throw new IllegalArgumentException();
		}

		return nPw; // 메일로 보냈던 인증 코드를 서버로 반환
	}

}
