package com.foke.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foke.demo.DetailRepository;
import com.foke.demo.NutritionalRepository;
import com.foke.demo.dto.DetailDTO;
import com.foke.demo.dto.NutritionalDTO;
import com.foke.demo.dto.ProductDTO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class DetailService {

	private final DetailRepository detailRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	private final NutritionalRepository nutritionalRepository;
	
	
	public List<DetailDTO> getList() {
		return this.detailRepository.findAll();
	}
	
	public List<ProductDTO> getType(String productType){
		return productRepository.findByProductType(productType);
	}
	
	public ProductDTO getProduct(String productName){
		return productRepository.findByProductName(productName);
	}
	
	public NutritionalDTO getNutritional(String productName){
		return this.nutritionalRepository.findByProductName(productName);
	}
	
	public DetailDTO getAuto(String productName){
		return this.detailRepository.findByMemberIdAndProductName("admin@0", productName);
	}
	
	public List<ProductDTO> getList(String productName){
		return productRepository.findAllByOrderByProductIdDesc();
	}
	
	
}
