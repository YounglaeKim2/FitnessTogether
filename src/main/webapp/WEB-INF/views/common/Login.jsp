<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/template/Top.jsp"/> 
 <!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V2</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<c:url value="/resources/login/images/login/favicon.ico"/>"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/login/vendor/bootstrap/css/bootstrap.min.css"/>"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/login/fonts/iconic/css/material-design-iconic-font.min.css"/>"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/login/vendor/animate/animate.css"/>"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/login/vendor/css-hamburgers/hamburgers.min.css"/>"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/login/vendor/animsition/css/animsition.min.css"/>"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/login/vendor/select2/select2.min.css"/>"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/login/vendor/daterangepicker/daterangepicker.css"/>"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/login/css/util.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/login/css/main.css"/>"/>
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
			 <form method="POST" action="<c:url value='/fnt/LoginProcess.do'/>">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-26">
						Welcome
					</span>
					<span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-font"></i>
					</span>
					
					 <c:if test="${! empty  NotMember}">
						<div class="row">
						<div class="col-xs-offset-1 col-xs-6 alert alert-warning fade in">
							<button class="close" data-dismiss="alert">
							<span>×</span>
							</button>
							${NotMember }
						</div>
						</div>
					</c:if>
					
					
					<c:if test="${not empty sessionScope.id }" var="isLogin">
						<div class="col-xs-offset-1 col-xs-6 alert alert-success">${sessionScope.id }님 즐감하세요</div>
					</c:if>
					
					
					<c:if test="${not isLogin }"/>
					<div class="wrap-input100 validate-input" >
					
						<input class="input100" type="text" name="id">
						<span class="focus-input100" data-placeholder="아이디를 입력하세요"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
					 
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="pwd">
						<span class="focus-input100" data-placeholder="비밀번호를 입력하세요"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>

					
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="<c:url value="/resources/login/vendor/jquery/jquery-3.2.1.min.js"/> "/></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/login/vendor/animsition/js/animsition.min.js"/> "/></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/login/vendor/bootstrap/js/popper.js"/> "/></script>
	<script src="<c:url value="/resources/login/vendor/bootstrap/js/bootstrap.min.js"/> "/></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/login/vendor/select2/select2.min.js"/> "/></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/login/vendor/daterangepicker/moment.min.js"/> "/></script>
	<script src="<c:url value="/resources/login/vendor/daterangepicker/daterangepicker.js"/> "/></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/login/vendor/countdowntime/countdowntime.js"/> "/></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/login/js/main.js"/> "/></script>

</body>
</html>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->