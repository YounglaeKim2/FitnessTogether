<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->


<style>
.page-link {
  color: black;
  text-decoration: underline;
}
.btn {
	
}
</style>

<!-- 실제 내용 시작 -->
    <div class="container px-4 py-5" id="featured-3">
    	<h1 class="pb-2 border-bottom">Perching Service<h4>원하는 이벤트에 참여하세요!! (list)</h4></h1>
    
	</div>


<div class="container">

	
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<div class="btn btn-link">
			<a href="<c:url value="/fnt/View1.do"/> "class="btn btn-primary">지도 보기</a>
		</div>
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<div class="btn btn-link">
			<a href="<c:url value="/fnt/View2.do"/> "class="btn btn-primary">헬스장 찾기</a>
		</div>
	</div><div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<div class="btn btn-link">
			<a href="<c:url value="/fnt/xx.do"/> "class="btn btn-primary">인증버튼</a>
		</div>
	</div>
	<!-- 작성하기 버튼 

	<div class="row">
		<div class="col-md-12"></div>
	</div>
	-->
	
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
								href="<c:url value="/fnt/View.do?no=${item.no}&nowPage="/><c:out value="${param.nowPage }" default="1"/>">${item.title }</a>
								<span class="badge">${item.commentCount }</span></td>
							<td>${item.name }</td>
							<td>${item.postDate }</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<tr>
					<td>1</td>
					<td>붕어빵</td>
					<td>이아영</td>
					<td>2021.12.1</td>
				</tr>
				<tr>
					<td>2</td>
					<td>INC COFFEE</td>
					<td>김혜란</td>
					<td>2021.12.2</td>
				</tr>
				<tr>
					<td>3</td>
					<td>담배쟁이</td>
					<td>복상일</td>
					<td>2021.12.3</td>
				</tr>
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
	<!--
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link">Previous</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">Next</a>
		    </li>
		  </ul>
	</nav>
	-->
	<!-- 검색용 UI -->
	
	<div class="container">
	  <div class="row justify-content-md-center" method="post" action="<c:url value='/onememo/bbs/List.do'/>">
	    <div class="col col-lg-2">
			<select name="searchColumn" class="form-control">
				<option value="title">제목</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
			</select>
	    </div>
	    <div class="col-md-auto">
			<input type="text" name="searchWord" class="form-control" />
	    </div>
	    <div class="col col-lg-1">
			<button type="submit" class="btn btn-primary">검색</button>
	    </div>
	  </div>
	</div>	
	<!--  
	<div class="container">
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
	</div>
	-->
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<div class="btn btn-link me-md-1">
		<a href="<c:url value="/fnt/mappingWrite.do"/>"
				class="btn btn-primary">등록</a>
		</div>
		<div class="btn btn-link me-md-1">
			<a href="<c:url value="/fnt/ZZZZ.do"/>"
				class="btn btn-primary">ZZZZ</a>
		</div>
		<div class="btn btn-link me-md-1">
			<a href="<c:url value="/fnt/ViewPost.do"/>"
				class="btn btn-primary">ViewPost</a>
		</div>
	</div>
	<!--  
	<div class="row">
		<div class="col-md-12 text-right">
			<a href="<c:url value="/fnt/mappingWrite.do"/>"
				class="btn btn-primary">등록</a>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12 text-right">
			<a href="<c:url value="/fnt/ZZZZ.do"/>"
				class="btn btn-primary">ZZZZ</a>
		</div>
	</div>
	-->
</div>
<!-- 실제 내용 끝-->

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->