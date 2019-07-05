package com.example.board.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.board.model.MemberDAO;
import com.example.board.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO mDao;

	@Override
	public List<MemberVO> memberList() {
		return mDao.memberList();
	}

	@Override
	public boolean checkPw(String userid, String password) {
		return mDao.checkPw(userid, password);
	}

	@Override
	public String login(MemberVO vo, HttpSession session) {
		String result = mDao.login(vo);
		if (result.equals("false")) {
			return "false";
		} else {
			session.setAttribute("name", result);
			session.setAttribute("userid", vo.getUserid());
			return "true";
		}
	}

}
