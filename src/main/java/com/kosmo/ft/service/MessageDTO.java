package com.kosmo.ft.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageDTO {
	
	private String mno;
	private int room;
	private String send_id;
	private String recv_id;
	private String send_time;
	private String read_time;
	private String content;
	private String read_chk;
	//현재 사용자의 메시지 상대 id를 담는다.
	private String other_id;
	//현재 사용자의 메시지 상대 프로필사진을 담는다.
	private String profile;
	//현재 사용자 id
	private String id;
	//안읽은 메시지 갯수
	private int unread;
	
}
