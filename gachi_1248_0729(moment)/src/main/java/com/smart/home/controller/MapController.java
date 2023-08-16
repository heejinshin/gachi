package com.smart.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map")
public class MapController {
	@RequestMapping("/mapPage")
	public String map() {
		return "/map/mapPage";
	}
}
