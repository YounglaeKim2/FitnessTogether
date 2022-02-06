package com.kosmo.ft.service;

import java.util.List;
import java.util.Map;

public interface MemberService {
	//로그인
	List<String> isLogin(Map map);
	 
	//회원가입-아이디확인
	 public int idck(String id);
	 
	 //회원가입-이메일확인
	 public int emailck(String email);
	 
	 //회원가입-닉네임확인
	 public int nameck(String name);
	 
	 //회원가입-비밀번호확인
	 boolean pwdck(Map map);

	 //회원가입
	 public String signck(Map map);
	 
	 //회원정보수정
	 public String updateMember(Map map);
	 
	 //비밀번호변경
	 public String updatePwd(Map map);
	 
	 //회원탈퇴
	 public void deleteMember(Map map);
	 
	//관리자페이지-회원관리
	 public List<MemberDTO> memberList();
	 
	//회원정보담기
	 public Map selectMemberInfo(String id);

}	

