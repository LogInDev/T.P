package com.foke.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foke.demo.dto.ProductDTO;
import com.foke.demo.dto.StockDTO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ProductService {
	@Autowired
	ProductRepository productRepository;
	
	public List<ProductDTO> getList(){
		return productRepository.findAll();
	}
	public List<ProductDTO> typeSalad(){
		return productRepository.typeSalad();
	}
	public List<ProductDTO> typeSide(){
		return productRepository.typeSide();
	}
	public List<ProductDTO> typeDrink(){
		return productRepository.typeDrink();
	}
	public List<StockDTO> quantity(int storeId){
		return productRepository.findProductStocksByStoreId(storeId);
	}
}
