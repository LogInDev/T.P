package com.foke.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.foke.demo.dto.StoreDTO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class StoreService {
	@Autowired
	StoreRepository storeRepository;

	public Page<StoreDTO> getList(int page) {
		List<Sort.Order> sorts = new ArrayList<>();
		sorts.add(Sort.Order.desc("storeId"));
		Pageable pageable = PageRequest.of(page, 10, Sort.by(sorts));
		return this.storeRepository.findAll(pageable);
	}
	
	public Page<StoreDTO> search(String keyword,int page){
		List<Sort.Order> sorts = new ArrayList<>();
		sorts.add(Sort.Order.desc("storeId"));
		Pageable pageable = PageRequest.of(page, 10, Sort.by(sorts));
		Page<StoreDTO> storeList = storeRepository.findByStoreNameContainingOrStoreAddressContaining(keyword,keyword,pageable);
		return storeList;
	}
	public StoreDTO getStore(int storeId){
		return this.storeRepository.findByStoreId(storeId);
	}
	public void modify(StoreDTO store, String storeName, String storeAddress,String storeTel,String storeOpen,String storeClose
			, double storeLat, double storeLng) {
		store.setStoreName(storeName);
		store.setStoreTel(storeTel);
		store.setStoreAddress(storeAddress);
		store.setStoreOpen(storeOpen);
		store.setStoreClose(storeClose);
		store.setStoreLat(storeLat);
		store.setStoreLng(storeLng);
		this.storeRepository.save(store);
	}
	public void register(String storeName, String storeTel, String storeAddress,String StoreOpen, String storeClose,double storeLat, double storeLng) {
		StoreDTO s = new StoreDTO();
		s.setStoreName(storeName);
		s.setStoreAddress(storeAddress);
		s.setStoreTel(storeTel);
		s.setStoreOpen(StoreOpen);
		s.setStoreClose(storeClose);
		s.setStoreLat(storeLat);
		s.setStoreLng(storeLng);
		this.storeRepository.save(s);
	}
	public void delete(StoreDTO storeDTO) {
		this.storeRepository.delete(storeDTO);
	}
		 public List<StoreDTO> getStoresByKeyword(String keyword) {
		        return storeRepository.findByStoreNameContainingOrStoreAddressContaining(keyword, keyword);
		    }
}
