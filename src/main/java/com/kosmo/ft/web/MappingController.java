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
	
	
	@RequestMapping("mappingView.do")
	public String view(@RequestParam Map map,Model model) {
		//서비스 호출]
		MappingDTO record=mappingService.selectOne(map);
		//데이타 저장]
		//줄바꿈 처리
		record.setContent(record.getContent().replace("\r\n","<br/>"));
		model.addAttribute("record", record);
		/////////////////////////////////////////////
		//뷰정보 반환]
		return "mapping/MappingView";
	}
	
	
	@RequestMapping("ZZZZ.do")
	public String goZZZZ() {
		return "mapping/ZZZZ";
	}
	
	//입력폼으로 이동
	@RequestMapping(value="mappingWrite.do",method = RequestMethod.GET)
	public String mappingWrite(@ModelAttribute("id") String id
								) {
		//뷰정보 반환
		return "mapping/MappingWrite";
	}//리스트에서 작성페이지로 이동
	//입력처리
	@RequestMapping(value="mappingWrite.do",method = RequestMethod.POST)
	public String mappingWriteOk(/*@ModelAttribute("id") String id,*/
								 @RequestParam Map/*<String,String>*/ map
			) {
		/*
		for(Map.Entry<String, String> entry :map.entrySet()) {
			System.out.println(entry.getKey()+" - " + entry.getValue());
		}
		*/
		
		//서비스 호출
		//map.put("id", id);
		mappingService.insert(map);
		//뷰정보 반환] 목록으로 이동
		System.out.println();
		return "forward:/fnt/mappingList.do";
	}
	
	
	@RequestMapping(value="getlocation.do",produces="application/json;charset=UTF-8")
	public @ResponseBody Map getlocation(@RequestParam Map map) {
		Map loctionInfo = mappingService.getlocation(map);
		return loctionInfo;
	}
	
	
	@RequestMapping(value="Verification.do",method = RequestMethod.GET)
	public String live(@ModelAttribute("id") String id) {
		//뷰정보 반환]
		return "mapping/Verification";
	}

	@RequestMapping(value="Verification.do",method = RequestMethod.POST)
	public String liveCheck(@ModelAttribute("id") String id,
						  @RequestParam Map map
			) throws Exception {
		//서비스 호출]	
		map.put("id", id);
		System.out.println("latitude:"+map.get("latitude"));
		System.out.println("longitude:"+map.get("longitude"));
		System.out.println("cityLocation:"+map.get("cityLocation"));
		//mappingService.check(map);
		//뷰정보 반환]목록으로 이동
		return "mapping/Live";
	}
	
	@RequestMapping("TeachableMachine.do")
	public String teachableMachine() {
		return "tmachine/TM";
	}
	
}