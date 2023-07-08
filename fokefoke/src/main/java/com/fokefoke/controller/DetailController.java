package com.fokefoke.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fokefoke.dto.DetailDTO;
import com.fokefoke.dto.NutritionalDTO;
import com.fokefoke.dto.ProductDTO;
import com.fokefoke.dto.StockDTO;
import com.fokefoke.service.DetailService;
import com.fokefoke.service.ProductService;

import lombok.Data;


@Controller
@Data
@RequestMapping("/detail/*")
public class DetailController {
	private static final Logger logger = LoggerFactory.getLogger(DetailController.class);

	@Autowired
	DetailService service;
	
	@Autowired
	private ProductService proService;
	
	public DetailController() {
		System.out.println("@Controller 스프링 자동생성");

	}

	@RequestMapping(value = "/view", method = {RequestMethod.GET} )
	public ModelAndView view( ProductDTO product, HttpServletRequest request) {
		List<ProductDTO> sides = service.getSide();
		List<ProductDTO> beverages = service.getBeverage();
		product = service.getProduct(product);
		NutritionalDTO nutritional = service.getNutritional(product);
		DetailDTO auto = service.getAuto(product);
		ModelAndView mav = new ModelAndView();
		
		//list 추가
		mav.addObject("list", proService.getList());
		mav.addObject("salad", proService.typeSalad());
		mav.addObject("side", proService.typeSide());
		mav.addObject("drink", proService.typeDrink());
		HttpSession session = request.getSession();
		String storeId = (String)session.getAttribute("storeId");
		List<StockDTO> stockList = proService.getStockByStoreId(storeId);
		mav.addObject("stock", stockList);
		
		mav.addObject("sides", sides);
		mav.addObject("beverages", beverages);
		mav.addObject("product", product);
		mav.addObject("nutritional", nutritional);
		mav.addObject("auto", auto);
		if(!product.getProductType().equals("샐러드")) {
			mav.setViewName("detail/shop-detailsSide");
		}else {
			mav.setViewName("detail/shop-details");
		}
		return mav;
	}
	@RequestMapping(value = "/view2", method = {RequestMethod.GET} )
	public ModelAndView view2( ProductDTO product, HttpServletRequest request) {
		List<ProductDTO> sides = service.getSide();
		List<ProductDTO> beverages = service.getBeverage();
		product = service.getProduct(product);
		NutritionalDTO nutritional = service.getNutritional(product);
		DetailDTO auto = service.getAuto(product);
		ModelAndView mav = new ModelAndView();
		
		//list 추가
		mav.addObject("list", proService.getList());
		mav.addObject("salad", proService.typeSalad());
		mav.addObject("side", proService.typeSide());
		mav.addObject("drink", proService.typeDrink());
		HttpSession session = request.getSession();
		String storeId = (String)session.getAttribute("storeId");
		List<StockDTO> stockList = proService.getStockByStoreId(storeId);
		mav.addObject("stock", stockList);
		
		mav.addObject("sides", sides);
		mav.addObject("beverages", beverages);
		mav.addObject("product", product);
		mav.addObject("nutritional", nutritional);
		mav.setViewName("detail/shop-detailsSide2");
		return mav;
	}
//	@RequestMapping(value = "/view", method = RequestMethod.POST )
//	public ModelAndView view11(HttpServletRequest request, DetailDTO dto, @RequestParam(required = false) String num, @RequestParam(required = false) List<String> toppingchk, 
//			@RequestParam(required = false) List<String> sourcechk, @RequestParam(required = false) List<String> extrachk) {
//		if (toppingchk != null) {
//			for(int i=0;i<toppingchk.size();i++) {
//				if(i==0) {
//					dto.setAtopping(toppingchk.get(i));
//				}else if(i==1) {
//					dto.setBtopping(toppingchk.get(i));
//				}else if(i==2) {
//					dto.setCtopping(toppingchk.get(i));
//				}else if(i==3) {
//					dto.setDtopping(toppingchk.get(i));
//				}
//			}
//		}
//		if (sourcechk != null) {
//			for(int i=0;i<sourcechk.size();i++) {
//				if(i==0) {
//					dto.setAsource(sourcechk.get(i));
//				}else if(i==1) {
//					dto.setBsource(sourcechk.get(i));
//				}
//			}
//		}
//		if(extrachk!=null) {
//			for(int i=0;i<extrachk.size();i++) {
//				if(i==0) {
//					dto.setAextratopping(extrachk.get(i));
//				}else if(i==1) {
//					dto.setBextratopping(extrachk.get(i));
//				}
//			}
//		}
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", proService.getList());
//		mav.addObject("salad", proService.typeSalad());
//		mav.addObject("side", proService.typeSide());
//		mav.addObject("drink", proService.typeDrink());
//		String tab="사이드";
//		mav.addObject("tab", tab);
//		HttpSession session = request.getSession();
//		String storeId = (String)session.getAttribute("storeId");
//		List<StockDTO> stockList = proService.getStockByStoreId(storeId);
//		mav.addObject("stock", stockList);
//		int rs = service.insertDetail(dto);
//		mav.setViewName("product/list");
//		return mav;
//	}

