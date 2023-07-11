package com.fokefoke.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fokefoke.dto.Paging;
import com.fokefoke.dto.StoreDTO;
import com.fokefoke.mapper.StoreMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class StoreServiceImpl implements StoreService{
	
	private StoreMapper mapper;

	@Override
	public void register(StoreDTO store) {
		log.info("get================================="+store);
		mapper.insertSelectKey(store);
		
	}

	@Override
	public StoreDTO get(int storeId) {
		log.info("get================================="+storeId);
		return mapper.read(storeId);
	}

	@Override
	public boolean modify(StoreDTO store) {
		log.info("modify================================="+store);
		return mapper.update(store)==1;
	}

	@Override
	public boolean remove(int storeId) {
		log.info("modify================================="+storeId);
		return mapper.delete(storeId)==1;
	}

	@Override
	public List<StoreDTO> getMap() {
		log.info("getList=================================");
		return mapper.getMap();
	}
	
	@Override
	public List<StoreDTO> getList(Paging page) {
		log.info("getList Paging page================================="+page);
		return mapper.getListWithPaging(page);
	}
	
	@Override
	public int getTotal(Paging page) {
		log.info("get total count");
		return mapper.getTotalCount(page);
	}
	
	@Override
	public int delete(int storeId) {
		log.info("delete");
		return 0;
	}
	
	@Override
	public List<StoreDTO> getFilteredMap(String keywords) {
		log.info("getFilteredMap");
		return mapper.getFilteredMap(keywords);
	}
	
}
