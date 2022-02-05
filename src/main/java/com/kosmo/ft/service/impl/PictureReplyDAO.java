package com.kosmo.ft.service.impl;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.ft.service.PictureDTO;
import com.kosmo.ft.service.PictureHeartDTO;
import com.kosmo.ft.service.PictureReplyDTO;

@Repository
public class PictureReplyDAO {

	@Autowired
	private SqlSessionTemplate template;

	// 댓글 작성
	public PictureDTO pictureWriteReply(PictureReplyDTO dto) {

		// BOARD 테이블에 해당 게시물의 reply수를 +1하기위한 dto세팅
		PictureDTO pto = new PictureDTO();
		pto.setBno(dto.getBno());
		
		// 해당 게시물의 reply+1
		template.update("picture_reply_up", pto);

		// 현재 REPLY 테이블의 가장큰 bno값을 가져온다
		int grp = template.selectOne("reply_max_no");

		// grp 세팅
		dto.setGrp(grp + 1);

		int result = template.insert("picture_reply_write", dto);

		int check = template.selectOne("p_reply_max_no");
		// grp를 방금넣은 데이터의 bno값으로 세팅
		dto.setGrp(check);

		// bno와 grp가 다르면 grp를 bno로 업데이트
		int check_update = template.update("picture_reply_check", dto);

		if (result == 1) {
			// REPLY 테이블에 새로운 댓글추가가 성공했다면
			// 갱신된 댓글수 가져오기
			pto = template.selectOne("picture_reply_count", pto);
		}
		return pto;
	}

	// 대댓글 작성
	public PictureDTO pictureWriteReReply(PictureReplyDTO dto) {
		// BOARD 테이블에 해당 게시물의 reply수를 +1하기위한 dto세팅
		PictureDTO pto = new PictureDTO();
		pto.setBno(dto.getBno());

		// 해당 게시물의 reply를 +1 한다.
		template.update("picture_reply_up", pto);

		// REPLY 테이블에 추가(위와 동일)
		int result = template.insert("picture_rereply_write", dto);

		if (result == 1) {
			pto = template.selectOne("picture_reply_count", pto);
		}
		return pto;
	}

	// 댓글 리스트
	public ArrayList<PictureReplyDTO> replyList(PictureReplyDTO dto) {

		ArrayList<PictureReplyDTO> replyList = new ArrayList();

		replyList = (ArrayList) template.selectList("picture_replyList", dto);

		return replyList;
	}

	// 댓글 삭제
	public PictureDTO pictureDeleteReply(PictureReplyDTO dto) {

		// BOARD 테이블에 해당 게시물의 reply수를 +1하기위한 dto세팅
		PictureDTO pto = new PictureDTO();
		pto.setBno(dto.getBno());
		
		//grp가 REPLY의 bno와 일치하는 댓글이 몇개인지 카운팅
		int count_rereply = template.selectOne("picture_count_rereply", dto);
		
		int result = 0;

		// 해당 게시물의 reply-1
		template.update("picture_reply_down", pto);
		
		if(count_rereply==0) { //답글이 없을 때 - 그냥 삭제
			
			// REPLY 테이블에서 삭제
			result = template.delete("picture_reply_delete", dto);
		}
		else {
			//REPLY 테이블에서 삭제
			result = template.update("pucture_reply_not_delete", dto);
		}
		
		if(result == 1) { //REPLY 테이블에서 댓글삭제가 성공한다면..
			//갱신된 댓글 갯수를 가져옴
			pto = template.selectOne("picture_reply_count", pto);
		}
		return pto;

	}
	
	// 대댓글 삭제
		public PictureDTO pictureDeleteReReply(PictureReplyDTO dto) {
			// BOARD 테이블에 해당 게시물의 reply수를 +1하기위한 dto세팅
			PictureDTO pto = new PictureDTO();
			pto.setBno(dto.getBno());

			// 해당 게시물의 reply를 +1 한다.
			template.update("picture_reply_up", pto);

			// REPLY 테이블에 추가(위와 동일)
			int result = template.insert("picture_rereply_write", dto);

			if (result == 1) {
				pto = template.selectOne("picture_reply_count", pto);
			}
			return pto;
		}
		
		//댓글 작성
		public PictureDTO pro_pictureWriteReply(PictureReplyDTO dto) {
			
			//BOARD 테이블에 해당 게시물의 REPLY수를 +1 하기위한 dto세팅
			PictureDTO pto = new PictureDTO();
			pto.setBno(dto.getBno());
			
			//해당 게시물의 reply를 +1 한다.
			template.update("picture_reply_up", pto);
			
			//현재의 REPLY 테이블의 가장큰 bno값 가져오기
			int grp = template.selectOne("p_reply_max_no");
			
			//grp세팅
			dto.setGrp(grp+1);
			
			int result = template.insert("picture_reply_write", dto);
			
			int check = template.selectOne("p_reply_max_no");
			//grp를 방금넣은 데이터의 bno값으로 세팅함
			
			dto.setGrp(check);
			
			//bno와 grp가 다르면 grp를 bno로 업데이트
			//int check_update = sqlSession.update("picture_reply_check",dto);
			
			if(result == 1) {
				//갱신된 댓글 갯수 가져오기
				pto = template.selectOne("picture_reply_count", pto);
			}
			
			return pto;
		}

}/// PictureHeartDAO
