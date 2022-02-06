<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/isLogin.jsp"%>
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
		<meta name="description">
		<meta name="author"/>
		<title>MyPage</title>
		<link rel="icon" type="image/x-icon" href="<c:url value="/resources/mypage/assets/img/favicon.ico"/>"/>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
		<!-- Font Awesome icons (free version)-->
		<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
		<script src = " https://unpkg.com/sweetalert/dist/sweetalert.min.js " > </script> 
		<!-- Bootstrap core JS-->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<!-- Core theme JS-->
		<script src="<c:url value="/resources/mypage/js/scripts.js"/>"/></script>
		<!-- Google fonts-->
		<link href="<c:url value="/resources/mypage/css/styles.css"/>" rel="stylesheet" />
		<link rel="stylesheet" href="/ft/resources/signup/signup.css">
		<link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
		<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
		<!-- Core theme CSS (includes Bootstrap)-->
		
	</head>
	<body id="page" style="padding: 0 0 0 0;">
		<!-- Page Content-->
			<div class="container">
			<!-- About-->
				<section class="resume-section" id="about">
					<div class="resume-section-content">
					<form id="pwdform"action="<c:url value="/fnt/MypagePro.do"/>" >
						<h2 class="mb-2" style=" padding: 0 0 0 90px;">개인정보수정</h2>
						<h3 class="mb-0" style="padding: 0 0 0 90px;">비밀번호 재확인</h3>
							<div class="subheading mb-5" style="padding: 0 0 0 100px;">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</div>
									<table class="w-pct60">
										<tr>
											<td class="pwd" >
											<input type="password" id="pwd" name="pwd" class="pwd" style="width:270px;margin: 0 400px 0 455px;background-image:url('<c:url value="/resources/mypage/images/user.png"/>')"/>		
											<br>
											<input type="button" id="sucessbtn" class="btn default" 
											style="color: black; font-size: 15px; font-weight: bold; height: 37px; width: 80px;margin: 30px 500px 0 550px;padding: 2.5px 10px 0 10px; border: 2px solid #595757;"
										value="확인" />
											</td>
											
										</tr>
								</table>

						</form>
					</div>
				</section>
			</div>
		<script>
			// 비밀번호 입력 확인
			$(function() {
			$("#sucessbtn").click(function() {
				$('#pwdform').submit();
				})
			});	
		</script>
	</body>
</html>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->