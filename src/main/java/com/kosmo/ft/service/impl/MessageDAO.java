package com.kosmo.ft.service.impl;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.ft.service.MessageDTO;

@Repository
public class MessageDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	//메시지 리스트
	public ArrayList<MessageDTO> messageList(MessageDTO dto){
		
		String id = dto.getId();
		
		//메시지 리스트에 나타낼 것들 가져오기 - 가장 최근 메시지, 보낸사람 프사, 보낸사람 id
		ArrayList<MessageDTO> list = (ArrayList)template.selectList("message_list", dto);
		
		for(MessageDTO mto : list) {
			mto.setId(id);
			//현재 사용자가 해당 room에서 안읽은 메시지의 갯수를 가져온다.
			int unread = template.selectOne("count_unread", mto);
			//현재 사용자가 메시지를 주고받는 상대 profile을 가져온다.
			String profile = template.selectOne("get_other_profile", mto);
			//안읽은 메시지 갯수를 mto에 set한다.
			mto.setUnread(unread);
			//메시지 상대의 프로필 사진을 mto에 set한다.
			mto.setProfile(profile);
			//메시지 상대 id를 세팅한다. other_id
			if(id.equals(mto.getSend_id())) {
				mto.setOther_id(mto.getRecv_id());
			}
			else {
				mto.setOther_id(mto.getSend_id());
			}
		}
		return list;
	}///messageList
	
	//room별 메시지 내용 가져온다
	public ArrayList<MessageDTO> roomContentList(MessageDTO dto){
		
		System.out.println("room : " + dto.getRoom());
		System.out.println("recv_id : " + dto.getRecv_id());
		System.out.println("id : " + dto.getId());
		
		//메시지 내역을 가져오기
		ArrayList<MessageDTO> clist = (ArrayList)template.selectList("room_content_list", dto);
		
		//해당 방의 메시지들 중 받는 사람이 현재 사용자의 id인 메시지를 모두 읽음 처리한다.
		
		return clist;
	}///roomContentList
	
	//메시지 list에서 메시지를 보낸다
	public int messageSendInlist(MessageDTO dto) {
		
		//메시지리스트에서 보낸건지 프로필에서 보낸건지 구분
		if(dto.getRoom() == 0) { //프로필에서 보낸경우
			int exist_chat = template.selectOne("exist_chat", dto);
			//프로필에서 보낸것 중 메시지 내역이 없어서 첫 메시지일 경우 구분하기 위함
			if(exist_chat == 0) { //메시지 내역이 없어서 0이면 message테이블의 room최대값 구해 to에 set한다.
				int max_room = template.selectOne("max_room", dto);
				dto.setRoom(max_room+1);
			}
			else { //메시지 내역이 있다면 해당 room번호 가져오기
				int room = Integer.parseInt(template.selectOne("select_room", dto));
				dto.setRoom(room);
			}
		}
		
		int flag = template.insert("messageSendInlist", dto);
		return flag;
		
	}///messageSendInlist

}//MessageDAO
