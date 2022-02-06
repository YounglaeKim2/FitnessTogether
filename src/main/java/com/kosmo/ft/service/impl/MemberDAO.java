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
	
	//로그인
	public List<String> isLogin(Map map) {
		return template.selectList("memberIsLogin",map);
	}
	

	public MemberDTO selectOne(Map map) {
		return template.selectOne("memberSelectOne",map);
	}
	
	//회원가입-닉네임확인
	public int nameck(String name) {
		return template.selectOne("selectNameck",name);
	}
	
	//회원가입-아이디확인
	public int idck(String id) {
		return template.selectOne("selectIdck",id);
	}
	
	//회원가입-이메일확인
	public int emailck(String email) {
		return template.selectOne("selectEmailck",email);
	}
	
	//회원가입-비밀번호확인
	public boolean pwdck(Map map) {
		return template.selectOne("selectPwdck",map);
	}
	
	//회원가입
	public String signck(Map map) {
		return template.selectOne("selectSignck",map);
	}
	
	//회원정보수정
	public String updateMember(Map map) {
		return template.selectOne("updateMember",map);
	}
	
	//비밀번호변경
	public String updatePwd(Map map) {
		return template.selectOne("updatePwd",map);
	}
	
	//회원탈퇴
	public void deleteMember(Map map) {
		System.out.println(String.format("DAOid : %s", map.get("id")));
		template.selectOne("deleteMember",map);
	}
	
	//관리자페이지-회원관리
	public List<MemberDTO> memberList() {
		return template.selectList("memberList");
	}
	
	//회원정보담기
	public Map selectMemberInfo(String id) {
		return template.selectOne("selectMemberInfo",id);
	}	
}
	
	

