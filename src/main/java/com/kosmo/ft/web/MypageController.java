package com.kosmo.ft.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/fnt/Mypage.do")
	public String Mypage() {
		return "common/Mypage";
	}
	
}
