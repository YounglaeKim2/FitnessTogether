<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->
<body data-bs-spy="scroll" data-bs-target="#navbarExample">
	
	<div class="container">
	
		<div class="page-header">
			<h1>
				우리 동네 인증
			</h1>
		</div>
		<!-- 검색용 UI -->
		<div class="row">
			<div class="text-center">
				<button type="button" name="verification1" class="btn btn-primary">+</button>
				<button type="button" name="verification2" class="btn btn-primary">+</button>
			</div>
			<div class="text-center">
			
				<span id="nowPolling"></span>
				<div class="text-center">
					<input type="text" name="searchAddress" class="form-control" />
					<button type="button" id="searchAddr" class="btn btn-primary">검색</button>
				</div>
				<span id="polling"></span>
				<form class="form-inline" method="POST"
					action="<c:url value='/fnt/Verification.do'/>">
					<button type="submit" class="btn btn-primary">인증</button>
					<input type="hidden" name="latitude" value="1">
					<input type="hidden" name="longitude" value="2">
					<input type="hidden" name="cityAddress" value="3">
				</form>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f36fde54b477984a8366d99dbc1380ca"></script>
		<script>
			var latitude = document.getElementsByName("latitude")[0];
			var longitude = document.getElementsByName("longitude")[0];
			if (navigator.geolocation) {
				//브라우저의 geolocation 지원 여부 판단
	
				//PositionOptions객체 설정용]
				var options = {
					timeout : 3000,
					maximumAge : 5000
				};
				//현재 위치 정보를 한번만 얻기
				navigator.geolocation.getCurrentPosition(successCallback);
			}
			//현재 위치를 성공적으로 수신시 자동으로 호출되는 콜백함수
			function successCallback(position) {
				var lat = position.coords.latitude;
				var lng = position.coords.longitude;
				latitude.value=lat;
				longitude.value=lng;
				console.log("latitude : %s longitude : %s",lat,lng);
				
				$.ajax({
					url:"<c:url value="/fnt/nowAddress.do"/>",
					data:'latitude='+lat+'&longitude='+lng,
					dataType:'text',
					type:'get',
					success:function(data){successNowAjax(data,'nowPolling');},
					error:function(error){//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
						console.log('%O',error);
						console.log('에러:',error.responseText);
					}
				});
			}
			var successNowAjax = function(data,id){
				console.log('서버로부터 받은 데이타:%O,타입:%s',data,typeof data);
			    var divString="<div id='now'>현재 위치는 <strong>"+data+"</strong> 입니다.</div>";
			    divString+="<input type='hidden' name='nowaddr' value="+data+">"
			    $('#'+id).html(divString);
			};
			
			$('#searchAddr').click(function(){
				$.ajax({
					url:"<c:url value="/fnt/SearchAddress.do"/>",
					data:'searchAddress='+$("input[name=searchAddress]").val(),
					type:'get',
					dataType:'json',
					success:function(data){successAjax(data,'polling');},
					error:function(error){//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
						console.log('%O',error);
						console.log('에러:',error.responseText);
					}
				});
			});
	
			var successAjax = function(data,id){
				console.log('서버로부터 받은 데이타:%O,타입:%s',data,typeof data);
			    var tableString="<table class='table table-bordered'>";
			    tableString+="<tr>";
			    tableString+="<th>찾는 위치</th>";
			    tableString+="</tr>";
			    $.each(data,function(index,item){
			    	tableString+="<tr>";
			    	tableString+="<td><a href='#' id='choice"+item["no"]+"'>"+item["AddressName"]+"</a></td>";
			    	tableString+="</tr>"
			    	
			    	$(document).on('click','#choice'+item["no"],function(){
					    var divString="<div id='choice'>선택한 위치는 <strong>"+item["AddressName"]+"</strong> 입니다.</div>";
					    $('#'+id).html(divString);
			    	});
			    	
			    });
			    tableString+="</table>";
			    $('#'+id).html(tableString);
			};
			
	
		</script>
	</div>
	
	
	<!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">인증 페이지 입니다</h2>
                    <h3 class="section-subheading text-muted">인증 페이지 입니다</h3>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-sm-6 mb-6">
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-question-circle fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="<c:url value="/resources/images/mapping/Verification1.png"/>" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">인증지역1</div>
                                <div class="portfolio-caption-subheading text-muted">Illustration</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-6 mb-6">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="<c:url value="/resources/images/mapping/Verification2.png"/>" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">인증지역2</div>
                                <div class="portfolio-caption-subheading text-muted">Graphic Design</div>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                </div>
            </div>
        </section>
	
	
	
	
	
	
	
</body>
<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->