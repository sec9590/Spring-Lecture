package com.example.board.model;

import java.util.List;

public interface BoardDAO {
	public void insert(BoardVO vo);
	public BoardVO detail(BoardVO vo);
	public void update(BoardVO vo);
	public void delete(int bno);
	public List<BoardVO> listAll();
	public void increaseViewcnt(int bno);
	
}
