<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<script>		
		alert("이용해주셔서 감사합니다");
		location.replace("<c:url value="/fnt/main.do"/>");	
	</script>
