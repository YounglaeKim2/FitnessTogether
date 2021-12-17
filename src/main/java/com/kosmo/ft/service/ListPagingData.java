package com.kosmo.ft.service;

import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

//페이징 관련 데이터와 레코드 목록 저장하는 크래스

//Lombok사용
@Getter
@Setter
@Builder
public class ListPagingData<T> {
	//레코드 목록
	private List<T> lists;
	//페이징 관련 데이타
	private int totalRecordCount;
	private int pageSize;
	private int blockPage;
	private int nowPage;
	private String pagingString;
}