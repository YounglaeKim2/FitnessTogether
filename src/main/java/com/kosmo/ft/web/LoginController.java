package com.kosmo.ft.web;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.buf.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosmo.ft.service.ListPagingData;
import com.kosmo.ft.service.MemberDTO;
import com.kosmo.ft.service.OneMemoDTO;
import com.kosmo.ft.service.impl.CalendarServiceImpl;
import com.kosmo.ft.service.impl.MemberDAO;
import com.kosmo.ft.service.impl.MemberServiceImpl;
import com.kosmo.ft.service.impl.OneMemoServiceImpl;

	
@Controller
@RequestMapping("/fnt/")
public class LoginController {
	
	MemberDAO memberdao;
	@Autowired
	private MemberServiceImpl memberService;
	private String name;
	private SqlSession sqlSession;
	private MemberDTO dto;
	
	//서비스 주입]
	@Resource(name="memoService")
	private OneMemoServiceImpl memoService;
	
	//-----------------------------------------------------------------//로그인
	//로그인 폼으로 이동
	@RequestMapping("Login.do")
	public String login() {
		return "common/Login";
	}
		
	//로그인 처리
	@RequestMapping("LoginProcess.do")
	public String loginprocess(@RequestParam Map map,Model model,HttpSession session,SessionStatus status,HttpServletRequest request) {
		
		List<String> idList = memberService.isLogin(map);
		String loginType = (String)map.get("loginType");
		String email = (String)map.get("email");
			
		if(idList.size() == 0) {
			if(!"ft".equals(loginType)) {
				request.setAttribute("loginType", loginType);
				request.setAttribute("loginEmail", map.get("loginEmail"));
				request.setAttribute("loginNm", map.get("loginNm"));
				//request.setAttribute("email", map.get("email"));
				return "common/SignUp"; 
			}
			status.setComplete();
			return "common/notLogin";
		}
		session.setAttribute("id", idList.get(0));
		session.setAttribute("email", map.get("email"));
		if(map.get("id").equals("ADMIN")) {
				List<MemberDTO> list = memberService.memberList();
				model.addAttribute("list",list);
			return "admin/MemberAdmin";
		} else {
			return "home";
		}
	}

	//로그아웃
	@RequestMapping("Logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		// 뷰정보 번환]
		return "common/Login";
	}
	
// -----------------------------------------------------------------------// 회원가입페이지
	//회원가입
	@RequestMapping("SignUp.do")
	public String signUp(HttpSession session){
		return "common/SignUp";
	}
	
	//닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value="nameck.do", method= RequestMethod.POST)
	public String nameck(@RequestParam(name = "name" ) String name)  {
		int cnt1 = memberService.nameck(name);
		
		if(cnt1 == 0) {
			return "0";
		}else {
			return "1";
		}	
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="idck.do", method= RequestMethod.POST)
	public String idck(@RequestParam(name = "id" ) String id)  {
		int cnt = memberService.idck(id);
		
		if(cnt == 0) {
			return "0";
		}else {
			return "1";
		}
	}
	
	//이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="emailck.do", method= RequestMethod.POST)
	public String emailck(@RequestParam(name = "email" ) String email)  {
		int cnt2 = memberService.emailck(email);
		
		if(cnt2 == 0) {
			return "0";
		}else {
			return "1";
		}
	}
	
	//회원가입 처리	
	@RequestMapping("signck.do")
	public String signck(@RequestParam Map map,HttpSession session,HttpServletRequest request){	
		String sign = memberService.signck(map);
		String joinType = (String)map.get("joinType");
		String name = (String)map.get("name");
		String email = (String)map.get("email");
		String phone = (String)map.get("phone");
		String birth = (String)map.get("birth");
		
		if(!"ft".equals(joinType) ) {
			session.setAttribute("id", map.get("id"));
			session.setAttribute("name", map.get("name"));
			session.setAttribute("email", map.get("email"));
			session.setAttribute("phone", map.get("phone"));
			session.setAttribute("birth", map.get("birth"));
		}
		return "common/AfSignUp";
	}
// ----------------------------------------------------------------------------//마이페이지
	//마이페이지 이동
	@RequestMapping("Mypage.do")
	public String mypage(@RequestParam Map map,HttpSession session){	
		return "mypage/Mypage";
		}
	
