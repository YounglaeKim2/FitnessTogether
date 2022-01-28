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
		<script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script> 
		<!-- Google fonts-->
		<link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
		<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
		<!-- Core theme CSS (includes Bootstrap)-->
		<link href="<c:url value="/resources/mypage/css/styles.css"/>" rel="stylesheet" />
		<link rel="stylesheet" href="/ft/resources/signup/signup.css">
		
	</head>
	<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
	<a class="navbar-brand js-scroll-trigger" href="#page-top">
		<span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="<c:url value="/resources/mypage/assets/img/user.png"/>" alt="..." /></span>
	</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
		
					<ul class="navbar-nav">
						<li class="nav-item">${sessionScope.id}</li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value="/fnt/UpdateMember.do"/>">프로필수정</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value="/fnt/UpdatePwd.do"/>">비밀번호 변경</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value="/fnt/DeleteMember1.do"/>">회원 탈퇴</a></li>
					
					</ul>
			</div>
	</nav>
		<!-- 본문시작 -->
		<div id="container">
			<form id="update_Pwd" action="<c:url value="/fnt/UpdatePwdPro.do"/>"method="post">
		<div id="main">
			<div class="content"
				style="width: 2000px; height: 500px; text-align: center; margin:100px 400px 0 0; padding: 40px 750px 0 0; ">
				<p class="w-pct60 right"
					style="margin: 0 auto; padding: 0 540px 0 0; font-size: 13px;"></p>
				<!-- <hr class="hr-4" style="height: 3px; width:580px; "> -->
				<div class="update" style="margin: 0 500px 25px 0; font-size: 30px; font-weight:bold; color:black;"> 비밀번호 변경 </div>
				
					<table class="w-pct60">
						<tr>
							<th>신규 비밀번호</th>
							<td>
								<input type="password" id="pwd" name="pwd" class="pwd" onfocus="showTextpwd()" placeholder="비밀번호를 입력해주세요" />
								<span id="alert-success" style="display: none; margin: 15px  0 15px 0; color:green; font-weight: bold;">비밀번호가 일치합니다.</span>
								<span id="alert-danger" style="display: none; margin: 15px  0 15px 0; color: red; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
								<div class='valid' id="validPWD" style="display: none;"> 8~16자 영문 대 소문자, 숫자, 특수문자를 입력해주세요</div>
							</td>
						</tr>
						 
						<tr>
							<th>신규 비밀번호 확인</th>
							<td><input type="password" maxlength="16"  id="pwdck" name="pwdck"class="pwdck" placeholder="비밀번호를 한번 더 입력해주세요" />								
						</tr>
					</table>
					<!-- <hr class="hr-4" style="height: 3px;"> -->
					<input type="button" id="sucessbtn" class="btn default"
						style="color: black; font-size: 15px; font-weight: bold; height: 44px; width: 100px; margin: 10px 950px 7px 500px; padding: 10px 10px 10px 10px; border: 2px solid #595757;"
						value="변경하기" />

			
			</div>
		</div>
		</form>
	</div>


<script>

function showTextpwd() {
	$('#validPWD').show();
	}
	
	// 비밀번호 확인
	$('.pwdck').focusout(function () {
		var pwd = $("#pwd").val();
		var pwdck = $("#pwdck").val();
		
		if ( pwd != '' && pwdck == '' ) {
			null;
		} else if ( pwd != "" || pwdck != "") {
			if (pwd == pwdck) {
				$("#alert-success").css('display', 'inline-block');
				$("#alert-danger").css('display', 'none');
			} else {
				$("#alert-success").css('display', 'none');
				$("#alert-danger").css('display', 'inline-block');
			}
		}
	});
	


	// 유효성 체크
	$(function() {
		$("#sucessbtn").click(function() {		
			var pwd = $("#pwd").val();
			var pwdck = $("#pwdck").val();	
			if (pwd == "") {
				swal({title: "비밀번호 입력은 필수입니다",icon: "warning"});
				$("#pwd").focus();
			} else if (!pwdck) {
				swal({title: "비밀번호 확인 입력은 필수입니다",icon: "warning"});
				$("#pwdck").focus();
			} else {
				$('#update_Pwd').submit();
				}			
			})	
		});
</script>		

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<c:url value="/resources/mypage/js/scripts.js"/>"/></script>
    </body>
</html>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->