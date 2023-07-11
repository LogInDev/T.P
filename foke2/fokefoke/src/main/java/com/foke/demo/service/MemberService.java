package com.foke.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.foke.demo.DataNotFoundException;
import com.foke.demo.dto.MemberDTO;
import com.foke.demo.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberService {

	private final MemberRepository memberRepository;
	private final PasswordEncoder pwEncoder;

	// 회원 리스트 읽기
	public List<MemberDTO> getList() {
		return this.memberRepository.findAll();
	}

	// 회원 한명 읽기
	public MemberDTO getMember(String memberId) {
		Optional<MemberDTO> member = this.memberRepository.findById(memberId);
		if (member.isPresent()) {
			return member.get();
		} else {
			throw new DataNotFoundException("회원을 찾을 수 없습니다.");
		}
	}

	// 회원 가입
	public void memberJoin(MemberDTO member) {
		String memberPw = member.getMemberPw();
		member.setMemberPw(pwEncoder.encode(memberPw));
		this.memberRepository.save(member);
	}
	
	// 회원 수정
	public void memberEdit(MemberDTO member) {
		String memberId = member.getMemberId();
		Optional<MemberDTO> optionalMember = this.memberRepository.findBymemberId(memberId);
		if (optionalMember.isPresent()) {
			MemberDTO member2 = optionalMember.get();
			member2.setMemberName(member.getMemberName());
			member2.setBirth(member.getBirth());
			member2.setPhone(member.getPhone());
			this.memberRepository.save(member2);
		} else {
			System.out.println("회원 수정 실패");
		}
	}
	
	// 마케팅 수신 설정
	public void consentSet(MemberDTO member) {
		String memberId = member.getMemberId();
		Optional<MemberDTO> optionalMember = this.memberRepository.findBymemberId(memberId);
		if (optionalMember.isPresent()) {
			MemberDTO member2 = optionalMember.get();
			member2.setConsentPush(member.getConsentPush());
			member2.setConsentEmail(member.getConsentEmail());
			member2.setConsentSMS(member.getConsentSMS());
			this.memberRepository.save(member2);
		} else {
			System.out.println("마케팅 수신 설정 실패");
		}
	}

	// 회원 탈퇴
	public void memberWithdrawals(MemberDTO member) {
		String memberId = member.getMemberId();
		this.memberRepository.deleteByMemberId(memberId);
	}
	
	// 회원 아이디 중복 체크
	public String idCheck(String memberId) {
		int idChk = this.memberRepository.countByMemberId(memberId);
		if (idChk != 0) {
			return "fail";
		} else {
			return "success";
		}
	}

	// 아이디 찾기
	public String findId(String memberName, String phone) {
		Optional<MemberDTO> member = this.memberRepository.findByMemberNameAndPhone(memberName, phone);
		if (member.isPresent()) {
			Optional<String> email = member.map(MemberDTO::getMemberId);
			String emailM = email.orElse("");
			emailM = emailM.replaceAll("(?<=.{3}).(?=.*@)", "*");
			return emailM;
		} else {
			return "fail"; // 아이디 x
		}
	}

	// 비밀번호 찾기
	public void setPw(String nPw, String memberId) {
		String encodeNewPw = ""; // 암호화된 임시비번
		Optional<MemberDTO> optionalMember = this.memberRepository.findBymemberId(memberId);
		if (optionalMember.isPresent()) {
			MemberDTO member2 = optionalMember.get();
			encodeNewPw = pwEncoder.encode(nPw); // 비밀번호 암호화
			member2.setMemberPw(encodeNewPw);
			this.memberRepository.save(member2);
		} else {
			// Optional에 값이 없는 경우 처리 로직 작성
			System.out.println("비번 재설정 실패");
		}
	}

	// 비밀번호 확인
	public String pwChk(MemberDTO member) throws Exception {
		String rawPw = ""; // 입력된 인코딩 전 비밀번호
		String encodePw = ""; // 불러온 인코딩 후 비밀번호
		Optional<MemberDTO> optionalMember = this.memberRepository.findBymemberId(member.getMemberId());
		if (optionalMember.isPresent()) {
			MemberDTO member2 = optionalMember.get();
			rawPw = member.getMemberPw();
			encodePw = member2.getMemberPw();
			if (pwEncoder.matches(rawPw, encodePw)) { // 로그인 성공
				return "success";
			} else {
				return "fail";
			}
		} else {
			return "fail";
		}
	}

	
}
