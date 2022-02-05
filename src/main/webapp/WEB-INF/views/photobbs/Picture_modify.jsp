<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->

<div class="page-wrapper bg-light p-t-100 p-b-50">
	<div class="wrapper wrapper--w900">
		<div class="card card-6">
			<div class="card-heading">
				<h2 class="title">당신의 운동성과를 자랑하세요!</h2>
			</div>
			<div class="card-body">
				<form action="<c:url value="/fnt/picture_write.do"/>" method="post" name="wfrm" enctype="multipart/form-data">
					
					<c:if test="${not empty sessionScope.id }">
							<input type="hidden" name="writer" value="${name }">
					</c:if>
					
					<div class="form-row">
						<div class="name">제목</div>
						<div class="value">
							<input class="input--style-6" type="text" name="subject">
						</div>
					</div>
					<div class="form-row">
						<div class="name">파일 업로드</div>
						<div class="value">
							<div class="input-group js-input-file">
								<input class="input-file" type="file" name="media" id="file">
								<label class="label--file" for="file">파일 선택</label><span
								class="input-file__info">선택된 파일이 없습니다</span>
							</div>
							<div class="label--desc">운동사진을 업로드하세요</div>
						</div>
					</div>
					
					<div class="form-row">
						<div class="name">내용</div>
						<div class="value">
							<div class="summernote-group">
								<textarea class="summernote" name="content" id="content"></textarea>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="card-footer">
				<button class="btn btn--radius-2 btn--blue-2" type="submit" 
						id="submit1">등록하기</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	window.onload = function() {
		
		//'등록하기'버튼 클릭시 모두 입력되었는지 검사
		document.getElementById('submit1').onclick = function() {
			if(document.wfrm.subject.value.trim() == ""){
				alert('제목을 입력하셔야 합니다.');
				return false;
			}
			
			if(document.wfrm.media.value.trim() == ""){
				alert('파일을 입력하셔야 합니다.');
				return false;
			}
			else {
				const extension = document.wfrm.media.value.split('.').pop();
				if(extension != 'png' && extension != 'jpg' && extension != 'PNG' && extension != 'JPG'){
					alert('이미지파일을 첨부하셔야 합니다.');
					return false;
				}
			}
			
			//내용입력확인
			if(document.wfrm.content.value.trim() == ""){
				alert('내용을 입력하셔야 합니다.');
				return false;
			}
			
			document.wfrm.submit();
			
		};//onclick
		
		//파일을 선택시 파일명이 뜨도록 함
		var file_input_container = $('.js-input-file');
		if(file_input_container[0]){
			file_input_container.each(function() {
				
				var that = $(this);
				
				var fileInput = that.find(".input-file");
				var info = that.find(".input-file__info");
				
				fileInput.on("change",function(){
					
					var fileName;
					fileName = $(this).val();
					
					if(fileName.substring(3, 11)=='fakepath'){
						fileName = fileName.substring(12);
					}
					
					if(fileName == ""){
						info.text("선택된 파일이 없습니다");
					}
					else {
						info.text(fileName);
					}
				})
				
			});
		}
		
		//내용란 설정
		var toolbar = [
			//글꼴설정
			['fontname',['fontname']],
			//글자 크기 설정
			['fontsize',['fontsize']],
			//굵기,기울임꼴,밑줄,취소선,서식지우기
			['style',['bold','italic','underline','strikethrough','clear']],
			//글자색
			['color',['forecolor','color']],
			//표만들기
			['table',['table']],
			//글머리 기호, 번호매기기, 문단정렬
			['para',['ul','ol','paragraph']],
			//줄간격
			['height',['height']],
			//코드보기,확대해서보기,도움말
			['view',['codeview','fullscreen','help']]
		];
		
		var setting = {
				height : 300, //에디터 높이
				minHeight : null,
				maxHeight : null,
				focus : true,
				lang : "ko-KR",
				placeholder: "최대 1000자까지 쓸 수 있습니다"
				
		}
		$('.summernote').summernote(setting);
		
	};//onload

</script>


<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->