package com.example.board.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.service.BoardService;



@Controller
//@RequestMapping("/shop/product/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav) {
		logger.info("boardList 시작");
		mav.setViewName("/board/board_list");
		mav.addObject("list", boardService.listAll());
		return mav;
	}
	
}
