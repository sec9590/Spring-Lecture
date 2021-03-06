package com.example.board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository //현재 클래스를 dao bean으로 등록 (dao 객체)
public class BoardDAOImpl implements BoardDAO {
	@Inject // 의존성 주입을 요청합니다. 
			// Inject 어노테이션으로 주입을 요청하면 연결된 Component가 Module로부터 객체를 생성하여 넘겨줍니다.
	SqlSession sqlsession;
	
	@Override
	public void insert(BoardVO vo) {
		// TODO Auto-generated method stub
		sqlsession.insert("board.insert", vo);

	}

	@Override
	public BoardVO detail(int bno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("board.detail", bno);
	}

	@Override
	public void update(BoardVO vo) {
		// TODO Auto-generated method stub
		sqlsession.update("board.update", vo);
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		sqlsession.delete("board.delete", bno);
	}

	@Override
	public List<BoardVO> listAll() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("board.listall");
	}

	@Override
	public void increaseViewcnt(int bno){
		sqlsession.update("board.increaseViewcnt", bno);
	}

	@Override
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlsession.selectList("board.listall", map);
	}

	@Override
	public int countArticle(String searchOption, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlsession.selectOne("board.countArticle", map);
	}

}
