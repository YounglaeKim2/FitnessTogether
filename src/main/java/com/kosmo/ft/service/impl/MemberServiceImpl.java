package com.kosmo.ft.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.ft.service.MemberDTO;
import com.kosmo.ft.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	//OneMemoDAO주입
    @Resource(name="memberDAO")
    private MemberDAO dao;
    
    @Override
	public boolean isLogin(Map map) {		
		return dao.isLogin(map);
	}
  
    @Override
    public int nameck(String name) {
    	return dao.nameck(name);
    }
    
    @Override
    public int idck(String id) {
    	return dao.idck(id);
    }
    
    @Override
    public int emailck(String email) {
    	return dao.emailck(email);
    }

	@Override
    public String signck(Map map) {
    	return dao.signck(map);
    }

	
    
	
} 

