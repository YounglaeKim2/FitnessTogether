<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->
<body data-bs-spy="scroll" data-bs-target="#navbarExample">

    <!-- Header -->
    <div class="container">
    	<section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">About</h2>
                    <h3 class="section-subheading text-muted">History of Our Team</h3>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="<c:url value="/resources/images/us/pic_11_8.png"/>" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Nov 2021</h4>
                                <h4 class="subheading">Our Humble Beginning</h4>
                            </div>
                        	<div class="timeline-body"><p class="text-muted">팀 결성</p></div>
                         	<div class="timeline-body"><p class="text-muted">김영래, 김형철, 김혜란, 박준희, 이아영</p></div>                       	
                        	<div class="timeline-body"><p class="text-muted">아이템 및 기능선정, 아이디어 교환 회의</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/2.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Nov 18 2021</h4>
                                <h4 class="subheading">New Members</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">팀원 보충</p></div>
                            <div class="timeline-body"><p class="text-muted">복상일, 허진서</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/3.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Nov 2021</h4>
                                <h4 class="subheading">Analysis & Modify the Design</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">프로젝트 설계 & 수정</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/2.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Dec 2021</h4>
                                <h4 class="subheading">Ex</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">역할분배</p></div>
                            <div class="timeline-body"><p class="text-muted">템프릿 선정, 적용</p></div>
                            <div class="timeline-body"><p class="text-muted">깃 설정</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/3.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Dec 17 2021</h4>
                                <h4 class="subheading">New Members</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">팀원 보충</p></div>
                            <div class="timeline-body"><p class="text-muted">조학래, 한상민</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/4.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Jan 3 20222</h4>
                                <h4 class="subheading">An Interim Announcement</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">중간발표</p></div>
                            </div>
                    </li>
                    <li class="timeline-inverted">
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
    
    
    
    
    
    </div>
    <!-- end of header -->

</body>
<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->