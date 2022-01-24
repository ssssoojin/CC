package org.cc.controller;

import org.cc.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
public class ProductController {
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@PostMapping("/custom")
	public void viewCustom(@RequestParam("itemNo") int itemNo, Model model) {
		log.info(itemNo);
		log.info("custom");
		model.addAttribute("product", service.getProduct(itemNo));
	}
	
	@PostMapping("/detail")
	public void viewDetail(@RequestParam("itemNo1") int itemNo, Model model) {
		log.info("detail");
		log.info(itemNo);
		model.addAttribute("item", service.getProduct(itemNo));
	}
}