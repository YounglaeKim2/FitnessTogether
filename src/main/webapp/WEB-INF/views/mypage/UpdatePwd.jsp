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
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">kosmo</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value="/fnt/UpdateMember.do"/>">프로필수정</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value="/fnt/UpdatePwd.do"/>">비밀번호 변경</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="<c:url value="/fnt/DeleteMember.do"/>">회원 탈퇴</a></li>
					
					</ul>
			</div>
	</nav>
		<!-- 본문시작 -->
		<div id="container">
		<div class="tit_page" style="text-size: 18pt; padding-right:300px;">회원가입</div>
		<div id="main">
			<div class="content"
				style="width: 2000px; height: 500px; text-align: center; margin:100px 800px 0 200px; padding: 0 750px 0 0; ">
				<p class="w-pct60 right"
					style="margin: 0 auto; padding: 0 540px 0 0; font-size: 13px;"></p>
				<hr class="hr-4" style="height: 3px;">
				<form id="dataform" action="<c:url value="/fnt/UpdatePwdPro.do"/>"
					method="post">
					<table class="w-pct60">
						<tr>
							<th>신규 비밀번호</th>
							<td>
								<input type="password" id="pwd" name="pwd" class="pwdck" onfocus="showTextpwd()" placeholder="비밀번호를 입력해주세요" />
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
					<hr class="hr-4" style="height: 3px;">
					<input type="button" id="sucessbtn" class="btn default"
						style="color: black; font-size: 15px; font-weight: bold; height: 44px; width: 100px; margin: 10px 950px 7px 500px; padding: 10px 10px 10px 10px; border: 2px solid #595757;"
						value="비밀번호변경" />

				</form>
			</div>
		</div>
	</div>


<script>
//값 초기화. 회원가입 버튼 비활성화
// $("#sucessbtn").prop("disabled",true);
 
	let ckname = false;
	let ckid = false;
	let ckemail = false;
	let cksign = false;
	
	const regname = /^[A-Za-z0-9가-힣]{2,10}$/;
	const regid = /^[A-za-z0-9]{5,15}$/;
	const regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	const regpwd =  /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,16}$/;      
	
	function showTextname() {
		$('#validNAME').show();
	}
	function showTextid() {
		$('#validID').show();
	}
	function showTextpwd() {
		$('#validPWD').show();
	}
	
	function nameKeyup(type) {
		if(type == 'name'){
			ckname = false;
		} else if(type == 'id'){
			ckid = false;
		} else {
			ckemail = false;
		}	
	}
	
	// 닉네임 중복체크
	function checkname() {
		
		var name = $.trim($("#name").val());
		if(name == ""){
			swal({title: "닉네임을 입력해주세요",icon: "warning"});
			return;
		}else if(! regname.test(name)){
			swal({title: "2~10자 한글,영문,숫자만 입력해주세요",icon: "warning"});
			return;
		} else {
			$.ajax({
				url:'/ft/fnt/nameck.do',
				data:{"name":name},
				dataType:"json",
				type:"post"
			}).done(function(data){
				console.log(data)
				
				if(data == '0'){
					swal({title: "사용가능합니다",icon: "success"})
					ckname = true;
				} else {
					swal({title: "이미 등록된 닉네임입니다",icon: "error"})
					ckname = false;
				}
				
			});
		}
	}
	
	// 아이디 중복체크
	function checkid() {
		
		var id = $.trim($("#id").val());
		if(id == ""){
			swal({title: "아이디를 입력해주세요",icon: "warning"});
			return;
		}else if(! regid.test(id)){
			swal({title: "5~15자 이상의 영문 소문자,숫자만 입력해주세요 ",icon: "warning"});
			return;
		} else {
			$.ajax({
				url:'/ft/fnt/idck.do',
				data:{"id":id},
				dataType:"json",
				type:"post"
			}).done(function(data){
				console.log(data)
				
				if(data == '0'){
					swal({title: "사용가능합니다",icon: "success"})
					ckid = true;
				} else {
					swal({title: "이미 등록된 아이디입니다",icon: "error"})
					ckid = false;
				}
				
			});
		}
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
	
	

	// 이메일 중복체크
	function checkemail() {
		
		var email = $.trim($("#email").val());
		if(email == ""){
			swal({title: "이메일을 입력해주세요",icon: "warning"});
			return;
		}else if(! regemail.test(email)){
			swal({title: "이메일을 다시 확인해주세요 ",icon: "warning"});
			return;
		} else {
			$.ajax({
				url:'/ft/fnt/emailck.do',
				data:{"email":email},
				dataType:"json",
				type:"post"
			}).done(function(data){
				console.log(data)
				
				if(data == '0'){
					swal({title: "사용가능합니다",icon: "success"})
					ckid = true;
				} else {
					swal({title: "이미 등록된 이메일입니다",icon: "error"})
					ckid = false;
				}
				
			});
		}
	}
	
	
	

	// 유효성 체크
	
	$(function() {
		$("#sucessbtn").click(function() {
			var name = $("#name").val();
			var id = $("#id").val();
			var pwd = $("#pwd").val();
			var pwdck = $("#pwdck").val();
			var email = $("#email").val();
			var birth_year = $("#birth_year").val();
			var birth_month = $("#birth_month").val();
			var birth_day = $("#birth_day").val();
			var phone = $("#phone ").val();
			var idck = $('#idck').val();
			
			if (name == "") {
				swal({title: "닉네임 입력은 필수입니다",icon: "warning"});
				$("#name").focus();
			} else if (!id) {
				swal({title: "아이디 입력은 필수입니다",icon: "warning"});
				$("#id").focus();
			} else if (!pwd) {
				swal({title: "비밀번호 입력은 필수입니다",icon: "warning"});
				$("#pwd").focus();
			} else if (!pwdck) {
				swal({title: "비밀번호 확인 입력은 필수입니다",icon: "warning"});
				$("#pwdck").focus();
			} else if (!email) {
				swal({title: "이메일 입력은 필수입니다",icon: "warning"});
				$("#email").focus();
			} else if (!birth_year) {
				swal({title: "생년월일 입력은 필수입니다",icon: "warning"});
				$("#birth_year").focus();
			} else if (!birth_month) {
				swal({title: "생년월일 입력은 필수입니다",icon: "warning"});
				$("#birth_month").focus();
			} else if (!birth_day) {
				swal({title: "생년월일 입력은 필수입니다",icon: "warning"});
				$("#birth_day").focus();
			} else if (!phone ) {
				swal({title: "전화번호 입력은 필수입니다",icon: "warning"});
				$("#phone").focus();
			} else {
				/*
				$.ajax({
					url:'/ft/fnt/signck.do',
					data:
					dataType:"json",
					type:"post"
				}).done(function(data){
					console.log(data)
					
					if(data == '0'){
						swal({title: "성공입니다",icon: "success"})
						cksign = true;
					} else {
						swal({title: "실패입니다",icon: "error"})
						cksign = false;
					}
				});
				*/
				
				/*
					swal({
						title: "회원가입이 완료되었습니다",
						icon: "success",
						buttons: "확인"
					}).then((value) =>{
						if(value){
							location.href = "/ft/fnt/signck.do";
								
						}
					});
				*/
				
				//swal({title: "회원가입이 완료되었습니다",icon: "success"});
				$('#dataform').submit();
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