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
	<meta name="google-signin-client_id" content="483006211482-roi1dr24q8s1i4cpkpkn3b4m4k6dvg3h.apps.googleusercontent.com">
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
  <style type="text/css">
    #customBtn {
      display: inline-block;
      background: white;
      color: #403b3b;
      width: 260px;
      height: 40px;
      border-radius: 5px;
      border: thin solid #474242;
      white-space: nowrap;
      margin-left: 10px;
      padding-left: 24dp;
    }
    #customBtn:hover {
      cursor: pointer;
    }
    span.label {
      font-family: serif;
      font-weight: normal;
    }
    span.icon {
      background: url("<c:url value="/resources/login/images/g-logo.png"/>" ) ;
      background-size: 21px 21px;
      display: inline-block;
      vertical-align: middle;
      width: 21px;
      height: 21px;
      margin-left:8px;
      margin-top:8px;
    }
    span.buttonText {
      display: inline-block;
      vertical-align: middle;
      margin-left: 25px;
      margin-top: 10px;
      padding-left: 42px;
      padding-right: 42px;
      font-size: 11.8px;
      font-weight: bold;
      /* Use the Roboto font that is loaded in the <head> */
      font-family: 'Roboto', sans-serif;
    }
  </style>
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
							<button class="login100-form-btn ">
								Login
							</button>
						</div>
					</div>
					<!-- 
	<!-- start 카카오계정으로 로그인하기 -->
	  <a href="javascript:kakaoLogin();"><img src="<c:url value="/resources/login/images/kakao_login_medium_wide.png"/>" style="margin:10px; height:40px;width:260px;"></a>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <script>
        // 자스키 - dce1a6b74b6037f0cc344d0b3f4d8a97
        window.Kakao.init("dce1a6b74b6037f0cc344d0b3f4d8a97");
        console.log(Kakao.isInitialized()); // sdk초기화여부판단
      //카카오로그인
      function kakaoLogin() {
          Kakao.Auth.login({
            success: function (response) {
              Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
              	  console.log(response)
                },
                fail: function (error) {
                  console.log(error)
                },
              })
            },
            fail: function (error) {
              console.log(error)
            },
          })
        }
      //카카오로그아웃  
      function kakaoLogout() {
          if (Kakao.Auth.getAccessToken()) {
            Kakao.API.request({
              url: '/v1/user/unlink',
              success: function (response) {
              	console.log(response)
              },
              fail: function (error) {
                console.log(error)
              },
            })
            Kakao.Auth.setAccessToken(undefined)
          }
        }  
      
    </script>
    <!-- end 카카오계정으로 로그인하기 -->
				
	
	<!-- start 구글로 로그인하기 -->
	
	<!-- 구글 로그인 버튼 -->
		<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://apis.google.com/js/api:client.js"></script>
	
 	 <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
 
  	<script>
		  var googleUser = {};
		  var startApp = function() {
		    gapi.load('auth2', function(){
		      // Retrieve the singleton for the GoogleAuth library and set up the client.
		      auth2 = gapi.auth2.init({
		        client_id: '483006211482-roi1dr24q8s1i4cpkpkn3b4m4k6dvg3h.apps.googleusercontent.com',
		        cookiepolicy: 'single_host_origin',
		        // Request scopes in addition to 'profile' and 'email'
		        //scope: 'additional_scope'
		      });
		      attachSignin(document.getElementById('customBtn'));
		    });
		  };

		  function attachSignin(element) {
		    console.log(element.id);
		    auth2.attachClickHandler(element, {},
		        function(googleUser) {
		          document.getElementById('name').innerText = "Signed in: " +
		              googleUser.getBasicProfile().getName();
		        }, function(error) {
		          alert(JSON.stringify(error, undefined, 2));
		        });
		  }
  </script>

 
  <!-- In the callback, you would hide the gSignInWrapper element on a
  successful sign in -->
  <div id="gSignInWrapper">
    <div id="customBtn" class="customGPlusSignIn">
      <span class="icon"></span>
      <span class="buttonText">구글로 로그인</span>
    </div>
  </div>
  <div id="name"></div>
  <script>startApp();</script>
<!-- end 구글 로그인 버튼 -->

<!-- 
	
	<script>
	function onSignIn(){
	var auth2 = gapi.auth2.getAuthInstance()
	if(auth2.isSignedIn.get()){
	 var profile = auth2.currentUser.get().getBasicProfile();
	 googleLoginPro(profile)
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	
	}
	
}
	 function signOut() {
			if(gapi.auth2 != undefined){
			 	var auth2 = gapi.auth2.getAuthInstance();
		   		 auth2.signOut().then(function () {
		    	  console.log('User signed out.');
		    });
			}

			
			location.href= "/user/logOut.do"
		  }
</script>
 -->
 
 <script>
 function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyDKw0T_m1qhDh_3Sv5OL4atqMi6_zraovw', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
        //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}
</script>

<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>


	
	
					
					
				</form>
			</div>
		</div>
	</div>
	

	
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