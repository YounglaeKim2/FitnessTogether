package com.kosmo.ft.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MappingController {
	
	@RequestMapping("/fnt/mappingList.do")
	public String goMapping() {
		return "mapping/MappingList";
	}
	@RequestMapping("/fnt/mappingWrite.do")
	public String goMappingWrite() {
		return "mapping/MappingWrite";
	}

}
