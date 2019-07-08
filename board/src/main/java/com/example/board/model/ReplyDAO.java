package com.example.board.model;

import java.util.List;

public interface ReplyDAO {
	public List<ReplyVO> list(int bno);
	public void insert(ReplyVO vo);
	public void update(ReplyVO vo);
	public void delete(int rno);
}
