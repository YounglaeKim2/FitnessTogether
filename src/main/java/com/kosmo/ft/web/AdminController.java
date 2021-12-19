package com.kosmo.ft.web;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/fnt/")
public class AdminController {
	
	//메인페이지로 이동
		@RequestMapping("Main.do")
		 public String main() {
		  return "common/Home";
		}
	
	//통계로 이동
	@RequestMapping("Statics.do")
	 public String statics() {
	  return "common/Statics";
	}
	
	//게시판관리로 이동
		@RequestMapping("Board.do")
		 public String board() {
		  return "common/Board";
		}
	
	//회원관리로 이동
		@RequestMapping("MemberAdmin.do")
			public String memberAdmin() {
		 return "common/MemberAdmin";
				}
		
	
	}


   


