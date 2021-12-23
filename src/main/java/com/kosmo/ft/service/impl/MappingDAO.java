package com.kosmo.ft.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.ft.service.MappingDTO;

@Repository
public class MappingDAO {
	
	//SqlSessionFactory를 직접 생성하지 않고 주입(DI)하기
	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;//static 필드 지원 안함

	/*[스프링에서 지원하는  마이바티스 관련 API(mybatis-spring-2.버전.jar) SqlSessionTemplate 사용]
	   -위 프로그래밍 순서의 (가)  및 (나)에서는 commit()호출
		그리고 (다)의 close()호출 불필요 
	 */
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
//	public boolean isLogin(Map map) {
//		// 스프링 지원 마이바티스 API 미 사용시
//		//1]SqlSession얻기
//		SqlSession session= sqlMapper.openSession();
//		//2]selectOne()호출
//		int count=session.selectOne("mappingIsLogin",map);
//		//3]close()호출
//		session.close();		
//		return count==1 ? true : false;
//	}//isLogin
	
	public List<MappingDTO> selectList(Map map){
		// 스프링 지원 마이바티스 API 미 사용시
		//1]SqlSession얻기
		SqlSession session= sqlMapper.openSession();
		//2]selectList()호출
		List<MappingDTO> lists = session.selectList("mappingSelectList",map);
		//3]close()호출
		session.close();
		return lists;
	}//selectList
	
	public int getTotalRowCount(Map map) {
		SqlSession session = sqlMapper.openSession();
		int total=session.selectOne("mappingTotalRowCount",map);
		session.close();
		return total;
	}//getTotalRowCount
	
	public int insert(Map map) {
		// 스프링 지원 마이바티스 API 미 사용시
		//1]SqlSession얻기
		SqlSession session = sqlMapper.openSession();
		//2]insert()호출
		int affected=session.insert("mappingInsert",map);
		//3]commit()호출
		session.commit();
		//4]close()호출
		session.close();
		return affected;
	}//insert
	
	/*[스프링에서 지원하는  마이바티스 관련 API(mybatis-spring-2.버전.jar) SqlSessionTemplate 사용]
	-위 프로그래밍 순서의 (가) 불필요  및 (나)에서는 commit()호출 불필요
		그리고 (다)의 close()호출 불필요 
	 */
	
	public MappingDTO selectOne(Map map) {
		return template.selectOne("mappingSelectOne",map);
	}
	public int update(Map map) {
		return template.update("mappingUpdate",map);
	}
	public void delete(Map map) {
		template.delete("mappingDelete",map);
	}
	
	
}
