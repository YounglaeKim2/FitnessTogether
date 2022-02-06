<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
@SessionAttributes("id")와 컨틀로러 메소드의 인자로 @ModelAttribute("id") String id 사용시
아래 로그인 여부 체크를 위한 인클루드 불필요
 -->
<%-- 
<%@ include file="/WEB-INF/views/common/IsLogin.jsp"%>
--%>
<!-- 상단메뉴 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 상단메뉴 끝 -->



<!-- 실제 내용 시작 -->
<div class="container">
	<div class="container px-4 py-5" id="featured-3">
		<h1 class="pb-2 border-bottom">종합 게시판<h4>종합 게시판 입니다.</h4></h1>
	</div>
	<!-- 
	<figure class="text-center" style="padding-top: 100px;">
		<blockquote class="blockquote">
			<h1>Q & A</h1>
		</blockquote>
		<figcaption class="blockquote-footer">게 시 판</figcaption>
	</figure>
	 -->
	<!-- 작성하기 버튼 -->
	<div class="row">
		<div class="col-md-12 text-end">
			<a href="<c:url value="/onememo/bbs/Write.do"/>"
				class="btn btn-primary">등록</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12"></div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table
				class="table table-bordered table-hover table-condensed text-center">
				<!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->
				<tr>
					<th class="col-md-1 text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="col-md-1 text-center">작성자</th>
					<th class="col-md-2 text-center">작성일</th>
				</tr>
				<c:if test="${empty listPagingData.lists }" var="isEmpty">
					<tr>
						<td colspan="4">등록된 게시물이 없어요</td>
					</tr>
				</c:if>
				<c:if test="${not isEmpty }">
					<c:forEach var="item" items="${listPagingData.lists}" varStatus="loop">
						<tr>
							<td>${listPagingData.totalRecordCount - (((listPagingData.nowPage - 1) * listPagingData.pageSize) + loop.index)}</td>			
							
							<td class="text-secondary"><a href="<c:url value="/onememo/bbs/View.do?no=${item.no}&nowPage="/><c:out value="${param.nowPage }" default="1"/>">${item.title }</a> <span
								class="badge bg-secondary rounded-pill">${item.commentCount }</span></td>
							<td>${item.name }</td>
							<td>${item.postDate }</td>
						</tr>
					</c:forEach>
				</c:if>

			</table>
		</div>
		<!-- column -->
	</div>
	<!-- row -->
	<!-- 페이징 -->
	<c:if test="${listPagingData.lists.size() !=0 }">
		<div class="row">
			<div class="col-md-12 text-center">${listPagingData.pagingString}</div>
		</div>
	</c:if>
	<!-- 검색용 UI -->
	<div class="row justify-content-end">
		<div class="text-end">
			<form class="form-inline text-end" method="post"
				action="<c:url value='/onememo/bbs/List.do'/>">
				<button type="submit" class="btn btn-primary" style="float: right;">검색</button>
				<div class="form-group col-md-2" style="float: right;">
					<input type="text" name="searchWord" class="form-control" />
				</div>
				<div class="form-group col-md-2" style="float: right;">
					<select name="searchColumn" class="form-control">
						<option value="title">제목</option>
						<option value="name">작성자</option>
						<option value="content">내용</option>
					</select>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 실제 내용 끝-->
<!-- 푸터 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- 푸터 끝 -->