	//비밀번호 확인 후 마이페이지 이동
	@RequestMapping("MypagePro.do")
	public String mypagePro(@RequestParam Map map,HttpSession session, HttpServletRequest request){	
			boolean flag =  memberService.pwdck(map);
			
			if(!flag){
				return "mypage/NotPwd";
			}else{		
				String id = (String)session.getAttribute("id");
				Map loginInfo = memberService.selectMemberInfo(id);
				request.setAttribute("loginInfo", loginInfo);
			return "mypage/UpdateMember";
		}
	}
	
	
	//회원정보 수정 페이지 이동
	@RequestMapping("UpdateMember.do")
	public String updateMember(@RequestParam Map map,HttpSession session, HttpServletRequest request){
			// db 조회 
			String id = (String)session.getAttribute("id");
			Map loginInfo = memberService.selectMemberInfo(id);
			request.setAttribute("loginInfo", loginInfo);
		return "mypage/UpdateMember";
	}
	
	
	//회원정보 수정 과정
	@RequestMapping("UpdateMemberPro.do")
	public String updateMemberPro(@RequestParam Map map,HttpSession session){	
			memberService.updateMember(map);
			session.invalidate();
		return "home";
	}
	
	/*
	//비밀번호 수정 페이지 이동
	@RequestMapping("UpdatePwd.do")
	public String updatePwd(@RequestParam Map map,HttpSession session,HttpServletRequest request){			
		String id = (String)session.getAttribute("id");
		Map loginInfo = memberService.selectMemberInfo(id);
		request.setAttribute("loginInfo", loginInfo);
			return "mypage/UpdatePwd";		
	}	
	*/
	
	/*
	//비밀번호 수정
	@RequestMapping("UpdatePwdPro.do")
	public String updatePwdPro(@RequestParam Map map,HttpSession session,HttpServletRequest request){	
			memberService.updatePwd(map);
			session.invalidate();
			return "home";	
	}
	*/
	
	
	//회원탈퇴 페이지 이동
	@RequestMapping("DeleteMember.do")
	public String DeleteMember(@RequestParam Map map){	
		return "mypage/DeleteMember";		
	}
		
	//회원탈퇴 과정
	@RequestMapping("DeleteMemberPro.do")
	public String deleteMemberPro(@RequestParam Map map,HttpSession session,HttpServletRequest request){	
			String id = (String)session.getAttribute("id");
			memberService.deleteMember(map);
			session.invalidate();
		return "common/AfDeleteMember";
	}
	
// ----------------------------------------------------------------------------//관리자페이지
	//메인페이지로 이동
	@RequestMapping("Main.do")
	 public String main(Model model) {
		List<MemberDTO> list = memberService.memberList();
		model.addAttribute("list",list);
	return "admin/MemberAdmin";
	}
	
	//통계로 이동
	@RequestMapping("Statics.do")
	 public String statics() {
	  return "admin/Statics";
	}
	
	//게시판관리
	@RequestMapping("Board.do")
	 public String board(
		@ModelAttribute("id") @RequestParam Map map,//검색 파라미터 및 페이징용 키값 저장용
		@RequestParam(required = false,defaultValue = "1") int nowPage,
		HttpServletRequest req,//페이징에 사용할 컨텍스트 루트 경로 얻기용
		Model model) 
	{
		//서비스 호출
		ListPagingData<OneMemoDTO> listPagingData = memoService.selectList(map, req, nowPage);
		List<OneMemoDTO> list = listPagingData.getLists();
		
		//데이타 저장
		model.addAttribute("list", list);
		
	return "admin/Board";
	}
	
	//게시물 삭제
	@RequestMapping("DeleteBoard.do")
	public String deleteBoard(@ModelAttribute("id") String id, Model model, 
			@RequestParam(required = false,defaultValue = "1") int nowPage,
			HttpServletRequest req,
			@RequestParam Map map) throws Exception {
			//서비스 호출
			memoService.delete(map);
			ListPagingData<OneMemoDTO> listPagingData = memoService.selectList(map, req, nowPage);
			List<OneMemoDTO> list = listPagingData.getLists();
			model.addAttribute("list", list);	
		return "admin/Board";
	}
	
	//회원관리로 이동
	@RequestMapping("MemberAdmin.do")
	public String memberAdmin(Model model) {
			List<MemberDTO> list = memberService.memberList();
			model.addAttribute("list",list);
		return "admin/MemberAdmin";
	}
	
	//회원탈퇴처리
	@RequestMapping("deleteMemberAdmin.do")
	public String deleteMemberAdmin(@RequestParam Map map,Model model,HttpSession session,HttpServletRequest request){	
			String id = (String)session.getAttribute("id");
			memberService.deleteMember(map);
			//session.removeAttribute(id);
			//session.invalidate();
			List<MemberDTO> list = memberService.memberList();
			model.addAttribute("list",list);
		return "admin/MemberAdmin";
	}
	
	
	@RequestMapping("viewBoard.do")
	public String viewPro(@RequestParam Map map, Model model){		 
			OneMemoDTO record = memoService.selectOne(map);
			model.addAttribute("record",record);
		return "admin/BoardView";
	}
	
}
		
