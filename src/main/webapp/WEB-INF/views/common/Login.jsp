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
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	
    <link href="<c:url value="/resources/css/swiper.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/css/styles.css"/>" rel="stylesheet">
	
    <link type="text/css" rel="stylesheet" href="//cdn.ggumim.co.kr/resource/fonts/spoqahansans.css" />

    <link type="text/css" rel="stylesheet" href="//cdn.ggumim.co.kr/static/ggumim-1.6.00.min.css"/>
    <script type="text/javascript" src="//cdn.ggumim.co.kr/static/ggumim-stack-1.6.00.min.js"></script>
    <!-- kakao moment -->
	<!-- Favicon  -->
    <link rel="icon" href="<c:url value="/resources/images/favicon.png"/>">
    
   
  
  
 
    
    
</head>
<body data-bs-spy="scroll" data-bs-target="#navbarExample">
    
    <!-- Navigation -->
    <nav id="navbarExample" class="navbar navbar-expand-lg fixed-top navbar-light" aria-label="Main navigation">
        <div class="container">

            <!-- Image Logo -->
            <a class="navbar-brand logo-image" href="<c:url value="/fnt/main.do"/>"><img src="<c:url value="/resources/images/logo.svg"/>" alt="alternative"></a> 

            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <!-- <a class="navbar-brand logo-text" href="<c:url value="index.html"/>">Zinc</a> -->

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
                        <a class="nav-link" href="<c:url value="/fnt/Mypage.do"/>">마이페이지</a>
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
            </div> <!-- end of navbar-collapse -->
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->

      

<!-- Top 끝 -->

    <title>Fitness Together</title>
    <!-- dable용 메타태그 -->
    <!-- CSS Offset -->
    <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <!-- 마케팅 Tool Start -->
    <!-- Criteo 로더 파일 -->
	<!--<script type="text/javascript" src="//dynamic.criteo.com/js/ld/ld.js?a=90210" async="true"></script>
	-->
	<!-- END Criteo 로더 파일 -->
	<!-- Criteo 태그 -->
	<!--  
	<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push(
        { event: "setAccount", account: 90210},

        // To Do 1. 현재 유저의 이메일 주소(공백 제거 및 소문자로 변환 후). 유저의 이메일을 알수 없는 상황이면 빈 문자열로 전달
        { event: "setEmail", email: "" }, 
    );
    -->
</script>
<!-- END Criteo 태그 -->  
    

   
</head>
<body class="">
   
  
  <div class="item sm-bar cart-icon">
   <img src="//" style="width: 20px; height: 28px; vertical-align: top; margin-top: 26px; " />
   </div>
   
    
      <a href="/member/order_nonmember/">
      </a>
     
<div class="login container-fixed">
        <div class="title-logo">
        <img src="<c:url value="/resources/images/logo2.png"/>"/>
		</div>
        <div class="title">로그인</div>
        <div class="login-wrapper">
        <div class="sns-login">
            <div class="login-button f-login" onclick="Login.withFacebook('');">
                <img src="//cdn.ggumim.co.kr/resource/icons/facebook_logo.png" alt=""
                     style="height: 30px; width: 30px; margin-right: 15px;"/>페이스북 계정으로 로그인
            </div>
            <div class="login-button k-login" onclick="Login.withKakaotalk('');">
                <img src="//cdn.ggumim.co.kr/resource/icons/kakaotalk_logo.png" alt=""
                     style="width: 19px; height: 19px;"/>카카오톡 계정으로 로그인
            </div>
            <div id="naverIdLogin"></div>
            <div id="naver_id_login">
            
            </div>
        </div>
     
        <c:if test="${! empty  NotMember}">
		
		</c:if>
		 
		
	
		<c:if test="${not empty sessionScope.id }" var="isLogin">
			<div class="col-xs-offset-1 col-xs-6 alert alert-success">${sessionScope.id }님
				즐감하세요</div>
		</c:if>
		
		<c:if test="${not isLogin }">
		<div class="input-wrapper" >
        <div style="text-align: center; margin-top: -15px; height: 30px; color: #8e8e8e;"> </div>
        <form method="POST" action="<c:url value='/fnt/LoginProcess.do'/>">
            <div class="input-wrapper">
                <i class="fa fa-envelope-o" aria-hidden="true"></i>
                <input type="text" id="id" name="id" class="input-login" placeholder="ID"/>
            </div>
            <div class="input-wrapper">
                <i class="fa fa-lock" aria-hidden="true"></i>
                <input type="password" id="pwd" name="pwd" class="input-login" placeholder="PASSWORD"/>
                
            </div>
            <div class="input-wrapper" style="text-align: center;">
            <input type="submit" class="signin-btn"  value="LOGIN">
            </div>    
        </form>
       </div>
       </c:if>
    </div>
    
    <div class="lost-wrapper hide">
        <form method="POST" action="#" onsubmit=" Lostbox.checkForm(); return false; " style="text-align:right;">
            <div class="input-wrapper">
                <input type="email" id="input-lost-email" class="input-login" placeholder="이메일 주소"/>
                <i class="fa fa-envelope-o" aria-hidden="true"></i>
            </div>
            <input type="submit" class="lost-btn" value="비밀번호 찾기">
            <input type="button" value="로그인 하기" onclick="hideLost();">
        </form>
    </div>
    
    
       
   
