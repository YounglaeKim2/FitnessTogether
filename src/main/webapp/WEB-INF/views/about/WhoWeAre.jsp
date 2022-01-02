<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->
<body data-bs-spy="scroll" data-bs-target="#navbarExample">

    <!-- Header -->
    <div class="container">
    	<section class="page-section bg-light" id="team">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Our Amazing Team</h2>
                    <h3 class="section-subheading text-muted">What We Can Do</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value="/resources/images/testimonial-1.jpg"/>" alt="..." />
                            <h5>Team Leader</h5>
                            <h4>김영래</h4>
                            <p class="text-muted">전체 프로젝트 검수</p>
                            <p class="text-muted">메인 페이지</p>
                            <p class="text-muted">맵핑 페이지</p>
                            <p class="text-muted">카카오 지도 API</p>
                            <p class="text-muted">ERD</p>
                            
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value="/resources/images/testimonial-2.jpg"/>" alt="..." />
                            <h5>Assistant Leader</h5>
                            <h4>박준희</h4>
                            <p class="text-muted">전체 프로젝트 검수</p>
                            <p class="text-muted">DB 설계</p>
                            <p class="text-muted">깃 설정</p>
                            <p class="text-muted">템플릿 작성</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value="/resources/images/testimonial-3.jpg"/>" alt="..." />
                            <h5>Assistant Leader</h5>
                            <h4>김형철</h4>
                            <p class="text-muted">전체 프로젝트 검수</p>
                            <p class="text-muted">캘린더 페이지</p>
                            <p class="text-muted">운동일지 DB</p>
                            <p class="text-muted">깃 설정</p>
                            <p class="text-muted">템플릿 작성</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    
                    
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value="/resources/images/testimonial-4.jpg"/>" alt="..." />
                            <h4>김혜란</h4>
                            <p class="text-muted">UML 작성</p>
                            <p class="text-muted">DB 설계</p>
                            <p class="text-muted">섭취 칼로리 DB</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value="/resources/images/testimonial-1.jpg"/>" alt="..." />
                            <h4>이아영</h4>
                            <p class="text-muted">로그인 / 회원가입 페이지</p>
                            <p class="text-muted">카카오 로그인 API</p>
                            <p class="text-muted">구글 로그인 API</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value="/resources/images/testimonial-2.jpg"/>" alt="..." />
                            <h4>복상일</h4>
                            <p class="text-muted">소셜 사진 게시판</p>
                            <p class="text-muted">기능 선정 참여</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    
                    
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value="/resources/images/testimonial-3.jpg"/>" alt="..." />
                            <h4>허진서</h4>
                            <p class="text-muted">기능 선정 참여</p>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value="/resources/images/testimonial-4.jpg"/>" alt="..." />
                            <h4>조학래</h4>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="<c:url value="/resources/images/testimonial-1.jpg"/>" alt="..." />
                            <h4>한상민</h4>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p></div>
                </div>
            </div>
        </section>
    
    
    </div>
    <!-- end of header -->

</body>
<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->