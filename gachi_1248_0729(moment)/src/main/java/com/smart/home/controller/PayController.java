package com.smart.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pay")
public class PayController {
	@RequestMapping("/payPage")
	public String pay() {
		return "/pay/payPage";
	}
}
