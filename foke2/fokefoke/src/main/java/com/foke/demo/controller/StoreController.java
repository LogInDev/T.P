package com.foke.demo.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foke.demo.StoreForm;
import com.foke.demo.dto.StoreDTO;
import com.foke.demo.service.StoreService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/store")
public class StoreController {
	
	private final StoreService storeService;
	
	@GetMapping("/list")
	public String list(Model model,@RequestParam(value="page", defaultValue="0")int page,@Param("keyword")String keyword) {
		Page<StoreDTO> list = null;
		if(keyword == null) {
			list = this.storeService.getList(page);
			keyword = "";
		}else {
			list = this.storeService.search(keyword,page);
			model.addAttribute("keyword",keyword);
		}
		model.addAttribute("paging",list);
		model.addAttribute("keyword",keyword);
		return "store/list";
	}
	@GetMapping("/listto")
	    public ResponseEntity<List<StoreDTO>> getStoresByKeyword(@RequestParam String keyword) {
		List<StoreDTO> list = storeService.getStoresByKeyword(keyword);
		
		return ResponseEntity.ok(list);
	    }
	@GetMapping("/modify")
	public String get(@RequestParam ("storeId") int storeId, Model model) {
		StoreDTO store = this.storeService.getStore(storeId);
		model.addAttribute("store", store);
		return "store/modify";
	}
	@PostMapping("/modify")
	public String modify(@Valid StoreForm storeForm, BindingResult bindingResult, @RequestParam ("storeId")	int storeId) {
		if (bindingResult.hasErrors()) {
	        // 유효성 검사 실패 시 처리할 로직 작성
	        return "store/modify";
	    }
		StoreDTO store = storeService.getStore(storeId);
		storeService.modify(store, storeForm.getStoreName(), storeForm.getStoreAddress(),storeForm.getStoreTel(), storeForm.getStoreOpen(), storeForm.getStoreClose(), storeForm.getStoreLat(), storeForm.getStoreLng());
		return "redirect:/store/list";
	}
	@GetMapping("/register")
	public String register(StoreForm storeForm) {
		return "store/register";
	}
	@PostMapping("/register")
	public String register(StoreForm storeForm, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "store/register";
		}
		storeService.register(storeForm.getStoreName(), storeForm.getStoreAddress(), storeForm.getStoreTel(), storeForm.getStoreOpen(), storeForm.getStoreClose(), storeForm.getStoreLat(), storeForm.getStoreLng());
		return "redirect:/store/list";
	}
	@GetMapping({"/deleteProcess"})
	public String deleteProcess(@RequestParam ("storeId") int storeId) {
		StoreDTO store = this.storeService.getStore(storeId);
		storeService.delete(store);
		return "redirect:/store/list";
	}
}
