package com.kosmo.ft.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kosmo.ft.service.MemberDTO;
import com.kosmo.ft.service.OneMemoDTO;

public class MemberDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;
	
	@Inject
	SqlSession sqlSession;

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
	
	public String updatePwd(Map map) {
		return template.selectOne("updatePwd",map);
	}
	
	public void deleteMember(Map map) {
		System.out.println(String.format("DAOid : %s", map.get("id")));
		template.selectOne("deleteMember",map);
	}
	
	public boolean pwdck(Map map) {
		return template.selectOne("selectPwdck",map);
	}
	
	public List<MemberDTO> memberList() {
		return template.selectList("memberList");
	}

	public Map selectMemberInfo(String id) {
		return template.selectOne("selectMemberInfo",id);
	}
	

	
}
	
	

