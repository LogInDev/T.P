package com.foke.demo.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.foke.demo.dto.NoticeDTO;

public interface NoticeRepository extends JpaRepository<NoticeDTO, Integer> {

    NoticeDTO findByNoticeTitle(String noticeTitle);

    NoticeDTO findByNoticeContent(String noticeContent);
    NoticeDTO findByNoticeImage(String noticeImage);
    NoticeDTO findByDetailImage(String detailImage);

    List<NoticeDTO> findByNoticeTitleLike(String noticeTitle);

    List<NoticeDTO> findAll();

    Page<NoticeDTO> findAll(Pageable pageable);
    
    //상세 이전 다음글
    NoticeDTO findTopByNoticeIdLessThanOrderByNoticeIdDesc(Integer noticeId);
    NoticeDTO findTopByNoticeIdGreaterThanOrderByNoticeIdAsc(Integer noticeId);

}