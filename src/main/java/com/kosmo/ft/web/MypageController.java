package com.kosmo.ft.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/fnt/ProAlter.do")
	public String proAlter() {
		return "mypage/ProAlter";
	}
	@RequestMapping("/fnt/PwdAlter.do")
	public String pwdAlter() {
		return "mypage/PwdAlter";
	}
	@RequestMapping("/fnt/MemberQuit.do")
	public String memberQuit() {
		return "mypage/MemberQuit";
	}
	@RequestMapping("/fnt/AddrAlter.do")
	public String addrAlter() {
		return "mypage/AddrAlter";
	}
}
