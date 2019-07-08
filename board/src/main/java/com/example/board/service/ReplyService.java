package com.example.board.service;

import java.util.List;

import com.example.board.model.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> list(int bno);
	public void insert(ReplyVO vo);
	public void update(ReplyVO vo);
	public void delete(int rno);
}
