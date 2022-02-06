package com.kosmo.ft.service.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AndroidDAO {

	@Autowired
	private SqlSessionTemplate template;

	public Map aMemberIsLogin(Map map) {		
		return template.selectOne("aMemberIsLogin", map);
	}
	
	public int ainsertFood(Map map) {
		return template.insert("insertFood", map);
	}
}
