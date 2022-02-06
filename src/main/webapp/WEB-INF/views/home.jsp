<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->
<style>
a {
  color: black;
  text-decoration: underline;
}
</style>
<body data-bs-spy="scroll" data-bs-target="#navbarExample">

	<main>
	<div class="container">
		<div id="myCarousel" class="carousel slide pointer-event" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
				<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
				<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="3" aria-label="Slide 4" class=""></button>
				<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="4" aria-label="Slide 5" class=""></button>
		    </div>
		    <div class="carousel-inner">
				<div class="carousel-item active">
					<img src="<c:url value="/resources/images/mapping/FT1.jpg"/>" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></img>
					<div class="container">
						<div class="carousel-caption text-start">
							<h1 style="color:white;">Fitness Together</h1>
		            		<p>Welcome to the Fitness Together. Build up healthy body with us.</p>
		          		</div>
		        	</div>
				</div>
				
		      <div class="carousel-item">
		        <img src="<c:url value="/resources/images/mapping/FT3.jpg"/>" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></img>
		
		        <div class="container">
		          <div class="carousel-caption">
		            <h1 style="color:white;">Sport Mate</h1>
		          </div>
		        </div>
		      </div>
		      
		      <div class="carousel-item">
		        <img src="<c:url value="/resources/images/mapping/FT2.jpg"/>" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></img>
		
		        <div class="container">
		          <div class="carousel-caption">
		            <h1 style="color:white;">Management</h1>
		          </div>
		        </div>
		      </div>
		      
		      <div class="carousel-item">
		        <img src="<c:url value="/resources/images/mapping/FT4.jpg"/>" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></img>
		
		        <div class="container">
		          <div class="carousel-caption">
		            <h1 style="color:white;">Record</h1>
		          </div>
		        </div>
		      </div>
		      
		      
		      <div class="carousel-item">
		        <img src="<c:url value="/resources/images/mapping/FT5.jpg"/>" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></img>
		
		        <div class="container">
		          <div class="carousel-caption text-end">
		            <h1 style="color:white;">Your Place</h1>
		          </div>
		        </div>
		      </div>
		      
		      
		    </div>
			<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div class="container marketing">
    <hr class="featurette-divider">
    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading"><a class="nav-link" href="<c:url value="/fnt/mappingList.do"/>">Perching.</a><h4 style="color:gray;"> person matching system</h4></h2>
        <p class="lead">퍼칭기능을 통해 새로운 운동메이트를 만나 함께 운동해 보세요</p>
      </div>
      <div class="col-md-5">
      	<a class="nav-link" href="<c:url value="/fnt/mappingList.do"/>">
        <img src="<c:url value="/resources/images/mapping/FT3.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect></img>
		</a>
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading"><a class="nav-link"href="<c:url value="/fnt/calendar.do"/>">Calendar.</a><h4 style="color:gray;"> schedule, measure and record</h4></h2>
        <p class="lead">캘린더기능을 통해 계획, 측정 그리고 기록하면서 운동하세요</p>
      </div>
      <div class="col-md-5 order-md-1">
      	<a class="nav-link" href="<c:url value="/fnt/calendar.do"/>">
        <img src="<c:url value="/resources/images/mapping/FT2.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect></img>
		</a>
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading"><a class="nav-link" href="<c:url value="/fnt/sfHome.do"/>"> Facilities </a><h4 style="color:gray;"> find your place</h4></h2>
        <p class="lead">내 주변의 운동시설을 찾아보세요</p>
      </div>
      <div class="col-md-5">
      	<a class="nav-link" href="<c:url value="/fnt/sfHome.do"/>">
        <img src="<c:url value="/resources/images/mapping/FT1.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect></img>
		</a>
      </div>
    </div>

    <hr class="featurette-divider">
    
    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading"><a class="nav-link" href="<c:url value="/fnt/TeachableMachine.do"/>"> Calorie Calculator </a><h4 style="color:gray;"> check how much calorie you got with photos</h4></h2>
        <p class="lead">섭취한 음식의 칼로리를 알아보세요.</p>
      </div>
      <div class="col-md-5 order-md-1">
      	<a class="nav-link" href="<c:url value="/fnt/TeachableMachine.do"/>">
        <img src="<c:url value="/resources/images/mapping/FT6.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect></img>
		</a>
      </div>
    </div>

    <hr class="featurette-divider">
    
    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading"><a class="nav-link" href="javascript:void(0);" onclick="searchVideo();">Video.</a><h4 style="color:gray;"> learn exercise through videos</h4></h2>
        <p class="lead">동영상으로 운동을 배워요</p>
      </div>
      <div class="col-md-5">
      	<a class="nav-link" href="javascript:void(0);" onclick="searchVideo();">
        	<img src="<c:url value="/resources/images/mapping/FT8.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect></img>
		</a>
      </div>
    </div>

    <hr class="featurette-divider">
    
    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading"><a class="nav-link" href="<c:url value="/fnt/proteinList.do"/>">Protein.</a><h4 style="color:gray;"> check protein at once</h4></h2>
        <p class="lead">가장 인기있는 프로틴은 무엇일까요.</p>
      </div>
      <div class="col-md-5 order-md-1">
      	<a class="nav-link" href="<c:url value="/fnt/proteinList.do"/>">
        <img src="<c:url value="/resources/images/mapping/FT7.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect></img>
		</a>
      </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->

	<!-- 유튜브 검색 모달 시작 -->
	<div class="modal fade" id="searchModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					<div><span style="font-size: 35px;font-weight: bold;">운동영상 검색</span></div>  
					<div class="col-md-6">
						<div class="input-group">
							<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16"><path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path></svg></span>
							<input type="text" id="searchWord" name="searchWord" class="form-control" placeholder="검색하실 운동명을 입력해주세요" onKeypress="javascript:if(event.keyCode==13){search();event.preventDefault();}"/>
							<input type="button" id="searchBtn" class="btn btn btn-info" value="검색" onkeyup="if(window.event.keyCode==13){javascropt:search()}"/>
						</div>
						
					</div>
				</div>
				<div class="modal-body" >
					<div id="videos" style="display: inline-block;"></div>
					<br/>
					<div id="playvideo" align="center" style="margin-top: 25px"><span style="font-size: 2em;font-weight: bold;">검색된 결과가 없습니다</span></div>				
					<br/>
					<div align="right">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>


  <!-- FOOTER -->
  <footer class="container">
    <p class="float-end"><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-shift-fill" viewBox="0 0 16 16">
  <path d="M7.27 2.047a1 1 0 0 1 1.46 0l6.345 6.77c.6.638.146 1.683-.73 1.683H11.5v3a1 1 0 0 1-1 1h-5a1 1 0 0 1-1-1v-3H1.654C.78 10.5.326 9.455.924 8.816L7.27 2.047z"/>
