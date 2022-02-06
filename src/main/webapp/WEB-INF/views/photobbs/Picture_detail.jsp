<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->

<form action="" method="get" name="frm">

	<c:if test="${not empty sessionScope.id }">
		<input type="hidden" name="id" value="${sessionScope.id}">
	</c:if>

	<input type="hidden" name="bno" value="${item.bno}">
	<div class="board-wrap">
		<div class="board-title-wrap">
			<br>
			<h1>${item.subject}</h1>
		</div>

		<div class="board-content-wrap">
			<div class="board-image-wrap">
				<c:if test="${empty item.imgName}">
					<img src="/ft/resources/images/mapping/FT1.jpg">
				</c:if>

				<c:if test="${not empty item.imgName}">
					<img
						src="<c:url value='/resources/images/upload/picture/${item.imgName}'/>">
				</c:if>
			</div>
			
			<div class="board-desc-wrap">${item.content}</div>
			
			<%-- <div id="m_heart_reply_hit">
				<span id="m_heart_icon"> <c:choose>
						로그인 상태일때 - 하트 클릭되게끔
						<c:when test="${not empty sessionScope.id }">
							<c:choose>
								<c:when test="${empty item.hno}">
									빈 하트일때
									<a idx="${item.bno}" href="javascript:"
										class="heart-click${item.bno}"> <img alt="빈하트"
										src="<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart.png"/>"
										class="bi bi-suit-heart" width="32" height="32" />
									</a>
								</c:when>
								<c:otherwise>
									꽉찬 하트일때
									<a idx="${item.bno}" href="javascript:"
										class="heart-click${item.bno}"> <img alt="꽉찬 하트"
										src="<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart-fill.png"/>"
										width="32" height="32" class="bi bi-suit-heart-fill" />
									</a>
								</c:otherwise>
							</c:choose>
						</c:when>
						로그인 상태가 아닐때 - 하트클릭 안되게
						<c:otherwise>
							<a href="javascript:" class="heart-notlogin"> <img alt="빈하트"
								src="<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart.png"/>"
								class="bi bi-suit-heart" width="32" height="32" />
							</a>
						</c:otherwise>
					</c:choose>
				</span> <span id="m_heart${item.bno}"></span>
			</div> --%>
		</div>
	</div>
	
	<!-- <div id="comments" class="col-md-12">
					
	</div> -->
	
	<!-- <div class="board-comment-wrap">
		<div class="board-comment-image-wrap">
			<img src="/ft/resources/images/photobbs/blank.png">
		</div>

		<div class="board-comment-input-wrap">
			<input type="text">
		</div>

		<div class="board-comment-button-wrap">
			<button class="btn btn-info" type="submit" name="btn_comment_write">댓글
				달기</button>
		</div>
	</div> -->
	<div class="board-button-wrap">
		<button class="btn btn-info" type="submit" name="btn_list">목록</button>
		<button class="btn btn-success" type="submit" name="btn_modify">수정</button>
		<button class="btn btn-danger" type="submit" name="btn_delete">삭제</button>
	</div>
</form>

<script>
	jQuery(document).ready(
			function($) {
				$("[name=btn_list]").click(
						function() {
							$("[name=frm]").attr('action',
									'/ft/fnt/picture_listshift.do/');
							$("[name=frm]").attr('method', 'get');
							$("[name=frm]").submit();
						});

				$("[name=btn_modify]").click(
						function() {
							$("[name=frm]").attr(
									'action',
									'/ft/fnt/picture_modify.do/'
											+ $("[name=bno]").val());
							$("[name=frm]").attr('method', 'get');
							$("[name=frm]").submit();
						});

				$("[name=btn_delete]").click(
						function() {
							$("[name=frm]").attr(
									'action',
									'/ft/fnt/picture_delete.do/'
											+ $("[name=bno]").val());
							$("[name=frm]").attr('method', 'post');
							$("[name=frm]").submit();
						});
			});
</script>

<style>
.board-wrap {
	text-align: center;
}

.board-image-wrap>img {
	max-width: 700px;
}

.board-button-wrap, .board-desc-wrap {
	text-align: center;
	margin-top: 30px
}

.board-comment-wrap {
	display: flex;
	align-items: center;
	justify-content: center;
}

.board-comment-image-wrap>img {
	width: 50px;
	height: 50px;
	border-radius: 100%;
}

.board-comment-input-wrap {
	padding: 0 10px;
}
</style>

<style>
/* ===================== BASIC STYLING ===================== */
* {
	box-sizing: border-box;
	font-family: 'Lato', sans-serif;
}

