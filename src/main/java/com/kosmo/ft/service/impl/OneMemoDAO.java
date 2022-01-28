package com.kosmo.ft.service.impl;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.ft.service.OneMemoDTO;

@Repository
public class OneMemoDAO {
	/*
	 * --------------------------------------------
	 * myBatis프레임워크 사용(mybatis-3.버전.jar)
	 * -SqlSessionFactory타입 객체 사용  
	   -형변환 불필요(iBatis는 형변환 해야 함)  
	 * --------------------------------------------
	 */
	/* [스프링에서 지원하는   마이바티스 관련 API(mybatis-spring-2.버전.jar) 미 사용]
	
		[프로그래밍 순서]
 	가. SqlSessionFactory타입의 openSession()메소드로 SqlSession타입 얻기 
 	나. SqlSession타입의 메소드 호출
    	.쿼리문이	SELECT 
	                  	다중레코드 일때:selectList()
	                  	단일 레코드일때:selectOne()
    	.쿼리문이 	INSERT - insert()
             		DELETE - delete()
             		UPDATE - update()메소드
         		      단,I/D/U일때는 반드시 commit()호출
         
		다.-close()호출   
	
	*/
	/* 스프링이 myBatis관련해서 지원하는 API 미 사용시
	 * -로그인/목록/입력에 적용해 보자	
	 */ 
	
	/*
	//주입받지 않고 직접 생성(순제어)
	private static SqlSessionFactory sqlMapper;
	static {
		try {
			String resource = "onememo/mybatis/configuration.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
		}
		catch(IOException e) {e.printStackTrace();}
		
	}*/
	/*SqlSessionFactory를 직접 생성하지 않고 주입(DI)하기*/
	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;//static 필드 지원 안함
	
	/*[스프링에서 지원하는  마이바티스 관련 API(mybatis-spring-2.버전.jar) SqlSessionTemplate 사용]
	   -위 프로그래밍 순서의 (가)  및 (나)에서는 commit()호출
		그리고 (다)의 close()호출 불필요 
	 */
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	public boolean isLogin(Map map) {
		// 스프링 지원 마이바티스 API 미 사용시
		//1]SqlSession얻기
		SqlSession session= sqlMapper.openSession();
		//2]selectOne()호출
		int count=session.selectOne("memoIsLogin",map);
		//3]close()호출
		session.close();		
		return count==1 ? true : false;
	}//////////////
	public List<OneMemoDTO> selectList(Map map) {
		// 스프링 지원 마이바티스 API 미 사용시
		//1]SqlSession얻기
		SqlSession session= sqlMapper.openSession();
		//2]selectList()호출
		List<OneMemoDTO> lists=session.selectList("memoSelectList", map);
		//3]close()호출
		session.close();
		return lists;
	}
	public int getTotalRowCount(Map map) {
		SqlSession session= sqlMapper.openSession();
		int total=session.selectOne("memoTotalRowCount",map);
		session.close();
		return total;
	}
	public int insert(Map map) {		
		
		// 스프링 지원 마이바티스 API 미 사용시
		//1]SqlSession얻기
		SqlSession session= sqlMapper.openSession();
		//2]insert()호출
		int affected=session.insert("memoInsert", map);
		//3]commit()호출
		session.commit();
		//4]close()호출
		session.close();
		return affected;		
		
	}
	/*[스프링에서 지원하는  마이바티스 관련 API(mybatis-spring-2.버전.jar) SqlSessionTemplate 사용]
	-위 프로그래밍 순서의 (가) 불필요  및 (나)에서는 commit()호출 불필요
		그리고 (다)의 close()호출 불필요 
	 */
	public OneMemoDTO selectOne(Map map) {		
		return template.selectOne("memoSelectOne",map);
	}/////////
	public int update(Map map) {
		
		return template.update("memoUpdate", map);
	}
	public void delete(Map map) {
		
		template.delete("memoDelete", map);		
	}

	

}
