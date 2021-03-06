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


	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://apis.google.com/js/platform.js"></script>
	<script src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v1.0&appId=2148512708633154"></script>
	<script src="<c:url value="/resources/login/js/login.js"/> "></script>

  <style type="text/css">
    #customBtn {
      display: inline-block;
      background: white;
      color: #403b3b;
      width: 260px;
      height: 40px;
      border-radius: 5px;
      border: 2px solid #474242;
      white-space: nowrap;
      margin-left: 10px;
      padding-left: 24dp;
    }
     #textF {
      display: inline-block;
      border-color: #5890FF;
      color: #403b3b;
      width: 260px;
      height: 40.8px;
      font-size: 11.8px;
      font-weight: bold;
      border-radius: 5px;
      border: thin solid #5890FF;
      background : #5890FF;
      white-space: nowrap;
      margin: 10px 10px 0 10px ;
      padding-left: 24dp;
      font-family: 'Roboto', sans-serif;
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
    button.iconF {
      background: url("<c:url value="/resources/login/images/f_logo_RGB-Blue_58.png"/>" ) ;
      background-size: 21px 21px;
      display: inline-block;
      vertical-align: middle;
      width: 12px;
      height: 21px;
      margin-left:8px;
      margin-top:8px;
    }
    span.buttonText {
      display: inline-block;
      vertical-align: middle;
      margin-left: 25px;
      margin-top: 10px;
      padding-left: 47px;
      padding-right: 60px;
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
				<form id="form" action="<c:url value="/fnt/LoginProcess.do"/>">
					<div class="wrap-input100 validate-input" >
						<input style="font-weight:bold;" class="input100" type="text" name="id" id="id" placeholder="???????????? ???????????????">
					</div>
		
					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input style="font-weight:bold;" class="input100" type="password" name="pwd" id="pwd" placeholder="??????????????? ???????????????">
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="button" class="login100-form-btn" onclick="fnLogin();"> Login </button>
						</div>
					</div>
					
					<!-- ????????? ????????? -->
					
					<a href="javascript:kakaoLogin();" onclick="social.kakao.login()"> 
	  				<img src="<c:url value="/resources/login/images/kakao_login_medium_wide.png"/>" style="margin:10px; height:40px;width:260px;"></a>
					
					<!-- ?????? ?????????
					
					<button type="button" class="icon" id="googleBtn">?????? ?????????</button>
					<span class="buttonText">?????? ?????????</span>
					-->
					<div id="customBtn" class="customGPlusSignIn">
					<span class="icon"></span>
      				<span class="buttonText" id="googleBtn">?????? ?????????</span>
					</div>
					
					<!-- ???????????? ????????? -->
					<span class="iconF"></span>
					<button type="button" id="textF" onclick="social.facebook.login()" style="color: white; border-width:2px; border-color:#5890FF; font-weight:bold;"><img src="<c:url value="/resources/login/images/f_logo_RGB-Blue_58.png"/>" style="width:22px; height:21px;margin: 0 60px 0 -70px; ">???????????? ?????????</button>
					
					
					<input type="hidden" name="loginType" id="loginType" value="ft">
					<input type="hidden" name="loginNm" id="loginNm">
					<input type="hidden" name="loginEmail" id="loginEmail"> 
					<input type="hidden" name="loginId" id="loginId"> 
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		// ????????? ?????? 
		function fnLogin() {	
			var id = $.trim($("#id").val());
			var pwd = $.trim($("#pwd").val());
			if(id == ""){
				swal({title: "???????????? ??????????????????",icon: "warning"});
				return;
			} else if(pwd == ""){
				swal({title: "??????????????? ??????????????????",icon: "warning"});
				return;
			} else {
				$('#form').submit();
			}
		}
		

		$(function (){
			social.kakao.init();
			social.google.init("googleBtn");
			social.facebook.init();
		});
		
		function socialGetInfo(info){
			$('#loginType').val(info.type);
			$('#loginNm').val(info.nm);
			$('#loginEmail').val(info.email);
			$('#loginId').val(info.id);
			setTimeout($('#form').submit(), 2000);
		}
	</script>
</body>
</html>
<!-- footer ?????? -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer ??? -->