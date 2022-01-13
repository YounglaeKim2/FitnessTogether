package com.kosmo.ft.service;

import java.util.List;
import java.util.Map;

public interface MemberService {
	 boolean isLogin(Map map);
	 
	 public int idck(String id);
	 
	 public int emailck(String email);
	 
	 public int nameck(String name);

	 public String signck(Map map);

	
}	

