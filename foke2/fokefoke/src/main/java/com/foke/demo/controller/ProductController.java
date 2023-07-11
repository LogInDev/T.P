package com.foke.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.foke.demo.dto.ProductDTO;
import com.foke.demo.dto.StockDTO;
import com.foke.demo.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {
	@Autowired
	private ProductService productService;
	

	@GetMapping("/list")
	public String list(Model model, @Param("storeId") int storeId,@Param("storeName")String storeName,@Param("storeAddress")String storeAddress,@Param("num") String num, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("storeId")==null) {
			session.setAttribute("storeId", storeId);
			Integer storeIdInteger = (Integer) session.getAttribute("storeId");
		    storeId = storeIdInteger.intValue();
		}
		List<ProductDTO> list = productService.getList();
		List<ProductDTO> salad = productService.typeSalad();
		List<ProductDTO> side = productService.typeSide();
		List<ProductDTO> drink = productService.typeDrink();
		List<StockDTO> stockList = productService.quantity(storeId);
		model.addAttribute("list", list);
		model.addAttribute("salad", salad);
		model.addAttribute("side", side);
		model.addAttribute("drink", drink);
		model.addAttribute("stock", stockList);
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
		model.addAttribute("tab",tab);
		session.setAttribute("storeName", storeName);
		session.setAttribute("storeAddress", storeAddress);
		session.setAttribute("storeId", storeId);
		
		return "product/list";

	}
	
	@GetMapping("/reList")
	public String reList(Model model, HttpServletRequest request, @RequestParam(required = false) String num) {
		model.addAttribute("list", productService.getList());
		model.addAttribute("salad", productService.typeSalad());
		model.addAttribute("side", productService.typeSide());
		model.addAttribute("drink", productService.typeDrink());
		String tab="";
		System.out.println("+++++++++++"+num);
		if(num != null) {
			if(num.equals("1")) {
				tab = "샐러드";
			}else if(num.equals("2")) {
				tab = "사이드";
			}else if(num.equals("3")) {
				tab = "음료수";
			}
		}
		System.out.println("+++++++++++"+tab);
		model.addAttribute("tab", tab);
		HttpSession session = request.getSession();
		int storeId = (int)session.getAttribute("storeId");
		List<StockDTO> stockList = productService.quantity(storeId);
		model.addAttribute("stock", stockList);
		model.addAttribute("product/list");
		return "product/list";
		
		
	}
	
}
