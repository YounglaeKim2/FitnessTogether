package com.kosmo.ft.web;


import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.kosmo.ft.service.AdminDTO;
import com.kosmo.ft.service.impl.AdminServiceImpl;



@Controller
@RequestMapping("/fnt/")
public class AdminController {
	
	@Resource
	private AdminServiceImpl adminService;
	
	@RequestMapping("AdminLoginProcess.do")
	public String adminLoginAction(@RequestParam Map map, Model model, SessionStatus status) {
		boolean flag = adminService.getAdmin(map);
		model.addAttribute("id", map.get("id"));
		// AdminDTO adminUser = (AdminDTO) session.getAttribute("adminUser");
		if (!flag) {
			model.addAttribute("message", "아이디와 비밀번호를 확인해주세요.");
			return "common/Login";
		} 
			return "admin/Home";
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


   


