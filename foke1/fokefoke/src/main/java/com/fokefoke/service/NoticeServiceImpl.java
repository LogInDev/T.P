package com.fokefoke.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fokefoke.dto.NoticeDTO;
import com.fokefoke.dto.Paging;
import com.fokefoke.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	private NoticeMapper mapper;

	@Override
	public void register(NoticeDTO notice) {
		log.info("get================================="+notice);
		mapper.insertSelectKey(notice);
		
	}

	@Override
	public NoticeDTO get(int noticeId) {
		log.info("get================================="+noticeId);
		return mapper.read(noticeId);
	}

	@Override
	public boolean modify(NoticeDTO notice) {
		log.info("modify================================="+notice);
		return mapper.update(notice)==1;
	}

	@Override
	public boolean remove(int noticeId) {
		log.info("modify================================="+noticeId);
		return mapper.delete(noticeId)==1;
	}

	@Override
	public List<NoticeDTO> getList(Paging page) {
		log.info("getList Paging page================================="+page);
		return mapper.getListWithPaging(page);
	}
	
	@Override
	public int getTotal(Paging page) {
		log.info("get total count");
		return mapper.getTotalCount(page);
	}
	
	@Override
	public int delete(int noticeId) {
		log.info("delete");
		return 0;
	}

	@Override
	public List<NoticeDTO> getListWithPaging(Paging page) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(page);
	}


	
}
