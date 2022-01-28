<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<script>		
		alert("비밀번호를 정확하게 입력해주세요");
		location.replace("<c:url value="/fnt/Mypage.do"/>");	
	</script>
