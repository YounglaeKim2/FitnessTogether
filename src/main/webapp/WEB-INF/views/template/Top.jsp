<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- SEO Meta Tags -->
    <meta name="description" content="Your description">
    <meta name="author" content="Your name">

    <!-- OG Meta Tags to improve the way the post looks when you share the page on Facebook, Twitter, LinkedIn -->
	<meta property="og:site_name" content="" /> <!-- website name -->
	<meta property="og:site" content="" /> <!-- website link -->
	<meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
	<meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
	<meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
	<meta property="og:url" content="" /> <!-- where do you want your post to link to -->
	<meta name="twitter:card" content="summary_large_image"> <!-- to have large image post format in Twitter -->

    <!-- Webpage Title -->
    <title>Fitness Together</title>
    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="<c:url value="/resources/css/fontawesome-all.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/swiper.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet">
	
	<!-- Favicon  -->
    <link rel="icon" href="<c:url value="/resources/images/favicon.png"/>">
    
    <!-- Scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> <!-- Bootstrap framework -->
    <script src="<c:url value="/resources/js/purecounter.min.js"/>"></script> <!-- Purecounter counter for statistics numbers -->
    <script src="<c:url value="/resources/js/isotope.pkgd.min.js"/>"></script> <!-- Isotope for filter -->
    <script src="<c:url value="/resources/js/scripts.js"/>"></script> <!-- Custom scripts -->
    
    
</head>
<body data-bs-spy="scroll" data-bs-target="#navbarExample">
    
    <!-- Navigation -->
    <nav id="navbarExample" class="navbar navbar-expand-lg fixed-top navbar-light" aria-label="Main navigation">
        <div class="container">

            <!-- Image Logo -->
            <a class="navbar-brand logo-image" href="<c:url value="index.html"/>"><img src="<c:url value="/resources/images/logo.svg"/>" alt="alternative"></a> 

            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <!-- <a class="navbar-brand logo-text" href="<c:url value="index.html"/>">Zinc</a> -->

            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ms-auto navbar-nav-scroll">
                    
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="#services"/>">로그인</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value="#projects"/>">회원가입</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="#services"/>">로그아웃</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="#projects"/>">마이페이지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="#pricing"/>">매핑</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value="#pricing"/>">채팅</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value="#pricing"/>">게시판</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="<c:url value="fnt/calendar.do"/>">캘린더</a>
                    </li>
                </ul>
            </div> <!-- end of navbar-collapse -->
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->

      