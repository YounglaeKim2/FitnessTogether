<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->
<body data-bs-spy="scroll" data-bs-target="#navbarExample">
	
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
                        <div class="portfolio-item" onclick="ADD(1)">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-question-circle fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="<c:url value="/resources/images/mapping/Verification1.png"/>" alt="..." />
                            </a>
                            <div id="portfolio1" class="portfolio-caption">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-6 mb-6">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item" onclick="ADD(2)">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid" src="<c:url value="/resources/images/mapping/Verification2.png"/>" alt="..." />
                            </a>
                            <div id="portfolio2" class="portfolio-caption">
                            </div>
                        </div>
                    </div>
                    
					<div class="row">
						<div class="text-center">
						
							<span id="nowPolling"></span>
							
							<div id="AAD" class="text-center"></div>
						</div>
					</div>
					
                    
                    
                    
                </div>
            </div>
        </section>
	
	
	<div class="modal fade" id="dataList" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
	   		<div class="modal-content">  
	   			<div class="modal-header">
					 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="javascript:$(document).off();"></button>   					
	  				 <h3 id="modaltitle" class="modal-title"></h3>
	  			</div>
	  			<div id ="modalcontent" class="modal-body">
                </div>
				<div id="modalfooter" class="modal-footer">		
				</div>
  			</div>   
		</div>
   	</div>    	
	
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f36fde54b477984a8366d99dbc1380ca"></script>
		<script>
			$.ajax({
				url:'<c:url value="/fnt/selectVerification.do"/>',
				data:{"id":"${sessionScope.id}"},
				dataType:"json",
				type:"post"
			}).done(function(data){
				successVerificationAjax(data,'portfolio');
			});

			var successVerificationAjax = function(data,id){
				var count=0;
					console.log(data);
				if(data.length != 0){
				    $.each(data,function(index,item){
				    	var divString='<div id="verification'+ ++count +'" class="portfolio-caption-heading">'+item["LOCATION"]+'</div>';
				    	divString+='<input type="hidden" name="no'+count+'" value="'+item["NO"]+'"/>';
					    $('#'+id+count).html(divString);
				    });
				}
				for (var i = count; i < 2; i++) {
					console.log(count);
					var divString='<div id="verification'+ ++count +'" class="portfolio-caption-heading">+</div>';
					$('#'+id+count).html(divString);
				}
				
			};
		
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
			    $('#'+id).html(divString);
				console.log($("#now > strong").text())
				
			};
			
			function ADD(num) {
				var divString="";
				console.log($('#portfolio'+num).text());
				if($('#portfolio'+num).text() === '+'){
					divString+='<div class="container">';
					divString+='<div class="row justify-content-start">';
					divString+='<div class="col-10"><input type="text" name="searchAddress" class="form-control"/></div>'
					divString+='<button type="button" id="searchAdd" class="btn btn-primary col-2">검색</button></div></div>'
					divString+='<span id="polling"></span>'
					divString+='<div class="row justify-content-center">';
					divString+='<button type="button" id="verificationBtn" class="btn btn-primary col-2">인증</button></div>';
				}
				else{
					divString="<div id='choice'>선택한 위치는 <strong>"+$('#portfolio'+num).text()+"</strong> 입니다.</div>";
					divString+='<div class="row justify-content-center">';
				    divString+='<button type="button" id="deleteBtn" class="btn btn-primary col-2">삭제</button></div>';
				}
			    $('#AAD').html(divString);
				

				$('#searchAdd').click(function(){
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

				$('#verificationBtn').click(function(){
					$.ajax({
						url:"<c:url value="/fnt/VerificationCheck.do"/>",
						data:{"id":"${sessionScope.id}","now":$("#now > strong").text(),"choice":$("#choice > strong").text(),"portfolio1":$('#portfolio1').text()},
						dataType:"json",
						type:'post'
					}).done(function(data){
						var modelBody="<h4>"+data.text+"</h4>";
						var modelFooter = "";
						if(data.SOF==="success"){
							modelFooter += '<button id="btnform" class="btn btn-info">확인</button>';
						}
						$('#modalcontent').html(modelBody);
						$('#modalfooter').html(modelFooter);
						$('#dataList').modal('show');

						$('#btnform').click(function(){
							$.ajax({
								url:"<c:url value="/fnt/insertVerification.do"/>",
								data:{"id":"${sessionScope.id}","location":$("#choice > strong").text()},
								dataType:"text",
								type:'post'
							}).done(function(data){
								location.href='<c:url value="/fnt/Verification.do"/>';
							}).fail(function(req,error){
								console.log(req)
							});
						});
					}).fail(function(req,error){
						console.log(req)
					});
				});
				$('#deleteBtn').click(function(){
					var modelBody="<h4>정말로 삭제하시겠습니까?</h4>";
					var modelFooter = '<button id="btnform" class="btn btn-info">확인</button>';
					$('#modalcontent').html(modelBody);
					$('#modalfooter').html(modelFooter);
					$('#dataList').modal('show');
					$('#btnform').click(function(){
						$.ajax({
							url:"<c:url value="/fnt/deleteVerification.do"/>",
							data:{"no":$("input[name=no"+num+"]").val()},
							dataType:"text",
							type:'post'
						}).done(function(data){
							location.href='<c:url value="/fnt/Verification.do"/>';
						}).fail(function(req,error){
							console.log(req)
						});
					});
				});
			}


			
	
		</script>
	
	
	
	
	
	
</body>
<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->