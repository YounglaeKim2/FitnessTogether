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

<script>
//페이지가 처음 로딩될때 보여줄 페이지
var currentPage = 1;
//현재 페이지가 로딩중인지 여부를 저장할 변수
var isLoading = false;

//웹브라우저의 창을 스크롤 할 때 마다 호출되는 함수 등록
$(window).on("scroll",function(){
	//위로 스크롤된 길이
	var scrollTop = $(window).scrollTop();
	//웹브라우저 창의 높이
	var windowHeight = $(window).height();
	//문서 전체의 높이
	var documentHeight = $(document).height();
	//바닥까지 스크롤 되어쓴지 여부를 알아낸다.
	var isBottom = scrollTop+windowHeight + 10 >= documentHeight;
	
	if(isBottom){
		//현재페이지가 마지막 페이지라면
		if(currentPage == ${totalPageCount} || isLoading){
			return; //여기에서 끝낸다
		}
		
		//현재 로딩중이라고 표시하기
		isLoading = true;
		//로딩바를 띄우기
		$(".back-drop").show();
		//요청할 페이지 번호를 1 증가시키기
		currentPage++;
		//추가로 받아올 페이지를 서버에 ajax 요청을 하고
		console.log("inscroll"+currentPage);
		GetList(currentPage);
	};
});
	
</script>

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
				var bno = $(this).attr('idx');
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
							
							var heart = pto.heart;
							
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
				}
				else if($(this).children('png').attr('class') == "bi bi-suit-heart-fill"){
					console.log("꽉찬하트 클릭"+bno);
					
					$.ajax({
						url: "<c: value="/fnt/removeHeart.do"/>",
						type: "post",
						data:{
							bno : bno,
						},
						success : function(pto) {
							//페이지 새로고침
							//document.location.reload(true);
							
							var heart = pto.heart;
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
			
			//페이지가 뒤로가기 하면 하트버튼과 하트 수 갱신이 안됨. 이때 하트 누르면 DB에 중복으로 들어감
			//이것을 방지하기위해 뒤로가기할때 css로 클릭막고 새로고침으로 갱신된 하트수가 나오게 하기위함
			$(window).bind("pageshow",function(event){
				//파폭,사파리 뿐 아니라 익스 크롬의 경우도 고려하여
				if(event.originalEvent.persisted || (window.performance && window.performance.navigation.type == 2)) {
					console.log('BFCahe로부터 복원됨');
					$(".heart-click").css("pointer-events","none");
					location.reload(); //새로고침
				}
				else{
					console.log('하트수 최신화된 페이지 열기');
				}
			});
			
			//댓글아이콘을 클릭했을때 댓글 리스트 함수를 호출
			$(".open_reply_list").unbind('click');
			$(".open_reply_list").click(function() {
				var bno = $(this).attr('idx');
				//게시물의 no에 해당하는 댓글 리스트를 가져오는 함수
				ReplyList(bno);
			});
			
			//댓글 달기 버튼 클릭시 실행
			$(".write_reply").unbind('click');
			$(".write_reply").click(function() {
				//게시물 번호
				var bno = $(this).attr('idx');
				//책갈피
				//댓글 입력란의 내용을 가져온다.
				var content = $("#input_reply"+bno).val();
				
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
							
							var reply = pto.reply;
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
};
	
</script>


<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->