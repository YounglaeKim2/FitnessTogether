package com.kosmo.ft.web;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.buf.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;


import com.kosmo.ft.service.MemberDTO;
import com.kosmo.ft.service.impl.CalendarServiceImpl;
import com.kosmo.ft.service.impl.MemberDAO;
import com.kosmo.ft.service.impl.MemberServiceImpl;

	
@Controller
@RequestMapping("/fnt/")
public class LoginController {
	
	MemberDAO memberdao;
	@Autowired
	private MemberServiceImpl memberService;
	private String name;
	private SqlSession sqlSession;

	// 로그인 폼으로 이동
	@RequestMapping("Login.do")
	public String login() {
		return "common/Login";
	}

	/*
	// 카카로 로그인 처리
	@RequestMapping("KakaoLogin.do")
	public String kakaologin(HttpSession session,HttpServletRequest request) {
		// kakaoemail을 kakaoid에 저장
		//String kakaoemail = request.getParameter("kakaoemail");
		
		//MemberDTO memberdto = new MemberDTO();
		//MemberDAO memberdao = new MemberDAO();
		
		//memberdto.setId(kakaoemail);
		
		//int result_lookup = memberdao.loginLookup(memberdto);
		
		//if(result_lookup == 0) {
			//System.out.println("카카오톡 회원 정보 설정");
			
			request.setAttribute("kakaoid",request.getParameter("kakaoid"));
			request.setAttribute("kakaoname",request.getParameter("kakaoname"));
			request.setAttribute("kakaoemail",request.getParameter("kakaoemail"));
			request.setAttribute("kakaogender",request.getParameter("kakaogender"));
		
		return "common/SignUp";
	//}else {
		//memberdto = memberdao.loginOkNick(memberdto);
		
		//session.setAttribute("kakaoid", memberdto.getId());
		//session.setAttribute("nick", memberdto.getName());
		//session.setAttribute("profile", memberdto.getProfile());
		//request.setAttribute("flag", 0);
		
		//System.out.println("kakaoid :" + memberdto.getId());
		//System.out.println("kakaoid :" + memberdto.getName());
		//System.out.println("kakaoid :" + memberdto.getProfile());
		
		
		}
	 	*/
	
		//구글 로그인 처리
	
	
		
		// 로그인 처리
	@RequestMapping("LoginProcess.do")
	public String loginprocess(@RequestParam Map map,HttpSession session,SessionStatus status) {
		if(map.get("id").equals("ADMIN")) { //관리자 로그인
			boolean flag = memberService.isLogin(map);
			if (!flag) { //관리자 로그인 실패
				status.setComplete();
				return "common/notLogin";
			}
			// 뷰정보 번환] //관리자 로그인 성공
			session.setAttribute("id", map.get("id"));
			return "admin/Home";
		} //일반  로그인 실패
		boolean flag = memberService.isLogin(map);
		if(!flag) {
			status.setComplete();
			return "common/notLogin";
		} //일반 로그인 성공
		//뷰정보 반환]
		session.setAttribute("id", map.get("id"));
		return "home";
	}


	@RequestMapping("Logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		// 뷰정보 번환]
		return "common/Login";
	}
	
	

	
// ---------------------------------------------------
// 회원가입페이지
	//회원가입
	@RequestMapping("SignUp.do")
	public String signUp(HttpSession session){
		return "common/SignUp";
	}
	
	// 닉네임 중복 체크
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
	
	
	// 아이디 중복 체크
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
	
	// 이메일 중복 체크
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
		public String signck(@RequestParam Map map,HttpSession session){	
			String sign = memberService.signck(map);
			
			
			session.getAttribute("id");
	     	session.getAttribute("pwd");
	     	session.getAttribute("name");
	     	session.getAttribute("email");
	     	session.getAttribute("gender");
	     	session.getAttribute("birth");
	     	session.getAttribute("phone");
			
			return "home";
		}

	

// ---------------------------------------------------
// 관리자페이지
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
		
	
	
	
	

