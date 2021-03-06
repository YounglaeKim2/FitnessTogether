package com.kosmo.ft.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO {

	@Autowired
	public SqlSessionTemplate template;
	
	public List<Map> selectOptions(String type){
		return template.selectList("selectOptions",type);
	}

	public Map selectSportsNo(String name) {
		return template.selectOne("selectSportsNo",name);
	}

	public void insertWeight(Map map) {
		template.insert("insertWeight",map);
	}

	public List<Map> showCalendarw(Map map) {
		return template.selectList("selectCalendarW",map);
	}
	
	public List<Map> showCalendarf(Map map) {
		return template.selectList("selectCalendarF",map);
	}

	public List<Map> showWeight(Map map) {
		return template.selectList("selectWeight",map);
	}

	public void deleteWeight(String w_no) {
		template.delete("deleteWegiht",w_no);
	}

	public void insertFood(Map map) {
		template.insert("insertFood",map);
	}

	public List<Map> showFood(Map map) {
		return template.selectList("selectFood",map);
	}

	public void deleteFood(String f_no) {
		template.delete("deleteFood",f_no);
	}

}
