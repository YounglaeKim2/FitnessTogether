<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
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
	</head>
	<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
	<a class="navbar-brand js-scroll-trigger" href="#page-top">
		<span class="d-block d-lg-none">Clarence Taylor</span>
		<span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="<c:url value="/resources/mypage/assets/img/images.jpg"/>" alt="..." /></span>
	</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
		
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link js-scroll-trigger" >kosmo</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value="/fnt/UpdateMember.do"/>">프로필수정</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value="/fnt/UpdatePwd.do"/>">비밀번호 변경</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value="/fnt/DeleteMember.do"/>">회원 탈퇴</a></li>
					
					</ul>
			</div>
	</nav>
		<!-- Page Content-->
			<div class="container-fluid p-0">
			<!-- About-->
				<section class="resume-section" id="about">
					<div class="resume-section-content">
					<form action="<c:url value="/fnt/MypagePro.do"/>">
						<h1 class="mb-0">개인정보수정</h1>
						<h22 class="mb-22">비밀번호 재확인</h22>
							<div class="subheading mb-5">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</div>
									<table class="w-pct60">
										<tr>
											<th class="w-px160">비밀번호</th>
											<td>
											<input type="text" id="pwd" name="pwd" style="margin:0 0 0 10px;  height:35px;"/>
											</td>
										</tr>
										<tr>
											<th class="w-px161">비밀번호 확인</th>
											<td>
											<input type="text" id="pwdck" name="pwdck" style="margin:30px 0 0 10px; height:35px; "/>
											</td>
										</tr>
								</table>
									<input type="button" id="sucessbtn" class="btn default"
										style="color: black; font-size: 15px; font-weight: bold; height: 44px; width: 100px; margin: 20px 950px 7px 120px; padding: 10px 10px 10px 10px; border: 2px solid #595757;"
										value="확인" 
										onclick="location.href='/fnt/UpdateMember.do'"/>
					
						</form>
					</div>
				</section>
			</div>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<c:url value="/resources/mypage/js/scripts.js"/>"/></script>
    </body>
</html>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->