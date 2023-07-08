package com.fokefoke.mapper;

import java.util.List;

import com.fokefoke.dto.NoticeDTO;
import com.fokefoke.dto.Paging;

public interface NoticeMapper {

	public List<NoticeDTO>getList();
	
	public void insert(NoticeDTO notice);
	
	public void insertSelectKey(NoticeDTO notice);
	
	public NoticeDTO read(int noticeId);
	
	public int delete(int noticeId);
	
	public int update(NoticeDTO notice);
	
	public List<NoticeDTO> getListWithPaging(Paging page);
	
	public int getTotalCount(Paging page);

}
