package com.example.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.board.model.MemberVO;
import com.example.board.service.MemberService;


@Controller		//헌재 클래스를 controller bean으로 등록
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;	
	
	@RequestMapping("/member/logincheck.do")
	public String login(@ModelAttribute MemberVO vo, Model model, HttpSession session) {
		String result = memberService.login(vo, session);
		if(result.equals("true")) {
			model.addAttribute("message", "success");
			return "home";
		} else {
			model.addAttribute("message", "로그인정보가 존재하지 않습니다.");
			return "member/login";
		}
	}
	
	@RequestMapping("/member/login.do")
	public String login() {
		return "member/login";
	}
	
	
	@RequestMapping("/member/logout.do")
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		model.addAttribute("message", "로그아웃되었습니다.");
		return "member/login";
	}
	
}
