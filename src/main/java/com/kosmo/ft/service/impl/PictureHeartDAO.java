package com.kosmo.ft.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.ft.service.PictureDTO;
import com.kosmo.ft.service.PictureHeartDTO;

@Repository
public class PictureHeartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public PictureDTO pictureSaveHeart(PictureHeartDTO to) {
		
		//테이블에 해당하는 게시물 좋아요수 +1하기 위해 to세팅
		PictureDTO pto = new PictureDTO();
		pto.setBno(to.getBno());
		
		//해당 게시물에 좋아요+1
		sqlSession.update("picture_heart_up", pto);
		
		// heart테이블에 추가
		int result = sqlSession.insert("picture_heart_save", to);
		
		if(result == 1) {
			pto = sqlSession.selectOne("picture_heart_count", pto);
			//테이블에 좋아요 추가가 성공한다면.. 갱신된 하트 갯수를 가져오기
		}
		return pto;
	}
	
	public PictureDTO pictureRemoveHeart(PictureHeartDTO to) {
		//board 테이블에 해당 게시물의 좋아요수 -1 하기위한 to세팅
		PictureDTO pto = new PictureDTO();
		pto.setBno(to.getBno());
		
		//해당 게시물의 좋아요 -1 하기
		sqlSession.update("picture_heart_down", pto);
		
		//좋아요 테이블에서 삭제
		int result = sqlSession.delete("picture_heart_remove", to);
		
		if(result == 1) {
			//heart 테이블에 좋아요 삭제 성공하면 하트 수 갱신하기
			pto = sqlSession.selectOne("picture_heart_count", pto);
		}
		return pto;
	}
	
}///PictureHeartDAO
