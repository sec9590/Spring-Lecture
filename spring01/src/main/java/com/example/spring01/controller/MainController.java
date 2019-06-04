package com.example.spring01.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring01.model.dto.ProductDTO;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	// URL pattern mapping 으로 get이나 post 방식 모두 사용 가능

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
		// Model : 데이터 담을 그릇, map(키, 값)
		model.addAttribute("message", "저의 홈페이지 입니다.");
		// model.addAttribute("변수", "값")
		return "main";
	}

	@RequestMapping(value = "gugu.do", method = RequestMethod.GET)
	public String gugu(int dan, Model model) {
		String result = "";
		for (int i = 1; i <= 9; i++) {
			result += dan + "X" + i + "=" + (dan * i) + "<br>";
		}
		model.addAttribute("result", result);
		model.addAttribute("dan", dan);
		return "test/gugu";
	}

	@RequestMapping(value = "test", method = RequestMethod.GET)
	// 리턴타입이 void인 경우 RuquestMapping과 동일한 페이지로 이동합니다.
	public void test() {

	}

	// test/doA 매핑 시키기
	@RequestMapping("test/doA")
	public String doA(Model model) {
		logger.info("doA called");
		model.addAttribute("message", "홈페이지 방문을 환영합니다");
		return "test/doB";
	}

	// test/doB 매핑 시키기
	@RequestMapping("test/doB")
	public void doB() {
		System.out.println("doB 하이");
	}

	// test/doC 매핑 시키기
	// ModelAndView로 객체와 출력페이지 함께 가지고 전달
	// Model : 데이터 저장소, view : 출력 화면
	// 데이터와 포워드할 페이지 정보 함께 전달
	@RequestMapping("test/doC")
	public ModelAndView doC() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", new ProductDTO("샤프", 1000));
		return new ModelAndView("test/doC", "map", map);
	}
}
