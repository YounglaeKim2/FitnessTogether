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
        <h2 class="featurette-heading">Video.<h4 style="color:gray;"> learn exercise through videos</h4></h2>
        <p class="lead">동영상으로 운동을 배워요</p>
      </div>
      <div class="col-md-5">
        <img src="<c:url value="/resources/images/mapping/FT8.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect></img>

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


  <!-- FOOTER -->
  <footer class="container">
    <p class="float-end"><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-shift-fill" viewBox="0 0 16 16">
  <path d="M7.27 2.047a1 1 0 0 1 1.46 0l6.345 6.77c.6.638.146 1.683-.73 1.683H11.5v3a1 1 0 0 1-1 1h-5a1 1 0 0 1-1-1v-3H1.654C.78 10.5.326 9.455.924 8.816L7.27 2.047z"/>
</svg></a></p>
    <p>© Fitness Together, Inc.</p>
  </footer>
</main>
</body>
<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->
