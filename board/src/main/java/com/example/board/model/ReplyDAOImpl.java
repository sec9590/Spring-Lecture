package com.example.board.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> list(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board_reply.list", bno);
	}

	@Override
	public void insert(ReplyVO vo) {
		sqlSession.insert("board_reply.insert", vo);
	}

	@Override
	public void update(ReplyVO vo) {
		sqlSession.update("board_reply.update", vo);
	}

	@Override
	public void delete(int rno) {
		sqlSession.delete("board_reply.delete", rno);
	}

}
