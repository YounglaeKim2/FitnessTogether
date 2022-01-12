<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:if test="${empty sessionScope.id }">	
	<script>		
		alert("아이디 또는 비밀번호가 맞지 않습니다");
		location.replace("<c:url value="/fnt/Login.do"/>");	
	</script>
</c:if>