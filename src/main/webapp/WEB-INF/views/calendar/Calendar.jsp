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
	.align{
		padding: 100px;
		
	}
	table {
	    width: 100%;
	    border-top: 1px solid #444444;
	    border-collapse: collapse;
 	}
  	th, td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
  	}
</style>
<script>
	
	$(function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	height: "1000px",
	    	initialView: 'dayGridMonth',
	    	locale:'ko',
	    	aspectRatio: 1.5,
	    	dateClick: function(info) {
            	console.log(info);
            	console.log(info.dateStr);
            	var date = info.dateStr;
            	$('#date').html(date);
            	$('#modaltest').modal('show');
	     	},
	     	events:[{
	     		title:"등운동",
	     		start:"2021-12-10"
   			},{
	     		title:"팔운동",
	     		start:"2021-12-11"
   			},{
	     		title:"어깨운동",
	     		start:"2021-12-12"
   			}]
	    });
	    calendar.render();
	    $(document).mouseover(function(){
	    	$('.fc-daygrid-day-frame').css('cursor','pointer');
	    });
    });
</script>

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
	<div class="modal fade" id="modaltest" data-backdrop="static">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
	   		<div class="modal-content">  
	   		  				
	   			<div class="modal-header">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>   					
					<h3 id="date" class="modal-title">날짜</h3>
	  				<h4>운동 기록</h4>
	  			</div>
	  				
	  			<div class="modal-body">
                       	<form class="form-inline" id="passwordForm" method="post" action="<c:url value="/dataroom/Password.kosmo"/>">
	   						<table>
	   							<tr>
	   								<td>부위</td>
	   								<td>운동종류</td>
	   								<td>무게</td>
	   								<td>횟수</td>
	   							</tr>
	   							<tr>
	   								<td>등</td>
	   								<td>바벨 로우</td>
	   								<td>40kg</td>
	   								<td>4세트</td>
	   							</tr>
	   							<tr>
	   								<td>등</td>
	   								<td>렛풀다운</td>
	   								<td>80kg</td>
	   								<td>4세트</td>
	   							</tr>
	   							<tr>
	   								<td>등</td>
	   								<td>시티드 로우</td>
	   								<td>45kg</td>
	   								<td>4세트</td>
	   							</tr>
	   							<tr>
	   								<td>등</td>
	   								<td>티바 로우</td>
	   								<td>20kg</td>
	   								<td>4세트</td>
	   							</tr>
	   							<tr>
	   								<td>등</td>
	   								<td>케이블 암풀다운</td>
	   								<td>15kg</td>
	   								<td>4세트</td>
	   							</tr>
	   						</table>
	   						<br/>
	   						<div class="form-group">
	   							<input type="submit" class="btn btn-info" value="추가작성"/>
	   						</div>
	   					</form>
	                </div>
	  			</div>   
			</div>
	   	</div>    	
	</div>
	<!-- 모달끝 -->

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->