<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 카드리스트 섹션 -->
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
					<div class="col-xsm card-title">${tmp.id}</div>
					<div class="col-sm card-heart" id="card-heart">
						<c:choose>
							<%--로그인 상태일때 -하트 클릭되게 --%>
							<c:when test="${not empty sessionScope.id}">
								<c:choose>
									<c:when test="${empty tmp.hno}">
										<%--빈 하트일때 --%>
										<span><a idx="${tmp.bno}" href="javascript:"
											class="heart-click heart_icon${tmp.bno}"> <img
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
					<h5 class="modal-title" id="m_subject"><!-- [${tmp.address}]&nbsp; -->${tmp.subject }</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<section class="modal-section">
						<!-- 글쓴이 프로필 사진이 원형으로 나오는 부분 -->
						<div class="row">
							<div class="col-10">
								<span id="m_writer_profile"> <a
									href="other_profile.do?other_id=${tmp.id }"> <img
										id="profileImage" src="" alt="프사" /> <%--업로드할 프사의 이미지 경로가 들어갈예정 --%>
										<%-- "<c:url value="/resources/images/photobbs/upload/'${tmp.pro }'"/>" --%>
								</a>
								</span>&nbsp;&nbsp;<span id="m_writer">${tmp.id }</span>
							</div>
							<div class="col-2">${tmp.wdate }</div>
						</div>
					</section>
					<section class="modal-section-media">
						<div class="container" id="m_media">
							<img class="w-100" id="media-image" src="" alt="업로드이미지" />
							<%--업로드할 사진의 이미지 경로가 들어갈예정 --%>
							<%-- "<c:url value="/resources/images/photobbs/upload/'${tmp.ino }'"/>" --%>
						</div>
					</section>

					<section class="modal-section">
						<div id="m_heart_reply_hit">
							<span id="m_heart_icon"> <c:choose>
									<%--로그인 상태일때 - 하트 클릭되게끔 --%>
									<c:when test="${not empty sessionScope.id }">
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
							</span> <span id="m_heart${tmp.bno}">${tmp.heart }</span>

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
					<div class="collapse" id="reply_card${tmp.rno }">
						<section class="modal-section">
							<div class="card card-body">
								<!-- 댓글 목록 -->
								<div class="reply-list reply-list${tmp.rno }">
									<!-- 댓글 목록이 들어가는 곳 -->
								</div>
								<!--로그인 상태에만 나오는 댓글 작성칸 -->
								<c:if test="${not empty sessionScope.id }">
									<div class="row reply-write">
										<div class="col-1">
											<a href="other_pro.do?other_name=${tmp.id }"> <img
												id="write_reply_profileImage" src="" /> <!-- "<c:url value="/resources/images/photobbs/upload/'${sessionScope.pro }'"/>" -->
												<!-- src에는 세션에 로그인한 프로필의 사진이 들어감 -->
											</a>
										</div>
										<div class="col-8" class="input_reply_div">
											<input class="w-100 form-control" id="input_reply${tmp.rno}"
												type="text" placeholder="댓글입력...">
										</div>
										<div class="col-3">
											<button type="button" idx="${tmp.rno }"
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
					<c:if test="${not empty id and tmp.id eq sessionScope.id}">
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
	//페이지가 열리자마자 실행되는 자스코드
	
	$(document).ready(function(){
		
		GetList(1);
		
		//애니메이션 관련 시작
		
		$(document).ready(function(){
			$(window).scroll(function(){
				$('.thumb').each(function(i){
					
					var bottom_element = $(this).offset().top + $(this).outerHeight();
					var bottom_window = $(window).scrollTop() + $(window).height();
					
					if (bottom_window > bottom_element){
						$(this).animate({'opacity':'1','margin-bottom':'0px'},1000);
					}
				});
			});
		});
		
		//애니메이션 관련 끝
		
		//조회수 올리기 시작
		$(document).on('click','card-img',function(){
			//게시물 번호(bno)를 idx로 전달받아 저장합니다.
			var bno = $(this).attr('idx');
			
			console.log(bno+"에 hit(조회수) + 1을 함");
			
			// +1된 hit값 불러오기
			$.ajax({
				url : "<c: value="/fnt/picture_view.do"/>",
				type: "post",
				data: {
					bno : bno
				},
				success : function(to){
					var hit = to.hit;
					
					$('#_hit'+bno).text(hit);
					$('#hit'+bno).text(hit);
				
				},
				error: function(){
					alert('서버 에러');
				}
			});
		});
	});
	
	//창 크기 변해도 가로세로 맞추기 위해
	$(window).resize(function(){
		$('.box').each(function(){
			$(this).height($(this).width());
		});
	}).resize();
</script>

