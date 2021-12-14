package com.kosmo.ft.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/fnt/")
@Controller
public class MappingController {
	
	@RequestMapping("mappingList.do")
	public String goMapping() {
		return "mapping/MappingList";
	}
	@RequestMapping("mappingWrite.do")
	public String goMappingWrite() {
		return "mapping/MappingWrite";
	}
	@RequestMapping("ZZZZ.do")
	public String goZZZZ() {
		return "mapping/ZZZZ";
	}
	@RequestMapping("ViewZZZZ.do")
	public String goViewZZZZ() {
		return "mapping/ViewZZZZ";
	}

}
