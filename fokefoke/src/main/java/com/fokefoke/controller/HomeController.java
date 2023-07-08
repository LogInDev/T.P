package com.fokefoke.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fokefoke.dto.NoticeDTO;
import com.fokefoke.dto.Paging;
import com.fokefoke.dto.ProductDTO;
import com.fokefoke.service.NoticeService;
import com.fokefoke.service.ProductService;

import lombok.Data;
import lombok.extern.log4j.Log4j2;


@Controller
@Data
@Log4j2
public class HomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Locale locale, Model model) {

        log.info("Welcome home! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        model.addAttribute("serverTime", formattedDate);

        return "index";

    }
    
 // 약관동의 페이지 이동
    @GetMapping(value = "/usepolicy")
    public void usepolicyGET() {
    }
    
    // 약관동의 페이지 이동
    @GetMapping(value = "/privacy")
    public void privacyGET() {
    }

    @Autowired
    private ProductService service;

    @GetMapping("/menuList")
    @ResponseBody
    public Map<String, Object> menuList() {
        List<ProductDTO> product = service.getList();
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("product", product);
        return resultMap;
    }
    
    @Autowired
    private NoticeService service2;

    @GetMapping("/noticeList")
    @ResponseBody
    public Map<String, Object> noticeList(Paging page) {
        List<NoticeDTO> notice = service2.getList(page);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("notice", notice);
        return resultMap;
    }

}