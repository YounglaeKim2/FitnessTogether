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
		url:'<c:url value="/fnt/showCalendarf.do"/>',
		data:{"id":"${sessionScope.id}"},
		dataType:"json",
		type:"post"
	}).done(function(fdate){
		
		$.ajax({
			url:'<c:url value="/fnt/showCalendarw.do"/>',
			data:{"id":"${sessionScope.id}"},
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
			events = [...new Set(events.map(JSON.stringify))].map(JSON.parse);
			
			
			console.log(fdate);
			var food = fdate.map(function(item){
				return {
					title : "식단 기록",
					start : item["POSTDATE"],
					color: "aqua",
					textColor: "black"
				}
			});
			console.log(food);
			food = [...new Set(food.map(JSON.stringify))].map(JSON.parse);
			console.log(food);
			for(var i=0;i<food.length;i++){
				events.push(food[i]);
			}
			
			console.log(events);
			
		    var calendarEl = document.getElementById('calendar');
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		    	height: 900,
		    	dayMaxEvents: true,
		    	initialView: 'dayGridMonth',
		    	locale:'ko',
		    	aspectRatio: 1.5,
		    	headerToolbar: {
		    		left: 'prevYear,nextYear',
		    		right: 'prev,next today',
		    		center: 'title'
	    		},
		    	dateClick: function(info) {
		    		
		    		$('#food-tab').click(); 
		    		
	            	date = info.dateStr;
	            	$('#date').html(date);
	            	$('#modaltest').modal('show');
	            	
	            	$.ajax({
		            	url:'<c:url value="/fnt/showFood.do"/>',
		            	data:{"id":"${sessionScope.id}","postdate":date},
		            	dataType:"json",
		            	type:"post"
		            }).done(function(data){
		            	var list = "<form class='form-control' action='<c:url value="/fnt/deleteFood.do"/>' method='post' id='foodform'><table class='table'>";
	            		list += "<tr><th><input type='checkbox' id='all_'/></th><th>식품이름</th><th>1회 제공량</th><th>열량(kcal)</th><th>탄수화물(g)</th><th>단백질(g)</th><th>지방(g)</th></tr>"
	            		if(data.length ==0){
	            			list += "<tr><td colspan='7' align='center'>작성된 게시글이 없습니다</td></tr>";
	            		}
	            		var totalkcal = 0;
	            		var totaltan = 0;
	            		var totaldan = 0;
	            		var totalgi = 0;
	            		$.each(data,function(index,element){
	            			list += "<tr><td><input type='checkbox' name='f_no' value='"+element['F_NO']+"'/></td><td>"+element['F_NAME']+"</td><td>"+element['F_SIZE']+" g</td><td>"+element['F_KCAL']+" kcal</td><td>"+element['F_TAN']+" g</td><td>"+element['F_DAN']+" g</td><td>"+element['F_GI']+" g</td></tr>";
	            			totalkcal += element['F_KCAL'];
	            			totaltan += element['F_TAN'];
	            			totaldan += element['F_DAN'];
	            			totalgi += element['F_GI'];
	            		});
	            		list += "<tr style='background-color: aqua; font-weight:bold;'><td colspan='2' style='text-align: center;'>종합 섭취량<td><td>"+totalkcal+" kcal</td><td>"+totaltan+" g</td><td>"+totaldan+" g</td><td>"+totalgi+" g</td></tr>"
		            	list += "</table>";
		            	list += "<br/><div class='form-group' align='right'><button id='writefood' type='button' class='btn btn-info'>추가작성</button> <button id='deletefood' type='button' class='btn btn-info'>삭제</button></form></div>";
		            	$('#food').html(list);
		            	
		            	$('#writefood').click(function(){
	 	           			location.href='<c:url value="/fnt/writefood.do"/>'+"?date="+date;;
	 	           		});
		            	
		            	$('#deletefood').click(function(){
	           		    	if($(':checkbox:checked').length ==0) {
	       		    			alert("삭제할 내용이 없습니다")
	       		    			return;
	       		    		}
	           		    	if(confirm('정말로 삭제하시겠습니까?')){
	           		    		$('#foodform').submit();
	           		    	}
	           		    });
		            	
	           		    $('#foodform :checkbox').on('click',function(){
	            	        if($(this).prop('id') == $('#all_').prop('id')){
	            	        	if($(this).prop('checked')){
	            	        		$('#foodform :checkbox:gt(0)').each(function(){
	            	        			$(this).prop('checked',true);
	            	        		});
	            	        	}
	            	        	else{ 
	            	        		$('#foodform :checkbox:gt(0)').each(function(){
	            	        			$(this).prop('checked',false);
	            	        		});
	            	        	}
	            	        }
	            	        else{
	            	        	if($(this).prop('checked')){
	            	        		if($('#foodform :checkbox:gt(0)').length == $('#foodform :checkbox:checked').length){
	            	        			$('#foodform :checkbox:first').prop('checked',true);
	            	        		}
	            	        	}
	            	        	else{ // 해제한 경우
	            	        		$('#foodform :checkbox:first').prop('checked',false);
	            	        	}
	            	        }
	            	  	});
		            });
	            	
	        		$.ajax({
		            	url:'<c:url value="/fnt/showWeight.do"/>',
		            	data:{"id":"${sessionScope.id}","postdate":date},
		            	dataType:"json",
		            	type:"post"
	 	            }).done(function(data){
	 	            	var list = "<form class='form-control' action='<c:url value="/fnt/deleteweight.do"/>' method='post' id='weightform'><table  class='table'>";
	 	            	list += "<tr><th><input id='all' type='checkbox' /></th><th scope=\"col\">부위</th><th scope=\"col\">운동종류</th><th scope=\"col\">무게</th><th scope=\"col\">횟수</th></tr>";
	 	            	if(data.length ==0){
	 	            		list += "<tr><td colspan='6' align='center'>작성된 게시글이 없습니다</td></tr>";
	 	            	}
	 	         
	 	            	$.each(data,function(index,element){
	 	            		list += "<tr><td><input type='checkbox' name='w_no' value='"+element['W_NO']+"'/></td><td>"+element['TYPE']+"</td><td>"+element['NAME']+"</td><td>"+element['KG']+"</td><td>"+element['COUNT']+"</td></tr>";
	 	            	});
	 	            		
	 	           		list += "</table>";
	 	           		list += "<br/><div class='form-group' align='right'><button id='writeweight' type='button' class='btn btn-info'>추가작성</button> <button id='deleteweight' type='button' class='btn btn-info'>삭제</button></form></div>";
	 	           			
	 	            	$('#weight').html(list);
	 	           		
	 	           		$('#writeweight').click(function(){
	 	           			location.href='<c:url value="/fnt/writeweight.do"/>'+"?date="+date;
	 	           		});
	 	           		    
	 	           		$('#deleteweight').click(function(){
	 	           			if($(':checkbox:checked').length ==0) {
	 	       		    		alert("삭제할 내용이 없습니다")
	 	       		    		return;
	 	       		    	}
	 	           		    if(confirm('정말로 삭제하시겠습니까?')){
	 	           		    	$('#weightform').submit();
	 	           		    }
	 	           		});
	 	           		    
	 	     		    $('#weightform :checkbox').on('click',function(){
	 	        		 	if($(this).prop('id') == $('#all').prop('id')){
	 	        		 		if($(this).prop('checked')){
	 	        		 			$('#weightform :checkbox:gt(0)').each(function(){
	 	        		 				$(this).prop('checked',true);
	 	        		 			});
	 	        		 		}
	 	        		 		else{
	 	        		 			$('#weightform :checkbox:gt(0)').each(function(){
	 	        		 				$(this).prop('checked',false);
	 	        		 			});
	 	        		 		}
	 	        		 	}
	 	        		 	else{
	 	        		 		if($(this).prop('checked')){
	 	        		 			if($('#weightform :checkbox:gt(0)').length == $('#weightform :checkbox:checked').length){
	 	        		 				$('#weightform :checkbox:first').prop('checked',true);
	 	        		 			}
	 	        		 		}
	 	        		 		else{
	 	        		 			$('#weightform :checkbox:first').prop('checked',false);
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
	
});
</script>



    <div class="container" style="padding-top: 50px; padding-bottom: 40px;">
        <div class="row">
            <div id='calendar'></div>
        </div> <!-- end of row -->
    </div> <!-- end of container -->
    
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
								<button class="nav-link active" id="food-tab" data-bs-toggle="tab" data-bs-target="#food" type="button" role="tab" aria-controls="food" aria-selected="true">섭취 칼로리</button>
							</li>
							<li class="nav-item" role="presentation">
								<button class="nav-link" id="weight-tab" data-bs-toggle="tab" data-bs-target="#weight" type="button" role="tab" aria-controls="weight" aria-selected="false">운동일지</button>
							</li>
						</ul>
						<br/>
                       	<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="food" role="tabpanel" aria-labelledby="food-tab">
							</div>
							<div class="tab-pane fade" id="weight" role="tabpanel" aria-labelledby="weight-tab">
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