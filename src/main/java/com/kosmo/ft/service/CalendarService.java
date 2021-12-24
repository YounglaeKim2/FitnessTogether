package com.kosmo.ft.service;

import java.util.List;
import java.util.Map;

public interface CalendarService {

	List<Map> selectOptions(String type);
	
	Map selectSportsNo(String str);
	
	void insertWeight(Map map);
	
}
