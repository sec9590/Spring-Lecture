package com.example.spring01.service;

import java.util.List;

import com.example.spring01.model.dto.MemberDTO;

public interface MemberService {
	public List<MemberDTO> memberList();
	public void insertMember(MemberDTO vo);
	public MemberDTO viewMember(String userid);
	public void deleteMember(String userid);
	public void updateMember(MemberDTO vo);
	public boolean checkPw(String userid, String password);
	public boolean login(String userid, String password);
}
