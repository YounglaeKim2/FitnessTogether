package com.kosmo.ft.service.impl;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.ft.service.PictureDTO;

//리스트관련

@Repository
public class PictureDAO {

	@Autowired
	public SqlSessionTemplate template;

	public ArrayList<PictureDTO> boardList(PictureDTO dto) {

		ArrayList<PictureDTO> list = (ArrayList)template.selectList("picture_list", dto);

		return list;
	}

	public ArrayList<PictureDTO> boardListLogin(PictureDTO dto) {

		ArrayList<PictureDTO> list = (ArrayList)template.selectList("picture_list_login", dto);

		return list;
	}

	// 게시물 갯수 가져오기
	public int PictureCount(PictureDTO dto) {

		int result = template.selectOne("picture_count", dto);

		return result;

	}

	// 베스트5 게시물 list
	public ArrayList<PictureDTO> bestList(PictureDTO dto) {

		ArrayList<PictureDTO> bestList = (ArrayList) template.selectList("best_picture_list", dto);

		return bestList;
	}

}
