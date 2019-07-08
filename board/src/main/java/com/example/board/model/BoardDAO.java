package com.example.board.model;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface BoardDAO {
	public void insert(BoardVO vo);
	public BoardVO detail(int bno);
	public void update(BoardVO vo);
	public void delete(int bno);
	public List<BoardVO> listAll();
	public void increaseViewcnt(int bno);
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword);
	public int countArticle(String searchOption, String keyword);
	
}
