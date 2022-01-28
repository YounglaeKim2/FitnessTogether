package com.kosmo.ft.web;

import java.util.Collection;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.ft.service.ListPagingData;
import com.kosmo.ft.service.OneMemoDTO;
import com.kosmo.ft.service.OneMemoService;
import com.kosmo.ft.service.impl.OneMemoServiceImpl;

/*
※스프링 씨큐리티 사용시에는 기존 방식의 로그인처리 및 로그인 여부 판단 그리고 로그아웃등
  모두 제거한다(.jsp 에서 혹은 .java에서)
  그리고 나서 스프링 씨큐리티에서 제공하는 API로 처리한다
  단,로그인처리 및 로그아웃은 스프링 씨큐리티에서 제공함으로  로그인 판단 여부만 처리하면 된다.
*/

@SessionAttributes("id")//스프링 씨큐리티를 사용할때 주석
@RequestMapping("/onememo/bbs/")
@Controller
public class OneMemoController {

	//서비스 주입]
	@Resource(name="memoService")
	private OneMemoServiceImpl memoService;
	
	//목록 처리]
	@RequestMapping("List.do")
	public String list(
					   @ModelAttribute("id")
					   @RequestParam Map map,//검색 파라미터 및 페이징용 키값 저장용
					   @RequestParam(required = false,defaultValue = "1") int nowPage,
			           HttpServletRequest req,//페이징에 사용할 컨텍스트 루트 경로 얻기용
			           Model model
			           
			) {
		//서비스 호출]
		ListPagingData<OneMemoDTO>  listPagingData= memoService.selectList(map, req, nowPage);
		
		//데이타 저장]
		model.addAttribute("listPagingData", listPagingData);
		//뷰정보 반환]
		return "onememo10/bbs/List";
	}//////////////////list
	
	/* 로그인 하지 않고 각 컨트롤러 메소드 실행시 오류:@ModelAttribute("id") String id사용시 */
	//씨큐리티 사용시에는 아래 예외처리 불필요
	
	@ExceptionHandler({Exception.class})
	public String error(Model model) {
		model.addAttribute("NotMember", "로그인후 이용바람....");
		//로그인이 안된경우 로그인 페이지로
		return "common/Login";
	}//////////
	//입력폼으로 이동]
	@RequestMapping(value="Write.do",method = RequestMethod.GET)
	public String write(
				@ModelAttribute("id") String id//(씨큐리티 미 사용시)세션영역에서 id가져오기
				//Authentication auth//씨큐리티 사용시(인증이 안된 사용자는 설정파일의 <security:form-login>태그의 login-page속성에 지정한 페이지로 바로 리다이렉트 됨)
			) {
		/*스프링 씨큐리티 적용시 인증(로그인)되었다면
		  Authentication객체에 로그인과 관련된 정보가 전달됨
		   로그인이 안되어 있으면 auth는 null*/
		/*
		System.out.println("[Authentication객체 출력]");
		System.out.println("auth:"+auth);
		UserDetails userDetails= (UserDetails)auth.getPrincipal();
		System.out.println("아이디:"+userDetails.getUsername());
		System.out.println("비밀번호:"+userDetails.getPassword());
		System.out.println("부여된 권한들:");
		Collection<GrantedAuthority> authorities=(Collection<GrantedAuthority>)userDetails.getAuthorities();
		for(GrantedAuthority authority:authorities) {
			System.out.println(authority.getAuthority());
		}
		*/
		//뷰정보 반환]
		return "onememo10/bbs/Write";
	}
	//입력처리]
	@RequestMapping(value="Write.do",method = RequestMethod.POST)
	public String writeOk(
			@ModelAttribute("id") String id,
			//Authentication auth,
			@RequestParam Map map
			) throws Exception {
		//서비스 호출]	
		map.put("id", id);//씨큐리티 미 사용시.호출전 아이디 맵에 저장
		//map.put("id", ((UserDetails)auth.getPrincipal()).getUsername());//씨큐리티 사용시
		memoService.insert(map);
		//뷰정보 반환]목록으로 이동
		return "forward:/onememo/bbs/List.do";
	}
	//컨트롤러 메소드 작성 규칙]
	/*
	 * 접근지정자 : public
	 * 반환타입 : 주로 String(뷰정보를 문자열로 반환)
	 * 메소드명: 임의
	 * 인자 : 원하는 타입을 사용할 수 있다(단, 사용할 수 있는 타입이 정해져 있다)
	 *       어노테이션도 가능
	 * 예외를 throws할 수 있다(선택) 
	 */
	//상세보기]
	@RequestMapping("View.do")
	public String view(
			@ModelAttribute("id") String id,//
			//Authentication auth,
			@RequestParam Map map,Model model) {
		//서비스 호출]
		OneMemoDTO record= memoService.selectOne(map);
		//데이타 저장]
		//줄바꿈 처리
		record.setContent(record.getContent().replace("\r\n","<br/>"));
		model.addAttribute("record", record);
		/////////////////////////////////////////////
		//뷰정보 반환]
		return "onememo10/bbs/View";
	}
	//수정폼으로 이동 및 수정처리]
	@RequestMapping("Edit.do")
	public String edit(
			@ModelAttribute("id") String id,//
			//Authentication auth,
			@RequestParam Map map,
			HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			//서비스 호출]
			OneMemoDTO record= memoService.selectOne(map);
			//데이타 저장]
			req.setAttribute("record", record);
			//수정 폼으로 이동]
			return "onememo10/bbs/Edit";
		}
		//수정처리후 상세보기로 이동
		//서비스 호출
		memoService.update(map);
		//뷰로 포워드
		return "forward:/onememo/bbs/View.do";
	}
	//삭제처리]
	@RequestMapping("Delete.do")
	public String delete(
			@ModelAttribute("id") String id,//
			//Authentication auth,
			@RequestParam Map map) throws Exception {
		
		//서비스 호출
		memoService.delete(map);
		//뷰로 포워드
		return "forward:/onememo/bbs/List.do";
		
	}
}////////////////
