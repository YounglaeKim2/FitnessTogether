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
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />	
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
				<span class="login100-form-title p-b-26">Welcome</span>
				<form action="<c:url value="/fnt/LoginProcess.do"/>">
					<div class="wrap-input100 validate-input" >
						<input style="font-weight:bold;" class="input100" type="text" name="id" id="id" placeholder="아이디를 입력하세요">
					</div>
		
					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input style="font-weight:bold;" class="input100" type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요">
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="button" class="login100-form-btn" onclick="loginFu()">
								Login
							</button>
						</div>
					</div>
				</form>
				
	
	 <!-- start 카카오계정으로 로그인하기 -->
	  <a href="javascript:kakaoLogin();"> 
	  <img src="<c:url value="/resources/login/images/kakao_login_medium_wide.png"/>" style="margin:10px; height:40px;width:260px;"></a>
      <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        // 자스키 - dce1a6b74b6037f0cc344d0b3f4d8a97
        //window.Kakao.init("dce1a6b74b6037f0cc344d0b3f4d8a97");
        console.log(Kakao.isInitialized()); // sdk초기화여부판단
      //카카오로그인
      function kakaoLogin() {
          Kakao.Auth.login({
            success: function (response) {
              Kakao.API.request({
                url: '/v2/user/me',
                success: res => { 
                	
             
                const email = res.kakao_account.email;
                const gender = res.kakao_account.gender;
                const name = res.kakao_account.profile.nickname;
                const kakao_account = res.kakao_account;
     
              	  console.log(kakao_account);
              	  console.log(email);
	              console.log(gender);
	              console.log(name);
	              
	              $('kakaoemail').val(email);
	              $('kakaoename').val(name);
	              $('kakaogender').val(gender);        
	              
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
      window.Kakao.init('dce1a6b74b6037f0cc344d0b3f4d8a97');
      function kakaoLogout() {
          if (!Kakao.Auth.getAccessToken()) {
           console.log('Not logged in');
           return;
          }
          Kakao.Auth.logout(function(response){
        	  alert(response + 'logout');
        	  window.location.href='/'
        	  });
          };
    </script>
    <!-- end 카카오계정으로 로그인하기 
    -->
			
	
	<!-- start 구글로 로그인하기 -->
	
	<!-- 구글 로그인 버튼 -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://apis.google.com/js/api:client.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
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
		    console.log(element);
		    auth2.attachClickHandler(element, {},
		        function(googleUser) {
		          document.getElementById('name').innerText = "Signed in: " +
		              googleUser.getBasicProfile().getName();
		          		var profile =  googleUser.getBasicProfile();
		          		console.log("Email:" + profile.getEmail());
		          		console.log("Name:" + profile.getName());

		        }, function(error) {
		          alert(JSON.stringify(error, undefined, 2));
		        });
		  }
  	</script>

 <!-- start 구글 로그인 버튼 -->
  <div id="gSignInWrapper">
    <div id="customBtn" class="customGPlusSignIn">
      <span class="icon"></span>
      <span class="buttonText">구글로 로그인</span>
    </div>
  </div>
  <div id="name"></div>
  <script>startApp();</script>
<!-- end 구글 로그인 버튼 -->


				</div>
			</div>
		</div>	
	</body>
</html>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->