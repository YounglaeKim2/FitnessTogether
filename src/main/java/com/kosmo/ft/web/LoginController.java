package com.kosmo.ft.web;


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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String loginprocess(@RequestParam Map map,HttpSession session,SessionStatus status,HttpServletRequest request) {
		
		List<String> idList = memberService.isLogin(map);
		String loginType = (String)map.get("loginType");
			
		if(idList.size() == 0) {
			if(!"ft".equals(loginType)) {
				request.setAttribute("loginType", loginType);
				request.setAttribute("loginEmail", map.get("loginEmail"));
				request.setAttribute("loginNm", map.get("loginNm"));
				return "common/SignUp"; 
			}
			status.setComplete();
			return "common/notLogin";
		}
		
		session.setAttribute("id", idList.get(0));
		
		if(map.get("id").equals("ADMIN")) {
			return "admin/Home";
		} else {
			return "home";
		}
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
		
		String joinType = (String)map.get("joinType");
		
		if(!"ft".equals(joinType) ) {
			session.setAttribute("id", map.get("id"));
		}
		
		return "home";
	}
// ---------------------------------------------------------------------------- Mypage
// 비밀번호 확인
	@RequestMapping("MypagePro.do")
	public String mypagePro(@RequestParam Map map,HttpSession session){	
		//String pwdck = memberService.pwdck(map);
		
		String pwdck = (String)map.get("pwd");
		
		if("pwd".equals(pwdck) ) {
			session.setAttribute("pwd", map.get("pwd"));
			return "mypage/UpdateMember";
		}else {
			return "mypage/Mypage";
		}
		}
	
//회원정보 수정 보기
	@RequestMapping("UpdateMember.do")
	public String updateMember(@RequestParam Map map,HttpSession session){	
		return "mypage/UpdateMember";
		}
	
// 회원정보 수정 과정
	@RequestMapping("UpdateMemberPro.do")
	public String updateMemberPro(@RequestParam Map map,HttpSession session){	

	return "mypage/UpdateMember";
	}

//비밀번호 수정
	@RequestMapping("UpdatePwd.do")
	public String UpdatePwd(@RequestParam Map map,HttpSession session){	
		return "mypage/UpdatePwd";
	}
//비밀번호 수정
	@RequestMapping("UpdatePwdPro.do")
	public String UpdatePwdPro(@RequestParam Map map,HttpSession session){	
	
		return "common/Login";
	}
	
// 회원탈퇴
	@RequestMapping("DeleteMember.do")
	public String QuitMember(@RequestParam Map map,HttpSession session){	
		return "mypage/DeleteMember";
	}
		
// 회원탈퇴 과정
		@RequestMapping("DeleteMemberPro.do")
		public String DeleteMemberPro(String id,HttpSession session,RedirectAttributes rttr){	
			memberService.deleteMember(id);
			session.invalidate();
			rttr.addFlashAttribute("msg", "이용해주셔서 감사합니다.");
				return "redirect:/fnt/Login.do";
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
		
	
	
	
	