<script>
	const WriteReReply = function(bno,rno){
		
		console.log(bno);
		console.log(rno);
		
		console.log($("#input_rereply" + rno).val());
		
		//댓글 입력란의 내용을 가져온다.
		var content = $("#input_rereply" +rno).val();
		content = content.trim();
		
		if(content == ""){ //입력된 내용 없을때
			alert("내용을 입력해주세요");
		}
		else{
			//입력란 비우기
			$("#input_rereply" + rno).val("");
			
			//reply+1 하고 그 값을 가져오기
			$.ajax({
				url : "<c: value="/fnt/picture_write_rereply.do"/>",
				type : "post",
				data : {
					rno : rno,
					bno : bno,
					content : content
				},
				success: function(pto) {
					
					var reply = pto.reply;
					//페이지, 모달창에 댓글 수를 갱신
					$('#m_reply'+bno).text(reply);
					$('#reply'+bno).text(reply);
					
					console.log("답글 작성 성공");
					
					//게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
					ReplyList(bno);
				},
				error: function(){
					alert("서버 에러");
				}
			});
		};
	};
	
	//댓글(최상위) 삭제일때
	
	const DeleteReply = function(rno, bno){
		//grp이 rno인 댓글이 있는 경우 content에 null을 넣고 없으면 삭제.
		$.ajax({
			url: "<c: value="/fnt/picture_delete_reply.do"/>",
			type: "post",
			data : {
				rno : rno,
				bno : bno
			},
			success: function(pto) {
				var reply = pto.reply;
				
				//페이지, 모당창에 댓글수 갱신
				$('#m_reply'+bno).text(reply);
				$('#reply'+bno).text(reply);
				
				console.log("모댓글 삭제 성공");
				
				//게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
				ReplyList(bno);
			},
			error: function() {
				alert('서버 에러');
			}
		});
	};
	
	//답글 삭제일때
	const DeleteReReply = function(rno, bno, grp){
		
		$.ajax({
			url: "<c: value="/fnt/picture_delete_rereply.do"/>",
			type: "post",
			data : {
				rno : rno,
				bno : bno,
				grp : grp
			},
			success: function(pto) {
				var reply = pto.reply;
				
				//페이지, 모당창에 댓글수 갱신
				$('#m_reply'+bno).text(reply);
				$('#reply'+bno).text(reply);
				
				console.log("답글 삭제 성공");
				
				//게시물 번호(bno)에 해당하는 댓글리스트를 새로 받아오기
				ReplyList(bno);
			},
			error: function() {
				alert('서버 에러');
			}
		});
	};
</script>