	@RequestMapping(value = "/select", method = RequestMethod.POST)
	public ModelAndView select( @RequestParam Map<String, String> map , DetailDTO dto, ProductDTO product, @RequestParam(required = false) List<String> toppingchk, 
			@RequestParam(required = false) List<String> sourcechk, @RequestParam(required = false) List<String> extrachk) {
		product = service.getProduct(product);
		int currentPrice = Integer.parseInt(product.getProductPrice());
		dto.setPrice(currentPrice);
		dto.setTotal(1);
		if (toppingchk != null) {
			for(int i=0;i<toppingchk.size();i++) {
				if(i==0) {
					dto.setAtopping(toppingchk.get(i));
				}else if(i==1) {
					dto.setBtopping(toppingchk.get(i));
				}else if(i==2) {
					dto.setCtopping(toppingchk.get(i));
				}else if(i==3) {
					dto.setDtopping(toppingchk.get(i));
				}
			}
		}
		if (sourcechk != null) {
			for(int i=0;i<sourcechk.size();i++) {
				if(i==0) {
					dto.setAsource(sourcechk.get(i));
				}else if(i==1) {
					dto.setBsource(sourcechk.get(i));
				}
			}
		}
		if(extrachk!=null) {
			for(int i=0;i<extrachk.size();i++) {
				if(i==0) {
					dto.setAextratopping(extrachk.get(i));
					if(extrachk.get(i).equals("낫또") || extrachk.get(i).equals("크랩샐러드") || extrachk.get(i).equals("아보카도") || extrachk.get(i).equals("피코데가요")){
						currentPrice +=2000;
						dto.setPrice(currentPrice);
					}else {
						currentPrice +=1500;
						dto.setPrice(currentPrice);
					}
				}else if(i==1) {
					dto.setBextratopping(extrachk.get(i));
					if(extrachk.get(i).equals("낫또") || extrachk.get(i).equals("크랩샐러드") || extrachk.get(i).equals("아보카도") || extrachk.get(i).equals("피코데가요")){
						currentPrice +=2000;
						dto.setPrice(currentPrice);
					}else {
						currentPrice +=1500;
						dto.setPrice(currentPrice);
					}
				}
			}
		}
		if(dto.getExtramain()!=null) {
			currentPrice +=3000;
			dto.setPrice(currentPrice);
		}
		List<ProductDTO> sides = service.getSide();
		List<ProductDTO> beverages = service.getBeverage();
		ModelAndView mav = new ModelAndView();
		mav.addObject("sides", sides);
		mav.addObject("beverages", beverages);
		mav.addObject("product", product);
		mav.addObject("map", map);
		mav.addObject("dto", dto);
		mav.setViewName("detail/shop-select");
		return mav;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public DetailDTO update(DetailDTO dto, ProductDTO product, @RequestParam List<String> toppingchk, 
			@RequestParam List<String> sourcechk, @RequestParam(required = false) List<String> extrachk) {
		product = service.getProduct(product);
		int currentPrice = Integer.parseInt(product.getProductPrice());
		dto.setTotal(1);
		dto.setPrice(currentPrice);
		for(int i=0;i<toppingchk.size();i++) {
			if(i==0) {
				dto.setAtopping(toppingchk.get(i));
			}else if(i==1) {
				dto.setBtopping(toppingchk.get(i));
			}else if(i==2) {
				dto.setCtopping(toppingchk.get(i));
			}else if(i==3) {
				dto.setDtopping(toppingchk.get(i));
			}
		}
		for(int i=0;i<sourcechk.size();i++) {
			if(i==0) {
				dto.setAsource(sourcechk.get(i));
			}else if(i==1) {
				dto.setBsource(sourcechk.get(i));
			}
		}
		if(extrachk!=null) {
			for(int i=0;i<extrachk.size();i++) {
				if(i==0) {
					dto.setAextratopping(extrachk.get(i));
					if(extrachk.get(i).equals("낫또") || extrachk.get(i).equals("크랩샐러드") || extrachk.get(i).equals("아보카도") || extrachk.get(i).equals("피코데가요")){
						currentPrice +=2000;
						dto.setPrice(currentPrice);
					}else {
						currentPrice +=1500;
						dto.setPrice(currentPrice);
					}
				}else if(i==1) {
					dto.setBextratopping(extrachk.get(i));
					if(extrachk.get(i).equals("낫또") || extrachk.get(i).equals("크랩샐러드") || extrachk.get(i).equals("아보카도") || extrachk.get(i).equals("피코데가요")){
						currentPrice +=2000;
						dto.setPrice(currentPrice);
					}else {
						currentPrice +=1500;
						dto.setPrice(currentPrice);
					}
				}
			}
		}
		if(dto.getExtramain()!=null) {
			currentPrice +=3000;
			dto.setPrice(currentPrice);
		}
		if(dto.getSetside()!=null) {
			currentPrice +=2500;
			dto.setPrice(currentPrice);
		}
		return dto;
	}
	
	@RequestMapping(value = "/toppingChk", method = RequestMethod.POST)
	@ResponseBody
	public DetailDTO toppingChk(DetailDTO dto, ProductDTO product, @RequestParam List<String> toppingchk, 
			@RequestParam List<String> sourcechk, @RequestParam(required = false) List<String> extrachk) {
		product = service.getProduct(product);
		int currentPrice = Integer.parseInt(product.getProductPrice());
		dto.setTotal(1);
		dto.setPrice(currentPrice);
			for(int i=0;i<toppingchk.size();i++) {
				if(i==0) {
					dto.setAtopping(toppingchk.get(i));
				}else if(i==1) {
					dto.setBtopping(toppingchk.get(i));
				}else if(i==2) {
					dto.setCtopping(toppingchk.get(i));
				}else if(i==3) {
					dto.setDtopping(toppingchk.get(i));
				}
			}
			for(int i=0;i<sourcechk.size();i++) {
				if(i==0) {
					dto.setAsource(sourcechk.get(i));
				}else if(i==1) {
					dto.setBsource(sourcechk.get(i));
				}
			}
			if(extrachk!=null) {
				for(int i=0;i<extrachk.size();i++) {
					if(i==0) {
						dto.setAextratopping(extrachk.get(i));
						if(extrachk.get(i).equals("낫또") || extrachk.get(i).equals("크랩샐러드") || extrachk.get(i).equals("아보카도") || extrachk.get(i).equals("피코데가요")){
							currentPrice +=2000;
							dto.setPrice(currentPrice);
						}else {
							currentPrice +=1500;
							dto.setPrice(currentPrice);
						}
					}else if(i==1) {
						dto.setBextratopping(extrachk.get(i));
						if(extrachk.get(i).equals("낫또") || extrachk.get(i).equals("크랩샐러드") || extrachk.get(i).equals("아보카도") || extrachk.get(i).equals("피코데가요")){
							currentPrice +=2000;
							dto.setPrice(currentPrice);
						}else {
							currentPrice +=1500;
							dto.setPrice(currentPrice);
						}
					}
				}
			}
			if(dto.getExtramain()!=null) {
				currentPrice +=3000;
				dto.setPrice(currentPrice);
			}
			if(dto.getSetside()!=null) {
				currentPrice +=2500;
				dto.setPrice(currentPrice);
			}
		return dto;
	}
	
}
