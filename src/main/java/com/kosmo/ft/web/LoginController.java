package com.kosmo.ft.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.kosmo.ft.service.MemberDTO;
import com.kosmo.ft.service.impl.MemberServiceImpl;

@Controller
public class LoginController {
	@Autowired 
	private MemberServiceImpl service;
	
	//로그인 폼으로 이동]
		@RequestMapping("/fnt/Login.do")
		public String login() {
			return "common/Login";
		}
	
	//로그인 요청
	@ResponseBody
	@RequestMapping("/fnt/loginprocess.do") 
	public String login(String id, String pwd, HttpSession session) {
		//화면에서 입력한 아이디와 비밀번호가 일치하는 회원 정보가 DB에 있는지 확인하여
		HashMap<String, String> map = new HashMap<String, String>(); 
		
		map.put("id", id); 
		map.put("pwd", pwd);
		MemberDTO dto = service.member_login(map); //일치하는 회원 정보가 있다면 회원 정보를 세션에 담는다
		session.setAttribute("login_info", dto); 
		
		return dto == null ? "false" : "true"; 
	}
	
	//로그아웃 요청 
	@ResponseBody 
	@RequestMapping("/fnt/logout.do") 
	public void logout(HttpSession session) {
		session.removeAttribute("login_info"); 
	} 
	
	
	//회원가입 화면 요청
	@RequestMapping("/fnt/signup.do") 
	public String member(HttpSession session) {
		session.setAttribute("category", "join");
		return "common/SignUp"; 
		} 
	}
