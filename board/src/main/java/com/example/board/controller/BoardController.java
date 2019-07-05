package com.example.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.model.BoardVO;
import com.example.board.service.BoardService;
import com.example.board.service.MemberService;



@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "include/filemenu";
	}
	@RequestMapping(value = "list.do")
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption, @RequestParam(defaultValue="") String keyword) {
		logger.info("boardList 시작");
		List<BoardVO> list = boardService.listAll(searchOption, keyword);
		int count = boardService.countArticle(searchOption, keyword);
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		mav.setViewName("/board/board_list");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String write(Model model, HttpSession session) {
		model.addAttribute("name", session.getAttribute("name"));				
		return "board/write";
	}
	
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public String insert(@ModelAttribute BoardVO vo) {
		boardService.insert(vo);
		return "redirect:list.do";
	}
	
	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
	public ModelAndView detail(Model model, HttpSession session, @RequestParam int bno) {	
		boardService.increaseViewcnt(bno, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/detail");
		mav.addObject("vo", boardService.detail(bno));	
		return mav;
	}
	
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String update(@ModelAttribute BoardVO vo) {
		boardService.update(vo);
		return "redirect:list.do";
	}
	
	@RequestMapping(value = "delete.do")
	public String delete(@RequestParam int bno) {
		boardService.delete(bno);
		return "redirect:list.do";
	}	

}
