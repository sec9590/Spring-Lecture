package com.product.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.product.spring.model.shop.dto.ProductDTO;
import com.product.spring.model.shop.service.ProductService;

@Controller
//@RequestMapping("/shop/product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	@Resource(name = "uploadProduct")
	String uploadProduct;

	@Inject
	ProductService productService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "include/filemenu";
	}

	@RequestMapping("/shop/product/list.do")
	public ModelAndView list(ModelAndView mav) {
		logger.info("productList 시작");
		mav.setViewName("/shop/product/product_list");
		mav.addObject("list", productService.listProduct());
		return mav;
	}

	@RequestMapping("/shop/product/write.do")
	public String write() {
		return "shop/product/write";
	}

	// @ModelAttribute 에 폼에서 입력한 데이터가 저장
	@RequestMapping(value = "/shop/product/insert.do", method = RequestMethod.POST) // 사용자가 요청한 주소
	public String insert(MultipartFile file, @ModelAttribute ProductDTO dto) throws IOException, Exception {
		logger.info("파일이름 : " + file.getOriginalFilename());
		String savedName = file.getOriginalFilename();
		logger.info("파일크기 : " + file.getSize());
		savedName = uploadFile(savedName, file.getBytes());
		dto.setPicture_url(savedName);
		productService.insertProduct(dto);
		return "redirect:/shop/product/list.do";
		// 만약 redirect를 붙이지 않으면 forward가되어 주소가 바뀌지 않는다.
		// forward경우 요청한 insert가 새로고침시 한번더 실행될수 있어 중복될 수 있다.
		// redirect 경우 요청정보가 reset되기에 요청이 실행되지않는다.
	}

	// 파일 이름이 중복되지 않도록 처리
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
		String savedName = originalName;
		File target = new File(uploadProduct, savedName);
		// 임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리에 복사
		// FileCopyUtils.copy(바이트 배열, 파일객체)
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	@RequestMapping("/shop/product/view.do")
	public String view(@RequestParam int product_id, Model model) {
		model.addAttribute("dto", productService.detailProduct(product_id));
		return "shop/product/view";
	}

	@RequestMapping("/shop/product/update.do")
	public String update(MultipartFile file, @ModelAttribute ProductDTO dto) throws IOException, Exception {
		String savedName = file.getOriginalFilename();
		System.out.println("파일이름" + savedName);
		ProductDTO dto2 = productService.detailProduct(dto.getProduct_id());
		System.out.println(dto2.toString());		
		
		if (savedName.equals("")) {
			System.out.println("원래 url : " + dto2.getPicture_url());
			dto.setPicture_url(dto2.getPicture_url());
			productService.updateProduct(dto);
			return "redirect:/shop/product/list.do";
		} else {
			savedName = uploadFile(savedName, file.getBytes());
			dto.setPicture_url(savedName);
			productService.updateProduct(dto);
			return "redirect:/shop/product/list.do";
		}
	}

	@RequestMapping("/shop/product/delete.do")
	public String delete(@ModelAttribute ProductDTO dto) {
		productService.deleteProduct(dto.getProduct_id());
		return "redirect:/shop/product/list.do";

	}
}
