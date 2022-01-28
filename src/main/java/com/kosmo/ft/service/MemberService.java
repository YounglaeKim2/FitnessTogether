package com.kosmo.ft.service;

import java.util.List;
import java.util.Map;

public interface MemberService {
	List<String> isLogin(Map map);
	 
	 public int idck(String id);
	 
	 public int emailck(String email);
	 
	 public int nameck(String name);

	 public String signck(Map map);
	 
	 public String updateMember(Map map);
	 
	 public String updatePwd(Map map);
	 
	 public String deleteMember(Map map);
	
	 boolean pwdck(Map map);
	 
	 public List<MemberDTO> memberList();
	 
	 
	 public Map selectMemberInfo(String id);
	 
	 public Map selectMemberInfo2(String pwd);

}	

