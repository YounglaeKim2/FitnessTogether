<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- 상단메뉴 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 상단메뉴 끝 -->
<!-- 
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet">
 -->
<!-- 실제 내용 시작 -->
<div class="container">
	<div class="container px-4 py-5" id="featured-3">
		<h1 class="pb-2 border-bottom">등 록 게 시 판<h4>적 어 보 세 요 ! ! ! ! !</h4></h1>
	</div>
	<!-- 
	<figure class="text-center" style="padding-top: 100px;">
		<blockquote class="blockquote">
			<h1>등 록 페 이 지</h1>
		</blockquote>
	</figure>
	 -->
	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" method="post"
				action="<c:url value='/onememo/bbs/Write.do'/>">
				<!-- 씨큐리티 적용:csrf취약점 방어용 -->
				<!-- 
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				 -->
				<div class="form-group text-center">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-8" style="margin: auto;">
						<input type="text" class="form-control" name="title"
							placeholder="제목을 입력하세요?">
					</div>
				</div>


				<div class="form-group text-center">
					<label class="col-sm-2 control-label">내용</label>
					<!-- 중첩 컬럼 사용 -->
					
						<div class="row">
							<div class="col-sm-8" style="margin: auto;">
								<textarea class="form-control" name="content" rows="5"
									placeholder="내용 입력하세요"></textarea>
							</div>
						</div>
					
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 text-end">
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 실제 내용 끝-->
<!-- 푸터 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- 푸터 끝 -->



