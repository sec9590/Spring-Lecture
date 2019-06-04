package com.example.spring02.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring02.dto.AddressDTO;
import com.example.spring02.service.AddressService;

@Controller		//헌재 클래스를 controller bean으로 등록
public class AddressController {
	private static final Logger logger = LoggerFactory.getLogger(AddressController.class);
	
	@Inject
	AddressService addressService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String memberList(Model model) {
		logger.info("memberList 시작");
		List<AddressDTO> list = addressService.AddressList();
		model.addAttribute("list", list);
		return "address/list";
	}		
	
	@RequestMapping("/address/write.do")
	public String write() {
		return "address/write";
	}	

	@RequestMapping("/address/insert.do") 
	public String insert(@ModelAttribute AddressDTO dto) {
		addressService.insertAddress(dto);
		return "redirect:/";
	}
	
	@RequestMapping("/address/view.do")
	public String view(@RequestParam String name, Model model) {
		AddressDTO dto = addressService.viewAddress(name);
		model.addAttribute("dto", dto);
		return "address/view";
	}
	
	@RequestMapping("/address/update.do")
	public String update(@ModelAttribute AddressDTO dto, Model model) {
			
			addressService.updateAddress(dto);
			return "redirect:/";
	}
	
	@RequestMapping("/address/delete.do")
	public String delete(@RequestParam String name, Model model) {
			addressService.deleteAddress(name);
			return "redirect:/";
	}
	
	

}
