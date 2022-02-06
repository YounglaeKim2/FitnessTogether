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
		<script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script> 
		        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<c:url value="/resources/mypage/js/scripts.js"/>"/></script>
	</head>
	<body id="page-top" style="padding: 0 0 0 0;">
		<!-- 본문시작 -->
		<div id="container">
			<div class="tit_page" style="font-size: 22pt;padding: 50px 0 7px 380px;">개인정보 수정</div>
			<div id="main">
				<div class="content" style="width: 2000px; text-align: center; margin: 20px 0 5px 250px ; padding: 0 850px 0 0; ">
					<p class="w-pct60 right" style="margin: 0 auto; padding: 0 540px 0 0; font-size: 13px;"></p>
						<hr class="hr-4" style="height: 3px;margin:0 0 15px 250px">
						<form id="dataform" action="/ft/fnt/UpdateMemberPro.do" method="post">
							<table class="w-pct60">
							<tr>
								<th class="w-px160">닉네임</th>
								<td>
									<input type="text" id="name" name="name"  onkeyup="nameKeyup()" onfocus="showTextname()" value="${ loginInfo.NAME }" placeholder="닉네임을 입력해주세요" />
									<a class="btn default" id="nameckBtn"  onclick="checkname();" href="#none"  style="color: black; font-size: 15px; font-weight: bold; height: 44px; width: 100px; padding: 10px 10px 10px 10px; border: 2px solid #595757;">중복확인</a>
									<div class='valid' id="validNAME" style="display: none;">2~10자 한글,영문,숫자를 입력해주세요</div>
								</td>
							</tr>
							<tr>
								<th class="w-px161">아이디</th>
								<td>
									<input type="text"  id="id" name="id" class="chk" onkeyup="idKeyup()" onfocus="showTextid()" placeholder="6자 이상의 영문과 숫자 조합"   value="${sessionScope.id }" readonly="readonly"/> 
									<input type="hidden" id="idck" name="idck" class="chk_id" value="N">		
								</td>
							</tr>
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
							<tr>
								<th>성별</th>
								<td>
									<label><input type="radio" style="width: 50px; background: black; height: 20px; border: 1px;" id="gender1" name="gender" value="남" <c:if test="${ loginInfo.GENDER eq '남' }">checked="checked"</c:if> />남자</label>
									 <span class="ico"></span> 
									<label><input type="radio" style="width: 50px; height: 20px; border: 1px;" id="gender2" name="gender" value="여" <c:if test="${ loginInfo.GENDER eq '여' }">checked="checked"</c:if> />여자</label>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>								
									<input type="text" id="email" name="email" onkeyup="emailKeyup()"  placeholder="ex)kosmo12@kosmo.com" value="${loginInfo.EMAIL}"  readonly="readonly" /> 
									<input type="hidden" id="emailck" name="emailck" class="chk_email" required fld_essential label="이메일중복체크" value> 					
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
								<input type="text" name="birth" id="birth" pattern="[0-9]*"  size="8" maxlength="8" placeholder="YYYYMMDD" value="${loginInfo.BIRTH}" style="width:332px;" readonly="readonly" />						
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" maxlength="11" id="phone" name="phone"  placeholder="숫자만 입력해주세요" value="${loginInfo.PHONE}" style="width: 200px;" /></td>
							</tr>
							<tr>
								<th></th>
								<td>
								</td>
							</tr>
						</table>
						<hr class="hr-4" style="height: 3px;margin:0 0 20px 250px">
							<input type="button" id="sucessbtn" class="btn default"
								style="color: black; font-size: 15px; font-weight: bold; height: 44px; margin:0 88px 0 0;  width: 100px; padding: 10px 10px 10px 10px; border: 2px solid #595757;"
								value="저장하기" />
							<input type="hidden" name="joinType" value="ft">
						</form>
							<form class="deleteMember" id="deleteMember" action="<c:url value="/fnt/DeleteMemberPro.do"/>" method="post">
								<input type="hidden" name="id" value="${sessionScope.id}"/>
								<div style="text-align: right;">
									<button id="sucessbtn" class="btn default" style="color: black; font-size: 15px; font-weight: bold; height: 44px; width: 100px; margin: 30px 50px 7px 0; padding: 10px 10px 10px 10px; border: 2px solid #595757">탈퇴하기</button>
								</div>
							</form>
				</div>
			</div>
		</div>
	</body>
<script>
	function showTextname() {
		$('#validNAME').show();
	}
	function showTextid() {
		$('#validID').show();
	}
	function showTextpwd() {
		$('#validPWD').show();
	}

	function showTextpwd() {
		$('#validPWD').show();
		}
		

	const regname = /^[A-Za-z0-9가-힣]{2,10}$/;
	const regid = /^[A-za-z0-9]{5,15}$/;
	const regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	const regpwd =  /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,16}$/;      
	
	
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
	

	// 유효성 체크
	
	$(function() {
		$("#sucessbtn").click(function() {
			var name = $("#name").val();
			var id = $("#id").val();
			var phone = $("#phone ").val();
			
			if (name == "") {
				swal({title: "닉네임 입력은 필수입니다",icon: "warning"});
				$("#name").focus();
			} else if (!phone ) {
				swal({title: "전화번호 입력은 필수입니다",icon: "warning"});
				$("#phone").focus();
			} else {
				$('#dataform').submit();
			}
		})	
	});
	
</script>

</html>
<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->