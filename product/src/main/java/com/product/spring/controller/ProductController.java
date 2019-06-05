package com.product.spring.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.product.spring.model.shop.service.ProductService;


@Controller
//@RequestMapping("/shop/product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
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
	
}
