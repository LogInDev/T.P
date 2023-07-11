package com.foke.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.data.repository.query.Param;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foke.demo.dto.DetailDTO;
import com.foke.demo.dto.NutritionalDTO;
import com.foke.demo.dto.ProductDTO;
import com.foke.demo.service.DetailService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequestMapping("/detail")
@RequiredArgsConstructor
@Controller
public class DetailController {
	
	private final HttpSession session;
	private final DetailService detailService;
	

	@GetMapping("/view2")
	public String view2(Model model, ProductDTO productDTO) {
		System.out.println("***********" + productDTO.getProductName());
		List<ProductDTO> sides = this.detailService.getType("사이드");
		List<ProductDTO> beverages = this.detailService.getType("음료");
		ProductDTO product = this.detailService.getProduct(productDTO.getProductName());
//		ProductDTO product = this.detailService.getProduct("콘스프");
		NutritionalDTO nutritional = this.detailService.getNutritional(productDTO.getProductName());
//		NutritionalDTO nutritional = this.detailService.getNutritional("콘스프");
		
		model.addAttribute("list", detailService.getList());
		model.addAttribute("salad", detailService.getType("샐러드"));
		model.addAttribute("beverages", beverages);
		model.addAttribute("sides", sides);
		model.addAttribute("product", product);
		model.addAttribute("nutritional", nutritional);
		return "details/shop-detailsSide2";
	}
	
	@GetMapping("/view")
	public String List(@AuthenticationPrincipal User user, Model model, @ModelAttribute ProductDTO productDTO, @Param("productName")String productName) {
		
		String memberId = user.getUsername();
		session.setAttribute("memberId", memberId);
		
		List<DetailDTO> detailList = this.detailService.getList();
		List<ProductDTO> sides = this.detailService.getType("사이드");
		List<ProductDTO> beverages = this.detailService.getType("음료");
		ProductDTO product = this.detailService.getProduct(productDTO.getProductName());
//		ProductDTO product = this.detailService.getProduct("콘스프");
		NutritionalDTO nutritional = this.detailService.getNutritional(productDTO.getProductName());
//		NutritionalDTO nutritional = this.detailService.getNutritional("콘스프");
		Integer storeIdInteger = (Integer)session.getAttribute("storeId");
		String storeId = String.valueOf(storeIdInteger);
		DetailDTO auto = detailService.getAuto(productDTO.getProductName());
//		DetailDTO auto = detailService.getAuto("포케 샐러드");
		model.addAttribute("detailList", detailList);
		model.addAttribute("beverages", beverages);
		model.addAttribute("storeId",storeId);
		model.addAttribute("sides", sides);
		model.addAttribute("auto", auto);
		model.addAttribute("product", product);
		model.addAttribute("nutritional", nutritional);
		model.addAttribute("list", detailService.getList());
		model.addAttribute("salad", detailService.getType("샐러드"));
		if(!product.getProductType().equals("샐러드")) {
			return "details/shop-detailsSide";
		}else {
			return "details/shop-details";
		}

	}
	
	@PostMapping("/select")
	public String select(Model model, @RequestParam Map<String, String> map, 
			DetailDTO dto, ProductDTO productDTO, 
			@RequestParam(required = false, defaultValue="foke") List<String> toppingchk, 
			@RequestParam(required = false, defaultValue="foke") List<String> sourcechk, 
			@RequestParam(required = false, defaultValue="foke") List<String> extrachk) {
		ProductDTO product = this.detailService.getProduct(productDTO.getProductName());
		int currentPrice = Integer.parseInt(product.getProductPrice());
//		System.out.println(!sourcechk.get(0).equals("foke")+"999999999999999999999999999" + dto.getBsource());
		dto.setPrice(currentPrice);
		dto.setTotal(1);
		if (!toppingchk.get(0).equals("foke")) {
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
		if (!sourcechk.get(0).equals("foke")) {
			for(int i=0;i<sourcechk.size();i++) {
				if(i==0) {
					dto.setAsource(sourcechk.get(i));
				}else if(i==1) {
					dto.setBsource(sourcechk.get(i));
				}
			}
		}
		if(!extrachk.get(0).equals("foke")) {
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
		List<ProductDTO> sides = this.detailService.getType("사이드");
		List<ProductDTO> beverages = this.detailService.getType("음료");
//		System.out.println("@@@@@@@@@@@@@@@@@" + map.get("automenu"));
		model.addAttribute("beverages", beverages);
		model.addAttribute("sides", sides);
		model.addAttribute("product", product);
		model.addAttribute("map", map);
		model.addAttribute("dto", dto);
		
		return "details/shop-select";
	}

	@PostMapping("/update")
	@ResponseBody
	public DetailDTO update(DetailDTO dto, ProductDTO productDTO, @RequestParam List<String> toppingchk, 
			@RequestParam List<String> sourcechk, @RequestParam(required = false, defaultValue="foke") List<String> extrachk) {
		ProductDTO product = this.detailService.getProduct(productDTO.getProductName());
//		System.out.println(dto + "!!!!!!!!!!!!!!" + productDTO);
//		System.out.println(toppingchk + "================" + sourcechk + "$$$$$$$$$$$$$$$$" + extrachk);
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
		if(!extrachk.get(0).equals("foke")) {
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
//		System.out.println("update꺼꺼꺼꺼꺼꺼ㅓㅓㅓㅓ" + dto.getTotal());
		return dto;
	}
	
	@PostMapping("/toppingChk")
	@ResponseBody
	public DetailDTO toppingChk(DetailDTO dto, ProductDTO productDTO, @RequestParam List<String> toppingchk, 
			@RequestParam List<String> sourcechk, @RequestParam(required = false, defaultValue="foke") List<String> extrachk) {
		ProductDTO product = this.detailService.getProduct(productDTO.getProductName());
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
			if(!extrachk.get(0).equals("foke")) {
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
//			System.out.println("&&&&&&&&&&&" + dto.getPrice());
		return dto;
	}
	
	@GetMapping("/checkChat")
	public String checkChat() {
		
		return "checkChat";
	}
	
	@GetMapping("/chatMain/{memberId}")
	public String chatMain(Model model, @PathVariable String memberId) {
		model.addAttribute("memberId", memberId);
		return "chat";
	}
}
