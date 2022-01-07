package com.kosmo.ft.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.ft.service.MemberDTO;
import com.kosmo.ft.service.MemberService;

@Service 
public class MemberServiceImpl implements MemberService {
	@Autowired 
	private MemberDAO dao;
	
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
	public MemberDTO member_login(HashMap<String, String> map) { 
		return dao.member_login(map); 
		}

	@Override 
	public boolean member_id_check(String id) {
		// TODO Auto-generated method stub
		return false;
		}
	
	@Override 
	public boolean member_update(MemberDTO dto) { 
		// TODO Auto-generated method stub 
		return false; } 
	
	@Override 
	public boolean member_delete(String id) { 
		// TODO Auto-generated method stub 
		return false; 
		} 
	}

	
	
	
	




