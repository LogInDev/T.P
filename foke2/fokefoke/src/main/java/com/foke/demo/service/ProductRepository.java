package com.foke.demo.service;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.foke.demo.dto.ProductDTO;
import com.foke.demo.dto.StockDTO;

public interface ProductRepository extends JpaRepository<ProductDTO, Integer>{
	List<ProductDTO> findByProductType(String productType);
	ProductDTO findByProductName(String productName);
	List<ProductDTO> findAllByOrderByProductIdDesc();
	
	List<ProductDTO> findAll();
	@Query(value = "Select p from ProductDTO p where p.productType='샐러드' ORDER BY p.productId DESC")
	List<ProductDTO> typeSalad();
	@Query(value = "Select p from ProductDTO p where p.productType='사이드' ORDER BY p.productId DESC")
	List<ProductDTO> typeSide();
	@Query(value = "Select p from ProductDTO p where p.productType='음료' ORDER BY p.productId DESC")
	List<ProductDTO> typeDrink();
	@Query(value = "SELECT s FROM StockDTO s WHERE s.storeDTO.storeId = :storeId")
	List<StockDTO> findProductStocksByStoreId(@Param("storeId") int storeId);
}
