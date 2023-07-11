package com.foke.demo.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.foke.demo.DataNotFoundException;
import com.foke.demo.dto.MemberDTO;
import com.foke.demo.dto.NoticeDTO;
import com.foke.demo.repository.MemberRepository;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service

public class AdminService {
	
	private final MemberRepository memberRepository;
	private final NoticeRepository noticeRepository;
	
	
	//관리자등록
	@Transactional
	public void adminenroll(MemberDTO memberDTO, Integer adminCk) {
	    MemberDTO Member = new MemberDTO();

	    // 기존 회원 정보 복사
	    BeanUtils.copyProperties(memberDTO, Member);
	  
	    Member.setAdminCk(adminCk);
	    memberRepository.save(Member);
	}
	
	// 회원 리스트 읽기
		public List<MemberDTO> getList() {
			return this.memberRepository.findAll();
		}
		
	//회원 상세조회
    public MemberDTO getmemberdto(String id) {  
        Optional<MemberDTO> member = this.memberRepository.findById(id);
        if (member.isPresent()) {
        	return member.get();
        } else {
            throw new DataNotFoundException("Member not found");
        }
    }
	
	//페이징
	public Page<MemberDTO> getList(int page) {
		List<Sort.Order> sorts = new ArrayList<>();
		sorts.add(Sort.Order.desc("birth"));
		Pageable pageable = PageRequest.of(page, 10, Sort.by(sorts));
		return this.memberRepository.findAll(pageable);
	}
	
	//이벤트 페이징
	@Transactional
	public Page<NoticeDTO> getnoticeList(int page) {
	    List<Sort.Order> sorts = new ArrayList<>();
	    sorts.add(Sort.Order.desc("noticeId"));
	    Pageable pageable = PageRequest.of(page, 10, Sort.by(sorts));
	    return this.noticeRepository.findAll(pageable);
	}
    //관리자 페이징
    public Page<MemberDTO> getAdminList(int page) {
        int adminCkValue = 1;
        int pageSize = 10; // 페이지당 데이터 개수, 필요한 값을 설정하세요.
        String sortField = "memberId"; // 정렬에 사용할 필드명, 필요한 값을 설정하세요.

        PageRequest pageRequest = PageRequest.of(page, pageSize, Sort.by(sortField).ascending());
        Page<MemberDTO> members = memberRepository.findByAdminCk(adminCkValue, pageRequest);

        return members;
    }	
    
    //관리자 멤버 진급 수정
    @Transactional
    public void AddModify(MemberDTO memberdto, int adminCk) {
    	adminCk = 1;
    	memberdto.setAdminCk(adminCk);
    	this.memberRepository.save(memberdto);
    }
	
    //관리자 멤버 추방 수정
    @Transactional
    public void modify(MemberDTO memberdto, int adminCk) {
    	adminCk = 0;
    	memberdto.setAdminCk(adminCk);
        this.memberRepository.save(memberdto);
    }
    
    
	//회원삭제
	public void memberdelete(String id) {
		memberRepository.deleteByMemberId(id);
	}
	
	// 이벤트 리스트
	public List<NoticeDTO> getnoticeList() {
		return this.noticeRepository.findAll();
	}
}
