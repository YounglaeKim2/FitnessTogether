package com.kosmo.ft.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.ft.service.MemberDTO;
import com.kosmo.ft.service.MemberService;
import com.kosmo.ft.service.OneMemoDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	//OneMemoDAO주입
    @Resource(name="memberDAO")
    private MemberDAO dao;
    
    //로그인
    @Override
	public List<String> isLogin(Map map) {
		return dao.isLogin(map);
	}
  
    //회원가입-닉네임확인
    @Override
    public int nameck(String name) {
    	return dao.nameck(name);
    }
    
    //회원가입-아이디확인
    @Override
    public int idck(String id) {
    	return dao.idck(id);
    }

    //회원가입-비밀번호확인
	@Override
    public boolean pwdck(Map map) {
    	return dao.pwdck(map);
    }
    
	//회원가입-이메일확인
    @Override
    public int emailck(String email) {
    	return dao.emailck(email);
    }
    
    //회원가입
	@Override
    public String signck(Map map) {
    	return dao.signck(map);
    }
	
	//회원정보담기
	@Override
	public Map selectMemberInfo(String id) {
		return dao.selectMemberInfo(id);
	}
	
	//마이페이지-회원정보수정
	@Override
    public String updateMember(Map map) {
    	return dao.updateMember(map);
    }
	
	//마이페이지-비밀번호변경
	@Override
    public String updatePwd(Map map) {
    	return dao.updatePwd(map);
    }
	
	//마이페이지-회원탈퇴
	@Override
    public void deleteMember(Map map) {
    	dao.deleteMember(map);
    }
	
	//관리자페이지-회원관리
	@Override
	public List<MemberDTO> memberList() {
		return dao.memberList();
	}

} 

