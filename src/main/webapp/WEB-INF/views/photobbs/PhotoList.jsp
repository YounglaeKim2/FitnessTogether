<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 카드리스트 섹션 -->

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->

<c:forEach var="tmp" items="${list}">

	<div class="col-3 card inner">
		<div class="thumb">
			<div class="card-img" type="button" idx="${tmp.bno}"
				data-bs-toggle="modal" data-bs-target="viewModal${tmp.bno}">
				<div class="box">
					<img src="./upload/picture/${tmp.media}"
						class="card-img-top img-wrapper" alt="...">
				</div>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-xsm card-title">${tmp.name}</div>
					<div class="col-sm card-heart" id="card-heart">
						<c:choose>
							<%--로그인 상태일때 -하트 클릭되게 --%>
							<c:when test="${not empty sessionScope.name}">
								<c:choose>
									<c:when test="${empty tmp.hno}">
										<%--빈 하트일때 --%>
										<span><a idx="${tmp.bno}" href="javascript:"
											class="heart-click heart_icon${tmp.no}"> <img
												alt="빈하트이미지"
												src="<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart.png"/>"
												width="16" height="16" class="bi bi-suit-heart">
										</a> </span>
									</c:when>
									<c:otherwise>
										<%--꽉찬 하트일때 --%>
										<span><a idx="${tmp.bno}" href="javascript:"
											class="heart-click heart_icon${tmp.bno}"> <img
												alt="꽉찬하트이미지"
												src="<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart-fill.png"/>"
												width="16" height="16" class="bi bi-suit-heart-fill">
										</a> </span>
									</c:otherwise>
								</c:choose>
							</c:when>
							<%--로그인 상태가 아닐때 -하트 클릭 안되게 --%>
							<c:otherwise>
								<span><a href="javascript:" class="heart-notlogin"> <img
										alt="빈하트이미지"
										src="<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart.png"/>"
										width="16" height="16" class="bi bi-suit-heart">
								</a> </span>
							</c:otherwise>
						</c:choose>
						<span id="heart${tmp.bno}">${tmp.heart}</span>

						<%--댓글 아이콘 --%>
						<span> <img alt="댓글아이콘이미지"
							src="<c:url value="/resources/images/photobbs/icons/bi bi-chat-dots.png"/>"
							class="bi bi-chat-dots" width="16" height="16">
						</span> <span id="reply${tmp.bno}">${tmp.reply}</span>

						<%--눈알 아이콘 --%>
						<span> <img alt="조회수아이콘이미지"
							src="<c:url value="/resources/images/photobbs/icons/bi bi-eye.png"/>"
							class="bi bi-eye" width="16" height="16">
						</span> <span id="hit${tmp.bno}">${tmp.hit}</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- view Modal -->
	<!-- tableindex = -1 을 주며 tab키로 이동못하도록 -->
	<div class="modal fade" id="viewModal${tmp.bno}" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="m_subject">[${tmp.address}]&nbsp;${tmp.subject }</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<section class="modal-section">
						<!-- 글쓴이 프로필 사진이 원형으로 나오는 부분 -->
						<div class="row">
							<div class="col-10">
								<span id="m_writer_profile"> <a
									href="other_profile.do?other_id=${tmp.name }"> <img
										id="profileImage" src="" alt="프사" /> <%--업로드할 프사의 이미지 경로가 들어갈예정 --%>
										<%-- "<c:url value="/resources/images/photobbs/upload/'${tmp.profile }'"/>" --%>
								</a>
								</span>&nbsp;&nbsp;<span id="m_writer">${tmp.name }</span>
							</div>
							<div class="col-2">${tmp.wdate }</div>
						</div>
					</section>
					<section class="modal-section-media">
						<div class="container" id="m_media">
							<img class="w-100" id="media-image" src="" alt="업로드이미지" />
							<%--업로드할 사진의 이미지 경로가 들어갈예정 --%>
							<%-- "<c:url value="/resources/images/photobbs/upload/'${tmp.media }'"/>" --%>
						</div>
					</section>

					<section class="modal-section">
						<div id="m_heart_reply_hit">
							<span id="m_heart_icon"> <c:choose>
									<%--로그인 상태일때 - 하트 클릭되게끔 --%>
									<c:when test="${not empty sessionScope.name }">
										<c:choose>
											<c:when test="${empty tmp.hno}">
												<%-- 빈 하트일때 --%>
												<a idx="{tmp.bno}" href="javascript:"
													class="heart-click heart_icon${tmp.bno}"> <img
													alt="빈하트"
													src="<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart.png"/>"
													class="bi bi-suit-heart" width="16" height="16" />
												</a>
											</c:when>
											<c:otherwise>
												<%-- 꽉찬 하트일때 --%>
												<a idx="${tmp.bno}" href="javascript:"
													class="heart-click heart_icon${tmp.bno}"> <img
													alt="꽉찬 하트"
													src="<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart-fill.png"/>"
													width="16" height="16" class="bi bi-suit-heart-fill" />
												</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<%--로그인 상태가 아닐때 - 하트클릭 안되게 --%>
									<c:otherwise>
										<a href="javascript:" class="heart-notlogin"> <img
											alt="빈하트"
											src="<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart.png"/>"
											class="bi bi-suit-heart" width="16" height="16" />
										</a>
									</c:otherwise>
								</c:choose>
							</span> <span id="m_heart${tmp.no}">${tmp.heart }</span>

							<%-- 댓글 수 --%>
							<span> <a idx="${tmp.bno}" href="javascript:"
								class="open_reply_list" data-bs-toggle="collapse"
								data-bs-target="#reply_card${tmp.bno}" aria-expanded="false"
								aria-controls="collapseExample"> <img alt="댓글아이콘이미지"
									src="<c:url value="/resources/images/photobbs/icons/bi bi-chat-dots.png"/>"
									class="bi bi-chat-dots" width="16" height="16">
							</a>
							</span> <span id="m_reply${tmp.bno}">${tmp.reply}</span>

							<%-- 조회수 --%>
							<span> <img alt="조회수아이콘이미지"
								src="<c:url value="/resources/images/photobbs/icons/bi bi-eye.png"/>"
								class="bi bi-eye" width="16" height="16">
							</span> <span id="m_hit${tmp.bno}">${tmp.hit}</span>
						</div>
					</section>
					<section class="modal-section">
						<div id="m_content">${tmp.content }</div>
					</section>
				</div>

				<div>
					<!-- 댓글 -->
					<div class="collapse" id="reply_card${tmp.bno }">
						<section class="modal-section">
							<div class="card card-body">
								<!-- 댓글 목록 -->
								<div class="reply-list reply-list${tmp.bno }">
									<!-- 댓글 목록이 들어가는 곳 -->
								</div>
								<!--로그인 상태에만 나오는 댓글 작성칸 -->
								<c:if test="${not empty sessionScope.name }">
									<div class="row reply-write">
										<div class="col-1">
											<a href="other_profile.do?other_nick=${tmp.name }"> <img
												id="write_reply_profileImage" src="" /> <!-- "<c:url value="/resources/images/photobbs/upload/'${sessionScope.profile }'"/>" -->
												<!-- src에는 세션에 로그인한 프로필의 사진이 들어감 -->
											</a>
										</div>
										<div class="col-8" class="input_reply_div">
											<input class="w-100 form-control" id="input_reply${tmp.bno}"
												type="text" placeholder="댓글입력...">
										</div>
										<div class="col-3">
											<button type="button" idx="${tmp.bno }"
												class="btn btn-success mb-1 write_reply">댓글&nbsp;달기</button>
										</div>
									</div>
								</c:if>
							</div>
						</section>
					</div>
				</div>
				<div id="modify_delete">
					<%-- 수정/삭제버튼 --%>
					<c:if test="${not empty id and tmp.name eq sessionScope.name}">
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-toggle="modal" data-bs-target="#modifyModal${tmp.bno}">수정</button>
							<button type="button" class="btn btn-dark" data-bs-toggle="modal"
								data-bs-target="#modifyModal${tmp.bno}">삭제</button>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<%-- view Modal 끝 --%>

	<!-- modify Modal(수정 모달)-->
	<div class="modal fade" id="modifyModal${tmp.bno}" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">modify confirm</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">수정페이지로 이동 하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">아니요</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/fnt/picture_modify.do?bno=${tmp.bno}'">네</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modify Modal 끝 -->

	<!-- delete Modal -->
	<div class="modal fade" id="deleteModal${tmp.bno}" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">삭제 확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">정말로 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">아니요</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='javascript:PictureDelete(${tmp.bno})'">네</button>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<script>
	
