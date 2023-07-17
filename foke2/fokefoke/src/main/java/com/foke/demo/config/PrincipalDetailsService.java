package com.foke.demo.config;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.foke.demo.dto.MemberDTO;
import com.foke.demo.repository.MemberRepository;

@Service
public class PrincipalDetailsService implements UserDetailsService{

	@Autowired
	private MemberRepository memberRepository;

	@Override
	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
		Optional<MemberDTO> memberEntity = memberRepository.findBymemberId(memberId);
		if(memberEntity.isPresent()) {
			return new PrincipalDetails(memberEntity.get());
		}
		
		return null;
	}
	
}
