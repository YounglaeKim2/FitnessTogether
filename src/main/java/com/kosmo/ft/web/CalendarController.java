package com.kosmo.ft.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.ft.service.impl.CalendarServiceImpl;

@Controller
public class CalendarController {

	@Autowired
	public CalendarServiceImpl service;
	
	
	@RequestMapping("/fnt/calendar.do")
	public String goCalendar() {
		return "calendar/Calendar";
	}
	
	@RequestMapping("/fnt/writefood.do")
	public String witreFood() {
		return "calendar/WriteFood";
	}
	
	@GetMapping("/fnt/writeweight.do")
	public String gowriteWeight(@RequestParam Map map,Model model) {
		model.addAttribute("date", map.get("date"));
		return "calendar/WriteWeight";
	}
	
	@RequestMapping(value ="/fnt/selectOption.do",produces = "application/json; charset=UTF-8")
	public @ResponseBody List<Map> selectOptions(@RequestParam String type) {
		//System.out.println(type);
		List<Map> options = service.selectOptions(type);
		
		return options;
	}
	
	@PostMapping("/fnt/writeweight.do")
	public String writeWeight(@RequestParam Map map,Model model) {
		
		
		System.out.println(String.format("type1: %s, name1: %s, kg1: %s, count1: %s",map.get("type1"),map.get("name1"),map.get("kg1"),map.get("count1")));
		System.out.println(String.format("type2: %s, name2: %s, kg2: %s, count2: %s",map.get("type2"),map.get("name2"),map.get("kg2"),map.get("count2")));
		
		return "";
	}
}
