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

import com.kosmo.ft.service.ListPagingData;
import com.kosmo.ft.service.MappingDTO;
import com.kosmo.ft.service.impl.MappingServiceImpl;

@RequestMapping("/fnt/")
@Controller
public class MappingController {
	
	//서비스 주입
	@Resource(name="mappingService")
	private MappingServiceImpl mappingService;
	
	
	@RequestMapping("mappingList.do")
	public String mappingList(
			@RequestParam Map map,//검색 파라미터 및 페이징용 키값 저장용
			@RequestParam(required = false,defaultValue = "1") int nowPage,
	        HttpServletRequest req,//페이징에 사용할 컨텍스트 루트 경로 얻기용
	        Model model
	        
			) {
		//서비스 호출
		ListPagingData<MappingDTO> listPagingData= mappingService.selectList(map, req, nowPage);
		
		//데이타 저장
		model.addAttribute("listPagingData",listPagingData);
		//뷰정보 반환
		return "mapping/MappingList";
	}/////list
	
	
	
	/*
	@RequestMapping("mappingWrite.do")
	public String goMappingWrite() {
		return "mapping/MappingWrite";
	}
	*/
	
	@RequestMapping("ZZZZ.do")
	public String goZZZZ() {
		return "mapping/ZZZZ";
	}
	
	@RequestMapping("View1.do")
	public String goView1() {
		return "mapping/View1";
	}
	@RequestMapping("View2.do")
	public String goView2() {
		return "mapping/View2";
	}
	
	@RequestMapping(value="mappingWrite.do",method = RequestMethod.GET)
	public String write(@ModelAttribute("id") String id) {
		return "mapping/MappingWrite";
	}//리스트에서 작성페이지로 이동
	
//	@RequestMapping(value="mappingWrite.do",method = RequestMethod.POST)
//	public String writeOk(/*@ModelAttribute("id") String id,*/
//						  @RequestParam Map map
//						  ) throws Exception {
//		//map.put("id", id);
//		mappingService.insert(map);
//		
//		return "forward:/mapping/mappingList.do";
//		
//	}
						  
}
















