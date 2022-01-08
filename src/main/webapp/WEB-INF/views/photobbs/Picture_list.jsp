<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->

<div id="card-search" class="card-search">
	<!-- 검색버튼과 form -->
	<!-- "<c: value="/fnt/picture_list.do"/>" -->
	<form action="<c: value="/fnt/picture_list.do"/>" method="post">
		<div class="row justify-content-md center" id="search">
			<div class="col-1"></div>
			<div class="col-1">
				<div class="value" id="condition_pick" style="text-align: right;">
					<select id="condition" name="condition" class="form-select">
						<option value="title"
							${condition eq 'title' ? ''selected' : ''}>제목</option>
							<option value="content" ${condition eq 'subject' ? ''selected' : ''}>내용</option>
						<option value="name"
							${condition eq 'name' ? ''selected' : ''}>닉네임</option>
							<option value="address" ${condition eq 'address' ? ''selected' : ''}>위치</option>
					</select>
				</div>
			</div>

			<div class="col-md-8" style="padding-left: 0px; text-align: left;">
				<input value="${keyword}" type="text" name="keyword"
					placeholder="검색어를 입력하세요" class="form-control"
					style="padding-left: 0px;">

			</div>

			<div class="col-md-2" style="padding: 0px; text-align: left;">
				<span><button class="btn btn-success" type="submit">검색</button></span>
				<span id="writebox"> <c:if test="${!empty sessionScope.name}">
						<c:choose>
							<c:when test="${empty sessionScope.name}">
								<button type="button" class="btn btn--radius-2 btn--blue-2"
									onclick="javascript:alert('로그인 해주십시오')">글쓰기</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn--radius-2 btn--blue-2"
									onclick="location.href="<c:value="/fnt/picture_write.do"/>"">글쓰기</button>
							</c:otherwise>
						</c:choose>
					</c:if>
				</span>
			</div>
		</div>
	</form>
</div>

<%-- 검색 키워드가 존재한다면 몇 개의 글이 검색되었는지 알려준다. --%>
<c:if test="${not empty keyword }">
	<div class="alert texgt-center">
		<strong>${totalRow }</strong> 개의 게시물이 검색되었습니다.
	</div>
</c:if>

<!-- 카드형 게시물 섹션 -->
<section id="card-list" class="card-list">
	<div class="container">
		<div class="row card-list-container thumbnails"></div>

	</div>
</section>
<!-- 카드형 게시물 섹션 끝-->

<!-- 로딩이미지 아직 미지정-->
<div class="back-drop">
	<img src=" "/>
</div>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->