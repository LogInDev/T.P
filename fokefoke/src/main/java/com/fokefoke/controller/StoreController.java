package com.fokefoke.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fokefoke.dto.PageDTO;
import com.fokefoke.dto.Paging;
import com.fokefoke.dto.StoreDTO;
import com.fokefoke.service.StoreService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/store/*")
@AllArgsConstructor
public class StoreController {
	private StoreService service;

	@GetMapping("/list")
	public void list(Paging page, Model model) {

		List<StoreDTO> list =  service.getList(page);
		model.addAttribute("list", service.getList(page));

		int total = service.getTotal(page);
		model.addAttribute("pageMarker", new PageDTO(page, total));
	}


	@RequestMapping(value = "/listto", method = RequestMethod.GET)
	@ResponseBody
	public List<StoreDTO> getFilteredMap(HttpServletRequest request) {
		String keywords = request.getParameter("keywords");
		List<StoreDTO> list =  service.getFilteredMap(keywords);
		return list;
	}

	@PostMapping("/register")
	public String register(StoreDTO store, RedirectAttributes rttr) {
		log.info("register"+store);
		service.register(store);
		rttr.addFlashAttribute("result=====================>", store.getStoreId());
		return "redirect:/store/list";
	}


	@GetMapping("/register")
	public void register() {
	}

	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam ("storeId") int storeId, Model model) {
		log.info("get or modify"+storeId);
		model.addAttribute("store", service.get(storeId));
	}


	@PostMapping("/modify")
	public String modify(@RequestParam ("storeId")	int storeId,  StoreDTO store, RedirectAttributes rttr) {
		log.info("modify" + store + storeId);
		store.setStoreId(storeId);

		if(service.modify(store)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/store/list";
	}

	@GetMapping("/delete")
	public String delete() {
		return "views/store/delete";
	}
	@GetMapping({"/deleteProcess"})
	public String deleteProcess(@RequestParam ("storeId") int storeId) {
		service.remove(storeId);
		return "redirect:/store/list";
	}

}
