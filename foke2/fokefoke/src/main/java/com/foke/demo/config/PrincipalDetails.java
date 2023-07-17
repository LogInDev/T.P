package com.foke.demo.config;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.foke.demo.dto.MemberDTO;

import lombok.Data;

@Data
public class PrincipalDetails implements UserDetails, OAuth2User {

	private MemberDTO member;
	private Map<String, Object> attributes;
	private String memberName;

	// 일반 로그인
	public PrincipalDetails(MemberDTO member) {
			this.member = member;
			this.memberName = member.getMemberName();
		}

	// OAuth 로그인
	public PrincipalDetails(MemberDTO member, Map<String, Object> attributes) {
			this.member = member;
			this.attributes = attributes;
			this.memberName = member.getMemberName();
		}

	// 해당 User의 권한을 리턴하는 곳
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collect = new ArrayList<>();
		collect.add(new GrantedAuthority() {
			@Override
			public String getAuthority() {
				if ("admin@".equals(member.getMemberId())) {
		            return "ROLE_ADMIN";
		        } else if (member.getAdminCk() == 1) {
		            return "ROLE_MANAGER";
		        } else {
		        	return "ROLE_USER";
		        }
			}
		});
		return collect;
	}

	@Override
	public String getPassword() {
		return member.getMemberPw();
	}

	@Override
	public String getUsername() {
		return member.getMemberId();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}

	@Override
	public String getName() {
		return null;
	}

}
