<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 카드형 게시물 섹션 -->
<c:if test="${empty list}">
	<span>일치하는 데이터가 없습니다.</span>
</c:if>
<c:forEach var="b" items="${list}">
	<div class="card-item-wrap">
		<div class="card-img-wrap">
			<a href="/ft/fnt/picture_detail.do/${b.bno}">
				<c:if test="${empty b.imgName}">
					<img src="/ft/resources/images/mapping/FT1.jpg">
				</c:if>

				<c:if test="${not empty b.imgName}">
					<img src="<%=request.getRealPath("/") %>/${b.imgName}">
				</c:if>
			</a>
		</div>

		<div class="card-content-wrap">
			<span> ${ b.id } </span>
			<span> heart </span>
			<span> comment </span>
			<span> view </span>
		</div>
	</div>
</c:forEach>
