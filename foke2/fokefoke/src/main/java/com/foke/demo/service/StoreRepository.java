package com.foke.demo.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import com.foke.demo.dto.StoreDTO;

public interface StoreRepository extends JpaRepository<StoreDTO, Long>{
	Page<StoreDTO> findAll(Pageable pageable);
	Page<StoreDTO> findAll(Specification<StoreDTO> spec, Pageable pageable);
	Page<StoreDTO> findByStoreNameContainingOrStoreAddressContaining(String storeName,String storeAddress, Pageable Pageable);
	StoreDTO findByStoreId(int storeId);
	List<StoreDTO> findByStoreNameContainingOrStoreAddressContaining(String storeName, String storeAddress);
}
