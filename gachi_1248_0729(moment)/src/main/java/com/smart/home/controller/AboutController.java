package com.smart.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/about")
public class AboutController {
	@RequestMapping("/aboutPage")
	public String about() {
		return "/about/aboutPage";
	}
}
