package com.kosmo.ft.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MappingDTO {
	
	private String no;
	private String title;
	private String content;
	private java.sql.Date postDate;
	private String id;
	private String name;//이름 저장용
	//각 글에 따른 댓글 총수 저장용
	private String commentCount;


}
