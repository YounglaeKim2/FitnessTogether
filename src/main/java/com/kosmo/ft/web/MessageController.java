package com.kosmo.ft.web;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.ft.service.MessageDTO;
import com.kosmo.ft.service.impl.MessageDAO;

@Controller
public class MessageController {
	
	@Autowired
	private MessageDAO messageDao;
	
	//메시지목록
	@RequestMapping(value = "/fnt/message_list.do")
	public String message_list(HttpServletRequest request,HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		
		MessageDTO dto = new MessageDTO();
		dto.setId(id);
		
		//메시지 리스트
		ArrayList<MessageDTO> list = messageDao.messageList(dto);
		request.setAttribute("list", list);
		
		return "message/message_list";
	}
	
	@RequestMapping(value = "/fnt/message_ajax_list.do")
	public String message_ajax_list(HttpServletRequest request, HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		
		MessageDTO dto = new MessageDTO();
		dto.setId(id);
		
		//메시지 리스트
		ArrayList<MessageDTO> list = messageDao.messageList(dto);
		request.setAttribute("list", list);
		
		return "message/message_ajax_list";
	}
	
	public String message_content_list(HttpServletRequest request, HttpSession session) {
		
		int room = Integer.parseInt(request.getParameter("room"));
		
		MessageDTO dto = new MessageDTO();
		dto.setRoom(room);
		dto.setId((String)session.getAttribute("id"));
		
		//메시지 내용을 가져온다.
		ArrayList<MessageDTO> clist = messageDao.roomContentList(dto);
		request.setAttribute("clist", clist);
		
		return "message/message_content_list";
	}
	
	//메시지 리스트에서 메시지 보내기
	@ResponseBody
	@RequestMapping(value = "/fnt/message_send_inlist.do")
	public int message_send_inlist(@RequestParam int room,@RequestParam String other_id,
				@RequestParam String content, HttpSession session) {
				
		MessageDTO dto = new MessageDTO();
		dto.setRoom(room);
		dto.setSend_id((String)session.getAttribute("id"));
		dto.setRecv_id(other_id);
		dto.setContent(content);
		
		int flag = messageDao.messageSendInlist(dto);
		
		return flag;
	}
	
}///MessageController

