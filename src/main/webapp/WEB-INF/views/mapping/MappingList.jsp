<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->


<style>
body {
	padding-top: 100px
}
</style>
<!-- 실제 내용 시작 -->
<div class="container">

	<div class="page-header">
		<h2>
			Mapping<small>List</small>
		</h2>
	</div>
	<!-- 작성하기 버튼 -->

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
					<c:forEach var="item" items="${listPagingData.lists}"
						varStatus="loop">
						<tr>
							<td>${listPagingData.totalRecordCount - (((listPagingData.nowPage - 1) * listPagingData.pageSize) + loop.index)}</td>

							<td class="text-left"><a
								href="<c:url value="/onememo/bbs/View.do?no=${item.no}&nowPage="/><c:out value="${param.nowPage }" default="1"/>">${item.title }</a>
								<span class="badge">${item.commentCount }</span></td>
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
	<div class="row">
		<div class="text-center">
			<form class="form-inline" method="post" action="<c:url value='/onememo/bbs/List.do'/>">
				<div class="form-group">
					<select name="searchColumn" class="form-control">
						<option value="title">제목</option>
						<option value="name">작성자</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" name="searchWord" class="form-control" />
				</div>
				<button type="submit" class="btn btn-primary">검색</button>
			</form>
		</div>
	</div>
		<div class="row">
		<div class="col-md-12 text-right">
			<a href="<c:url value="/fnt/mappingWrite.do"/>"
				class="btn btn-success">등록</a>
		</div>
	</div>
</div>
<!-- 실제 내용 끝-->


<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->