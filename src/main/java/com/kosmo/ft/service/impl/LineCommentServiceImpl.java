package com.kosmo.ft.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.ft.service.LineCommentService;

@Service("commentService")
public class LineCommentServiceImpl implements LineCommentService {

	//LineCommentDAO주입]
	@Autowired
	private LineCommentDAO dao;
	
	@Override
	public List<Map> selectList(Map map) {	
		return dao.selectList(map);
	}
	
	@Override
	public String insert(Map map) {
		//영향받은 행의 수가 아니라 새로 입력된 레코드의 키값(lno)를 반환 받는다
		int lno=dao.insert(map);
		String name=dao.findNameById(map.get("id").toString());
		return String.format("%s:%s",lno,name);
	}

	@Override
	public int delete(Map map) {
		
		return dao.delete(map);
	}

	@Override
	public int update(Map map) {
		
		return dao.update(map);
	}

}
