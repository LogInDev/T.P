package com.fokefoke.mapper;

import com.fokefoke.dto.MemberDTO;

public interface MemberMapper {

	//회원가입
	public void memberJoin(MemberDTO member);
	
	//아이디 중복 검사
	public int idCheck(String memberId);
	
	//로그인
	public MemberDTO memberLogin(MemberDTO member);
	
	//회원정보수정
	public void memberEdit(MemberDTO member);
	
	//회원정보조회
	public MemberDTO memberSelectOne(String memberId);
	
	//회원삭제
	public void memberWithdrawals(MemberDTO member);
	
	//비밀번호변경
	public void editPassword(MemberDTO member);
	
	//아이디찾기
	public MemberDTO findId(MemberDTO member);
	
	//비밀번호찾기
	public int findPw(MemberDTO member);
	
	//회원정보수정
	public void consentSet(MemberDTO member);
}
