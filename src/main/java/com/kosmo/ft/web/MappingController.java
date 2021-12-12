package com.kosmo.ft.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MappingController {
	
	@RequestMapping("/fnt/mapping.do")
	public String goMapping() {
		return "mapping/Mapping";
	}

}
