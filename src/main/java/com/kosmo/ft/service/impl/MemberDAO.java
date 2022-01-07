package com.kosmo.ft.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.ft.service.MemberDTO;
import com.kosmo.ft.service.MemberService;

@Repository 
public class MemberDAO implements MemberService { 
	@Autowired
	private SqlSessionTemplate template; //이미 만들어둔 SqlSession을 이용하기 위해 Autowired를 사용한다


	@Override
	public boolean member_insert(MemberDTO dto) { 
		// TODO Auto-generated method stub 
		return false; 
	}
	

	@Override
	public MemberDTO member_select(String id) {
		// TODO Auto-generated method stub 
		return null; 
	}
	

	@Override 
	public  MemberDTO member_login(HashMap<String, String> map) {
		return template.selectOne("mybatis.mapper.member.login", map); 
	}
	
	@Override 
	public boolean member_id_check(String id) { 
		// TODO Auto-generated method stub
		return false; 
	}
	

	@Override 
	public boolean member_update(MemberDTO dto) { 
		// TODO Auto-generated method stub
		return false; 
	}
	

	@Override 
	public boolean member_delete(String id) { 
		// TODO Auto-generated method stub 
		return false; 
		}
	

				






}




