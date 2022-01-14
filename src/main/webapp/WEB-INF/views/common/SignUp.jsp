<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="<c:url value="/resources/signup/signup_check.js"/>">
	
</script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
<!-- cdnjs.com에서 가져온 fontawesome cdn 라이브러리 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/ft/resources/signup/signup.css">
<script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script> 
<title>join JSP</title>

</head>
<body>
	<div id="container">
		<div class="tit_page" style="text-size: 18pt; padding-right:300px;">회원가입</div>
		<div id="main">
			<div class="content"
				style="width: 2000px; text-align: center; margin:0 800px 0 200px; padding: 0 750px 0 0; ">
				<p class="w-pct60 right"
					style="margin: 0 auto; padding: 0 540px 0 0; font-size: 13px;"></p>
				<hr class="hr-4" style="height: 3px;">
				<form id="dataform" action="<c:url value="/fnt/signck.do"/>"
					method="post">
					<table class="w-pct60">
						<tr>
							<th class="w-px160">닉네임</th>
							<td>
								<input type="text"   id="name" name="name" onkeyup="nameKeyup()" onfocus="showTextname()" placeholder="닉네임을 입력해주세요" />
								<a class="btn default" onclick="checkname();" href="#none" 
								style="color: black; font-size: 15px; font-weight: bold; height: 44px; width: 100px; margin: 3.7px 8px 7px 1px; padding: 10px 10px 10px 10px; border: 2px solid #595757;">중복확인</a>
							<div class='valid' id="validNAME" style="display: none;">2~10자 한글,영문,숫자를 입력해주세요</div>
							</td>
						</tr>
						<tr>
							<th class="w-px161">아이디</th>
							<td>
								<input type="text"  id="id" name="id" class="chk" onkeyup="idKeyup()" onfocus="showTextid()" placeholder="6자 이상의 영문과 숫자 조합" /> 
								<input type="hidden" id="idck" name="idck" class="chk_id" value="N">
								<a class="btn default" onclick="checkid();" href="#none" 
								style="color: black; font-size: 15px; font-weight: bold; height: 44px; width: 100px; margin: 3.7px 8px 7px 1px; padding: 10px 10px 10px 10px; border: 2px solid #595757;">중복확인</a>
								<br>
								<div class='valid' id="validID" style="display: none;"> 5~15자 영문 소문자, 숫자를 입력하세요</div>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" id="pwd" name="pwd" class="pwdck" onfocus="showTextpwd()" placeholder="비밀번호를 입력해주세요" />
								<span id="alert-success" style="display: none; margin: 15px  0 15px 0; color:green; font-weight: bold;">비밀번호가 일치합니다.</span>
								<span id="alert-danger" style="display: none; margin: 15px  0 15px 0; color: red; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
								<div class='valid' id="validPWD" style="display: none;"> 8~16자 영문 대 소문자, 숫자, 특수문자를 입력해주세요</div>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" maxlength="16"  id="pwdck" name="pwdck"class="pwdck" placeholder="비밀번호를 한번 더 입력해주세요" />								
						</tr>
						<tr>
							<th>성별</th>
							<td>
								<label><input type="radio" style="width: 50px; background: black; height: 20px; border: 1px;" id="gender1" name="gender" value="남"  />남자</label>
								 <span class="ico"></span> 
								<label><input type="radio" style="width: 50px; height: 20px; border: 1px;" id="gender2" name="gender" value="여" />여자</label></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" id="email" name="email" onkeyup="emailKeyup()"  placeholder="ex)kosmo12@kosmo.com" /> 
								<input type="hidden" id="emailck" name="emailck" class="chk_email" required fld_essential label="이메일중복체크" value> 
								<a class="btn default" href="#none" onclick="checkemail();" style="color: black; font-size: 15px; font-weight: bold; height: 44px; width: 100px; margin: 3.7px 8px 7px 1px; padding: 10px 10px 10px 10px; border: 2px solid #595757;">중복확인</a>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>
							<input type="text" name="birth" id="birth_year" pattern="[0-9]*"  size="4" maxlength="4" placeholder="YYYY" style="width:100px;">						
							<input type="text" name="birth" id="birth_month" pattern="[0-9]*" size="2" maxlength="2" placeholder="MM" style="width:100px;">		
							<input type="text" name="birth" id="birth_day" pattern="[0-9]*" size="2" maxlength="2" placeholder="DD" style="width:100px;">
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" maxlength="11" id="phone" name="phone" placeholder="숫자만 입력해주세요" style="width: 200px;" /></td>
						</tr>
						<tr>
							<th></th>
							<td>
								<!-- 
                   <a class='btn-fill-s' onclick="daum_post()">우편번호 찾기</a> 
                   <br>
                   <input type="text" name="post" class="w-px60" readonly /> 
                   <br>
                   <input type="text" name="addr" class="w-px60" readonly/>
                   <br>
                   <input type="text" name="addr" class="w-px60" />
                   <br>
                   <br>
                    -->


							</td>
						</tr>

					</table>
					<hr class="hr-4" style="height: 3px;">
					<input type="button" id="sucessbtn" class="btn default"
						style="color: black; font-size: 15px; font-weight: bold; height: 44px; width: 100px; margin: 10px 950px 7px 500px; padding: 10px 10px 10px 10px; border: 2px solid #595757;"
						value="가입하기" />

				</form>
			</div>
		</div>
	</div>
</body>


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
					data:{"id":id, "pwd":pwd, "name":name, "gender":gender, "birth":birth, "phone":phone, "email":email}
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
</html>



<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->