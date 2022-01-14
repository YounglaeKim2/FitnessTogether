package com.kosmo.ft.service;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
public class MappingDTO {
	
	private String no;
	private String title;
	private String content;
	private java.sql.Date postDate;
	private java.sql.Date eventDate;
	private String id;
	private String name;//이름 저장용
	private String commentCount;//각 글에 따른 댓글 총수 저장용
	private String latitude;
	private String longitude;
	private String eventAddress;
	
	//no에 따른 모든 한줄 댓글 목록 저장용
	//마이바티스의 ResultMap 태그의 collection태그 적용용	
//	List<LineCommentDTO> comments;

}
