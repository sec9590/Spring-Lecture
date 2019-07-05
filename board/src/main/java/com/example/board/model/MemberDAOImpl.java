package com.example.board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemberVO> memberList() {
		return sqlSession.selectList("member.memberList");
	}

	@Override
	public boolean checkPw(String userid, String password) {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("password", password);
		int count = sqlSession.selectOne("member.checkPw", map);
		if(count == 1)
			result = true;
		return result;
	}

	@Override
	public String login(MemberVO vo) {
		boolean result = false;		
		String name = sqlSession.selectOne("member.login", vo);
		System.out.println(name);
		if(name != null)
			return name;
		else
			return "false";
	}	

}
