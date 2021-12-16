package com.kosmo.ft.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MappingService {
	//로그인용
	boolean isLogin(Map map);
	//목록용
	//ListPagingData<MappingDTO> selectList(Map map,HttpServletRequest req,int nowPage);
	//상세보기용
	MappingDTO selectOne(Map map);
	//입력/수정/삭제
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
}
