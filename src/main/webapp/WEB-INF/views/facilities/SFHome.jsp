<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->
<style>
a {
  color: black;
}
</style>
<body>
<div class="container px-4 py-5" id="featured-3">
	<h1 class="pb-2 border-bottom">Sports Facilities<h4>이벤트를 개최할 장소를 찾아요!!</h4></h1>
  
</div>
<div class="container marketing">

	<hr class="featurette-divider">
	
	<div class="row featurette">
		<div class="col-md-7">
			<h2 class="featurette-heading">헬스장<span class="text-muted">헬스장</span></h2>
			<p class="lead">헬스장</p>
		</div>
		<div class="col-md-5">
	        <a href="<c:url value="/fnt/findGym.do"/>">
	        <img src="<c:url value="/resources/images/facilities/SF_Gym.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></img>
			</a>
		</div>
    </div>
    
    <hr class="featurette-divider">
	
	<div class="row featurette">
		<div class="col-md-7 order-md-2">
			<h2 class="featurette-heading">수영장<span class="text-muted">수영장</span></h2>
			<p class="lead">수영장</p>
		</div>
		<div class="col-md-5">
	        <a href="<c:url value="/fnt/findSwimmingPool.do"/>">
	        <img src="<c:url value="/resources/images/facilities/SF_Swimming.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></img>
			</a>
		</div>
    </div>
    
    <hr class="featurette-divider">
	
	<div class="row featurette">
		<div class="col-md-7">
			<h2 class="featurette-heading">필라테스<span class="text-muted">수영장</span></h2>
			<p class="lead">필라테스</p>
		</div>
		<div class="col-md-5">
	        <a href="<c:url value="/fnt/findPilates.do"/>">
	        <img src="<c:url value="/resources/images/facilities/SF_Pilates.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></img>
			</a>
		</div>
    </div>
    
    <hr class="featurette-divider">
	
	<div class="row featurette">
		<div class="col-md-7 order-md-2">
			<h2 class="featurette-heading">요가<span class="text-muted">요가</span></h2>
			<p class="lead">요가</p>
		</div>
		<div class="col-md-5">
	        <a href="<c:url value="/fnt/findYoga.do"/>">
	        <img src="<c:url value="/resources/images/facilities/SF_Yoga2.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></img>
			</a>
		</div>
    </div>
    

    
    
    

</div>
</body>
<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->
