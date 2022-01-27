package com.kosmo.ft.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.ft.service.impl.VerificationServiceImpl;

@RequestMapping("/fnt/")
@Controller
public class VerificationController {

	@Autowired
	public VerificationServiceImpl service;
	
	@RequestMapping(value="Verification.do",method = RequestMethod.GET)
	public String Verification(@ModelAttribute("id") String id) {
		//뷰정보 반환]
		return "mapping/Verification";
	}
	@RequestMapping("/selectVerification.do")
	public @ResponseBody List<Map> selectVerification(@RequestParam Map map){
		return service.selectList(map);
	}

	@RequestMapping("/insertVerification.do")
	public @ResponseBody String insertVerification(@RequestParam Map map) {
		int affected=service.insertVerification(map);
		return String.valueOf(affected);
	}
	@RequestMapping("/deleteVerification.do")
	public @ResponseBody String deleteVerification(@RequestParam Map map) {
		int affected=service.deleteVerification(map);
		return String.valueOf(affected);
	}

}
