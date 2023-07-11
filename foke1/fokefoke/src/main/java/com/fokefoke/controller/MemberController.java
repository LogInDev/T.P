package com.fokefoke.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fokefoke.dto.MemberDTO;
import com.fokefoke.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/member/*")
@Log4j2
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	public MemberController() {
		System.out.println("member @Controller 스프링 자동 생성");
	}

	// 로그인 페이지 이동
	@GetMapping(value = "/login")
	public void login() {
	}

	// 로그인
	@PostMapping(value = "/login.do")
	public String loginPOST(HttpServletRequest request, MemberDTO member,
			RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		MemberDTO member2 = memberService.memberSelectOne(member.getMemberId());

		if(member2 != null) { // 일치하는 아이디 존재시
			rawPw = member.getMemberPw(); // 사용자가 제출한 비밀번호
			encodePw = member2.getMemberPw(); // DB에 저장한 encodingPw
			if(pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 확인
				// 로그인 성공
				session.setAttribute("memberId", member2.getMemberId());
				session.setAttribute("adminCk", member2.getAdminCk());
				return "redirect:/";
			}else {
				// 로그인 실패
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login";
			}
		}else { // 로그인 실패
			rttr.addFlashAttribute("result", 0);
			
			return "redirect:/member/login";
		}
	}

	// 메인 페이지 로그아웃
	@GetMapping(value = "/logout")
	public String logoutMainGET(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:/";
	}
	
	// 비동기방식 로그아웃
    @PostMapping(value="logout.do")
    @ResponseBody
    public void logoutPOST(HttpServletRequest request) throws Exception{
        HttpSession session = request.getSession();
        session.invalidate();
    }

	// 회원가입 페이지 이동
	@GetMapping(value = "/join")
	public void joinGET() {
	}

	// 회원가입 서비스 실행
	@PostMapping(value = "/join")
	public String joinPOST(MemberDTO member) throws Exception {
        String rawPw = ""; // 인코딩 전 비밀번호
        String encodePw = ""; // 인코딩 후 비밀번호
        rawPw = member.getMemberPw(); // 비밀번호 데이터 얻음
        encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
        
        member.setMemberPw(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장
		memberService.memberJoin(member); // 회원가입 쿼리 실행

		return "/member/join_success";
	}

	// 회원가입 성공 페이지 이동
	@GetMapping(value = "/join/success")
	public String joinSuccessGET() {
		return "/member/join_success";
	}
	
	// 아이디 중복 검사
	@PostMapping(value = "/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {
		int result = memberService.idCheck(memberId);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	}
	
	// 이메일 인증
	@GetMapping(value="/mailCheck")
    @ResponseBody
    public String mailCheckGET(String memberId) throws Exception{
        // 인증번호(난수) 생성
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        
        // 이메일 보내기
        String setFrom = "p0kepok3@naver.com";
        String toMail = memberId;
        String title = "[포케포케] 회원가입 인증코드입니다.";
        String content =
        		"<a href=" + "\"" + "http://localhost:8080/" + "\"" + ">" +
        		"<img src=" + "\"" + "https://i.imgur.com/XMK2u4x.png" + "\"" + ">" +
        		"</a>" +
                "<br>" + 
                "<h3>인증코드를 확인해주세요.</h3>" +
                "<h1>" + checkNum + "</h1>" +
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입해주세요.";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
        }catch(Exception e) {
            e.printStackTrace();
        }
        String num = Integer.toString(checkNum);
        
        return num;
	}

	// 아이디 찾기 페이지 이동
	@GetMapping(value = "/find_email")
	public void findEmailGET() {
	}
	
	// 아이디 찾기
	@PostMapping(value = "/findId")
	@ResponseBody
	public String findIdPOST(MemberDTO member, Model model) throws Exception {
		MemberDTO member2 = new MemberDTO();
		member2 = memberService.findId(member);

		if (member2 != null) {
			String email = member2.getMemberId();
			String emailM = email.replaceAll("(?<=.{3}).(?=.*@)", "*");
			
			return emailM;
		} else {
			return "fail"; // 아이디 x
		}
	}
	
	// 아이디 찾기 성공 페이지 이동
	@PostMapping(value = "/findId/success")
	public String findIdPOST(String memberId, Model model) throws Exception {
		model.addAttribute("memberId", memberId);
		System.out.println(model.getAttribute("memberId"));
		
		return "/member/find_email_success";
	}

	// 비밀번호 찾기 페이지 이동
	@GetMapping(value = "/find_password")
	public void findPasswordGET() {
	}
	
	// 비밀번호 찾기
	@PostMapping(value = "/findPw")
	public String findPwPOST(MemberDTO member) throws Exception {
		String memberId = member.getMemberId();

		// 인증번호(난수) 생성
        int result = 0; // 성공 여부
        String newPw = ""; // 임시 비번
        String encodeNewPw = ""; // 암호화된 임시비번
        String possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+~`{}[]:;<>?,./|";
        StringBuilder text = new StringBuilder();
        Random random = new Random();
        
        for (int i = 0; i < 15; i++) {
            text.append(possible.charAt(random.nextInt(possible.length())));
        }
        
        newPw = text.toString(); // 임시 비밀번호
        encodeNewPw = pwEncoder.encode(newPw); // 비밀번호 암호화
        member.setMemberPw(encodeNewPw); // 인코딩된 비밀번호 member객체에 다시 저장
        result = memberService.findPw(member); // 임시비번 저장 쿼리 실행

        // 이메일 보내기
        String setFrom = "p0kepok3@naver.com";
        String toMail = memberId;
        String title = "[포케포케] 임시 비밀번호입니다.";
        String content =
        		"<a href=" + "\"" + "http://localhost:8080/" + "\"" + ">" +
        		"<img src=" + "\"" + "https://i.imgur.com/XMK2u4x.png" + "\"" + ">" +
        		"</a>" +
                "<br>" + 
                "<h3>임시 비밀번호가 발급되었습니다.</h3>" +
                "<h1>" + newPw + "</h1>" +
                "<br>" + 
                "로그인 후 비밀번호를 변경해주세요.";
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        if(result == 1) {
        	return "/member/login";
        }else {
        	log.info("비번 재설정 실패");
        	return null;
        }
	}
		
	// 비밀번호 확인 페이지 이동
	@GetMapping(value = "/mypage/info")
	public String checkPasswordGET() {
		return "/member/mypage_info";
	}
	
	// 회원 비밀번호 확인
	@PostMapping(value = "/memberPwChk")
	@ResponseBody
	public String memberPwChkPOST(MemberDTO member) throws Exception {
		String rawPw = ""; // 입력된 인코딩 전 비밀번호
	    String encodePw = ""; // 불러온 인코딩 후 비밀번호
		
		MemberDTO member2 = memberService.memberSelectOne(member.getMemberId());
		
		rawPw = member.getMemberPw();
		encodePw = member2.getMemberPw();
		
		if(pwEncoder.matches(rawPw, encodePw)) { // 로그인 성공
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 회원정보 수정 페이지 이동
	@GetMapping(value = "/mypage/edit")
	public String editMemberGET(HttpServletRequest request, Model model) throws Exception {
		String memberId = (String) request.getSession().getAttribute("memberId");
		
		MemberDTO member = memberService.memberSelectOne(memberId);
		model.addAttribute("member", member);
		
		return "/member/edit";
	}
	
	// 회원정보 수정
	@PostMapping(value = "/mypage/edit")
	public String editMemberPOST(MemberDTO member, RedirectAttributes rttr) throws Exception {
		memberService.memberEdit(member);
		
		MemberDTO member2 = memberService.memberSelectOne(member.getMemberId());
		
		if(member2 == null) { //업데이트 실패
			return "/error";
		}else {
			rttr.addFlashAttribute("result", 1);
			rttr.addFlashAttribute("member", member2); // 로그인 성공
		}
		
		return "redirect:/member/mypage/edit";
	}
	
	// 마케팅 수신 설정 페이지 이동
	@GetMapping(value = "/mypage/push_setting")
	public String pushMemberGET(HttpServletRequest request, Model model) throws Exception {
		String memberId = (String) request.getSession().getAttribute("memberId");
		
		MemberDTO member = memberService.memberSelectOne(memberId);
		model.addAttribute("member", member);
		
		return "/member/push_setting";
	}
	
	// 마케팅 수신 설정
	@PostMapping(value = "/consentPushSet")
	@ResponseBody
	public String consentPushPOST(MemberDTO member, RedirectAttributes rttr) throws Exception {
		memberService.consentSet(member);
		
		MemberDTO member2 = memberService.memberSelectOne(member.getMemberId());

		if(member2 == null) { // 업데이트 실패
			return "fail";
		}else {
			rttr.addFlashAttribute("member", member2); // 업데이트 성공
			return "success";
		}
	}
	
	// 비밀번호 재설정 페이지 이동
	@GetMapping(value = "/mypage/edit_password")
	public String editPwMemberGET() {
		return "/member/edit_password";
	}
	
	// 비밀번호 재설정
	@PostMapping(value = "/mypage/edit_password")
	public String editPwMemberPOST(MemberDTO member) throws Exception {
		 String rawPw = ""; // 인코딩 전 비밀번호
		 String encodePw = ""; // 인코딩 후 비밀번호
	     rawPw = member.getMemberPw(); // 비밀번호 데이터 얻음
	     encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
	     
	     member.setMemberPw(encodePw); // 인코딩된 비밀번호 member객체에 다시 저장
	     memberService.editPassword(member);
		
		return "redirect:/member/mypage/edit_password";
	}

	// 회원 탈퇴 페이지 이동
	@GetMapping(value = "/mypage/withdrawals")
	public String withdrawalsMemberGET() {
		
		return "/member/withdrawals";
	}

	// 회원 탈퇴
	@PostMapping(value = "mypage/withdrawals")
	public String withdrawalsMemberPOST(MemberDTO member) throws Exception {
		memberService.memberWithdrawal(member);
		
		return "redirect:/member/logout";
	}
	
}
