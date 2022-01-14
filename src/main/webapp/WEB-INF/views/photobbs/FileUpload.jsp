<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 카드리스트 섹션 -->

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->

<!-- View에서 파일을 하나씩 넘기고 Controller(Service의 역할을 겸함)에서 여러개의 파일을 처리하는 방식  -->
<!--  -->

<!-- 실제 내용 시작 -->
<div class="container">
	<!-- 점보트론(Jumbotron) -->
	<div class="jumbotron">
		<h1>
			사진게시판<small>등록 페이지</small>
		</h1>
	</div>
	<div>
		<form id="myform" class="form-horizontal" method="post"
			enctype="multipart/form-data"
			action="<c:url value="/fnt/picture_write.do"/>">
			<div class="form-group">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="name"
						placeholder="이름을 입력하세요?">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">제 목</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="subject"
						placeholder="제목을 입력하세요">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">파일 업로드</label>
				<div class="col-sm-8">
					<input type="file" name="attachfile">
					<p class="help-block">파일을 첨부하세요</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" name="password"
						placeholder="비밀번호를 입력하세요">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">내 용</label>
				<!-- 중첩 컬럼 사용 -->
				<div class="col-sm-10">
					<div class="row">
						<div class="col-sm-8">
							<textarea rows="5" class="form-control" name="content"
								placeholder="내용을 입력하세요"></textarea>
						</div>
					</div>
				</div>
			</div>

			<h1>업로드할 이미지를 끌어와주세요!</h1>
			<div class="upload-box">
				<button class="btn-upload">파일선택</button>
				<input class="btn file d-none" type="file">
				<!-- 파일 인풋 박스 형태 -->
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4">
					<button class="btn btn-primary">등록</button>
				</div>
			</div>
		</form>
	</div>

</div>
<!-- container -->
<!-- 실제 내용 끝-->
<!-- 경고창 모달 시작 -->
<div class="modal  fade" id="small-modal" data-backdrop="static">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<button class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
				<h5 class="modal-title">
					<span class="glyphicon glyphicon-blackboard"></span> 확인 메시지
				</h5>
				<h5 id="warningMessage" style="color: red"></h5>
			</div>
		</div>
	</div>
</div>

<script>
	var btnUpload = sec9.querySelector('.btn-upload');
	var inputFile = sec9.querySelector('input[type="file"]');
	var uploadBox = sec9.querySelector('.upload-box');

	/* 박스 안에 드래그하여 들어왔을 때 */
	uploadBox.addEventListener('dragenter', function(e) {
		console.log('dragenter');
	});

	/* 박스 안에서 드래그를 하고 있을 때 */
	uploadBox.addEventListener('dragover', function(e) {
		e.preventDefault();

		var valid = e.dataTransfer.types.indexOf('Files') >= 0;

		if (!valid) {
			this.style.backgroundColor = 'red';
		} else {
			this.style.backgroundColor = 'green';
		}

	});

	/* 박스 밖으로 드래그가 나갈 때 */
	uploadBox.addEventListener('dragleave', function(e) {
		console.log('dragleave');

		this.style.backgroundColor = 'white';
	});

	/* 박스 안에서 드래그 앤 드롭했을 때 */
	uploadBox.addEventListener('drop', function(e) {
		e.preventDefault();

		console.log('drop');
		this.style.backgroundColor = 'white';

		console.dir(e.dataTransfer);

		var data = e.dataTransfer.files[0];
		console.dir(data);
	});
</script>

<style>
.jumbotron {
	margin-bottom: 0px;
	background-image:
		url("/FitnessTogether/src/main/webapp/resources/images/photobbs/background/write_background.jpg");
	background-position: 0% 25%;
	background-size: cover;
	background-repeat: no-repeat;
	color: white;
	text-shadow: black 0.3em 0.3em 0.3em;
}

.upload-box {
	outline: 2px dashed #92b0b3;
	outline-offset: -10px;
	text-align: center;
	transition: all .15s ease-in-out;
	width: 300px;
	height: 300px;
	background-color: gray;
}
</style>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->