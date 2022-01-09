package com.kosmo.ft.service.impl;


import java.util.Map;

import javax.annotation.Resource;


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
  
   
} 

