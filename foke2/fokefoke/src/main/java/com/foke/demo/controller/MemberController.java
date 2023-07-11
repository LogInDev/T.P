package com.foke.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.foke.demo.dto.MemberDTO;
import com.foke.demo.service.MemberService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;

	// 비밀번호 확인 페이지 이동
	@GetMapping(value = "/mypage/info")
	public String checkPasswordGET() {
		return "member/mypage_info";
	}

	// 회원 비밀번호 확인
	@PostMapping(value = "/memberPwChk")
	@ResponseBody
	public String memberPwChkPOST(MemberDTO member, Model model) throws Exception {
		String result = memberService.pwChk(member);
		return result;
	}

	// 회원정보 수정 페이지 이동
	@GetMapping(value = "/mypage/edit")
	public String editMemberGET(@AuthenticationPrincipal User user, Model model) throws Exception {
		String memberId = user.getUsername();
		MemberDTO member = memberService.getMember(memberId);
		model.addAttribute("member", member);
		return "member/edit";
	}

	// 회원정보 수정
	@PostMapping(value = "/mypage/edit")
	public String editMemberPOST(MemberDTO member, RedirectAttributes rttr) throws Exception {
		memberService.memberEdit(member);
		MemberDTO member2 = memberService.getMember(member.getMemberId());
		if (member2 == null) { // 업데이트 실패
			return "/error";
		} else {
			rttr.addFlashAttribute("member", member2); // 로그인 성공
		}

		return "redirect:/member/mypage/edit";
	}

	// 마케팅 수신 설정 페이지 이동
	@GetMapping(value = "/mypage/push_setting")
	public String pushMemberGET(@AuthenticationPrincipal User user, Model model) {
		String memberId = user.getUsername();
		MemberDTO member = memberService.getMember(memberId);
		model.addAttribute("member", member);
		return "member/push_setting";
	}

	// 마케팅 수신 설정
	@PostMapping(value = "/consentPushSet")
	@ResponseBody
	public String consentPushPOST(MemberDTO member, RedirectAttributes rttr) throws Exception {
		memberService.consentSet(member);
		MemberDTO member2 = memberService.getMember(member.getMemberId());
		if (member2 == null) { // 업데이트 실패
			return "fail";
		} else {
			rttr.addFlashAttribute("member", member2); // 업데이트 성공
			return "success";
		}
	}

	// 비밀번호 재설정 페이지 이동
	@GetMapping(value = "/mypage/edit_password")
	public String editPwMemberGET(@AuthenticationPrincipal User user, Model model) {
		String memberId = user.getUsername();
		MemberDTO member = memberService.getMember(memberId);
		model.addAttribute("member", member);
		return "member/edit_password";
	}

	// 비밀번호 재설정
	@PostMapping(value = "/mypage/edit_password")
	public String editPwMemberPOST(MemberDTO member) throws Exception {
		memberService.setPw(member.getMemberPw(), member.getMemberId());
		return "redirect:/member/mypage/edit_password";
	}

	// 회원 탈퇴 페이지 이동
	@GetMapping(value = "/mypage/withdrawals")
	public String withdrawalsMemberGET(@AuthenticationPrincipal User user, Model model) {
		String memberId = user.getUsername();
		MemberDTO member = memberService.getMember(memberId);
		model.addAttribute("member", member);
		return "member/withdrawals";
	}

	// 회원 탈퇴
	@PostMapping(value = "mypage/withdrawals")
	public String withdrawalsMemberPOST(MemberDTO member) throws Exception {
		memberService.memberWithdrawals(member);
		return "redirect:/login/logout";
	}
}