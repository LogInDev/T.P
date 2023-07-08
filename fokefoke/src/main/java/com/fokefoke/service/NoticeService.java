package com.fokefoke.service;

import java.util.List;

import com.fokefoke.dto.NoticeDTO;
import com.fokefoke.dto.Paging;

public interface NoticeService {
	
	public NoticeDTO get(int noticeId);
	
	public boolean modify(NoticeDTO notice);
	
	public boolean remove(int noticeId);
	
	public int delete(int noticeId);

	public List<NoticeDTO> getList(Paging page);
	
	public int getTotal(Paging page);

	public void register(NoticeDTO notice);


	List<NoticeDTO> getListWithPaging(Paging page);

}
