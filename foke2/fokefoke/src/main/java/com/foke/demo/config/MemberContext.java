package com.foke.demo.config;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.foke.demo.dto.MemberDTO;

import lombok.Getter;

@Getter
public class MemberContext extends User{
	private final String memberName;
	private final Integer point;
	private final String phone;
	
	public MemberContext(MemberDTO member, List<GrantedAuthority> authorities) {
		super(member.getMemberId(), member.getMemberPw(), authorities);
		this.memberName = member.getMemberName();
		this.point = member.getPoint();
		this.phone = member.getPhone();
	}
}
