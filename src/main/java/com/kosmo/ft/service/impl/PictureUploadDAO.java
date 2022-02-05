package com.kosmo.ft.service.impl;

import java.util.Map;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.ft.service.PictureDTO;
import com.kosmo.ft.service.PictureUploadDTO;

@Repository
public class PictureUploadDAO {

	@Resource(name = "template")
	private SqlSessionTemplate template;

	//게시글 삽입
	public int pictureUpload(Map map) {

		return template.insert("pictureUpload", map);
	}

	public int update(Map map) {

		return template.update("pictureUpdate", map);
	}

	public void delete(Map map) {

		template.delete("pictureDelete", map);
	}

	//이미지소스
	public int pictureSrcInsert(Map map) {
			
		return template.insert("pictureSrcInsert", map);
	}

	public PictureDTO selectOne(Map map) {
		
		return template.selectOne("pictureSelectOne",map);
	}

}///// PictureUploadDAO
