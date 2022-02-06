package com.kosmo.ft.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.ft.service.impl.MappingLineCommentServiceImpl;

@SessionAttributes({"id"})//씨큐리티 사용시 주석
@RestController
public class MappingCommentsController {
	//서비스 주입]
	@Autowired
	private MappingLineCommentServiceImpl commentService;
	//ObjectMapper API(Jackson에 포함된 클래스) 주입:빈 설정파일에 등록 혹은 SpringBeanConfig클래스에 @Bean으로 등록
	@Autowired
	private ObjectMapper mapper;
	
	/*
	 * @RequestParam : key - value쌍으로 받을때
	 * 					1.form으로 전송시
	 *                 <form action="my.do" enctype="x-www-form-urlencoded">
	 *                 	<input type="text" name="age"/>
	 *                 </form>
	 *                
	 * 					key : age ,value : 사용자 입력값
	 * 					전송방식 즉 post 혹은 get상관없다
	 * 					 2.쿼리 스트링으로 전송시
	 * 	                <a href="my.do?age=30">클릭</a>
	 * 					key : age ,value : 30
	 * 
	 * @RequestBody : JSON으로 받을때 즉 자바스크립트 객체로 받을떼 사용
	 * 	
	 * produces = "text/plain;charset=UTF-8"은 응답바디에 쓰여진다
	 * Content-type:text/plain;charset=UTF-8
	 * 
	 * ※@RequestParam Map map으로 받은때는 요청을보낼때 JSON이 아니라 key=value형태로 보내야 한다
	 */
	
	//1.String으로 반환시
	//@PostMapping(value="/onememo/comments/List.do",produces = "text/plain; charset=UTF-8")
	//public String list(@ModelAttribute("id") String id,@RequestParam Map map) throws JsonProcessingException {
	//2.List<Map>으로 반환시
	@PostMapping(value="/mapping/comments/List.do",produces = "application/json; charset=UTF-8")	
	public List<Map> list(@ModelAttribute("id") String id,@RequestParam Map map) throws JsonProcessingException {
		//서비스 호출]
		List<Map> lists= commentService.selectList(map);
		//데이타베이스에서 읽어온 값:2021-11-23 12:34:49.0
		if(lists.size() !=0)
			System.out.println("데이타베이스에서 읽어온 값:"+lists.get(0).get("LPOSTDATE"));
		//JACKSON이 List<Map>을 JSON형태 문자열로 변경시
		//날짜데이타를 2021-11-23 12:34:49.0에서 1637638489000로 변경해버린다.
		//숫자형태의 날짜를 년월일형태의 문자열로 변경해서 다시 Map에 해당 키값으로 저장해여한다.
		for(Map comment:lists) {
			comment.put("LPOSTDATE", comment.get("LPOSTDATE").toString().substring(0, 10));
		}
		//데이타 반환]
		//String으로 반환시
		//String comments=mapper.writeValueAsString(lists);
		//return comments;
		//List<Map>으로 반환시
		return lists;
	}
	//코멘트 입력처리]
	@PostMapping(value="/mapping/comments/Write.do",produces = "text/plain; charset=UTF-8")
	public String write(@ModelAttribute("id") String id,@RequestParam Map map) {
		map.put("id", id);//(씨큐리티 미 사용시)한줄 댓글 작성자의 아이디를 맵에 설정
		//서비스 호출]
		String commentInfo = commentService.insert(map);
		//데이타 반환]
		return commentInfo;//입력된 글의 키와 작성자이름 문자열로 반환
	}
	//코멘트 수정처리]
	@PostMapping(value="/mapping/comments/Edit.do",produces = "text/plain; charset=UTF-8")
	public String update(@ModelAttribute("id") String id,@RequestParam Map map) {
	
		//서비스 호출]
		commentService.update(map);
		//수정한 글의 키값 반환
		return map.get("lno").toString();
	}/////////////
	//코멘트 삭제처리]
	@PostMapping(value="/mapping/comments/Delete.do",produces = "text/plain; charset=UTF-8")
	public String delete(@ModelAttribute("id") String id,@RequestParam Map map) {
	
		//서비스 호출]
		int affected=commentService.delete(map);
		//삭제된 행의 수 반환
		return String.valueOf(affected);
	}/////////////
	
}
