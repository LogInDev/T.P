package com.fokefoke.mapper;

import java.util.List;

import com.fokefoke.dto.Paging;
import com.fokefoke.dto.StoreDTO;

public interface StoreMapper {
    public List<StoreDTO> getApi();

	public List<StoreDTO>getList();
	
	public void insert(StoreDTO store);
	
	public void insertSelectKey(StoreDTO store);
	
	public StoreDTO read(int storeId);
	
	public int delete(int storeId);
	
	public int update(StoreDTO store);
	
	public List<StoreDTO> getListWithPaging(Paging page);
	
	public int getTotalCount(Paging page);

	public List<StoreDTO> getMap();

	public List<StoreDTO> getFilteredMap(String keywords);

}
