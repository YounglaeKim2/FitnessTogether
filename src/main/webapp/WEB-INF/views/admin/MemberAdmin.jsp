<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 관리</title>
<!-- Bootstrap -->
<link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link href="<c:url value="/resources/vendors/bootstrap/dist/css/bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/vendors/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/vendors/nprogress/nprogress.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/vendors/iCheck/skins/flat/green.css"/>" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="<c:url value="/resources/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/build/css/custom.min.css"/>" rel="stylesheet" />
<script
	src="<c:url value="/resources/vendors/jquery/dist/jquery.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/fastclick/lib/fastclick.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/nprogress/nprogress.js"/> " /></script>
<script src="<c:url value="/resources/vendors/iCheck/icheck.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/datatables.net/js/jquery.dataTables.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/datatables.net-buttons/js/buttons.flash.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/datatables.net-buttons/js/buttons.html5.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/datatables.net-buttons/js/buttons.print.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/jszip/dist/jszip.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/pdfmake/build/pdfmake.min.js"/> " /></script>
<script
	src="<c:url value="/resources/vendors/pdfmake/build/vfs_fonts.js"/> " /></script>
<script src="<c:url value="/resources/build/js/custom.min.js"/> " /></script>
<script src=" https://unpkg.com/sweetalert/dist/sweetalert.min.js "> </script>
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
									href="<c:url value="/fnt/Board.do"/>"><i class="fa fa-edit"></i>
										게시판관리</a></li>		
							</ul>
						</div>
					</div>
					<!-- /sidebar menu -->
					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small">
						<a style="width: 230px;" data-toggle="tooltip"
							data-placement="top" title="Logout"
							href="<c:url value="/fnt/Logout.do"/>"> <span
							class="glyphicon glyphicon-off" aria-hidden="true"></span>
						</a>
					</div>
					<!-- /menu footer buttons -->
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
					<div class="page-title">
						<div class="title_left"></div>
						<div class="clearfix"></div>
						<div class="row">
							<div class="col-md-12 col-sm-12 ">
								<div class="x_panel">
									<div class="x_title">
										<h2>회원 관리</h2>
										<ul class="nav navbar-right panel_toolbox">
											<li><a class="collapse-link"><i
													class="fa fa-chevron-up"></i></a></li>
											<li><a class="close-link"><i class="fa fa-close"></i></a>
											</li>
										</ul>
										<div class="clearfix"></div>

									</div>
									<div class="x_content">
										<div class="row">
											<div class="col-sm-12">
												<div class="card-box table-responsive">
													<table id="datatable"
														class="table table-striped table-bordered"
														style="width: 100%">
														<thead>
															<tr style="text-align:center;">
																<th>아이디</th>
																<th>닉네임</th>
																<th>성별</th>
																<th>생년월일</th>
																<th>전화번호</th>
																<th>이메일</th>
																<th>상태</th>
															</tr>
														</thead>
														<tbody>
															<c:if test="${empty list}">
																<tr>
																	<td colspan="5">일치하는 데이터가 없습니다.</td>
																</tr>
															</c:if>
															<c:forEach var="m" items="${list}">
																<tr style="text-align:center;">
																	<td >${m.id}</td>
																	<td >${m.name}</td>
																	<td >${m.gender}</td>
																	<td>${m.birth}</td>
																	<td >${m.phone}</td>
																	<td>${m.email}</td>
															<td>
																	<form action="/ft/fnt/deleteMemberAdmin.do" style="text-align:center">
																		<input type="hidden" name="id" value="${m.id}"/>
																		<button class="btn default" 																	
																			style="color: black; background-color: #f5f2f2; 
																			font-size: 12px; font-weight: bold; height: 30px; 
																			width: 60px; 
																			padding: 5px 0px 0px 0px; border: 2px solid #595757">탈퇴
																		</button>
																	</form>
																	</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
			<!-- footer content -->
			<footer>
				<div class="pull-right">
					Fitness Together
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
			</div>
		</div>
</body>

<script>
/*
	function fnQuit(id) {
		var result = swal("강제탈퇴하시겠습니까?");
		if (result) {
			$.ajax({
				url : '/ft/fnt/deleteMemberAdmin.do',
				data : {
					"id" : id
				},
				dataType : "json",
				type : "post",
			}).done(function(data) {
				if (data != null) {
					swal("강제탈퇴가 완료되었습니다");
					window.location.reload();
				} else {
					swal(data.msg);
				}
			})
			
			
		}
	}
	*/
</script>
</html>