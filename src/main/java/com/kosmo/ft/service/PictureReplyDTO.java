package com.kosmo.ft.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PictureReplyDTO {
	
	private String rno; // 댓글 번호
	private String bno; // 게시글 번호
	private int grp; // 댓글의 그룹번호 (댓글과 대댓글은 같은 grp를 가짐)
	private int grps; // 그룹내 댓글 순서 (오래된순 ~ 최신순 오름차순)
	private int grpl; // 그룹내 댓글 깊이(댓글..대댓글..)
	private String name; // 작성자
	private String content; // 내용
	private String wdate; // 작성일
	
	private String wgap; // wdate와 현재시간의 차이를 계산한 값 (ex:3시간전...)
	private String pro; // 프사
	
}
