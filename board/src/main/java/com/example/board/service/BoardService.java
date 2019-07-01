package com.example.board.service;

import java.util.List;

import com.example.board.model.BoardVO;

public interface BoardService {
	public void insert(BoardVO vo);
	public BoardVO detail(BoardVO vo);
	public void update(BoardVO vo);
	public void delete(int bno);
	public List<BoardVO> listAll();
	public void increaseViewcnt(int bno);	
}
