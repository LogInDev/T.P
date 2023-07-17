package com.foke.demo.config;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.foke.demo.config.provider.FacebookUserInfo;
import com.foke.demo.config.provider.GoogleUserInfo;
import com.foke.demo.config.provider.KakaoUserInfo;
import com.foke.demo.config.provider.NaverUserInfo;
import com.foke.demo.config.provider.OAuth2UserInfo;
import com.foke.demo.dto.MemberDTO;
import com.foke.demo.repository.MemberRepository;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MemberRepository memberRepository;

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

		OAuth2User oauth2User = super.loadUser(userRequest);
		String provider = userRequest.getClientRegistration().getRegistrationId();
		
		OAuth2UserInfo oAuth2UserInfo = null;
		if(provider.equals("google")) {
			oAuth2UserInfo = new GoogleUserInfo(oauth2User.getAttributes());
		}else if(provider.equals("naver")){
			oAuth2UserInfo = new NaverUserInfo((Map)oauth2User.getAttributes().get("response"));
		}else if(provider.equals("kakao")){
			oAuth2UserInfo = new KakaoUserInfo(oauth2User.getAttributes());
		}
		
		String providerId = oAuth2UserInfo.getProviderid();
		String username = oAuth2UserInfo.getName();
		String password = bCryptPasswordEncoder.encode("0000");
		String email = oAuth2UserInfo.getEmail();
		Integer role = 0;
		
		Optional<MemberDTO> OptionalMemberEntity = memberRepository.findBymemberId(email);
		MemberDTO memberEntity = new MemberDTO();
		if(OptionalMemberEntity.isEmpty()) {
			memberEntity = MemberDTO.builder()
					.memberId(email)
					.memberPw(password)
					.memberName(username)
					.adminCk(role)
					.provider(provider)
					.providerId(providerId)
					.build();
			memberRepository.save(memberEntity);
		}else {
			memberEntity = OptionalMemberEntity.get();
		}
		
		return new PrincipalDetails(memberEntity, oauth2User.getAttributes());
	}
}
