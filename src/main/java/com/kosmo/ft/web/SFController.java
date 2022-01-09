package com.kosmo.ft.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.ft.service.ListPagingData;
import com.kosmo.ft.service.MappingDTO;
import com.kosmo.ft.service.impl.MappingServiceImpl;

@RequestMapping("/fnt/")
@Controller
public class SFController {
	
	@RequestMapping("sfHome.do")
	public String sfHome() {
		return "facilities/SFHome";
	}
	
	@RequestMapping("findGym.do")
	public String findGym() {
		return "facilities/Gym";
	}
	
	@RequestMapping("findSwimmingPool.do")
	public String findSwimmingPool() {
		return "facilities/SwimmingPool";
	}
	
	@RequestMapping("findPilates.do")
	public String findPilates() {
		return "facilities/Pilates";
	}
	
	@RequestMapping("findYoga.do")
	public String findYoga() {
		return "facilities/Yoga";
	}
				  
}
















