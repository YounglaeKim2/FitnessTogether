package com.kosmo.ft.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kosmo.ft.service.MemberDTO;

public class MemberDAO {

	@Autowired
	private SqlSessionTemplate template;

	public List<String> isLogin(Map map) {
		return template.selectList("memberIsLogin",map);
	}

	public MemberDTO selectOne(Map map) {
		return template.selectOne("memberSelectOne",map);
	}
	
	public int nameck(String name) {
		return template.selectOne("selectNameck",name);
	}
	
	public int idck(String id) {
		return template.selectOne("selectIdck",id);
	}
	
	public int emailck(String email) {
		return template.selectOne("selectEmailck",email);
	}

	public String signck(Map map) {
		return template.selectOne("selectSignck",map);
	}
	
	public String updateMember(Map map) {
		return template.selectOne("updateMember",map);
	}
	
	public String deleteMember(String delete) {
		return template.selectOne("deleteMember",delete);
	}
	
	
	
}
	
	

