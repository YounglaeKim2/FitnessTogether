package com.kosmo.ft.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.ft.service.FoodDTO;



@Repository
public class FoodDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public int insert(FoodDTO food) {
		return template.insert("foodInsert",food);
	}

	public List<FoodDTO> selectList() {		
		return template.selectList("foodSelectList");
	}

	public FoodDTO selectOne(String food_name) {		
		return template.selectOne("memberSelectOne",food_name);
	}

	public int update(FoodDTO dto) {
		return template.update("foodUpdate",dto);	
	}

	public void delete(String food_name) {
		template.delete("foodDelete",food_name);	
	}
}