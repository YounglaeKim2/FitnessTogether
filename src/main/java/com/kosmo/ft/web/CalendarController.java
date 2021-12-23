package com.kosmo.ft.web;

import java.util.Arrays;
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
	public String writeWeight(@RequestParam Map map,Model model) {
		
		// map 크기 4면 행 한개 넘어옴
		int size = map.size()/4;
		
		
		// 중복된 운동명을 제외하기위한 코드
		Map<String,String> weightName = new HashMap();
		for(int i=1; i<=size;i++) {
			weightName.put(map.get("name"+i).toString(),map.get("name"+i).toString());
		}
	    // 중복이제거된 운동명을 배열로 변환
		Set<String> keyes = weightName.keySet();
		String keyValue="";
		for(String key:keyes) {
			keyValue += weightName.get(key)+","; 
		}
		keyValue = keyValue.substring(0,keyValue.length()-1);
		String[] key = keyValue.split(",");
		// 운동명에 따른 no을 얻기 위한 코드 List에 {NO:1,NO:2} 로 가져옴
		List<Map> noList = service.selectSportsNo(Arrays.asList(key));
		
		
		// 각 행들을 저장할 List
		List writeList = new Vector();
		// 중복된 운동명의 데이터를 저장하기위한 코드
		for(int i=0;i<key.length;i++) {
			Map writeMap = new HashMap();
			String count="";
			String kg="";
			for(int j=1;j<=size;j++) { // 
				if(key[i].equals(map.get("name"+j).toString())) {
					count += map.get("kg"+j).toString()+" ";
					kg += map.get("count"+j).toString()+" ";
				}
			}
			writeMap.put("id",map.get("id"));
			writeMap.put("postdate",map.get("postdate"));
			writeMap.put("no",noList.get(i).get("NO"));
			writeMap.put("kg",count);
			writeMap.put("count",kg);
			writeList.add(writeMap);
		}
		
		for(int i = 0;i < writeList.size();i++) {
			System.out.println(writeList.get(i));
		}
		
		
		
		return "calendar/Calendar";
	}
	
	@PostMapping("/fnt/writefood.do")
	public String writeFood(@RequestParam Map map,Model model) {
		
		return "";
	}
}

