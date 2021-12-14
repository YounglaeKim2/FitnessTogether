package com.kosmo.ft.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SignUpController {

			//회원가입
			@RequestMapping("/fnt/SignUp.do")
			public String signup(){
				
				
				return "common/SignUp";
				
			}
			/*
			//회원가입 처리
			@RequestMapping("SignUpProcess.do")
			public String signupprocess(){
				
				
				return "home";
				
			}
			*/
	
}
