package com.kosmo.ft.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MappingLineCommentDAO {
	
	//SqlSessionTemplate객체 주입
	@Autowired
	private SqlSessionTemplate template;
	
	public List<Map> selectList(Map map){
		
		return template.selectList("mappingcommentListsUsingAjax",map);
	}

	public int insert(Map map) {
		//마이바티스의 insert는 무조건 영향받은 행의 수 반환
		template.insert("mappingcommentInsert",map);
		//새롭게 입력된 댓글의 키(lno)반환
		//인자로 받은 Map에 입력된 댓글의 키 저장
		return Integer.parseInt(map.get("lno").toString());
	}
	
	public String findNameById(String id) {
		return template.selectOne("mappingFindNameById",id);
	}

	public int update(Map map) {		
		return template.update("mappingcommentUpdate",map);
	}

	public int delete(Map map) {
		
		return template.delete("mappingcommentDelete",map);
	}

	public int deleteByNo(Map map) {
		return template.delete("mappingcommentDeleteByNo",map);
	}
}
