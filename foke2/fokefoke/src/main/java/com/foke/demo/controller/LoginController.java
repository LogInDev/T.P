package com.foke.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foke.demo.dto.MemberDTO;
import com.foke.demo.service.FindPwMailService;
import com.foke.demo.service.MailService;
import com.foke.demo.service.MemberService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	MemberService memberService;

	@Autowired
	MailService mailService;
	
	@Autowired
	FindPwMailService pwMailService;

	// 로그인 페이지 이동
	@GetMapping(value = "/loginform")
	public String login() {
		return "login/login";
	}

	// 회원가입 페이지 이동
	@GetMapping(value = "/join")
	public String joinGET() {
		return "login/join";
	}

	// 회원가입 서비스 실행
	@PostMapping("/join")
	public String joinPOST(MemberDTO member) {
		memberService.memberJoin(member);
		return "login/join_success";
	}

	// 아이디 중복 검사
	@PostMapping(value = "/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String memberId) {
		String result = memberService.idCheck(memberId);
		return result;
	}

	// 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGET(String memberId) throws Exception {
		String code = mailService.sendSimpleMessage(memberId);
		System.out.println("인증코드 : " + code);
		return code;
	}

	// 아이디 찾기 페이지 이동
	@GetMapping(value = "/find_email")
	public String findEmailGET() {
		return "login/find_email";
	}

	// 아이디 찾기 서비스 실행
	@PostMapping(value = "/findId")
	@ResponseBody
	public String findIdPOST(MemberDTO member) {
		String memberName = member.getMemberName();
		String phone = member.getPhone();
		String result = memberService.findId(memberName, phone);
		return result;
	}

	// 아이디 찾기 성공 페이지 이동
	@PostMapping(value = "/findId/success")
	public String findIdPOST(String memberId, Model model) {
		model.addAttribute("memberId", memberId);
		return "login/find_email_success";
	}

	// 비밀번호 찾기 페이지 이동
	@GetMapping(value = "/find_password")
	public String findPasswordGET() {
		return "login/find_password";
	}

	// 비밀번호 찾기 서비스 실행
	@PostMapping(value = "/findPw")
	public String findPwPOST(String memberId) throws Exception {
		String nPw = ""; // 임시 비번
		nPw = pwMailService.sendSimpleMessage(memberId);
		memberService.setPw(nPw, memberId);
		
		return "redirect:/login/loginform";
	}

}
