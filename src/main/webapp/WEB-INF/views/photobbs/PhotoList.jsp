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
			<a href="/ft/fnt/picture_detail.do/${b.bno}"> <c:if
					test="${empty b.imgName}">
					<img src="/ft/resources/images/mapping/FT1.jpg">
				</c:if> <c:if test="${not empty b.imgName}">
					<img
						src="<c:url value='/resources/images/upload/picture/${b.imgName}'/>">
				</c:if>
			</a>
		</div>

		<div class="card-content-wrap">
			<span> ${ b.subject } </span> <%-- <span> <img alt="하트아이콘이미지"
				src="<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart-fill.png"/>"
				class="bi bi-suit-heart-fill" width="16" height="16">
			</span> <span id="heart${b.bno}">${b.heart}</span> --%>
			<%--댓글 아이콘 --%>
			<%-- <span> <img alt="댓글아이콘이미지"
				src="<c:url value="/resources/images/photobbs/icons/bi bi-chat-dots.png"/>"
				class="bi bi-chat-dots" width="16" height="16">
			</span> <span id="reply${b.bno}">${b.reply}</span> --%>

			<%--눈알 아이콘 --%>
			<%-- <span> <img alt="조회수아이콘이미지"
				src="<c:url value="/resources/images/photobbs/icons/bi bi-eye.png"/>"
				class="bi bi-eye" width="16" height="16">
			</span> <span id="hit${b.bno}">${b.hit}</span> --%>
		</div>
	</div>
</c:forEach>
