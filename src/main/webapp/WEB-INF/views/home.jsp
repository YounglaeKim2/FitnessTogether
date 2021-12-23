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

    <!-- Header 
	    <div class="container">
	      <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	        <div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
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
		            <h1>Example headline.</h1>
		            <p>Some representative placeholder content for the first slide of the carousel.</p>
		            <p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
		          </div>
		        </div>
		      </div>
		      
		      
		      <div class="carousel-item">
		        <img src="<c:url value="/resources/images/mapping/FT2.jpg"/>" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></img>
		
		        <div class="container">
		          <div class="carousel-caption">
		            <h1>Another example headline.</h1>
		            <p>Some representative placeholder content for the second slide of the carousel.</p>
		            <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
		          </div>
		        </div>
		      </div>
		      
		      <div class="carousel-item">
		        <img src="<c:url value="/resources/images/mapping/FT3.jpg"/>" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></img>
		
		        <div class="container">
		          <div class="carousel-caption">
		            <h1>Another example headline.</h1>
		            <p>Some representative placeholder content for the second slide of the carousel.</p>
		            <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
		          </div>
		        </div>
		      </div>
		      
		      <div class="carousel-item">
		        <img src="<c:url value="/resources/images/mapping/FT4.jpg"/>" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></img>
		
		        <div class="container">
		          <div class="carousel-caption">
		            <h1>Another example headline.</h1>
		            <p>Some representative placeholder content for the second slide of the carousel.</p>
		            <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
		          </div>
		        </div>
		      </div>
		      
		      
		      <div class="carousel-item">
		        <img src="<c:url value="/resources/images/mapping/FT5.jpg"/>" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></img>
		
		        <div class="container">
		          <div class="carousel-caption text-end">
		            <h1>One more for good measure.</h1>
		            <p>Some representative placeholder content for the third slide of this carousel.</p>
		            <p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
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
	
	<!-- About US
	================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->
	<section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">ABOUT US</h2>
                    <h3 class="section-subheading text-muted">WHO WE R</h3>
                </div>
                <ul class="timeline">
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value="/resources/images/testimonial-1.jpg"/>" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h6>TEAM LEADER</h6>
                                <h4 class="subheading">KIM YoungLae</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">전체 프로젝트 검수</p></div>
                            <div class="timeline-body"><p class="text-muted">메인</p></div>
                            <div class="timeline-body"><p class="text-muted">맵핑</p></div>
                            <div class="timeline-body"><p class="text-muted">카카오 지도 API</p></div>
                            <div class="timeline-body"><p class="text-muted">ERD</p></div>
                            
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value="/resources/images/testimonial-2.jpg"/>" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h6>Project Leader</h6>
                                <h4 class="subheading">PARK JunHee</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">전체 프로젝트 검수</p></div>
                            <div class="timeline-body"><p class="text-muted">맵핑</p></div>
                            <div class="timeline-body"><p class="text-muted">DB 설계</p></div>
                            <div class="timeline-body"><p class="text-muted">깃, 템플릿</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value="/resources/images/testimonial-3.jpg"/>" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h6>Project Leader</h6>
                                <h4 class="subheading">KIM HyungCheol</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">캘린더</p></div>
                            <div class="timeline-body"><p class="text-muted">깃, 템플릿</p></div>
                            <div class="timeline-body"><p class="text-muted">운동 DB</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value="/resources/images/testimonial-4.jpg"/>" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="subheading">KIM HyeRan</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">DB 설계</p></div>
                            <div class="timeline-body"><p class="text-muted">UML 작성</p></div>
                            <div class="timeline-body"><p class="text-muted">식품 DB</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value="/resources/images/testimonial-1.jpg"/>" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="subheading">LEE Ah-Young</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">로그인/회원가입</p></div>
                            <div class="timeline-body"><p class="text-muted">관리자 페이지</p></div>
                            <div class="timeline-body"><p class="text-muted">로그인 API</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value="/resources/images/testimonial-2.jpg"/>" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="subheading">BOCK SangIl</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">메인 사진 게시판</p></div>
                            <div class="timeline-body"><p class="text-muted">기능선정 참여</p></div>
                            
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value="/resources/images/testimonial-3.jpg"/>" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="subheading">HEO JinSeo</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">기능선정 참여</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value="/resources/images/testimonial-4.jpg"/>" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="subheading">CHO HakLae</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted"> </p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value="/resources/images/testimonial-1.jpg"/>" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="subheading">HAN SangMin</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted"> </p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image">
                            <h4>
                                Be Part
                                <br />
                                Of Our
                                <br />
                                Story!
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
	
	
	
	
	
	
	
	
	
	
	
	
  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
        <img src="<c:url value="/resources/images/mapping/FT1.jpg"/>" class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">1</text></img>

        <h2>Heading</h2>
        <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
        <p><a class="btn btn-secondary" href="#">View details »</a></p>
      </div><!-- /.col-lg-4 -->
      
      
      <div class="col-lg-4">
        <img src="<c:url value="/resources/images/mapping/FT2.jpg"/>" class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">2</text></img>

        <h2>Heading</h2>
        <p>Another exciting bit of representative placeholder content. This time, we've moved on to the second column.</p>
        <p><a class="btn btn-secondary" href="#">View details »</a></p>
      </div><!-- /.col-lg-4 -->
      
      
      <div class="col-lg-4">
        <img src="<c:url value="/resources/images/mapping/FT3.jpg"/>" class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">3</text></img>

        <h2>Heading</h2>
        <p>And lastly this, the third column of representative placeholder content.</p>
        <p><a class="btn btn-secondary" href="#">View details »</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
        <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
      </div>
      <div class="col-md-5">
        <img src="<c:url value="/resources/images/mapping/FT4.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></img>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
      </div>
      <div class="col-md-5 order-md-1">
        <img src="<c:url value="/resources/images/mapping/FT5.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></img>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
        <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
      </div>
      <div class="col-md-5">
        <img src="<c:url value="/resources/images/mapping/FT1.jpg"/>" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></img>

      </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


  <!-- FOOTER -->
  <footer class="container">
    <p class="float-end"><a href="#">Back to top</a></p>
    <p>© Fitness Together, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
  </footer>
</main>
</body>
<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->
