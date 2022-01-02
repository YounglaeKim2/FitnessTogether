package com.kosmo.ft.web;


import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;


@Controller
@RequestMapping("/fnt/")
public class AdminController {
	
	
	
			
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


   


