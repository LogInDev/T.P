package com.foke.demo.controller;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foke.demo.dto.NoticeDTO;
import com.foke.demo.service.NoticeService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/notice")
public class NoticeController {

	private final NoticeService noticeService;

	//목록
	@GetMapping("/list")
	public String list(Model model, @RequestParam(value="page", defaultValue="0") int page) {
		Page<NoticeDTO> paging = this.noticeService.getList(page);
		model.addAttribute("paging", paging);

		return "notice/Notice_list";
	}
	
	
	//디테일
	@GetMapping(value = "/detail/{noticeId}")
	public String detail(Model model, @PathVariable("noticeId") Integer id) {
		NoticeDTO noticedto = this.noticeService.getnoticedto(id);
		model.addAttribute("noticedto", noticedto);
		return "notice/Notice_detail";
	}

		
	// 섬네일 데이터 전송하기
	@GetMapping("/display/{noticeImage}")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(@PathVariable("noticeImage") String fileName) { // 특정 파일의 이름을 받아서 이미지 데이터를 전송하는 코드
	    System.out.println("fileName : " + fileName); // fileName은 파일의 경로

	    File file = new File("/home/ubuntu/fokefoke/static/img/blog/" + fileName);

	    System.out.println("file : " + file);

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

	// 게시판 데이터 전송하기
	@GetMapping("/display2/{detailImage}")
	@ResponseBody
	public ResponseEntity<byte[]> getFileEntity(@PathVariable("detailImage") String detailfileName) { // 특정 파일의 이름을 받아서 이미지 데이터를 전송하는 코드
	    System.out.println("detailfileName : " + detailfileName); // fileName은 파일의 경로

	    File file = new File("/home/ubuntu/fokefoke/static/img/board/" + detailfileName);

	    System.out.println("file : " + file);

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
   
}
