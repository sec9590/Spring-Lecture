package com.example.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.board.model.ReplyDAO;
import com.example.board.model.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO rDao;

	@Override
	public List<ReplyVO> list(int bno) {
		return rDao.list(bno);
	}

	@Override
	public void insert(ReplyVO vo) {
		rDao.insert(vo);
	}

	@Override
	public void update(ReplyVO vo) {
		rDao.update(vo);
	}

	@Override
	public void delete(int rno) {
		rDao.delete(rno);
	}

}
