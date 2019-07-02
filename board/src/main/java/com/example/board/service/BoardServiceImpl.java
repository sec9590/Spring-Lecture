package com.example.board.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	public BoardVO detail(int bno) {
		// TODO Auto-generated method stub
		return bDao.detail(bno);
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
	public void increaseViewcnt(int bno, HttpSession session) {
		long update_time = 0;
		if(session.getAttribute("update_time_"+ bno) != null)
			update_time = (long) session.getAttribute("update_time_" + bno);
		
		long current_time = System.currentTimeMillis();
		
		if(current_time - update_time > 5*1000) {
			bDao.increaseViewcnt(bno);
			session.setAttribute("update_time_"+bno, current_time);
		}
		
	}

}
