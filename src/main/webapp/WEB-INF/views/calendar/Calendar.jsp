<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->

<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales/ko.js"></script>
<style>
	table {
	    width: 100%;
	    border-top: 1px solid #444444;
	    border-collapse: collapse;
 	}
  	th, td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
  	}
  	a {
	  color: black;
	  text-decoration: underline;
	}
</style>
<script>
$(function() {
	
	$.ajax({
		url:'<c:url value="/fnt/showCalendar.do"/>',
		data:{"id":"hkk1239"},
		dataType:"json",
		type:"post"
	}).done(function(data){
		var date;
		var list = data;
		var events = list.map(function(item){
			return {
				title : item["TYPE"]+" 운동",
				start : item["POSTDATE"]
			}
		});
		console.log(typeof events);
		console.log(events);
		events = [...new Set(events.map(JSON.stringify))].map(JSON.parse);
		console.log(typeof events);
		console.log(events);
		
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	height: "1000px",
	    	initialView: 'dayGridMonth',
	    	locale:'ko',
	    	aspectRatio: 1.5,
	    	dateClick: function(info) {
            	date = info.dateStr;
            	$('#date').html(date);
            	$('#modaltest').modal('show');
            	
            	$.ajax({
            		url:'<c:url value="/fnt/showWeight.do"/>',
            		data:{"id":"hkk1239","postdate":date},
            		dataType:"json",
            		type:"post"
            	}).done(function(data){
					console.log("리스트정보 :",data);
            		var list = "<form class='form-control' action='<c:url value="/fnt/deleteweight.do"/>' method='post' id='dataform'><table  class='table'>";
            		list += "<tr><th><input id='all' type='checkbox' /></th><th scope=\"col\">부위</th><th scope=\"col\">운동종류</th><th scope=\"col\">무게</th><th scope=\"col\">횟수</th></tr>";
            		if(data.length ==0){
            			list += "<tr><td colspan='6' align='center'>작성된 게시글이 없습니다</td></tr>";
            		}
            		
            		$.each(data,function(index,element){
            			list += "<tr><td><input type='checkbox' name='no' value='"+element['W_NO']+"'/></td><td>"+element['TYPE']+"</td><td>"+element['NAME']+"</td><td>"+element['KG']+"kg</td><td>"+element['COUNT']+"회</td></tr>";
            		});
            		
           			list += "</table>";
           			list += "<br/><div class='form-group' align='right'><button id='writeweight' type='button' class='btn btn-info'>추가작성</button> <button id='updateweight' type='button' class='btn btn-info'>수정</button> <button id='deleteweight' type='button' class='btn btn-info'>삭제</button></form></div>";
           			
            		$('#weight').html(list);
            		
           		    $('#writefood').click(function(){
           		    	location.href='<c:url value="/fnt/writefood.do"/>'+"?date="+date;;
           		    });
           		    $('#writeweight').click(function(){
           		    	location.href='<c:url value="/fnt/writeweight.do"/>'+"?date="+date;
           		    });
           		    
           		    $('#deleteweight').click(function(){
           		    	if(confirm('정말로 삭제하시겠습니까?')){
           		    		if(data.length ==0) {
           		    			alert("삭제할 내용이 없습니다")
           		    			return;
           		    		}
           		    		$('#dataform').submit();
           		    	}
           		    });
           		    
     		    	$(':checkbox').on('click',function(){
        		 		if($(this).prop('id') == $('#all').prop('id')){ // "전체선택" 클릭
        		 			if($(this).prop('checked')){ // 체크한 경우
        		 				$(':checkbox:gt(0)').each(function(){
        		 					$(this).prop('checked',true);
        		 				});
        		 			}
        		 			else{ // 해제한 경우
        		 				$(':checkbox:gt(0)').each(function(){
        		 					$(this).prop('checked',false);
        		 				});
        		 			}
        		 		}
        		 		else{ // "전체선택"이 아닌 체크박스 클릭
        		 			if($(this).prop('checked')){ // 체크한 경우
        		 				// 체크된 모든 체크박스의 수와 전체 선택을 제외한 체크박스의 수가 같다면
        		 				// 즉 모두 선택되었다면
        		 				if($(':checkbox:gt(0)').length == $(':checkbox:checked').length){
        		 					$(':checkbox:first').prop('checked',true);
        		 				}
        		 			}
        		 			else{ // 해제한 경우
        		 				$(':checkbox:first').prop('checked',false);
        		 			}
        		 		}
        		 	});
           		    
            	});
            	
            	
	     	},
	     	events:events
	    });
	    calendar.render();
		
	    $(document).mouseover(function(){
			$('.fc-daygrid-day-frame').css('cursor','pointer');
	    });
    	
	   
    });
	
	
	
	
});
</script>

	<i class="bi-alarm" style="font-size: 2rem; color: cornflowerblue;"></i>

    <!-- Header -->
    <header id="header" class="header">
        <div class="container">
            <div class="row">
                <div id='calendar'></div>
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of header -->
    <!-- end of header -->

<!-- 모달 작성 -->
	<div class="modal fade" id="modaltest" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
	   		<div class="modal-content">  
	   		  				
	   			<div class="modal-header">
					 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>   					
					<h3 id="date" class="modal-title">날짜</h3>
	  				<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-calendar-event" viewBox="0 0 16 16">
					  <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"></path>
					  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"></path>
					</svg>
	  			</div>
	  				
	  			<div class="modal-body">
                       	<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#food" type="button" role="tab" aria-controls="food" aria-selected="true">섭취 칼로리</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#weight" type="button" role="tab" aria-controls="weight" aria-selected="false">운동일지</button>
							</li>
						</ul>
						<br/>
                       	<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="food" role="tabpanel" aria-labelledby="food-tab">
		   						<table class="table">
		   							<tr>
		   								<th scope="col">음식종류</th>
		   								<th scope="col">칼로리</th>
		   							</tr>
		   							<tr>
		   								<td colspan="2" align="center">작성된 게시글이 없습니다</td>
		   							</tr>
		   							<tr>
		   								<td>라면</td>
		   								<td>750kcal</td>
		   							</tr>
		   							<tr>
		   								<td>부대찌개</td>
		   								<td>1200kcal</td>
		   							</tr>
		   							<tr>
		   								<td>아이스크림</td>
		   								<td>450kcal</td>
		   							</tr>
		   							<tr>
		   								<td>삼겹살</td>
		   								<td>1250kcal</td>
		   							</tr>
		   						</table>
		   						<br/>
		   						<div class="form-group" align="right">
		   							<button id="writefood" type="button" class="btn btn-info">추가작성</button>
		   							<button id="updatefood" type="button" class="btn btn-info">수정</button>
		   							<button id="deletefood" type="button" class="btn btn-info">삭제</button>
		   						</div>
							</div>
							<div class="tab-pane fade" id="weight" role="tabpanel" aria-labelledby="weight-tab">
							</div>
						</div>
                       	
                       
	                </div>
	  			</div>   
			</div>
	   	</div>    	
	</div>
	<!-- 모달끝 -->

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->