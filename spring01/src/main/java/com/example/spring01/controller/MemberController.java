package com.example.spring01.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring01.model.dto.MemberDTO;
import com.example.spring01.service.MemberService;

@Controller		//헌재 클래스를 controller bean으로 등록
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	@RequestMapping("/member/loginmain.do")
	public String loginmain(HttpSession session) {
		if(session.getAttribute("name")!=null)
			return "redirect:/member/list.do";
		else
			return "member/login";
	}
	
	@RequestMapping("/member/login.do")
	public String login(@ModelAttribute MemberDTO dto, Model model, HttpSession session) {
		boolean result = memberService.login(dto.getUserid(), dto.getPassword());
		if(result) {
			session.setAttribute("name", dto.getUserid());
			return "redirect:/member/list.do";
		} else {
			model.addAttribute("message", "로그인정보가 존재하지 않습니다.");
			return "member/login";
		}
	}
	
	@RequestMapping("/member/logout.do")
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		model.addAttribute("message", "로그아웃되었습니다.");
		return "member/login";
	}
	
	
	@RequestMapping("/member/list.do")
	public String memberList(Model model) {
		logger.info("memberList 시작");
		List<MemberDTO> list = memberService.memberList();
		model.addAttribute("list", list);
		return "member/member_list";
	}
	
	@RequestMapping("/member/write.do")
	public String write() {
		return "member/write";
	}
	
	// @ModelAttribute 에 폼에서 입력한 데이터가 저장
	@RequestMapping("/member/insert.do") //사용자가 요청한 주소
	public String insert(@ModelAttribute MemberDTO dto) {
		// @ModelAttribute MemberDTO dto 하면 일일이 request.getParameter로 값을 전달하지 않아도됨
		memberService.insertMember(dto);
		return "redirect:/member/list.do";
		// 만약 redirect를 붙이지 않으면 forward가되어 주소가 바뀌지 않는다.
	}
	
	// view.do?userid=kim, 
	// RequestParam String userid변수에 kim 저장 (개별값 넘김)
	@RequestMapping("/member/view.do")
	public String view(@RequestParam String userid, Model model) {
		model.addAttribute("dto", memberService.viewMember(userid));
		return "member/view";
	}
	
	// @ModelAttribute는 폼의 전체 데이터 전달, 즉 dto
	// @RequestParam은 폼의 개별데이터 전달
	
	@RequestMapping("/member/update.do")
	public String update(@ModelAttribute MemberDTO dto, Model model) {
		boolean result = memberService.checkPw(dto.getUserid(), dto.getPassword());
		logger.info("비밀번호확인 : " + result);
		if(result) { // 비밀번호가 맞으면
			memberService.updateMember(dto);
			return "redirect:/member/list.do";
		} else { // 비밀번호가 틀리면
			MemberDTO dto2 = memberService.viewMember(dto.getUserid());
			dto.setJoin_date(dto2.getJoin_date()); //날짜가 지워지지 않도록
			model.addAttribute("dto", dto);
			model.addAttribute("message", "비밀번호가 일치하지 않습니다");
			return "member/view"; //수정페이지로 돌아감
		}
	}
	
	@RequestMapping("/member/delete.do")
	public String delete(@ModelAttribute MemberDTO dto, Model model) {		
		boolean result = memberService.checkPw(dto.getUserid(), dto.getPassword());
		logger.info("비밀번호확인 : " + result);
		if(result) { // 비밀번호가 맞으면
			memberService.deleteMember(dto.getUserid());
			return "redirect:/member/list.do";
		} else { // 비밀번호가 틀리면
			MemberDTO dto2 = memberService.viewMember(dto.getUserid());
			dto.setJoin_date(dto2.getJoin_date()); //날짜가 지워지지 않도록
			model.addAttribute("dto", dto);
			model.addAttribute("message", "비밀번호가 일치하지 않습니다");
			return "member/view"; //수정페이지로 돌아감
		}
	}
}
