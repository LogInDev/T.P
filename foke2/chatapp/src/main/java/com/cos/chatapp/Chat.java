package com.cos.chatapp;

import java.time.LocalDateTime;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Data
@Document(collection="chat")
public class Chat {
	@Id
	private String id;
	private String msg;
	private String sender; //보내는 사람
	//private String receiver; // 받는 사람(귓솔말할 때 사용됨)
	private String roomNum; //방번호
	private Integer pushNum; //push 숫자
	
	private LocalDateTime createdAt;

}
