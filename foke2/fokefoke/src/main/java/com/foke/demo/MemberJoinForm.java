package com.foke.demo;

import java.time.LocalDate;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberJoinForm {

	@Email
	@NotEmpty(message = "이메일은 필수항목입니다.")
	private String memberId1;
	
	@NotEmpty(message = "이메일 인증은 필수항목입니다.")
	private Integer memberId2;

	@Size(min = 8)
	@NotEmpty(message = "비밀번호는 필수항목입니다.")
	private String memberPw1;

	@Size(min = 8)
	@NotEmpty(message = "비밀번호 확인은 필수항목입니다.")
	private String memberPw2;

	@NotEmpty(message = "이름은 필수항목입니다.")
	private String memberName;
	
	@NotEmpty(message = "생년월일은 필수항목입니다.")
	private LocalDate birth;
	
	@NotEmpty(message = "전화번호는 필수항목입니다.")
	private String phone;

}