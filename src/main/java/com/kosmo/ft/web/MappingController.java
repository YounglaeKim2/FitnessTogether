package com.kosmo.ft.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/fnt/")
@Controller
public class MappingController {
	
	//서비스 주입
	//@Resource(name="mappingService")
	//private MappingServiceImpl mappingService;
	
	
	@RequestMapping("mappingList.do")
	public String goMapping() {
		return "mapping/MappingList";
	}
	/*
	@RequestMapping("mappingWrite.do")
	public String goMappingWrite() {
		return "mapping/MappingWrite";
	}
	*/
	
	@RequestMapping("ZZZZ.do")
	public String goZZZZ() {
		return "mapping/ZZZZ";
	}
	
	@RequestMapping("ViewZZZZ.do")
	public String goViewZZZZ() {
		return "mapping/ViewZZZZ";
	}
	
	@RequestMapping(value="mappingWrite.do",method = RequestMethod.GET)
	public String write(@ModelAttribute("id") String id) {
		return "mapping/MappingWrite";
	}//리스트에서 작성페이지로 이동
	
//	@RequestMapping(value="mappingWrite.do",method = RequestMethod.POST)
//	public String writeOk(/*@ModelAttribute("id") String id,*/
//						  @RequestParam Map map
//						  ) throws Exception {
//		//map.put("id", id);
//		mappingService.insert(map);
//		
//		return "forward:/mapping/mappingList.do";
//		
//	}
						  
}
















