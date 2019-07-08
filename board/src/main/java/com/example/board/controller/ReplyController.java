package com.example.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.board.model.ReplyVO;
import com.example.board.service.ReplyService;

@Controller
public class ReplyController {
	@Inject
	ReplyService replyService;
	
	@RequestMapping("/reply/insert.do")
	public void insert(@ModelAttribute ReplyVO vo, HttpSession session) {
		String name = (String) session.getAttribute("name");
		vo.setReplyer(name);
		System.out.println(vo.toString());
		replyService.insert(vo);
	}
	
	@RequestMapping("/reply/list.do")
	public ModelAndView list(@RequestParam int bno, ModelAndView mav) {
		List<ReplyVO> list = replyService.list(bno);
		mav.setViewName("board/replyList");
		mav.addObject("list", list);
		return mav;		
	}
	
	//댓글목록 @RestController Json방식으로 처리 :데이터 리턴
	@RequestMapping("/reply/listJson.do")
	@ResponseBody // 리턴데이터를 json으로 변환
	public List<ReplyVO> listJson(@RequestParam int bno){
		List<ReplyVO> list = replyService.list(bno);
		return list;
	}
	
	
}
