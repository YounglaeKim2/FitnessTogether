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
						<div class="col-md-12 col-sm-12  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>게시판 관리</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="table-responsive">
										
										<table class="table table-striped jambo_table bulk_action">
											<thead>
												<tr class="headings">
													<th class="column-title">번호</th>
													<th class="column-title">제목</th>
													<th class="column-title">닉네임</th>
													<th class="column-title">아이디</th>
													<th class="column-title">작성일</th>
													<th class="column-title no-link last"> <span class="nobr">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정보</span></th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty list}">
													<tr>
														<td colspan="16">일치하는 데이터가 없습니다.</td>
													</tr>
												</c:if>
												<c:forEach var="m" items="${list}">
													<tr>
														<td> ${ m.no }</td>
														<td> ${ m.title }</td>
														<td> ${ m.name }</td>
														<td> ${ m.id }</td>
														<td> ${ m.postDate }</td>
														<td> 
														<button class="btn btn-secondary" id="btn1"
															 style="font-size:12px;"
															 onclick="fnView(${m.no})">상세보기</button>
														<button class="btn default" id="btn1"
															 onclick="fnView(${m.no})"
															 style="color: black; background-color: #f5f2f2; 
															font-size: 12px; font-weight: bold; height: 30px; 
															width: 60px; margin: 0px 30px 0px 0px; 
															padding: 5px 0px 0px 0px; border: 2px solid #595757"
															 >상세보기</button>
														<button class="btn btn-secondary" id="btn1"
															 style="font-size:12px;background-color:#36526e"
															 onclick="fnView(${m.no})">상세보기</button>
														<form action="/ft/fnt/DeleteBoard.do" method="post">
															<button  class="btn btn-secondary" id="btn2" 
															 style="font-size:12px;"
															>삭제</button>
															<input type="hidden" name="no" value="${m.no}"/>
														</form>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<form id="pwdform"action="<c:url value="/fnt/viewBoard.do"/>" >
											<input type="hidden" name="no" value="">
											<input type="hidden" name="no" value="${m.no}"/>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- /page content -->
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
	function fnView(no) {
		$('[name=no]').val(no);
		$('#pwdform').submit();
	}
	/*
	function fnDelete(no) {
		var result = swal("삭제하시겠습니까?");
		if (result) {
			$.ajax({
				url : '/ft/fnt/DeleteBoard.do',
				data : { "no" : no },
				dataType : "json",
				type : "post",
			}).done(function(result) {
				if (result) {
					swal("삭제되었습니다");
					window.location.reload();
				} else {
					swal("삭제할 수 없습니다");
				}
			})
		}
	}
	*/
	
	//게시물 삭제
	/* $(function() {
		$(".deletebtn").click(function() {
			$this
			
		})
	}); */
</script>
</html>
