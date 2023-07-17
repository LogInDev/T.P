package com.foke.demo.dto;

import java.sql.Timestamp;
import java.time.LocalDate;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Table(name = "member")
@Entity
@NoArgsConstructor
public class MemberDTO {

	// 회원 기본 정보
	@Id
	@Column(nullable = false)
	private String memberId;

	@Column
	@CreationTimestamp
	private Timestamp createDate;

	@Column
	private String memberPw;

	@Column
	private String memberName;

	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birth;

	@Column
	private String phone;

	// 관리자 구분(0:일반사용자, 1:관리자)
	@Column(nullable = false)
	private Integer adminCk = 0;

	// 마케팅 동의 여부(0:false, 1:true)
	@Column
	private Integer consentPush = 0;

	@Column
	private Integer consentEmail = 0;

	@Column
	private Integer consentSMS = 0;

	// 소셜 로그인
	@Column
	private String provider;

	@Column
	private String providerId;

	// 예비 변수
	@Column
	private Integer money = 0;

	@Column
	private Integer point = 1000;

	@Builder
	public MemberDTO(String memberId, Timestamp createDate, String memberPw, String memberName, Integer adminCk,
			String provider, String providerId) {
		super();
		this.memberId = memberId;
		this.createDate = createDate;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.adminCk = adminCk;
		this.provider = provider;
		this.providerId = providerId;
	}

}