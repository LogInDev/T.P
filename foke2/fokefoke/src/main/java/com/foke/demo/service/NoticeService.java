package com.foke.demo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.foke.demo.DataNotFoundException;
import com.foke.demo.dto.NoticeDTO;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class NoticeService {

    private final NoticeRepository NoticeRepository;
    
    //공지사항 목록
    public List<NoticeDTO> getList() {
        return this.NoticeRepository.findAll();
    }
    
    //공지사항 상세조회
    public NoticeDTO getnoticedto(Integer id) {  
        Optional<NoticeDTO> notice = this.NoticeRepository.findById(id);
        if (notice.isPresent()) {
            return notice.get();
        } else {
            throw new DataNotFoundException("Notice not found");
        }
    }
    
    
    //공지사항 상세 이전다음글 가져오기
    public NoticeDTO getPreviousNotice(Integer noticeId) {
        return NoticeRepository.findTopByNoticeIdLessThanOrderByNoticeIdDesc(noticeId);
    }
    public NoticeDTO getNextNotice(Integer noticeId) {
        return NoticeRepository.findTopByNoticeIdGreaterThanOrderByNoticeIdAsc(noticeId);
    }
    
    //게시글쓰기
    @Transactional
    public void enroll(String noticeTitle, String noticeContent, String noticeImage,String detailImage) {
        NoticeDTO notice = new NoticeDTO();
        notice.setNoticeTitle(noticeTitle);
        notice.setNoticeContent(noticeContent);
        notice.setNoticeImage(noticeImage);
        notice.setDetailImage(detailImage);
        NoticeRepository.save(notice);
    }
    

    //페이징
    public Page<NoticeDTO> getList(int page) {
    	List<Sort.Order> sorts = new ArrayList<>();
        sorts.add(Sort.Order.desc("noticeDate"));
        Pageable pageable = PageRequest.of(page, 6, Sort.by(sorts));
        return this.NoticeRepository.findAll(pageable);
    }
    //게시글 수정
    @Transactional
    public void modify(NoticeDTO noticedto, String noticeTitle, String noticeContent, String noticeImage,String detailImage) {
    	noticedto.setNoticeTitle(noticeTitle);
    	noticedto.setNoticeContent(noticeContent);
    	noticedto.setNoticeImage(noticeImage);
    	noticedto.setDetailImage(detailImage);
        this.NoticeRepository.save(noticedto);
    }
    
    //게시글 삭제
    public void delete(Integer id) {
        NoticeRepository.deleteById(id);
    }
  

}