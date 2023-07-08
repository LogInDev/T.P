package com.fokefoke.service;

import java.util.List;

import com.fokefoke.dto.Paging;
import com.fokefoke.dto.StoreDTO;

public interface StoreService {
	
	public StoreDTO get(int storeId);
	
	public boolean modify(StoreDTO store);
	
	public boolean remove(int storeId);
	
	public int delete(int storeId);

	public List<StoreDTO> getList(Paging page);
	
	public int getTotal(Paging page);

	public List<StoreDTO> getMap();

	public void register(StoreDTO store);

	public List<StoreDTO> getFilteredMap(String keywords);

}