html, body {
	margin: 0;
	padding: 0;
	font-weight: 300;
	height: 100%;
	/*background: #053777;*/
	/*color: #fff;*/
	font-size: 16px;
	overflow: hidden;
	/*background: -moz-linear-gradient(top, #053777 0%, #00659b 100%);*/
	/*!* FF3.6+ *!*/
	/*background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #053777),*/
	/*color-stop(100%, #00659b));*/
	/*!* Chrome,Safari4+ *!*/
	/*background: -webkit-linear-gradient(top, #053777 0%, #00659b 100%);*/
	/*!* Chrome10+,Safari5.1+ *!*/
	/*background: -o-linear-gradient(top, #053777 0%, #00659b 100%);*/
	/*!* Opera 11.10+ *!*/
	/*background: -ms-linear-gradient(top, #053777 0%, #00659b 100%);*/
	/*!* IE10+ *!*/
	/*background: linear-gradient(to bottom, #053777 0%, #00659b 100%);*/
	/*!* W3C *!*/
}

h1 {
	text-align: center;
	margin: 50px auto;
	/*font-weight: 100;*/
}

label {
	font-weight: 500;
	display: block;
	margin: 4px 0;
	text-transform: uppercase;
	font-size: 13px;
	overflow: hidden; span { float : right;
	text-transform: none;
	font-weight: 200;
	line-height: 1em;
	font-style: italic;
	opacity: 0.8;
}

button {
	padding: 8px 30px;
	background: rgba(255, 255, 255, 0.8);
	color: #053777;
	text-transform: uppercase;
	font-weight: 600;
	font-size: 11px;
	border: 0;
	text-shadow: 0 1px 2px #fff;
	cursor: pointer;
}

.form-group {
	max-width: 500px;
	margin: auto;
	margin-bottom: 30px;
}

.left {
	float: left;
}

.right {
	float: right;
}
</style>

<script>
	$("#m_heart").click(function() {
						//게시물 번호(bno)를 idx로 전달받아 저장
						var bno = $(this).attr('idx');
						console.log("heart-click");

						//빈하트를 눌렀을때
						if ($(this).children('png').attr('class') == "bi bi-suit-heart") {
							console.log("빈하트 클릭" + bno);

							$.ajax({
								url : "<c:url value="/fnt/saveHeart.do"/>",
								type : 'get',
								data : {
									bno : bno,
								},
								success : function(pto) {
									//페이지 새로고침
									//document.location.reload(true);

									var heart = pto.heart;

									//페이지와 모달창에 하트수를 갱신
									$('#m_heart' + bno).text(heart);
									$('#heart' + bno).text(heart);

									console.log("하트추가 성공");
								},
								error : function() {
									alert('서버에 에러가 발생했습니다');
								}

							});

							console.log("꽉찬하트로 바꾸기");
							$(this)
									.attr('src',
											'<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart-fill.png"/>')
							$('.heart_icon' + bno)
									.attr('src',
											'<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart-fill.png"/>')

							//꽉찬 하트를 눌렀을 때
						} else if ($(this).children('png').attr('class') == "bi bi-suit-heart-fill") {
							console.log("꽉찬하트 클릭" + bno);

							$.ajax({
								url : "<c:url value="/fnt/removeHeart.do"/>",
								type : 'get',
								data : {
									bno : bno,
								},
								success : function(pto) {
									//페이지 새로고침
									//document.location.reload(true);

									var heart = pto.heart;
									//페이지 하트 수 갱신
									$('#m_heart' + bno).text(heart);
									$('#heart' + bno).text(heart);

									console.log("하트삭제 성공");
								},
								error : function() {
									alert('서버 에러');
								}
							});
							console.log("빈하트로 바꾸기");

							//빈하트로 바꾸기
							$(this)
									.attr('src',
											'<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart.png"/>')
							$('.heart_icon' + bno)
									.attr('src',
											'<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart.png"/>')
						}
					});

	//로그인 안한 상태에서 하트를 클릭하면 로그인해야한다는 알림창이 뜹니다.
	//(로그인한 상태인 하트의 <a></a> class명: heart-notlogin)
	$('.heart-notlogin').unbind('click');
	$('.heart-notlogin').click(function() {
		alert('로그인 하셔야 하트를 누를 수 있습니다');
	});

	//페이지가 뒤로가기 하면 하트버튼과 하트 수 갱신이 안됨. 이때 하트 누르면 DB에 중복으로 들어감
	//이것을 방지하기위해 뒤로가기할때 css로 클릭막고 새로고침으로 갱신된 하트수가 나오게 하기위함
	$(window)
			.bind(
					"pageshow",
					function(event) {
						//파폭,사파리 뿐 아니라 익스 크롬의 경우도 고려하여
						if (event.originalEvent.persisted
								|| (window.performance && window.performance.navigation.type == 2)) {
							console.log('BFCahe로부터 복원됨');
							$(".heart-click").css("pointer-events", "none");
							location.reload(); //새로고침
						} else {
							console.log('하트수 최신화된 페이지 열기');
						}
					});
</script>







<%-- 
<script src="<c:url value="/resources/js/photobbs/scripts.js"/>"></script>
<script src="<c:url value="/resources/js/photobbs/scripts.js"/>"></script>
<script src="<c:url value="/resources/js/photobbs/scripts.js"/>"></script> --%>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->
