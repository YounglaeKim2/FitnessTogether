<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->

<!-- CSS file -->
<link href="<c:url value="/resources/css/message/message_list.css"/>" rel="stylesheet">

<!-- 메시지 전송 아이콘 떄문에 필요함 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	rel="stylesheet">

<div class="msg-container">

	<div class="messaging">
		<div class="inbox_msg">
			<!-- 메시지 목록 영역 -->
			<div class="inbox_people">
				<div class="headind_srch">
					<div class="recent_heading">
						<h4>최근</h4>
					</div>
					<!-- 메시지 검색 -->
					<div class="srch_bar">
						<div class="stylish-input-group">
							<input type="text" class="search-bar" placeholder="사람찾기" id="search_people">
							<span class="input-group-addon">
								<button type="button">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</span>
						</div>
					</div>
				</div>

				<!-- 메시지 리스트 -->
				<div class="inbox_chat"></div>

			</div>

			<!-- 메시지 내용 영역 -->
			<div class="mesgs">
				<!-- 메시지 내용 목록 -->
				<div class="msg_history" name="contentList">
					<!-- 메시지 내용이 올 자리 -->
				</div>
				<div class="send_message"></div>
				<!-- 메시지 입력란이 올 자리 -->
			</div>
		</div>

	</div>
</div>

<script>
	//가장 처음의 메시지 리스트 가져오기
	const FirstMessageList = function(){
		$.ajax({
			url: "/fnt/message_ajax_list.do",
			method: "post",
			data: {
				
			},
			success:Function(data){
				console.log("메시지 리스트 리로딩 성공");
				
				$('.inbox_chat').html(data);
				
				//메시지 리스트 중 하나를 클릭했을 때
				$('.chat_list').on('click',function(){
					
					var room = $(this).attr('room');
					var other_name = $(this).attr('other-name');
					
					//선택한 메시지빼고 나머지는 avtive효과 해제하기
					$('.char_list_box').not('.chat_list_box.chat').removeClass('active_chat');
					//선택한 메시지만 active효과주기
					$('.chat_list_box'+room).addClass('active_chat');
					
					var send_msg = "";
					send_msg +="<div class='type_msg'>";
					send_msg +="	<div class='input_msg_write row'>";
					send_msg +="		<div class=;'col-11'>";
					send_msg +="			<input type='text' class='write_msg form-control' placeholder='메시지를 입력...' />";
					send_msg +="		</div>";
					send_msg +="		<div class=;'col-1'>";
					send_msg +="			<button class='msg_send_btn' type='button'><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>";
					send_msg +="		</div>";
					send_msg +="	</div>";
					send_msg +="</div>";
					
					//메시지 입력,전송칸을 보여주기
					$('.send_message').html(send_msg);
					
					//메시지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						
						//메시지 전송 함수 호출
						SendMessage(room, other_name);
						//전송버튼을 누르면 메시지 리스트가 리로드되며 현재 열린 메시지의 선택됨표시 사라짐
						//이를 해결하기 위하여 메시지 전송버튼을 누르고 메시지 리스트가 리로드되면 현재 열린 메시지가 선택됨 표시되도록
						$('.chat_list_box:first').addClass('active_chat');
					});
					
					//메시지 내용을 불러오는 함수 호출
					MessageContentList(room);
				});
			}
		})
	};
	
	//메시지 리스트 다시 가져오기
	const MessageList = function(){
		$.ajax({
			url: "/fnt/message_ajax_list.do",
			method: "post",
			data: {
				
			},
			success:Function(data){
				console.log("메시지 리스트 리로딩 성공");
				
				$('.inbox_chat').html(data);
				
				//메시지 리스트 중 하나를 클릭했을 때
				$('.chat_list').on('click',function(){
					
					var room = $(this).attr('room');
					var other_name = $(this).attr('other-name');
					
					//선택한 메시지빼고 나머지는 avtive효과 해제하기
					$('.char_list_box').not('.chat_list_box.chat').removeClass('active_chat');
					//선택한 메시지만 active효과주기
					$('.chat_list_box'+room).addClass('active_chat');
					
					var send_msg = "";
					send_msg +="<div class='type_msg'>";
					send_msg +="	<div class='input_msg_write row'>";
					send_msg +="		<div class=;'col-11'>";
					send_msg +="			<input type='text' class='write_msg form-control' placeholder='메시지를 입력...' />";
					send_msg +="		</div>";
					send_msg +="		<div class=;'col-1'>";
					send_msg +="			<button class='msg_send_btn' type='button'><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>";
					send_msg +="		</div>";
					send_msg +="	</div>";
					send_msg +="</div>";
					
					//메시지 입력,전송칸을 보여주기
					$('.send_message').html(send_msg);
					
					//메시지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						
						//메시지 전송 함수 호출
						SendMessage(room, other_name);
						//전송버튼을 누르면 메시지 리스트가 리로드되며 현재 열린 메시지의 선택됨표시 사라짐
						//이를 해결하기 위하여 메시지 전송버튼을 누르고 메시지 리스트가 리로드되면 현재 열린 메시지가 선택됨 표시되도록
						$('.chat_list_box:first').addClass('active_chat');
					});
					
					//메시지 내용을 불러오는 함수 호출
					MessageContentList(room);
				});
			}
		})
	};
	
	//메시지 내용을 가져오기
	//읽지 않은 메시지를 읽음으로 처리하기
	const MessageContentList = function(room) {
		
		$.ajax({
			url: "/fnt/message_content_list.do",
			method: "post",
			data: {
				room : room,
			},
			success: function(data){
				console.log("메시지 내용 가져오기 성공");
				
				//메시지 내용을 html에 넣기
				$('.msg_history').html(data);
				
				//이 함수로 메시지 내용을 가져올때마다 스크롤을 맨 아래로 가게한다.
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
			},
			error: function(){
				alert("서버 에러");
			}
		})
		
		$('.unread'+room).empty();
	};
	
	// 메세지를 전송하는 함수
	const SendMessage = function(room,other_name){
		
		var content = $('.write_msg').val();
		
		content = content.trim();
		
		if(content == ""){
			alert("메시지를 입력하세요");
		}
		else {
			$.ajax({
				url: "/fnt/message_send_inlist.do",
				method: "post",
				data: {
					room : room,
					other_name : other_name,
					content : content
				},
				success: function(data){
					console.log("메시지 전송 성공");
					
					//메시지 입력칸 비우기
					$('.write_msg').val("");
					
					//메시지 내용 리로드
					MessageContentList(room);
					
					//메시지 리스트 리로드
					MessageList();
				},
				error: function(){
					alert("서버 에러");
				}
			});
		}
	};
	
	$(document).ready(function() {
		//메시지 리스트 리로드
		FirstMessageList();
	});

</script>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->