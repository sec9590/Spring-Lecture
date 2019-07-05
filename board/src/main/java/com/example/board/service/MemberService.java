package com.example.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.board.model.MemberVO;


public interface MemberService {
	public List<MemberVO> memberList();
	public boolean checkPw(String userid, String password);
	public String login(MemberVO vo, HttpSession session);

}
