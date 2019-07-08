package com.example.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.board.model.BoardVO;

public interface BoardService {
	public void insert(BoardVO vo);
	public BoardVO detail(int bno);
	public void update(BoardVO vo);
	public void delete(int bno);
	public List<BoardVO> listAll();
	public void increaseViewcnt(int bno, HttpSession session);	
	public List<BoardVO> listAll(int Start, int end, String searchOption, String keyword);
	public int countArticle(String searchOption, String keyword);
}
