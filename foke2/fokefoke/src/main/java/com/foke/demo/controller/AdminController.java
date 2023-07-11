package com.foke.demo.controller;

import java.security.Principal;

import org.springframework.data.domain.Page;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foke.demo.config.MemberRole;
import com.foke.demo.dto.MemberDTO;
import com.foke.demo.dto.NoticeDTO;
import com.foke.demo.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private final AdminService adminService;
	
	// 관리자 메인 페이지 이동
	@GetMapping("/main")
	public String adminmain(Principal principal, Model model) {
	    // 사용자 이름 가져오기
	    String username = principal.getName();
	    model.addAttribute("username", username);

	    boolean isAdmin = false;

	    // Spring Security context에서 현재 로그인한 사용자의 정보 가져오기
	    Object principalObj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

	    if (principalObj instanceof UserDetails) {
	        UserDetails userDetails = (UserDetails) principalObj;

	        // 사용자가 가지고 있는 권한 목록 확인
	        for (GrantedAuthority authority : userDetails.getAuthorities()) {
	            // 권한이 MemberRole.ADMIN의 value와 일치하는 경우 관리자로 간주
	            if (authority.getAuthority().equals(MemberRole.ADMIN.getValue())) {
	                isAdmin = true;
	            }
	        }
	    }

	    // 관리자 여부에 따라 adminCk 값을 설정
	    if (isAdmin) {
	        model.addAttribute("adminCk", 1);
	    } else {
	        model.addAttribute("adminCk", 0);
	    }

	    return "admin/admin_main";
	}

	
    // 관리자 목록페이지 이동
    @GetMapping("/adminlist")
    public String adminlist(HttpServletRequest request, Model model, @RequestParam(value = "page", defaultValue = "0") int page) {

        Page<MemberDTO> members = adminService.getAdminList(page);
        model.addAttribute("paging", members);

        String currentUrl = request.getRequestURI();
        model.addAttribute("currentUrl", currentUrl);

        return "admin/admin_adminlist.html";
    }
	
    //관리자 진급
	@PostMapping("/enroll")
	public String adminEnroll(@Valid MemberDTO memberDTO, BindingResult bindingResult,
	                             @RequestParam(value="adminCk", required=false, defaultValue="null") Integer adminCk) {
	        if (bindingResult.hasErrors()) {
	        	System.out.println("adminCk________________________"+ adminCk);
	            return "admin/detail";
	        }
	        // 회원 등록 ( 관리자 및 일반 회원 모두 )
	        adminService.adminenroll(memberDTO, adminCk);
	        
	        return "redirect:/admin/list";
	}
	
	//회원목록 페이지
	@GetMapping("/list")
	public String list(HttpServletRequest request, Model model, @RequestParam(value="page", defaultValue="0") int page) {
		Page<MemberDTO> paging = this.adminService.getList(page);
		model.addAttribute("paging", paging);
		
	    String currentUrl = request.getRequestURI();
	    model.addAttribute("currentUrl", currentUrl);
		return "admin/admin_list";
	}
	//회원 정보 페이지
	@GetMapping("/detail/{memberId}")
	public String detail(Model model, @PathVariable("memberId") String id) {
		MemberDTO memberdto = this.adminService.getmemberdto(id);
		model.addAttribute("memberdto", memberdto);
		return "admin/admin_detail";
	}
	
	//관리자멤버 진급 수정
	@PostMapping("/addmodify/{id}")
    public String adminAddModify(@PathVariable("id") String id, MemberDTO member) {
	MemberDTO adminTemp = adminService.getmemberdto(id);
    
	adminTemp.setAdminCk(member.getAdminCk());
	adminService.AddModify(adminTemp, member.getAdminCk());
      return "redirect:/admin/adminlist";
    }
	
	//관리자멤버 추방 수정
	@PostMapping("/modify/{id}")
	public String adminModify(@PathVariable("id") String id, MemberDTO member) {
		MemberDTO adminTemp = adminService.getmemberdto(id);
		
		adminTemp.setAdminCk(member.getAdminCk());
		adminService.modify(adminTemp, member.getAdminCk());
		return "redirect:/admin/adminlist";
	}


		
	//회원 삭제
    @PostMapping("/delete/{id}")
    public String memberDelete(@PathVariable("id") String id) {
    	adminService.memberdelete(id);
        return "redirect:/admin/list"; 
    }
    
  //이벤트리스트
    @GetMapping("/noticelist")
    public String noticelist(HttpServletRequest request, Model model, @RequestParam(value="page", defaultValue="0") int page) {
        Page<NoticeDTO> paging = this.adminService.getnoticeList(page); // 페이지 번호를 0부터 시작하도록 수정
        model.addAttribute("paging", paging);

        String currentUrl = request.getRequestURI();
        model.addAttribute("currentUrl", currentUrl);
        return "admin/admin_noticelist";
    }
    
    
}
