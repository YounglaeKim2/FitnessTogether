package com.kosmo.ft.service;

import java.util.List;
import java.util.Map;

public interface CalendarService {

	List<Map> selectOptions(String type);
	
	Map selectSportsNo(String str);
	
	void insertWeight(Map map);
	
	List<Map> showCalendarw(Map map);
	
	List<Map> showCalendarf(Map map);
	
	List<Map> showWeight(Map map);
	
	void deleteWeight(String[] w_no);
	
	void insertFood(Map map);
	
	List<Map> showFood(Map map);
	
	void deleteFood(String[] f_no);
	
}
