package com.fokefoke.service;

import com.fokefoke.dto.MemberDTO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberDTO member) throws Exception;
	
	//아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
	
	//로그인
	public MemberDTO memberLogin(MemberDTO member) throws Exception;
	
	//회원정보수정
	public void memberEdit(MemberDTO member) throws Exception;
	
	//회원정보조회
	public MemberDTO memberSelectOne(String memberId) throws Exception;
	
	//회원정보탈퇴
	public void memberWithdrawal(MemberDTO member) throws Exception;
	
	//비밀번호변경
	public void editPassword(MemberDTO member) throws Exception;
	
	//아이디찾기
	public MemberDTO findId(MemberDTO member) throws Exception;
	
	//비밀번호찾기
	public int findPw(MemberDTO member) throws Exception;
	
	//회원정보수정
	public void consentSet(MemberDTO member) throws Exception;
}
