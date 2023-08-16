package com.smart.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.smart.home.dto.PagingDTO;

@Controller
@RequestMapping("/faq")
public class FaqController {
	
	@GetMapping("/faqPage")
	public String faq() {
		return "faq/faqPage";
	}
}