const GetList = function(currentPage){
	console.log("inGetList"+currentPage);
	
	//무한 스크롤
	$.ajax({
		url:"<c: value="/fnt/photoList.do"/>",
		method:"POST",
		//검색기능이 있는 경우 condition과 keyword를 함께 넘겨줘야한다.(검색결과만 출력하기 위해서)
		data:"pageNum="+currentPage+"&condition=${condition}&keyword=${keyword}",
		//PhotoList.jsp의 내용이 data로 들어오도록 함.
		success:function(data){
			console.log(data);
			//응답된 문자열은 html 형식이다.(PhotoList.jsp에 응답내용이 있다.)
			//해당 문자열을 .card-list-container div에 html로 해석하라고 추가
			$(".card-list-container").append(data);
			//로딩바를 숨긴다.
			$(".back-drop").hide();
			//로딩중이 아니라고 표시한다.
			isLoading=false;
			console.log("ajax");
			
			$(".heart-click").unbind('click');
			//로그인 한 상태에서 하트를 클릭했을 때 (로그인한 상태의 하트의 <a></a> class명: heart-click)
			$(".heart-click").click(function(){
				
				//게시물 번호(bno)를 idx로 전달받아 저장
				let bno = $(this).attr('idx');
				console.log("heart-click");
				
				//빈하트를 눌렀을때
				if($(this).children('png').attr('class') == "bi bi-suit-heart-fill"){
					console.log("빈하트 클릭" + bno);
					
					$.ajax({
						url : "<c: value="/fnt/saveHeart.do"/>",
						type : 'post',
						data : {
							bno : bno,
						},
						success : function(pto) {
							//페이지 새로고침
							//document.location.reload(true);
							
							let heart = pto.heart;
							
							//페이지와 모달창에 하트수를 갱신
							$('#m_heart'+bno).text(heart);
							$('#heart'+bno).text(heart);
							
							console.log("하트추가 성공");	
						},
						error: function() {
							alert('서버에 에러가 발생했습니다');
						}
			
					});
					
					console.log("꽉찬하트로 바꾸기");
					$(this).attr('src','<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart-fill.png"/>')
					$('.heart_icon'+bno).attr('src', '<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart-fill.png"/>')
				
					//꽉찬 하트를 눌렀을 때
				}else if($(this).children('png').attr('class') == "bi bi-suit-heart-fill"){
					console.log("꽉찬하트 클릭"+bno);
					
					$.ajax({
						uri: "<c: value="/fnt/removeHeart.do"/>",
						type: "post",
						data:{
							bno : bno,
						},
						success : function(pto) {
							//페이지 새로고침
							//document.location.reload(true);
							
							let heart = pto.heart;
							//페이지, 모달창에 하트 수 갱신
							$('#m_heart'+bno).text(heart);
							$('#heart'+bno).text(heart);
							
							console.log("하트삭제 성공");
						},
						error: function() {
							alert('서버 에러');
						}
					});
					console.log("빈하트로 바꾸기");
					
					//빈하트로 바꾸기
					$(this).attr('src', '<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart.png"/>')
					$('.heart_icon'+bno).attr('src', '<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart.png"/>')
				}
			});
			
			//로그인 안한 상태에서 하트를 클릭하면 로그인해야한다는 알림창이 뜹니다.
			//(로그인한 상태인 하트의 <a></a> class명: heart-notlogin)
			$('.heart-notlogin').unbind('click');
			$('.heart-notlogin').click(function() {
				alert('로그인 하셔야 하트를 누를 수 있습니다');
			});
			
			//댓글아이콘을 클릭했을때 댓글 리스트 함수를 호출
			$(".open_reply_list").unbind('click');
			$(".open_reply_list").click(function() {
				let bno = $(this).attr('idx');
				//게시물의 no에 해당하는 댓글 리스트를 가져오는 함수
				ReplyList(bno);
			});
			
			//댓글 달기 버튼 클릭시 실행
			$(".write_reply").unbind('click');
			$(".write_reply").click(function() {
				//게시물 번호
				let bno = $(this).attr('idx');
				//책갈피
				//댓글 입력란의 내용을 가져온다.
				let content = $("#input_reply"+bno).val();
				
				//앞뒤 공백을 제거한다.(띄어쓰기만 입력했을때 댓글작성안되게 처리하기 위함)
				content = content.trim();
				
				console.log(content);
				
				if(content == ""){ //입력 내용없을시
					alert("내용을 입력하세요");
				}
				else{
					//입력란 비우기
					$('#input_reply'+bno).val("");
					
					// reply+1 하고 그 값을 가져옴
					$.ajax({
						url : "<c: value="/fnt/picture_write_reply.do"/>",
						type: "post",
						data: {
							bno : bno,
							content : content
						},
						success : function(pto){
							
							let reply = pto.reply;
							//페이지, 모달창에 댓글 수 갱신
							$('#m_reply'+bno).text(reply);
							$('#reply'+bno).text(reply);
							
							console.log("댓글 작성 성공");
							
							//댓글리스트 새로 받아오기
							ReplyList(bno);
						},
						error : function() {
							alert('서버 에러');
						}
					});
				}
			});
		}
	
	});
}
	
</script>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->