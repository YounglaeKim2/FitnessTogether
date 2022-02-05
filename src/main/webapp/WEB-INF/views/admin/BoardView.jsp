<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판 관리</title>
<link href="<c:url value="/resources/vendors/bootstrap/dist/css/bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/vendors/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/vendors/nprogress/nprogress.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/vendors/iCheck/skins/flat/green.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/build/css/custom.min.css"/>" rel="stylesheet" />
<script src="<c:url value="/resources/vendors/jquery/dist/jquery.min.js"/>" /></script>
<script src="<c:url value="/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"/>" /></script>
<script src="<c:url value="/resources/vendors/fastclick/lib/fastclick.js"/>" /></script>
<script src="<c:url value="/resources/vendors/nprogress/nprogress.js"/>" /></script>
<script src="<c:url value="/resources/vendors/iCheck/icheck.min.js"/>" /></script>
<script src="<c:url value="/resources/build/js/custom.min.js"/>" /></script>
<script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js "></script>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="" class="site_title"><i class="fa fa-paw"></i> 
						<span>Fitness Together</span></a>
					</div>
					<div class="clearfix"></div>
					<div class="profile clearfix">
						<div class="profile_pic">
							<img
								src="<c:url value="/resources/build/images/premium-icon-admin-3093042.png" />"
								alt="..." class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2>admin</h2>
						</div>
					</div>
					<br />
					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<ul class="nav side-menu">
								<li class="nav-item"><a class="nav-link"
									href="<c:url value="/fnt/MemberAdmin.do"/>"><i
										class="fa fa-desktop"></i> 회원관리</a></li>
								<li class="nav-item"><a class="nav-link"
									href="<c:url value="/fnt/Board.do"/>"><i class="fa fa-edit"></i>게시판관리</a></li>
							</ul>
						</div>
					</div>
					<div class="sidebar-footer hidden-small">
						<a style="width: 230px;" data-toggle="tooltip"
							data-placement="top" title="Logout"
							href="<c:url value="/fnt/Logout.do"/>"> <span
							class="glyphicon glyphicon-off" aria-hidden="true"></span>
						</a>
					</div>
				</div>
			</div>

			<div class="top_nav">
				<div class="nav_menu">				
					<nav class="nav navbar-nav"></nav>
				</div>
			</div>

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="row">
						<div class="col-md-offset-2 col-md-12">
							<form id="viewForm" action="" method="POST">
								<table class="table table-bordered table-striped">
									<tbody>
										<tr>
											<th class="text-center">번호</th>
											<td>${record.no}</td>
										</tr>
										<tr>
											<th class="text-center">제목</th>
											<td>${record.title}</td>
										</tr>
										<tr>
											<th class="text-center">작성자</th>
											<td>${record.name}</td>
										</tr>
										<tr>
											<th class="text-center">등록일</th>
											<td>${record.postDate}</td>
										</tr>
										<tr>
											<th class="text-center" colspan="2">내용</th>
										</tr>
										<tr>
											<td colspan="2">${record.content}</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>		
			
			<!-- footer content -->
			<footer>
				<div class="pull-right">
					<form action="/ft/fnt/Board.do" method="post">
						<button  class="btn default" id="btn3" 
							style="color: black; background-color: #f5f2f2; 
							font-size: 12px; font-weight: bold; height: 30px; 
							width: 60px; border: 2px solid #595757">목록
						</button>
					</form>
					<br>
					Fitness Together
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>
</body>
<script>
	function save() {
		값체크 
		
		$('viewForm').submit();
	}
</script>
</html>
