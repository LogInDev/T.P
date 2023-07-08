package com.fokefoke.dto;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fokefoke.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	private ProductService service;
	
	@GetMapping("/list")
	public void list(HttpServletRequest request, String storeId, String storeName, String storeAddress, Model model) {
		model.addAttribute("list", service.getList());
		model.addAttribute("salad", service.typeSalad());
		model.addAttribute("side", service.typeSide());
		model.addAttribute("drink", service.typeDrink());
		
	    List<StockDTO> stockList = service.getStockByStoreId(storeId);
	    model.addAttribute("stock", stockList);
	    System.out.println("여기임~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+stockList);
	    
		HttpSession session = request.getSession();
		session.setAttribute("storeName", storeName);
		session.setAttribute("storeAddress", storeAddress);
		session.setAttribute("storeId", storeId);
		
		System.out.println(storeName);
		System.out.println(storeAddress);
		
		
	}
	
	@GetMapping("/reList")
	public ModelAndView reList(HttpServletRequest request, @RequestParam(required = false) String num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.getList());
		mav.addObject("salad", service.typeSalad());
		mav.addObject("side", service.typeSide());
		mav.addObject("drink", service.typeDrink());
		String tab="";
		if(num != null) {
			if(num.equals("1")) {
				tab = "샐러드";
			}else if(num.equals("2")) {
				tab = "사이드";
			}else if(num.equals("3")) {
				tab = "음료수";
			}
		}
		mav.addObject("tab", tab);
		HttpSession session = request.getSession();
		String storeId = (String)session.getAttribute("storeId");
		List<StockDTO> stockList = service.getStockByStoreId(storeId);
		mav.addObject("stock", stockList);
		mav.setViewName("product/list");
		return mav;
		
		
	}
	
}
