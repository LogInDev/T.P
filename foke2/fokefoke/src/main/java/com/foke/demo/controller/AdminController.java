package com.foke.demo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.foke.demo.config.MemberRole;
import com.foke.demo.dto.MemberDTO;
import com.foke.demo.dto.NoticeDTO;
import com.foke.demo.dto.PaymentDTO;
import com.foke.demo.service.AdminService;
import com.foke.demo.service.CartService;
import com.foke.demo.service.MemberService;
import com.foke.demo.service.NoticeService;
import com.foke.demo.service.Paymentservice;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import net.coobird.thumbnailator.Thumbnails;

@RequiredArgsConstructor
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private final AdminService adminService;
	private final CartService cartService;
	private final NoticeService noticeService;
	private final Paymentservice paymentService;
	
	
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
	    
	    //Cart차트
		List<Object[]> mostAddedProducts = this.cartService.getMostAddedProducts();
		model.addAttribute("mostAddedProducts",mostAddedProducts);
	    
	    return "admin/admin_main";
	}
	
	
	
	//관리자사이드바 정보
	@ControllerAdvice
	public class UserControllerAdvice {

	    private final MemberService memberService;

	    public UserControllerAdvice(MemberService memberService) {
	        this.memberService = memberService;
	    }

	    @ModelAttribute("username")
	    public String getUsername() {
	        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	        if (auth != null && auth.isAuthenticated()) {
	            return auth.getName();
	        }
	        return null;
	    }

	    @ModelAttribute("memberName")
	    public String getMemberName() {
	        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	        if (auth != null && auth.isAuthenticated()) {
	            return memberService.getMemberNameByUsername(auth.getName());
	        }
	        return null;
	    }
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
	public String detail(Model model, @PathVariable("memberId") String memberId) {
	    MemberDTO memberdto = this.adminService.getmemberdto(memberId);
	    String[] memberIdParts = splitMemberId(memberdto.getMemberId());
	    model.addAttribute("username", memberIdParts[0]);
	    model.addAttribute("domain", memberIdParts[1]);
	    model.addAttribute("memberdto", memberdto);
	    return "admin/admin_detail";
	}

	    public String[] splitMemberId(String memberId) {
	        return memberId.split("@");
	    
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
    
    
    //이벤트 글쓰기 페이지
  	@GetMapping("/notice_enroll")
  	public String noticeEnroll(Model model) {
  	    model.addAttribute("noticeDTO", new NoticeDTO());
  	    return "admin/admin_noticeenroll";
  	}
    
  	
	//글등록,이미지 등록
	@PostMapping("/notice_enroll")
	public String noticeEnroll(@Valid NoticeDTO noticedto, BindingResult bindingResult,
	                           @RequestParam(value = "fileItem", required = false) MultipartFile imageFile,
	                           @RequestParam(value = "detailFile", required = false) MultipartFile detailImageFile) throws IOException {
	    if (bindingResult.hasErrors()) {
	        return "admin/notice_enroll";
	    }

	    String fileName = "";
	    String detailfileName = "";
	    //사이즈 설정
	    int imageWidth = 400; // 원하는 가로 길이를 설정하세요.
	    int imageHeight = 300; // 원하는 세로 길이를 설정하세요.
	    
	    // 썸네일 이미지 파일 저장
        Path uploadPath = Paths.get("src/main/resources/static/img/blog/");
        String uploadDirectory = uploadPath.toAbsolutePath().toString() + File.separator;
        if (imageFile != null && !imageFile.isEmpty()) {
            File uploadDir = new File(uploadDirectory);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            fileName = imageFile.getOriginalFilename();

            // uuid 적용 파일 이름
            String uuid = UUID.randomUUID().toString();
            fileName = uuid + "_" + fileName;
            File imageFileToSave = new File(uploadDirectory + fileName);
            imageFile.transferTo(imageFileToSave);
        }
	    
        // 게시판 이미지 파일 저장
        Path boardPath = Paths.get("src/main/resources/static/img/board/");
        String boardDirectory = boardPath.toAbsolutePath().toString() + File.separator;
        if (detailImageFile != null && !detailImageFile.isEmpty()) {
            File boardDir = new File(boardDirectory);
            if (!boardDir.exists()) boardDir.mkdirs();

            detailfileName = detailImageFile.getOriginalFilename();

            // uuid 적용 파일 이름
            String uuid = UUID.randomUUID().toString();
            detailfileName = uuid + "_" + detailfileName;
            File imageFileToSave = new File(boardDirectory + detailfileName);
            detailImageFile.transferTo(imageFileToSave);

            if (!detailfileName.isEmpty()) {
                noticedto.setDetailImage(detailfileName);
            }
        }

	    // 이미지 리사이징
	    if (!fileName.isEmpty()) {
	        String resizedFileName = fileName.replace(".", "_resized.");
	        File resizedFile = new File(uploadDirectory + resizedFileName);
	        Thumbnails.of(uploadDirectory + fileName)
	                .size(imageWidth, imageHeight) 
	                .keepAspectRatio(false) // 원본 종횡비 미유지
	                .toFile(resizedFile);
	
	        // 파일 URL을 DTO 객체에 설정
	        noticedto.setNoticeImage(resizedFileName);
	    }

	    this.noticeService.enroll(noticedto.getNoticeTitle(), noticedto.getNoticeContent(), noticedto.getNoticeImage(),noticedto.getDetailImage());
	    return "redirect:/admin/noticelist";
	}
  	
	//썸네임 이미지 출력
	@GetMapping("/display/{noticeImage}")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(@PathVariable("noticeImage") String fileName) {
	    
	    // 경로 수정
	    Path uploadPath = Paths.get("src/main/resources/static/img/blog/");
	    System.out.println("uploadPath : " + uploadPath);
	    
	    String uploadDirectory = uploadPath.toAbsolutePath().toString() + File.separator;
	    File file = new File(uploadDirectory + fileName);
	    
	    ResponseEntity<byte[]> result = null;

	    try {
	        HttpHeaders header = new HttpHeaders();

	        header.add("Content-Type", Files.probeContentType(file.toPath()));
	        result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return result;
	}

	//게시판 이미지 출력
	@GetMapping("/display2/{detailImage}")
	@ResponseBody
	public ResponseEntity<byte[]> getFileEntity(@PathVariable("detailImage") String detailfileName) {
	    System.out.println("detailfileName : " + detailfileName);

	    // 경로 수정
	    Path boardPath = Paths.get("src/main/resources/static/img/board/");
	    String boardDirectory = boardPath.toAbsolutePath().toString() + File.separator;
	    File file = new File(boardDirectory + detailfileName);

	    ResponseEntity<byte[]> result = null;

	    try {
	        HttpHeaders header = new HttpHeaders();

	        header.add("Content-Type", Files.probeContentType(file.toPath()));
	        result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return result;
	}
	
    //게시글 삭제
    @PostMapping("/notice_delete/{id}")
    public String noticeDelete(@PathVariable("id") Integer id) {
        noticeService.delete(id);
        return "redirect:/admin/noticelist";
    }
    
    
	//게시글수정
    @GetMapping("/notice_modify/{id}")
    public String Modify(Model model, @PathVariable("id") Integer id) {
    	model.addAttribute("noticedto", noticeService.getnoticedto(id));
    	
        return "admin/admin_noticemodify";
    }
    
    
    //게시글수정실행
    @PostMapping("/notice_modify/{id}")
    public String noticeModify(@PathVariable("id") Integer id, NoticeDTO notice,
    		@RequestParam(value = "fileItem", required = false) MultipartFile imageFile,
            @RequestParam(value = "detailFile", required = false) MultipartFile detailImageFile) throws IOException {
    
    	String fileName = "";
	    String detailfileName = "";
	    NoticeDTO originalNotice = noticeService.getnoticedto(id);
	    //사이즈 설정
	    int imageWidth = 400; // 원하는 가로 길이를 설정하세요.
	    int imageHeight = 300; // 원하는 세로 길이를 설정하세요.
	    
	    // 썸네일 이미지 파일 저장
	    Path uploadPath = Paths.get("src/main/resources/static/img/blog/");
        String uploadDirectory = uploadPath.toAbsolutePath().toString() + File.separator;
	    if (imageFile != null && !imageFile.isEmpty()) {
	        File uploadDir = new File(uploadDirectory);
	        if (!uploadDir.exists()) uploadDir.mkdirs();

	        fileName = imageFile.getOriginalFilename();

	        // uuid 적용 파일 이름 
	        String uuid = UUID.randomUUID().toString();
	        fileName = uuid + "_" + fileName;
	        File imageFileToSave = new File(uploadDirectory + fileName);
	        imageFile.transferTo(imageFileToSave);
	        
	    }
	    // 게시판 이미지 파일 저장
	    Path boardPath = Paths.get("src/main/resources/static/img/board/");
	    String boardDirectory = boardPath.toAbsolutePath().toString() + File.separator;
	    if (detailImageFile != null && !detailImageFile.isEmpty()) {
	        File boardDir = new File(boardDirectory);
	        if (!boardDir.exists()) boardDir.mkdirs();

	        detailfileName = detailImageFile.getOriginalFilename();

	        // uuid 적용 파일 이름 
	        String uuid = UUID.randomUUID().toString();
	        detailfileName = uuid + "_" + detailfileName;
	        File imageFileToSave = new File(boardDirectory + detailfileName);
	        detailImageFile.transferTo(imageFileToSave);
	        
	        if (!detailfileName.isEmpty()) {
	            notice.setDetailImage(detailfileName);
	        }
	    } else {
	        notice.setDetailImage(originalNotice.getDetailImage());
	    }

	    // 이미지 리사이징
	    if (!fileName.isEmpty()) {
	        String resizedFileName = fileName.replace(".", "_resized.");
	        File resizedFile = new File(uploadDirectory + resizedFileName);
	        Thumbnails.of(uploadDirectory + fileName)
	                .size(imageWidth, imageHeight) 
	                .keepAspectRatio(false) // 원본 종횡비 미유지
	                .toFile(resizedFile);

	        // 파일 URL을 DTO 객체에 설정
	        notice.setNoticeImage(resizedFileName);
	    }  else {
	        notice.setNoticeImage(originalNotice.getNoticeImage());
	    }
    	
    NoticeDTO noticeTemp = noticeService.getnoticedto(id);
            
      noticeTemp.setNoticeTitle(notice.getNoticeTitle());
      noticeTemp.setNoticeContent(notice.getNoticeContent());
      noticeTemp.setNoticeImage(notice.getNoticeImage());
      noticeTemp.setDetailImage(notice.getDetailImage());
      noticeService.modify(noticeTemp, notice.getNoticeTitle(), notice.getNoticeContent(), notice.getNoticeImage(),notice.getDetailImage());
      return "redirect:/admin/notice_modify/" + noticeTemp.getNoticeId();
    }
    
    //주문정보 페이지불러오기
    @GetMapping("/orderlist")
	public String orderlist(HttpServletRequest request, Model model, @RequestParam(value="page", defaultValue="0") int page) {
		Page<PaymentDTO> paging = this.paymentService.getList(page);
		model.addAttribute("paging", paging);
		
	    String currentUrl = request.getRequestURI();
	    model.addAttribute("currentUrl", currentUrl);
		return "admin/admin_order";
	}
    
    //주문상세보기
    @GetMapping("/orderdetail/{id}")
    public String orderdetail(Model model, @PathVariable("id") Integer id) {
    	model.addAttribute("paymentdto", paymentService.getpaymentdto(id));
    	System.out.println("paymentdto 실행");
    	
        return "admin/admin_orderdetail";
    }
    
    //주문취소
    @PostMapping("/orderdelete/{id}")
    public String orderdelete(@PathVariable("id") Integer id) {
        paymentService.delete(id);
        return "redirect:/admin/orderlist";
    }
    
   
}
