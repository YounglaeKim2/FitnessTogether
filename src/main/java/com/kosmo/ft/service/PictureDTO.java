package com.kosmo.ft.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PictureDTO {
	
	private String bno; // 게시물 번호
	private String subject; // 제목
	private String content; // 내용
	private String wdate; // 작성일
	private String hit; // 조회수
	private String address; // 사용자 위치(주소)
	private String media; // 들어갈 이미지파일
	private String reply; // 댓글수
	private String heart; // 하트수 
	
	//현재 사용자가 좋아요 누른건지 아닌지
	private String hno; // 하트번호
	//글쓴이 프로필 사진
	private String profile; // 프로필사진(BLOB)
	//현재 사용자 id
	private String name; // 닉네임
	
	//시작 게시물 번호
	private int startRownum; //
	//끝 게시물 번호
	private int endRowNum; //
	//가져갈 게시물 갯수
	private int rowCount; //
	
}
