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
		return dao.selectOptions(type);
	}

	@Override
	public List<Map> selectSportsNo(List list) {
		return dao.selectSportsNo(list);
	}

	
	
}
