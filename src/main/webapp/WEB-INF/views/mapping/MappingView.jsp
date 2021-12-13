<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->

<!-- 실제 내용 시작 -->
<div class="container">

	<div class="page-header">
		<h1>
			Mapping<small>View</small>
		</h1>
	</div>
	<!-- 씨큐리티 사용시:사용자 권한 출력 div -->
	<div>
		<div class="col-md-offset-2 col-md-8">
			<ul style="list-style: decimal;">
				<c:forEach items="${authorities }" var="authority">
					<li>${authority }</li>
				</c:forEach>
			</ul>
		</div>
	</div>


	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<table class="table table-bordered table-striped">
				<tr>
					<th class="col-md-2 text-center">번호</th>
					<td>${record.no}</td>
				</tr>
				<tr>
					<th class="text-center">제목</th>
					<td>${record.title}</td>
				</tr>
				<tr>
					<th class="text-center">작성자</th>
					<td>${record.name}</td>
				</tr>
				<tr>
					<th class="text-center">등록일</th>
					<td>${record.postDate}</td>
				</tr>
				<tr>
					<th class="text-center" colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="2">${record.content}</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		<div class="col-md-offset-2 col-md-8">
			<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
			<ul id="pillMenu" class="nav nav-pills center-block"
				style="width: 200px; margin-bottom: 10px">
				<!-- 아래는 씨큐리티 미 사용시 -->
				<c:if test="${sessionScope.id ==record.id }">
					<!-- 아래는 씨큐리티 사용시 -->
					<li><a
						href="<c:url value='/onememo/bbs/Edit.do?no=${record.no}'/>"
						class="btn btn-success">수정</a></li>
					<li><a href="javascript:isDelete();" class="btn btn-success">삭제</a></li>
				</c:if>
				<li><a
					href="<c:url value='/onememo/bbs/List.do?nowPage=${param.nowPage}'/>"
					class="btn btn-success">목록</a></li>
			</ul>
		</div>
	</div>

	<!-- row -->
	<div class="row">
		<div class="col-md-12">
			<div class="text-center">
				​
				<!-- 한줄 코멘트 입력 폼-->
				<!-- 마이바티스의 리절트맵 테스트용:<%--${record.comments.size()} --%> -->
				<h2>한줄 댓글 입력 폼</h2>
				<form class="form-inline" id="frm">
					<!-- 씨큐리티 적용:csrf취약점 방어용 -->
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="hidden" name="no"
						value="${record.no}" />
					<!-- 수정 및 삭제용 파라미터 -->
					<input type="hidden" name="lno" /> <input placeholder="댓글을 입력하세요"
						id="title" class="form-control" type="text" size="50"
						name="linecomment" /> <input class="btn btn-success" id="submit"
						type="button" value="등록" />
				</form>
				<div class="row">
					<!-- 한줄 코멘트 목록-->
					<!-- ajax로 아래에 코멘트 목록 뿌리기 -->
					<div id="comments" class="col-md-offset-3 col-md-6">
						<!--방법1:마이바티스의 resultMap의 collection태그 사용시 시작-->
						<!-- 한번 요청으로 글 번호에 따른 한줄 댓글도 가져오는 방법이다 -->
						<%-- 
						<c:if test="${not empty record.comments }">
							<h2>한줄 댓글 목록</h2>
							<table class='table table-bordered'>
								<tr>
									<th class='text-center col-md-2'>작성자</th>
									<th class='text-center'>코멘트</th>
									<th class='text-center col-md-2'>작성일</th>
									<th class='text-center col-md-2'>삭제</th>
								</tr>
								<tbody class="comment-title">

									<c:forEach var="comment" items="${record.comments}">
										<tr class="comment${comment.lno}">
											<td>${comment.name }</td>
											<td style='cursor:pointer' class="title" title="${comment.lno}">${comment.lineComment }</td>
											<td>${comment.lpostDate }</td>
											<td><c:if test="${sessionScope.id ==comment.id }"
													var="isOwn">
													<span href="#" class='delete' title='${comment.lno}'>삭제</span>
												</c:if> <c:if test="${not isOwn}">
											삭제불가
											</c:if></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
						--%>
						<!-- 마이바티스의 resultMap의 collection태그 사용시 끝-->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 실제 내용 끝-->


<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->

