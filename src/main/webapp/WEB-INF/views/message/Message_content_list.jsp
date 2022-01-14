<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 상의 후 수정이 들어갈 페이지 -->

<c:forEach var="tmp" items="${clist}">

	<c:choose>
		<c:when test="${sessionScope.id ne tmp.send_id }">
			<!-- 받은메시지 -->
			<div class="incoming_msg">
				<div class="incoming_msg_img">
					<a href="other_profile.do?other_id={tmp.send_id}"> <!-- <img src="<c:url value="/resources/images/upload/profile/${tmp.profile}"/>" alt="보낸사람프사">  -->
						<img
						src="<c:url value="/resources/images/upload/profile/tempprofile2.jpg"/>"
						alt="보낸사람프사"> <!-- 주석처리한것이 불러올 프사이미지이고 아래는 임시로 저장해놓은것입니다. -->
					</a>
				</div>
				<div class="received_msg">
					<div class="received_withd_msg">
						<p>${tmp.content }</p>
						<span class="time_date">${tmp.send_time }</span>
					</div>
				</div>
			</div>
		</c:when>
		
		<c:otherwise>
		<!-- 보낸 메시지 -->
		<div class="outgoing_msg">
			<div class="semt_msg">
				<p>${tmp.content }</p>
				<span class="time_date">${tmp.send_time }</span>
			</div>
			
		</div>
		</c:otherwise>
	</c:choose>

</c:forEach>