<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- SEO Meta Tags -->
<meta name="description" content="Your description">
<meta name="author" content="Your name">

<!-- OG Meta Tags to improve the way the post looks when you share the page on Facebook, Twitter, LinkedIn -->
<meta property="og:site_name" content="" /><!-- website name -->
<meta property="og:site" content="" /><!-- website link -->
<meta property="og:title" content="" /><!-- title shown in the actual shared post -->
<meta property="og:description" content="" /><!-- description shown in the actual shared post -->
<meta property="og:image" content="" /><!-- image link, make sure it's jpg -->
<meta property="og:url" content="" /><!-- where do you want your post to link to -->
<meta name="twitter:card" content="summary_large_image"><!-- to have large image post format in Twitter -->

<!-- Webpage Title -->
<title>Fitness Together</title>
<!-- Styles
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link href="<c:url value="/resources/css/fontawesome-all.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/swiper.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/navbar.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/stylesmain.css"/>"
	rel="stylesheet">

<!-- Favicon  -->
<link rel="icon" href="<c:url value="/resources/images/favicon.png"/>">

<!-- Scripts -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- Bootstrap framework -->
<script src="<c:url value="/resources/js/purecounter.min.js"/>"></script>
<!-- Purecounter counter for statistics numbers -->
<script src="<c:url value="/resources/js/isotope.pkgd.min.js"/>"></script>
<!-- Isotope for filter -->
<script src="<c:url value="/resources/js/scripts.js"/>"></script>
<!-- Custom scripts -->


</head>


<header id="page-top">


	<nav
		class="navbar navbar-expand-lg navbar-light bg-light rounded fixed-top"
		aria-label="Tenth navbar example">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarsExample08"
				aria-controls="navbarsExample08" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-md-center"
				id="navbarsExample08">
				<ul class="navbar-nav">
					<!--
					<li class="nav-item"><img
						src="<c:url value="/resources/images/logo.svg"/>"
						alt="alternative"></li>
					-->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="<c:url value="/fnt/main.do"/>"> FITNESS
							TOGETHER </a></li>
					<!--
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>	
					
					<li class="nav-item"><a class="nav-link disabled" href="#"
						tabindex="10" aria-disabled="true">Disabled</a></li>
						
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/fnt/AboutUs.do"/>">About</a></li>
					-->	
						
					<!-- 로그인하지 않은 경우 --> 
					<c:if test="${empty sessionScope.id}" var="isLogin">
					<li class="nav-item"><a class="nav-link" 
						href="<c:url value="/fnt/Login.do"/>"> 로그인 </a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/fnt/SignUp.do"/>"> 회원가입 </a>
					</li>
					</c:if>
					<!-- 로그인한 경우 -->
					<c:if test="${!empty sessionScope.id}" >
					<li class="nav-item"><a class="nav-link" 
						href="<c:url value="/fnt/Logout.do"/>"> 로그아웃 </a>
					</li>
					</c:if>
					
					
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/fnt/MypagePro.do"/>"> My-Page </a>
					</li>
					
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/fnt/TeachableMachine.do"/>"> Food-Calculator </a>
					</li>
						
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/fnt/#.do"/>"> DirectMessage </a>
					</li>
					
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/fnt/mappingList.do"/>"> 퍼칭(Perching) </a>
					</li>
					
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/fnt/sfHome.do"/>"> 운동시설찾기 </a>
					</li>
					
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/fnt/calendar.do"/>"> 캘린더 </a>
					</li>
					

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdownBoard"
						data-bs-toggle="dropdown" aria-expanded="false"> Board </a>
						<ul class="dropdown-menu" aria-labelledby="dropdown08">
							<li><a class="dropdown-item"
								href="<c:url value="/fnt/picture_list.do"/>">소셜게시판</a></li>
							<li><a class="dropdown-item"
								href="#">Q & A Board</a></li>
							<li><a class="dropdown-item" 
								href="#">Something else here</a></li>
						</ul>
					</li>
					
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdownAbout"
						data-bs-toggle="dropdown" aria-expanded="false"> About </a>
						<!--
						<c:if test="${!empty sessionScope.id}">
							<li style="width:200px; padding: 10px 0 0 250px; margin: 0 0 0 -250px;">&nbsp;${sessionScope.id }&nbsp;님</li>
						</c:if>
						-->
						<ul class="dropdown-menu" aria-labelledby="dropdownAbout">
							<li><a class="dropdown-item"
								href="<c:url value="/fnt/whoWeAre.do"/>">Our Amazing Team</a></li>
							<li><a class="dropdown-item" 
								href="<c:url value="/fnt/howWeDid.do"/>">How We Did</a></li>
							<li><a class="dropdown-item" href="#">Something else here</a></li>
						</ul>
					</li>
					
					
						
				</ul>
				
			</div>
			
		</div>
		
	</nav>
	<div class="container" style="padding-top:20px">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<c:if test="${!empty sessionScope.id}">
				<li style="width:200px; padding: 10px 0 0 250px; margin: 0 0 0 -250px;">&nbsp;${sessionScope.id }&nbsp;님</li>
			</c:if>
		</div>
	</div>
	
	<!-- Navigation 
    <nav id="navbarExample" class="navbar navbar-expand-lg fixed-top navbar-light" aria-label="Main navigation">
        <div class="container">

            
            <a class="navbar-brand logo-image" href="<c:url value="/fnt/main.do"/>"><img src="<c:url value="/resources/images/logo.svg"/>" alt="alternative"></a> 

            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ms-auto navbar-nav-scroll">
                    
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/fnt/Login.do"/>">로그인</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/fnt/SignUp.do"/>">회원가입</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/fnt/Logout.do"/>">로그아웃</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/fnt/ProAlter.do"/>">마이페이지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/fnt/mappingList.do"/>">매핑</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value="#pricing"/>">채팅</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/fnt/photoList.do"/>">소셜게시판</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/fnt/calendar.do"/>">캘린더</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>-->
	<!-- end of navigation -->

	<!-- Navigation
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top"><img src="assets/img/navbar-logo.svg" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                    	<li class="nav-item"><a class="nav-link" href="<c:url value="/fnt/AboutUs.do"/>">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/fnt/Login.do"/>">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/fnt/SignUp.do"/>">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/fnt/Logout.do"/>">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/fnt/ProAlter.do"/>">마이페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/fnt/mappingList.do"/>">매핑</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/fnt/#.do"/>">채팅</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/fnt/photoList.do"/>">소셜게시판</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/fnt/calendar.do"/>">캘린더</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    -->
</header>