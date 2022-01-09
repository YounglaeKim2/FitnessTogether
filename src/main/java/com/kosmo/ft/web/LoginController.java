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
import com.kosmo.ft.service.MemberService;

import com.kosmo.ft.service.impl.MemberServiceImpl;

@Controller
@RequestMapping("/fnt/")
public class LoginController {

	@Resource(name = "memberServiceImpl")
	private MemberServiceImpl memberService;
	

	// 로그인 폼으로 이동
	@RequestMapping("Login.do")
	public String login() {
		return "common/Login";
	}

	// 로그인 처리

	@RequestMapping("LoginProcess.do")
	public String loginprocess(@RequestParam Map map, Model model, HttpSession session) {
		
		if(map.get("id").equals("ADMIN")) {
			boolean flag = memberService.isLogin(map);
			if (!flag) {
				session.setAttribute("NotMember", "아이디와 비밀번호를 확인해주세요");
				return "common/Login";
			}
			// 뷰정보 번환]
			session.setAttribute("id", map.get("id"));
			return "admin/Home";
		}
	
		if(! map.get("id").equals("ADMIN")) {
			boolean flag = memberService.isLogin(map);
			if(!flag) {
				session.setAttribute("NotMember", "아이디와 비밀번호를 확인해주세요");
				return "common/Login";
			}
			//뷰정보 반환]
			session.setAttribute("id", map.get("id"));
			return "home";
		}
		return "home";
				
}

	
	
	// 로그인 처리
	/*
	@RequestMapping("LoginProcess.do")
	public String process(HttpSession session, Model model) {
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		if(loginUser == null) {
			return "common/Login";
		} else {
			return "home";
			}
		}
	*/
	
	
	@RequestMapping("Logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		// 뷰정보 번환]
		return "common/Login";
	}


//메인페이지로 이동
	@RequestMapping("Main.do")
	 public String main() {
	return "admin/Home";
	}
	
	//통계로 이동
	@RequestMapping("Statics.do")
	 public String statics() {
	  return "admin/Statics";
	}
	
	//게시판관리로 이동
		@RequestMapping("Board.do")
		 public String board() {
		  return "admin/Board";
		}
	
	//회원관리로 이동
		@RequestMapping("MemberAdmin.do")
			public String memberAdmin() {
		 return "admin/MemberAdmin";
		}
}
		
	
	
	
	

