package com.foke.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foke.demo.dto.NoticeDTO;
import com.foke.demo.dto.ProductDTO;
import com.foke.demo.dto.StoreDTO;
import com.foke.demo.service.MemberService;
import com.foke.demo.service.NoticeService;
import com.foke.demo.service.ProductService;
import com.foke.demo.service.StoreService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HomeController {
	private final StoreService storeService;
	private final ProductService productService;
	private final NoticeService noticeService;
	private final MemberService memberService;

	@GetMapping("/")
	public String index(HttpServletRequest request, Model model) {
		return "index";
	}

	@GetMapping("/menuList")
	@ResponseBody
	public Map<String, Object> menuList() {
		List<ProductDTO> product = productService.getList();
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("product", product);
		return resultMap;
	}

	@GetMapping("/noticeList")
	@ResponseBody
	public Map<String, Object> noticeList() {
		List<NoticeDTO> notice = noticeService.getList();
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("notice", notice);
		return resultMap;
	}

	// 약관동의 페이지 이동
	@GetMapping(value = "/usepolicy")
	public void usepolicyGET() {
	}

	// 약관동의 페이지 이동
	@GetMapping(value = "/privacy")
	public void privacyGET() {
	}

	// 엘라스틱서치 페이지 이동
	@GetMapping(value = "/test")
	public String test(Model model, @RequestParam(value = "page", defaultValue = "0") int page,
			@Param("keyword") String keyword) {
		Page<StoreDTO> list = null;
		if (keyword == null) {
			list = this.storeService.getList(page);
			keyword = "";
		} else {
			list = this.storeService.search(keyword, page);
			model.addAttribute("keyword", keyword);
		}
		model.addAttribute("paging", list);
		model.addAttribute("keyword", keyword);
		return "test";
	}
}
