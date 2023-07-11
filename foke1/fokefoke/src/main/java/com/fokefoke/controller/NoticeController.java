package com.fokefoke.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fokefoke.dto.NoticeDTO;
import com.fokefoke.dto.PageDTO;
import com.fokefoke.dto.Paging;
import com.fokefoke.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {
	private NoticeService service;

	@GetMapping("/list")
	public void list(Paging page, Model model) {

		List<NoticeDTO> list =  service.getList(page);
		model.addAttribute("list", service.getList(page));

		int total = service.getTotal(page);
		model.addAttribute("pageMarker", new PageDTO(page, total));
	}
	







	@PostMapping("/register")
	public String register(NoticeDTO notice, RedirectAttributes rttr) {
		log.info("register"+notice);
		service.register(notice);
		rttr.addFlashAttribute("result=====================>", notice.getNoticeId());
		return "redirect:/notice/list";
	}


	@GetMapping("/register")
	public void register() {
	}

	@GetMapping({"/view", "/modify"})
	public void get(@RequestParam ("noticeId") int noticeId, Model model) {
		log.info("get or modify"+noticeId);
		model.addAttribute("noticeList", Collections.singletonList(service.get(noticeId)));
	}


	@PostMapping("/modify")
	public String modify(@RequestParam ("noticeId")	int noticeId, NoticeDTO notice, RedirectAttributes rttr) {
		log.info("modify" + notice + noticeId);
		notice.setNoticeId(noticeId);

		if(service.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/notice/list";
	}

	@GetMapping("/delete")
	public String delete() {
		return "views/notice/delete";
	}
	@GetMapping({"/deleteProcess"})
	public String deleteProcess(@RequestParam ("noticeId") int noticeId) {
		service.remove(noticeId);
		return "redirect:/notice/list";
	}

}
