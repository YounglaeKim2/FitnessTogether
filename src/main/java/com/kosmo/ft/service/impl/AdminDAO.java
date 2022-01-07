package com.kosmo.ft.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.ft.service.AdminDTO;
import com.kosmo.ft.service.MemberDTO;

@Repository
public class AdminDAO {
	/*
	public AdminDTO getAdmin(AdminDTO dto) {
		AdminDTO admin = template.selectOne("AdminDAO.getAdmin", dto);
		return admin;
	}
	*/

	/*SqlSessionFactory를 직접 생성하지 않고 주입(DI)하기*/
	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;//static 필드 지원 안함
	
	/*[스프링에서 지원하는  마이바티스 관련 API(mybatis-spring-2.버전.jar) SqlSessionTemplate 사용]
	   -위 프로그래밍 순서의 (가)  및 (나)에서는 commit()호출
		그리고 (다)의 close()호출 불필요 
	 */
	
	@Resource(name="template")
	private SqlSessionTemplate template;

	private static final String namespace="mybatis.mapper.member";
	
	public boolean getAdmin(Map map) {
		// 스프링 지원 마이바티스 API 미 사용시
		//1]SqlSession얻기
		SqlSession session= sqlMapper.openSession();
		//2]selectOne()호출
		int count=session.selectOne("getAdminLogin",map);
		//3]close()호출
		session.close();
		return count==1 ? true : false;
	}//////////////

	public AdminDTO selectOne(Map map) {
		return template.selectOne("adminSelectOne",map);
	}
}
