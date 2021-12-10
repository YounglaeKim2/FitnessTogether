<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html lang="ko">
<html>
<head>
<meta charset='utf-8' />
<title>연습용</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales/ko.js"></script>
<script>
	
	var test = [{
			title:'테스트1',
			start:'2021-12-08T20:13:00'
	},{
			title:'테스트2',
			start:'2021-12-08T22:13:00',
			end:'2021-12-09T22:13:00'
	},{
			title:'테스트3',
			start:'2021-12-01T22:13:00',
			end:'2021-12-02T22:13:00'
	},{
			title:'아무거나들어갑니다',
			start:'2021-12-09',
			end:'2021-12-11'
	},{
			title:'클릭테스트',
			start:'2021-12-03T22:13:00'
	},{
			title:'클릭테스트',
			start:'2021-12-04T22:13:00'
	},{
			title:'클릭테스트',
			start:'2021-12-25T22:13:00',
			backgroundColor:'blue',
			url:"https:www.naver.com"
	}]
	
	
	$(function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	initialView: 'dayGridMonth',
	    	locale:'ko',
	    	aspectRatio: 1.5,
	    	dateClick: function(info) {
            	//alert(info.dateStr);
            	//location.href="https://www.naver.com?date="+info.dateStr;
            	console.log(info);
            	console.log(info.dateStr);
            	$('#modaltest').modal('show');
	     	},
	     	events:test
	    });
	    calendar.render();
	    $(document).mouseover(function(){
	    	$('.fc-daygrid-day-frame').css('cursor','pointer');
	    });
    });
</script>
<style>
	.align{
		padding: 100px;
		
	}
</style>
</head>
<body>
	<div class="align">
		<div id='calendar'></div>
	</div>	
	
	<!-- 모달 작성 -->
	<div class="modal fade" id="modaltest" data-backdrop="static">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
	   		<div class="modal-content">  
	   		  				
	   			<div class="modal-header">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>   					
					<h4 class="modal-title">일지 입력</h4>
	  			</div>
	  				
	  			<div class="modal-body">
	                <div role="tabpanel">
	                    <!-- Nav tabs -->
	                    <ul class="nav nav-tabs" role="tablist">
	                        <li role="presentation" class="active">
		                        <a href="#food" aria-controls="uploadTab" role="tab" data-toggle="tab">
		                        	Food
		                        </a>
	                        </li>
	                        <li role="presentation">
		                        <a href="#weight" aria-controls="browseTab" role="tab" data-toggle="tab">
		                        	Weight
		                        </a>
	                        </li>
	                    </ul>
	                    <!-- Tab panes -->
	                    <div class="tab-content">
	                        <div role="tabpanel" class="tab-pane active" id="food">
								<form class="form-inline" id="passwordForm" method="post" action="<c:url value="/dataroom/Password.kosmo"/>">
			   						<div class="form-group">
			   							<div style="margin-top: 10px">식단</div>
			   							<input type="text" class="form-control" name="password" placeholder="식단을 입력하세요"/>
			   						</div>
			   						<div class="form-group"	>
			   							<input type="submit" class="btn btn-info" value="확인"/>
			   						</div>
			   					</form>
							</div>
	                        <div role="tabpanel" class="tab-pane" id="weight">
	                        	<form class="form-inline" id="passwordForm" method="post" action="<c:url value="/dataroom/Password.kosmo"/>">
			   						<div class="form-group">
			   							<div style="margin-top: 10px" >운동횟수</div>
			   							<input type="text" class="form-control" name="password" placeholder="운동횟수를 입력하세요"/>
			   						</div>
			   						<br/>
			   						<div class="form-group">
			   							<div style="margin-top: 10px" >운동횟수</div>
			   							<input type="text" class="form-control" name="password" placeholder="운동횟수를 입력하세요"/>
			   						</div>
			   						<br/>
			   						<div class="form-group">
			   							<div style="margin-top: 10px" >운동횟수</div>
			   							<input type="text" class="form-control" name="password" placeholder="운동횟수를 입력하세요"/>
			   						</div>
			   						<br/>
			   						<div class="form-group">
			   							<div style="margin-top: 10px" >운동횟수</div>
			   							<input type="text" class="form-control" name="password" placeholder="운동횟수를 입력하세요"/>
			   						</div>
			   						<br/>
			   						<div class="form-group">
			   							<input type="submit" class="btn btn-info" value="확인"/>
			   						</div>
			   					</form>
	                        </div>
	                    </div>
	                </div>
	  			</div>   
			</div>
	   	</div>    	
	</div>
	<!-- 모달끝 -->
</body>	
</html>