</div>

<!--
<script>
	
    Stack.add(function () {
            });

    var access_type = '';

    var naverLogin;
    var naver_id_login;

    if (access_type == '') {
        naver_id_login = new naver_id_login("T3V848rTYJ3a8ANOGuSU", "https://www.ggumim.co.kr/login/process");
    } else {
        naver_id_login = new naver_id_login("T3V848rTYJ3a8ANOGuSU", "https://www.ggumim.co.kr/login/process_link");
    }

    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("white", 2, 40);
    naver_id_login.setDomain("https://ggumim.co.kr");
    naver_id_login.setState(state);
    naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();

    Stack.add(function () {
        $("#naver_id_login_anchor").html('<div class="login-button n-login"><img src="//cdn.ggumim.co.kr/resource/icons/naver_logo.png" alt="" style="margin-right: 30px; width:15px; height:15px;"/>네이버 계정으로 로그인</div>');
    });

    function showSignUp() {
        $(".login-wrapper").addClass("hide");
        $(".signup-wrapper").removeClass("hide");
    }

    function hideSignUp() {
        $(".login-wrapper").removeClass("hide");
        $(".signup-wrapper").addClass("hide");
    }

    function showLost() {
        $(".login-wrapper").addClass("hide");
        $(".lost-wrapper").removeClass("hide");
    }

    function hideLost() {
        $(".login-wrapper").removeClass("hide");
        $(".lost-wrapper").addClass("hide");
    }
</script>
-->

<!--JS Offsite-->
<!--  
<script type="text/javascript">
    window.Symbol || function (t) {
        "use strict";
        var e = Object.defineProperty, n = "__symbol-" + Math.ceil(1e9 * Math.random()) + "-", i = 0;

        function o(t) {
            if (!(this instanceof o)) return new o(t);
            var e = n + i++;
            this._symbol = e
        }

        e(o.prototype, "toString", {
            enumerable: !1, configurable: !1, writable: !1, value: function () {
                return this._symbol
            }
        }), t.Symbol = o
    }(this);
</script>

<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://pay.naver.com/customer/js/naverPayButton.js" charset="UTF-8"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
    var api_url = "https://api.ggumim.co.kr";
    var api_url_v2 = "https://moapi.ggumim.co.kr";
    var product_api_url = "https://product-api.ggumim.co.kr";
</script>

  <script type="text/javascript" src="//cdn.ggumim.co.kr/static/ggumim-vendors-1.6.00.min.js"></script>
  <script type="text/javascript" src="//cdn.ggumim.co.kr/static/ggumim-common-1.6.00.min.js"></script>
  <script type="text/javascript" src="//cdn.ggumim.co.kr/static/ggumim-app-1.6.00.min.js"></script>
<script>
    //  쌍였던 애들 처리
    Stack.process();
    // 너무 많이 페이지 내러가면, 업 버튼 생기기
    Scrolltop.begin();
    // 갤러리!
    Naruto.begin();
    </script>
    -->
</body>
</html>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->