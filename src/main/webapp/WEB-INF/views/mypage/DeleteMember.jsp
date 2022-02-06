<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
		<meta name="description" content="" />
		<meta name="author" content="" />
		<title>MyPage</title>
		<link rel="icon" type="image/x-icon" href="<c:url value="/resources/mypage/assets/img/favicon.ico"/>"/>
		<!-- Font Awesome icons (free version)-->
		<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
		<!-- Google fonts-->
		<link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
		<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
		<!-- Core theme CSS (includes Bootstrap)-->
		<link href="<c:url value="/resources/mypage/css/styles.css"/>" rel="stylesheet" />
		<link rel="stylesheet" href="/ft/resources/signup/signup.css">
		<!-- Bootstrap core JS-->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="<c:url value="/resources/mypage/js/scripts.js"/>"/></script>
	</head>
	<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
		<a class="navbar-brand js-scroll-trigger" href="#">
			<span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="<c:url value="/resources/mypage/assets/img/user.png"/>" alt="..." /></span>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav">
						<li class="nav-item">${sessionScope.id }</li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value="/fnt/UpdateMember.do"/>">프로필수정</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value="/fnt/DeleteMember.do"/>">회원 탈퇴</a></li>
					</ul>
			</div>
	</nav>
		<!-- 본문시작 -->
	<div id="container">
		<div id="main">
			<div class="content" style="width: 2000px; height: 500px; text-align: center; margin:100px 800px 0 200px; padding: 0 750px 0 0; ">
				<p class="w-pct60 right" style="margin: 0 auto; padding: 0 540px 0 0; font-size: 13px;"></p>
				<span class="delete_user"><img class="deleteUser" style="width:130px;height:130px;margin:0 560px 0 0;"src="<c:url value="/resources/mypage/images/delete_user.png"/>" /></span>
				<div class="subheading mb-5" style="color:black; font-weight:bold; padding: 0 600px 0 0;">정말&nbsp;&nbsp;탈퇴&nbsp;&nbsp;하시겠습니까?</div>
				<div class="subheading mb-6" style="color:black; font-weight:bold; padding: 0 600px 0 0;">탈퇴한&nbsp;&nbsp;데이터는&nbsp;&nbsp;복구가&nbsp;&nbsp;되지&nbsp;&nbsp;않습니다.</div>
				<div class="subheading mb-7" style="color:black; font-weight:bold; padding: 0 600px 0 0;">탈퇴를&nbsp;&nbsp;원하시면&nbsp;&nbsp;아래 "<span class="highlight" style="background-color:#f5bfab;">회원&nbsp;&nbsp;탈퇴</span>" 버튼을&nbsp;&nbsp;눌러주세요</div>
					<form class="deleteMember" id="deleteMember" action="<c:url value="/fnt/DeleteMemberPro.do"/>" method="post">
						<input type="hidden" name="id" value="${sessionScope.id}"/>
						<button id="sucessbtn" class="btn default" style="color: black; font-size: 15px; font-weight: bold; height: 44px; width: 100px; margin: 30px 600px 7px 0; padding: 10px 10px 10px 10px; border: 2px solid #595757">회원탈퇴</button>
					</form>
			</div>
		</div>
	</div>
</body>
</html>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->