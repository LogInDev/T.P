package com.fokefoke.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fokefoke.dto.ProductDTO;
import com.fokefoke.dto.StockDTO;
import com.fokefoke.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService{

	private ProductMapper mapper;

	@Override
	public List<ProductDTO> getList() {
		log.info("getList=================================");
		return mapper.getList();
	}

	@Override
	public List<ProductDTO> typeSalad() {
		log.info("getSalad=================================");
		return mapper.typeSalad();
	}

	@Override
	public List<ProductDTO> typeSide() {
		log.info("getSide=================================");
		return mapper.typeSide();
	}

	@Override
	public List<ProductDTO> typeDrink() {
		log.info("getDrink=================================");
		return mapper.typeDrink();
	}

	@Override
	public List<StockDTO> getStockByStoreId(String storeId) {
		log.info("getStockByStoreId=================================");
		return mapper.getStockByStoreId(storeId);
	}

}
