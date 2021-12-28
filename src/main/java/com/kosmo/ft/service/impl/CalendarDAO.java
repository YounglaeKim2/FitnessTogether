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

	public Map selectSportsNo(String str) {
		return template.selectOne("selectSportsNo",str);
	}

	public void insertWeight(Map map) {
		template.insert("insertWeight",map);
	}

	public List<Map> showCalendar(Map map) {
		return template.selectList("selectCalendar",map);
	}

	public List<Map> showWeight(Map map) {
		return template.selectList("selectWeight",map);
	}

}
