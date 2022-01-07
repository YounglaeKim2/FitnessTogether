package com.kosmo.ft.service;

import java.util.HashMap;
import java.util.Map;

public interface MemberService {
	//회원가입시 회원 정보 저장 
	boolean member_insert(MemberDTO dto); 
	//마이페이지에서 회원 정보 확인 
	MemberDTO member_select(String id); 
	//로그인 처리 
	//HashMap : 키와 밸류를 갖는 데이터 타입 
	//Map : 사물함, Key : 열쇠, Value : 자료 
	MemberDTO member_login(HashMap<String, String> map); 
	//아이디 중복 확인 
	boolean member_id_check(String id); 
	//마이페이지에서 회원 정보 변경 저장 
	boolean member_update(MemberDTO dto); 
	//회원 정보 탈퇴 
	boolean member_delete(String id);

	 // boolean isLogin(Map map);
}
