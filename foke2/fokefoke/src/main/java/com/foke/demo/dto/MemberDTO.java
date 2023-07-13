package com.foke.demo.dto;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name = "member")
@Entity
public class MemberDTO {
	
	// 회원 기본 정보
    @Id
    @Column(nullable = false)
    private String memberId;

    @Column(length = 200)
    private String memberPw;
    
    @Column(length = 200)
    private String memberName;

    @Column
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birth;

    @Column
    private String phone;
    
    
    // 관리자 구분(0:일반사용자, 1:관리자)
    // 근데 쓸지 모르겠음
    @Column(nullable = false)
    private Integer adminCk = 0;
    
    
    // 마케팅 동의 여부(0:false, 1:true)
    @Column(nullable = false)
    private Integer consentPush;
    
    @Column(nullable = false)
    private Integer consentEmail;
    
    @Column(nullable = false)
    private Integer consentSMS;
    
    
    // 예비 변수
    @Column
    private Integer money = 0;
    
    @Column
    private Integer point = 1000;
    
}