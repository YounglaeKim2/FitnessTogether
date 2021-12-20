<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->

    <!-- Header -->
	    <div class="container">
	      <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	        <div class="carousel-inner">
	          <div class="carousel-item active">
	            <img src="<c:url value="/resources/images/mapping/FT1.jpg"/>" class="d-block w-100" alt="...">
	          </div>
	          <div class="carousel-item">
	            <img src="<c:url value="/resources/images/mapping/FT2.jpg"/>" class="d-block w-100" alt="...">
	          </div>
	          <div class="carousel-item">
	            <img src="<c:url value="/resources/images/mapping/FT3.jpg"/>" class="d-block w-100" alt="...">
	          </div>
	        </div>
	        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
	          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	          <span class="visually-hidden">Previous</span>
	        </button>
	        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
	          <span class="carousel-control-next-icon" aria-hidden="true"></span>
	          <span class="visually-hidden">Next</span>
	        </button>
	      </div>
	    </div>
        <div class="container">
	        <div class="row">
	            <div class="col-md-4">
	                <div class="card" style="width: 100%">
	                    <img src="<c:url value="/resources/images/mapping/FT1.jpg"/>" class="card-img-top" alt="...">
	                    <div class="card-body">
	                      <h5 class="card-title">Card title</h5>
	                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                      <a href="#" class="btn btn-primary">Go somewhere</a>
	                    </div>
	                  </div>
	            </div>
	            <div class="col-md-4">
	                <div class="card" style="width: 100%">
	                    <img src="<c:url value="/resources/images/mapping/FT2.jpg"/>" class="card-img-top" alt="...">
	                    <div class="card-body">
	                      <h5 class="card-title">Card title</h5>
	                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                      <a href="#" class="btn btn-primary">Go somewhere</a>
	                    </div>
	                  </div>
	            </div>
	            <div class="col-md-4">
	                <div class="card" style="width: 100%">
	                    <img src="<c:url value="/resources/images/mapping/FT3.jpg"/>" class="card-img-top" alt="...">
	                    <div class="card-body">
	                      <h5 class="card-title">Card title</h5>
	                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                      <a href="#" class="btn btn-primary">Go somewhere</a>
	                    </div>
	                  </div>
	            </div>
	            <div class="col-md-4">
	                <div class="card" style="width: 100%">
	                    <img src="<c:url value="/resources/images/mapping/FT1.jpg"/>" class="card-img-top" alt="...">
	                    <div class="card-body">
	                      <h5 class="card-title">Card title</h5>
	                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                      <a href="#" class="btn btn-primary">Go somewhere</a>
	                    </div>
	                  </div>
	            </div>
	            <div class="col-md-4">
	                <div class="card" style="width: 100%">
	                    <img src="<c:url value="/resources/images/mapping/FT2.jpg"/>" class="card-img-top" alt="...">
	                    <div class="card-body">
	                      <h5 class="card-title">Card title</h5>
	                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                      <a href="#" class="btn btn-primary">Go somewhere</a>
	                    </div>
	                  </div>
	            </div>
	            <div class="col-md-4">
	                <div class="card" style="width: 100%">
	                    <img src="<c:url value="/resources/images/mapping/FT3.jpg"/>" class="card-img-top" alt="...">
	                    <div class="card-body">
	                      <h5 class="card-title">Card title</h5>
	                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                      <a href="#" class="btn btn-primary">Go somewhere</a>
	                    </div>
	                  </div>
	            </div>
	        </div>
        </div> <!-- end of container -->
    <!-- end of header -->


<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->