</svg></a></p>
    <p>© Fitness Together, Inc.</p>
  </footer>
</main>
</body>
<script>
 
	function searchVideo(){
			$('#searchModal').modal('show');
	}
 
 $(function(){
	 
	 function search(){
			var keyword = $('#searchWord').val()
			$.ajax({
				url:'http://127.0.0.1:10000/youtube/'+keyword
			}).done(function(data){
				$('#playvideo').html("");
				$('#videos').html("");
				data = JSON.parse(data);
				var divs ="";
				
				$.each(data,function(index,element){
					var num = index+1
					divs += "<a href='jaavscript:void(0);' id='play"+num+"'><img style='width: 230px; height: 130px; margin-right: 25px;' src='"+element['img']+"' data-link='"+element['link']+"' data-width='560' data-height='315'/></a>"
					
					$(document).on("click",'#play'+num,function(){
						$('#playvideo').html("");
						$('#playvideo').html(element['link']);
					});
				});
				divs += "<br/>"
				
				$('#videos').html(divs);
				$('#searchWord').val("");
				
				
				
			});
		}

	 
	 	
		
	 
		$('#searchModal').on('hidden.bs.modal',function(){
			$('#videos').html("");
			$('#searchWord').val("");
			$('#playvideo').html("<span style='font-size: 2em;font-weight: bold;'>검색된 결과가 없습니다</span>");
		});
		
		//검색버튼 클릭시
		$('#searchBtn').click(function(){
			if($('#searchWord').val() == ""){
				alert("검색어를 입력해주세요");
				return
			}
			search();
		});
		
		$('#searchWord').on('keydown',function(){
			if(event.keyCode === 13) {
	        	event.preventDefault(); // 엔터키로 submit 하는거 막기
	        	if($('#searchWord').val() == ""){
	    			alert("검색어를 입력해주세요");
	    			return
	    		}
	        	search();
		    }
			
		});
	 
 });

</script>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->
