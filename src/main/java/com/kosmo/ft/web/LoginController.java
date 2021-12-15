package com.kosmo.ft.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.kosmo.ft.service.MemberDTO;
import com.kosmo.ft.service.impl.MemberServiceImpl;


@Controller
@RequestMapping("/fnt/")
public class LoginController {
	
	@Resource(name="memberServiceImpl")
	private MemberServiceImpl memberServiceImpl;
	
	@RequestMapping("Login.do")
	 public String login() {
	  return "common/Login";
	}
	//로그인 처리
	@RequestMapping("LoginProcess.do")
	public String process(@RequestParam MemberDTO dto, Model model, SessionStatus status) throws Exception {
	boolean flag= memberServiceImpl.Login(dto);
	 model.addAttribute("id", dto.getId());
	 if(!flag) {
			status.setComplete();
			model.addAttribute("NotMember","아뒤와 비번이 틀려요");
		}
		//뷰정보 번환]
		return "home";
	}
	   
	@RequestMapping("Logout.do")
	public String logout(SessionStatus status){
		status.setComplete();
		//뷰정보 번환]
		return "common/AfLogOut";
		}
	
		
	}


   

