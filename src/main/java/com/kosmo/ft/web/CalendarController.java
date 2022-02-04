package com.kosmo.ft.web;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.swing.text.Document;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.kosmo.ft.service.impl.CalendarServiceImpl;


@Controller
public class CalendarController {

	@Autowired
	public CalendarServiceImpl service;
	@Autowired
	private RestTemplate restTemplate;
	
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
	
	@PostMapping(value="/fnt/searchFood.do",produces="application/json;charset=UTF-8")
	public @ResponseBody List<Map> searchFood(@RequestParam Map map) {
		String searchWord = map.get("searchWord").toString();
		HttpHeaders headers= new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		HttpEntity entity = new HttpEntity(headers);
		String url = "http://openapi.foodsafetykorea.go.kr/api/cb8f0be721a04b56a16d/I2790/json/1/50/DESC_KOR="+searchWord;
		ResponseEntity<Map> response = restTemplate.exchange(
				url,//요청 URI
				HttpMethod.GET,//요청 메소드
				entity,//HttpEntity(요청바디와 요청헤더)
				Map.class);
		Map result_one = (Map)response.getBody().get("I2790");
		List<Map> result_two = null;
		if(result_one.get("row")!= null) {
			result_two = (List<Map>)result_one.get("row");
		}
		else { // 검색된 결과가 없을때 오류코드 보내기
			result_two = new Vector<Map>();
			result_two.add((Map)result_one.get("RESULT")); 
		}
		return result_two;
	}
	
	@PostMapping("/fnt/writefood.do")
	public String writeFood(@RequestParam Map map) {
		service.insertFood(map);
		return "calendar/Calendar";
	}
	
	@PostMapping("/fnt/showCalendarw.do")
	@ResponseBody
	public List<Map> showCalendarw(@RequestParam Map map){ // 아이디값 받기위해 Map 사용
		List<Map> lists = service.showCalendarw(map);
		//2021-12-01 00:00:00.0 형태로 출력됨 형태변환위해 아래코드 사용
		for(Map date:lists) {
			date.put("W_POSTDATE", date.get("W_POSTDATE").toString().substring(0, 10));
		}
		return lists;
	}
	
	@PostMapping("/fnt/showCalendarf.do")
	@ResponseBody
	public List<Map> showCalendarf(@RequestParam Map map){ // 아이디값 받기위해 Map 사용
		List<Map> lists = service.showCalendarf(map);
		//2021-12-01 00:00:00.0 형태로 출력됨 형태변환위해 아래코드 사용
		for(Map date:lists) {
			date.put("F_POSTDATE", date.get("F_POSTDATE").toString().substring(0, 10));
		}
		return lists;
	}
	
	@PostMapping("/fnt/showWeight.do")
	@ResponseBody
	public List<Map> showWeight(@RequestParam Map map){ // 아이디와 날짜 정보받기
		List<Map> lists = service.showWeight(map);
		for(Map date:lists) {
			date.put("W_POSTDATE", date.get("W_POSTDATE").toString().substring(0, 10));
		}
		return lists;
	}
	
	@RequestMapping("/fnt/deleteweight.do")
	public String deleteWeight(@RequestParam String[] w_no) {// 체크박스라 String 배열로 받기
		service.deleteWeight(w_no); 
		return "calendar/Calendar";
	}
	
	@RequestMapping("/fnt/deleteFood.do")
	public String deleteFood(@RequestParam String[] f_no) {// 체크박스라 String 배열로 받기
		service.deleteFood(f_no); 
		return "calendar/Calendar";
	}
	
	@RequestMapping("/fnt/showFood.do")
	@ResponseBody
	public List<Map> showFood(@RequestParam Map map){ // 아이디와 날짜 정보받기
		List<Map> lists = service.showFood(map);
		for(Map date:lists) {
			date.put("F_POSTDATE", date.get("F_POSTDATE").toString().substring(0, 10));
		}
		return lists;
	}
	
}

