package com.kosmo.ft.web;

import java.sql.SQLException;
import java.util.HashMap;
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

	@Resource
	private MemberServiceImpl memberService;
	
	// 로그인 폼으로 이동
	@RequestMapping("Login.do")
	public String login() {
		return "common/Login";
	}

	// 로그인 처리
	@RequestMapping("LoginProcess.do")
	public String process(@RequestParam Map map, Model model, SessionStatus status) {
		boolean flag = memberService.isLogin(map);
		model.addAttribute("id", map.get("id"));
			if (!flag) {
				status.setComplete();
				model.addAttribute("NotMember", "아뒤와 비번이 틀려요");
				return "common/Login";
			}
		// 뷰정보 번환]
		return "common/AfLogin";
	}

	
	// 카카오로그인 처리
		@RequestMapping("KakaoLoginProcess.do")
		public String kakaoLoginprocess(SessionStatus status) {
			return "common/AfLogin";
		}

	@RequestMapping("Logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		// 뷰정보 번환]
		return "common/Login";
	}
	
	
	
}
