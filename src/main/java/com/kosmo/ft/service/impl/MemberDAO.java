package com.kosmo.ft.service.impl;

import javax.annotation.Resource;


import org.mybatis.spring.SqlSessionTemplate;

import com.kosmo.ft.service.MemberDTO;

public class MemberDAO {

	
	/*[스프링에서 지원하는  마이바티스 관련 API(mybatis-spring-2.버전.jar) SqlSessionTemplate 사용]
	   -위 프로그래밍 순서의 (가)  및 (나)에서는 commit()호출
		그리고 (다)의 close()호출 불필요 
	 */
	@Resource(name="template")
	private SqlSessionTemplate template;

	 public boolean Login(MemberDTO dto) throws Exception {
	        return template.selectOne("Member.Login", dto);
	    }
}
