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
		
		return "";
	}
}
