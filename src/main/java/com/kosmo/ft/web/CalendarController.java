package com.kosmo.ft.web;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

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
	
	@GetMapping("/fnt/writefood.do")
	public String gowriteFood(@RequestParam Map map,Model model) {
		model.addAttribute("date", map.get("date"));
		return "calendar/WriteFood";
	}
	
	@GetMapping("/fnt/writeweight.do")
	public String gowriteWeight(@RequestParam Map map,Model model) {
		model.addAttribute("date", map.get("date"));
		return "calendar/WriteWeight";
	}
	
	@RequestMapping(value ="/fnt/selectOption.do",produces = "application/json; charset=UTF-8")
	public @ResponseBody List<Map> selectOptions(@RequestParam String type) {
		List<Map> options = service.selectOptions(type);
		return options;
	}
	
	@PostMapping("/fnt/writeweight.do")
	public String writeWeight(@RequestParam Map map) {
		service.insertWeight(map);
		return "calendar/Calendar";
	}
	
	@PostMapping("/fnt/writefood.do")
	public String writeFood(@RequestParam Map map,Model model) {
		
		return "";
	}
	
	@PostMapping("/fnt/showCalendar.do")
	@ResponseBody
	public List<Map> showCalendar(@RequestParam Map map){ // 아이디값 받기위해 Map 사용
		List<Map> lists = service.showCalendar(map);
		//2021-12-01 00:00:00.0 형태로 출력됨 형태변환위해 아래코드 사용
		for(Map date:lists) {
			date.put("POSTDATE", date.get("POSTDATE").toString().substring(0, 10));
		}
		return lists;
	}
	
}

