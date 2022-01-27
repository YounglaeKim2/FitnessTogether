package com.kosmo.ft.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VerificationDAO {

	@Autowired
	public SqlSessionTemplate template;

	public List<Map> selectList(Map map) {
		return template.selectList("selectVerification",map);
	}
	
	public int insertVerification(Map map) {
		return template.insert("insertVerification",map);
	}

	public int deleteVerification(Map map) {
		return template.delete("deleteVerification", map);
	}



}