<script>
	//두번째 방법-ajax를 이용해서 페이지 로딩후 다시 서버에 현재 글번호에 대한 한줄 댓글 목록 요청
	//          View.do요청과 코멘트 목록 요청 두번이 일어난다.
	showComments();
	//ajax로 서버에 데이터를 요청하는 함수]
	/*
		※AJAX에서의 요청방식
		 -GET, POST요청 :
			 data:key1=value1&key2=value2&...
			 contentType:"application/x-www-form-urlencoded"(디폴트)			 
			 스프링에서는 @RequestParam으로 데이타를 받는다
	 	 -POST,PUT, DELETE요청
	 	 	data:JSON.stringify({key1:value1,key2:value2,...})
	 		contentType:"application/json"
	 		스프링에서는 @RequestBody 로 데이터를 받는다.
	*/
	function showComments(){
		//contentType키를 생략시 디폴트:x-www-form-urlencoded
		//post방식이라 요청바디에 데이타가 key=value형태로 변환되서 전송 
		$.ajax({
			url:'<c:url value="/onememo/comments/List.do"/>',
			data:{"no":"${record.no}"},
			dataType:"json",
			type:"post",
			success:showComments_,
			error:function(e){console.log(e);}
		});
	}
	//실제 댓글 목록을 뿌려주는 함수]
	function showComments_(data){
		console.log("서버에서 전송받은 데이타(댓글 목록):",data);
		var comments ="<h2>한줄 댓글 목록</h2>";
		comments+="<table class='table table-bordered'>";
		comments+="<tr><th class='text-center col-md-2'>작성자</th><th class='text-center'>코멘트</th><th class='text-center col-md-2'>작성일</th><th class='text-center col-md-2'>삭제</th></tr>";
		comments+="<tbody class=\"comment-title\">";
		
		if(data.length ==0){
			comments+="<tr><td colspan='4'>등록한 한줄 댓글이 없어요</td></tr>"
		}
		
		$.each(data,function(index,element){
			comments+="<tr class='comment"+element["LNO"]+"'><td>"+element["NAME"]+"</td>";
			comments+="<td style='cursor:pointer' class='title' title='"+element["LNO"]+"'>"+element["LINECOMMENT"]+"</td>";
			comments+="<td>"+element["LPOSTDATE"]+"</td>";
			if("${sessionScope.id}"==element['ID'])
				comments+="<td><span href=\"#\" style='cursor:pointer' class='delete' title='"+element["LNO"]+"'>삭제</span></td></tr>";
			else
				comments+="<td>삭제불가</td></tr>";
		});
		comments+="</tbody></table>";
		$('#comments').html(comments);
		
	}//////////

	//코멘트 입력 및 수정처리]
	var action;
	$("#submit").click(function(){
		console.log("클릭 이벤트 발생:",$(this).val());
		console.log("파라미터값들:",$("#frm").serialize());
		if($(this).val()==='등록'){
			action="<c:url value="/onememo/comments/Write.do"/>";
			
		}
		else{
			action="<c:url value="/onememo/comments/Edit.do"/>";
			
		}
		console.log("한줄 댓글 키값(lno):",$('input[name=lno]').val());
		//ajax로 요청]
		$.ajax({
			url:action,
			data:$("#frm").serialize(),
			dataType:"text",
			type:"post",
			success:function(data){
				console.log("서버로부터 받은 데이타:",data);				
				//showComments();이래도 된다. 하지만 서버에 또 현재글에 대한 댓글 전체목록 요청하게 된다
				//아래는 서버에 요청을 보내지 않고 자스로만 처리
				
				if($('#submit').val()=='등록'){					
					//"8:김길동"
					var lno = data.split(":")[0];
					var name = data.split(":")[1];
					var date = new Date();
					var lpostdate=date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate();
					console.log(lno,name)
					var newComment ="<tr class='comment"+lno+"'><td>"+name+"</td><td style='cursor:pointer' class='title' title='"+lno+"'>"+$("#title").val()+"</td><td>"+lpostdate+"</td><td style='cursor:pointer' class='delete' title='"+data+"'>삭제</td></tr>";
					$(".comment-title").prepend(newComment);
				}
				else{
					//서버에 요청 안보내고 원래 글을 수정한 글로 변경
					//title속성값은 코멘트 제목 클릭시 설정한 lno값으로  혹은 컨트롤러에서 반환한 값(data)으로
					
					//코멘트 제목 클릭시 설정한 lno값
					//$('.title[title='+$('input[name=lno]').val()+']').html($("#title").val());
					
					//컨트롤러에서 반환값으로
					$('.title[title='+data+']').html($("#title").val());
					
					//버튼의 텍스트 변경
					$('#submit').val("등록");
				}
				
				//입력이나 수정시 댓글 클리어 및 포커스 주기
				$('#title').val("");
				$('#title').focus();
				
				
				
			}
			
		});////////////////
	
	});/////////click
	
	//코멘트 제목 클릭시 수정처리하기(UI변경)
	//반드시 click이벤트걸때 $(document).on으로
	$(document).on('click','.title',function(){
		console.log('클릭:',$(this).html());
		//클릭한 제목으로 텍스트박스 값 설정
		$('#title').val($(this).html());
		//버튼은 "등록"에서 "수정"으로
		$('#submit').val("수정");
		//댓글 입력 form의 hidden타입의 속성중 name="lno"의 value속성 설정
		$('input[name=lno]').val($(this).attr('title'));
		console.log("lno 설정후:",$('input[name=lno]').val());
	});
	//삭제 클릭시 삭제처리하기
	$(document).on('click','.delete',function(){
		var lno = $(this).attr('title').split(":")[0];
		if(confirm("정말로 삭제 할래?")){
			//삭제 처리]
			$.ajax({
				url:"<c:url value="/onememo/comments/Delete.do"/>",
				type:"post",
				data:"lno="+lno,
				dataType:"text"				
			}).done(function(data){
				console.log(data);
				//tr태그 삭제
				$('.comment'+lno).remove();
				
			}).fail(function(e){
				console.log(e)
			});
		}		
	});
	
	function isDelete(){
		if(confirm("정말로 삭제 하시겠습니까?")){
			location.replace("<c:url value="/onememo/bbs/Delete.do?no=${record.no}"/>");
		}
	}
	
	

</script>