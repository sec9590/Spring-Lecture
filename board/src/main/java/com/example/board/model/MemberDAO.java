package com.example.board.model;

import java.util.List;

public interface MemberDAO {
	public List<MemberVO> memberList();	
	public boolean checkPw(String userid, String password);
	public String login(MemberVO vo);	
}