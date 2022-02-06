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
	private String reply; // 댓글수
	private String heart; // 하트수 
	
	private String hno; //현재 사용자가 좋아요 누른건지 아닌지
	private String id;
	private String imgName; //

	//시작 게시물 번호
	private int startRowNum; //
	//끝 게시물 번호
	private int endRowNum; //
	//가져갈 게시물 갯수
	private int rowCount; //
	
}
