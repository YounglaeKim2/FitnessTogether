package com.kosmo.ft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.ft.service.CalendarService;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	public CalendarDAO dao;

	@Override
	public List<Map> selectOptions(String type) {
		switch (type) {
		case "reg": 
			type = "하체";
			break;
		case "back":
			type = "등";
			break;
		case "chest":
			type = "가슴";
			break;
		case "shoulder":
			type = "어깨";
			break;
		default: type = "팔";
		}
		
		return dao.selectOptions(type);
	}
	
	
	
}
