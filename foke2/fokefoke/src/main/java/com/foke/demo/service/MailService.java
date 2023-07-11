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
public class MailService implements MailServiceInter {

	@Autowired
	JavaMailSender emailsender; // Bean 등록해둔 MailConfig 를 emailsender 라는 이름으로 autowired

	private String ePw; // 인증번호

	// 인증 메일 내용 작성
	@Override
	public MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException {
		System.out.println("보내는 대상 : " + to);
		System.out.println("인증 번호 : " + ePw);

		MimeMessage message = emailsender.createMimeMessage();

		message.addRecipients(RecipientType.TO, to);// 보내는 대상
		message.setSubject("[포케포케] 회원가입 인증코드입니다.");// 제목

		String content = "";
		content += "<a href=" + "\"" + "http://localhost:8080/" + "\"" + ">";
		content += "<img src=" + "\"" + "https://i.imgur.com/XMK2u4x.png" + "\"" + ">";
		content += "</a>";
		content += "<br>";
		content += "<h3>인증코드를 확인해주세요.</h3>";
		content += "<h1>" + ePw + "</h1>";
		content += "<br>";
		content += "해당 인증번호를 인증번호 확인란에 기입해주세요.";
		message.setText(content, "utf-8", "html");// 내용, charset 타입, subtype
		// 보내는 사람의 이메일 주소, 보내는 사람 이름
		message.setFrom(new InternetAddress("p0kepok3@naver.com", "포케포케"));// 보내는 사람

		return message;
	}

	// 랜덤 인증 코드 전송
	@Override
	public String createKey() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();

		for (int i = 0; i < 8; i++) { // 인증코드 8자리
			int index = rnd.nextInt(3); // 0~2 까지 랜덤, rnd 값에 따라서 아래 switch 문이 실행됨

			switch (index) {
			case 0:
				key.append((char) ((int) (rnd.nextInt(26)) + 97));
				// a~z (ex. 1+97=98 => (char)98 = 'b')
				break;
			case 1:
				key.append((char) ((int) (rnd.nextInt(26)) + 65));
				// A~Z
				break;
			case 2:
				key.append((rnd.nextInt(10)));
				// 0~9
				break;
			}
		}

		return key.toString();
	}
	
	// 인증 메일 발송
	// sendSimpleMessage 의 매개변수로 들어온 to 는 곧 이메일 주소가 되고,
	// MimeMessage 객체 안에 내가 전송할 메일의 내용을 담는다.
	// 그리고 bean 으로 등록해둔 javaMail 객체를 사용해서 이메일 send!!
	@Override
	public String sendSimpleMessage(String to) throws Exception {

		ePw = createKey(); // 랜덤 인증번호 생성

		MimeMessage message = createMessage(to); // 메일 발송
		try {// 예외처리
			emailsender.send(message);
		} catch (MailException es) {
			es.printStackTrace();
			throw new IllegalArgumentException();
		}

		return ePw; // 메일로 보냈던 인증 코드를 서버로 반환
	}
}