<script>
	//댓글
	
	//게시물의 댓글 목록을 불러오는 자스코드
	const ReplyList = function(rno){
		$.ajax({
			url : "<c: value="/fnt/picture_replyList.do"/>",
			type : 'post',
			data : {
				rno : rno
			},
			success : function(data){
				
				console.log("댓글 리스트 가져오기 성공");
				
				//댓글 목록을 html로 담기
				var listHtml = "";
				for(const i in data){
					var rno = data[i].rno;
					var bno = data[i].bno;
					var grp = data[i].grp;
					var grps = data[i].grps;
					var grpl = data[i].grpl;
					var name = data[i].name;
					var content = data[i].content;
					var wdate = data[i].wdate;
					var wgap = data[i].wgap;
					var pro = data[i].pro;
					
					console.log(grpl]); //댓글일땐 0, 대댓글일땐 1
					
					listHtml += "<div class='row replyrow reply" + rno +"'>";
					
					if(content == ""){ //삭제된 댓글일때
						listHtml += "	 <div>";
						listHtml += "	 		(삭제된 댓글입니다)";
						listHtml += "	 <div>";
					}
					else{
						if(grpl == 0){ //댓글일때
							listHtml += "	 <div class='col-1'>";
							listHtml += "	 		<a href='other_pro.do?other_name="+name+"'>";
							//아래 프로필이미지 경로는 나중에 물어보고 수정하기
							listHtml += "	 				<img class='reply_list_profileImage' src='./upload/pro/"+ pro +"'/>";						
							listHtml += "	 		</a>";		
							listHtml += "	 </div>";
							listHtml += "	 <div class='rereply-content col-8'>";
							listHtml += "	 		<div>";
							listHtml += "	 				<span>";
							listHtml += "	 						<b>"+ name +"</b>";
							listHtml += "	 				</span>";
							listHtml += "	 				<span>";
							listHtml += 	 						content;
							listHtml += "	 				</span>";
							listHtml += "	 		</div>";
							// 현재 로그인 상태일때 답글작성 버튼이 나온다.
							if("${name}" != ""){
								listHtml += "			<div>";
								//함수에 게시글번호(bno), 댓글번호(rno), 모댓글 작성자(name)를 인자로 담아서 넘기고
								//이때 댓글 작성자 name은 string, string을 인자로 넣기위해 "", ''로 감싼다.
								listHtml += "					<a href='#' class='write_reply_start' data-bs-toggle='collapse' data-bs-target='#re_reply"+ no +"' aria-controls='collapseExample'>답글$nbsp;달기</a>";
								listHtml += "			</div>";
							}
							listHtml += "   </div>"
						}
						else{ //대댓글일때
							listHtml += "	 <div class='col-1'>";
							listHtml += "	 </div>";
							listHtml += "	 <div class='col-1'>";
							listHtml += "	 				<img class='reply_list_profileImage' src='./upload/pro/"+ pro +"'/>";
							listHtml += "	 </div>";
							listHtml += "	 <div class='rereply-content col-7'>";
							listHtml += "	 		<div>";
							listHtml += "	 				<span>";
							listHtml += "	 						<b>"+ name +"</b>";
							listHtml += "	 				</span>";
							listHtml += "	 				<span>";
							listHtml += 	 						content;
							listHtml += "	 				</span>";
							listHtml += "	 		</div>";
							listHtml += "   </div>"
						}
						
						listHtml += "	 <div class='col-3 reply-right'>";
						listHtml += "	 		<div>";
						listHtml +=						wdate;
						listHtml += "	 		</div>";
						//책갈피
						
						if("${name}" != ""){ //현재 로그인 상태이고
						
							//작성자가 로그인한 사용자라면
							if("${name}" == name){
								listHtml += "			<div>";
								//수정할 댓글의 rno와 grpl을 함께 넘긴다.
								//grpl을 넘기는 이유는 댓글 수정란과 대댓글 수정란을 구분하기 위하여
								listHtml += "				<a href='javascript:' rno='"+ rno +"' grpl='"+ grpl +"' class='reply_modify'>수정</a>";
								listHtml += "				&nbsp;|&nbsp;"
								//삭제는 rno만 넘긴다.
								listHtml += "				<a href='javascript:' rno='"+ rno +"' grpl='"+ grpl +"' bno'"+ bno +"' grp'"+grp+"' class='reply_delete'>삭제</a>";
								listHtml += "			</div>";
							}///if
						}///if
						listHtml += "   <div class='collapse row rereply_write' id='re_reply"+rno+"'>";
						listHtml += "  		<div class='col-1'>"		
						listHtml += "   </div>"
						listHtml += "  		<div class='col-1'>"
						listHtml += "  			<a href='other_profile.do?other_name="+name+"'>";
						listHtml += "  				<img id='write_reply_profileImage' src='<c:url value="/resources/images/upload/profile/${pro}"/>'";
						//위 두항목은 추후에 .do와 프로필 경로 등 반드시 합의하에 수정할 것.
						listHtml += "  			</a>";
						listHtml += "   	</div>"
						listHtml += "  		<div class='col-7'>"
						listHtml += "		<input class='w-100 input_rereply_div form-control'	id='input_rereply"+ rno +"' type='text' placeholder='댓글을 입력하세요'>"		
						listHtml += "   	</div>"
						listHtml += "  		<div class='col-3'>"
						
						//대댓다는 버튼을 누르면 댓글번호(rno)와 게시물번호(bno)
						//동적으로 넣은 html태그에서 발생하는 이벤트는 동적으로 처리해야한다.
						//가령, 동적으로 넣은 html태그에서 발생하는 click이벤트는 html태그 안에서 onclick으로 처리하지말고, 제이쿼리에서 클래스명이나 id값으로 받아서 처리해야한다.
						listHtml += "  			<button type='button' class='btn btn-success mb-1 write_rereply' rno='"+ rno +"' bno='"+ bno + "'>답글&nbsp;달기"</button>"
						listHtml += "   	</div>"
						listHtml += "   </div>"
						//---답글입력란 끝
					}
					
					listHtml += "</div>";
				};///for
				
				//동적으로 넣은 html에 대한 이벤트 처리는 같은 함수내에서 처리해줘야한다.
				//$(document).ready(function(){}); 안에 쓰지 말것.
				
				//댓글 리스트 부분에 받아온 댓글 리스트 넣기
				$(".reply-list"+rno).html(listHtml);
				
				//답글을 작성한 후 답글달기 버튼을 눌렀을 때 클릭이벤트를 제이쿼리로 처리
				$('button.btn.btn-success.mb-1.write_rereply').on('click',function(){
					console.log('rno',$(this).attr('rno'));
					console.log('bno',$(this).attr('bno'));
					
					//답글을 DB에 저장하는 함수를 호출하기
					WriteReReply($(this).attr('rno'),$(this).attr('bno'));
				});
				
				//삭제버튼 클릭시
				$('.reply_delete').on('click',function(){
					//댓글삭제일 경우
					if($(this).attr('grpl') == 0){
						DeleteReply($(this).attr('rno'), $(this).attr('bno'));
					}
					//대댓(답글) 삭제일시
					else{
						DeleteReReply($(this).attr('rno'), $(this).attr('grp'));
					}
					
				})
				
			},////success
			error: function() {
				alert('서버 에러');
			}
		});
	};
	
</script>