package com.fokefoke.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fokefoke.dto.MemberDTO;
import com.fokefoke.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper membermapper;

	@Override
	public void memberJoin(MemberDTO member) throws Exception {
		membermapper.memberJoin(member);
	}

	@Override
	public int idCheck(String memberId) throws Exception {
		return membermapper.idCheck(memberId);
	}
	
	@Override
	public MemberDTO memberLogin(MemberDTO member) throws Exception {
		return membermapper.memberLogin(member) ;
	}

	@Override
	public void memberEdit(MemberDTO member) throws Exception {
		membermapper.memberEdit(member);
	}
	
	@Override
	public MemberDTO memberSelectOne(String memberId) throws Exception {
		return membermapper.memberSelectOne(memberId);
	}
	
	@Override
	public void memberWithdrawal(MemberDTO member) throws Exception {
		membermapper.memberWithdrawals(member);
	}
	
	@Override
	public void editPassword(MemberDTO member) throws Exception {
		membermapper.editPassword(member);
	}
	
	@Override
	public MemberDTO findId(MemberDTO member) throws Exception {
		return membermapper.findId(member);
	}
	
	@Override
	public int findPw(MemberDTO member) throws Exception {
		return membermapper.findPw(member);
	}
	
	@Override
	public void consentSet(MemberDTO member) throws Exception {
		membermapper.consentSet(member);
	}
}
