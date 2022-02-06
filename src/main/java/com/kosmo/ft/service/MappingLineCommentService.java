package com.kosmo.ft.service;

import java.util.List;
import java.util.Map;

public interface MappingLineCommentService {
	//목록용]
	//레코드를 DTO가 아닌 맵에 담아보자.
	List<Map> selectList(Map map);
	//입력/수정/삭제]
	String insert(Map map);
	int delete(Map map);
	int update(Map map);
}
