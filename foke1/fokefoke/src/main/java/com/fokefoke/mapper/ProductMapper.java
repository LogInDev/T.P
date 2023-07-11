package com.fokefoke.mapper;

import java.util.List;

import com.fokefoke.dto.ProductDTO;
import com.fokefoke.dto.StockDTO;

public interface ProductMapper {
	public List<ProductDTO>getList();
	
	public List<ProductDTO>typeSalad();
	
	public List<ProductDTO>typeSide();
	
	public List<ProductDTO>typeDrink();
	
	public List<StockDTO> getStockByStoreId(String storeId);

}
