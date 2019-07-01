package com.example.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.board.model.BoardDAO;
import com.example.board.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject 
	BoardDAO bDao;
	
	@Override
	public void insert(BoardVO vo) {
		bDao.insert(vo);
	}

	@Override
	public BoardVO detail(BoardVO vo) {
		// TODO Auto-generated method stub
		return bDao.detail(vo);
	}

	@Override
	public void update(BoardVO vo) {
		// TODO Auto-generated method stub
		bDao.update(vo);
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		bDao.delete(bno);
	}

	@Override
	public List<BoardVO> listAll() {
		// TODO Auto-generated method stub
		return bDao.listAll();
	}

	@Override
	public void increaseViewcnt(int bno) {
		// TODO Auto-generated method stub
		bDao.increaseViewcnt(bno);
	}

}
