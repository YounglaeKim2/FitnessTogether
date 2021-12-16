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




/*
//Lombok미 사용시
public class ListPagingData<T> {
	//레코드 목록
	private List<T> lists;
	//페이징 관련 데이타
	private int totalRecordCount;
	private int pageSize;
	private int blockPage;
	private int nowPage;
	private String pagingString;
	
	
	public List<T> getLists() {
		return lists;
	}
	public void setLists(List<T> lists) {
		this.lists = lists;
	}
	public int getTotalRecordCount() {
		return totalRecordCount;
	}
	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getBlockPage() {
		return blockPage;
	}
	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public String getPagingString() {
		return pagingString;
	}
	public void setPagingString(String pagingString) {
		this.pagingString = pagingString;
	}	
}*/
