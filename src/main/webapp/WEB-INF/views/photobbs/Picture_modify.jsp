<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->

<form action="<c:url value="/fnt/picture_modify.do"/>" method="post" name="mfrm" enctype="multipart/form-data">
    <h1> 게시물 수정 </h1>

    <c:if test="${not empty sessionScope.id }">
        <input type="hidden" name="id" value="${sessionScope.id}">
    </c:if>

    <input type="hidden" name="bno" value="${item.bno}">

    <div class="form-group">
        <div class="name">제목</div>
        <div class="value">
            <input class="input--style-6" type="text" name="subject" value="${item.subject}">
        </div>
    </div>


    <div class="form-group">
        <div class="name">내용</div>
        <div class="value">
            <div class="summernote-group">
                <textarea class="summernote" name="content" id="content">${item.content}</textarea>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="name">파일 업로드</div>
        <div class="value">
            <div class="input-group js-input-file">
                <input class="input-file" type="file" name="imgName" id="file">
                <label class="label--file" for="file">파일 선택</label>
            </div>
        </div>
    </div>

    <div class="form-group">
        <button class="btn btn-radius btn--blue-2" type="submit" id="submit1">수정하기</button>
    </div>
</form>

<style>
    form {
        display: flex;
        align-items: center;
        flex-direction: column;
    }
</style>

<style>
    /* ===================== BASIC STYLING ===================== */
    * {
        box-sizing: border-box;
        font-family: 'Lato', sans-serif;
    }

    html, body {
        margin: 0;
        padding: 0;
        font-weight: 300;
        height: 100%;
        /*background: #053777;*/
        /*color: #fff;*/
        font-size: 16px;
        overflow: hidden;
        /*background: -moz-linear-gradient(top, #053777 0%, #00659b 100%);*/
        /*!* FF3.6+ *!*/
        /*background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #053777),*/
        /*color-stop(100%, #00659b));*/
        /*!* Chrome,Safari4+ *!*/
        /*background: -webkit-linear-gradient(top, #053777 0%, #00659b 100%);*/
        /*!* Chrome10+,Safari5.1+ *!*/
        /*background: -o-linear-gradient(top, #053777 0%, #00659b 100%);*/
        /*!* Opera 11.10+ *!*/
        /*background: -ms-linear-gradient(top, #053777 0%, #00659b 100%);*/
        /*!* IE10+ *!*/
        /*background: linear-gradient(to bottom, #053777 0%, #00659b 100%);*/
        /*!* W3C *!*/
    }

    h1 {
        text-align: center;
        margin: 50px auto;
        /*font-weight: 100;*/
    }

    label {
        font-weight: 500;
        display: block;
        margin: 4px 0;
        text-transform: uppercase;
        font-size: 13px;
        overflow: hidden;

    span {
        float: right;
        text-transform: none;
        font-weight: 200;
        line-height: 1em;
        font-style: italic;
        opacity: 0.8;
    }

    button {
        padding: 8px 30px;
        background: rgba(255, 255, 255, 0.8);
        color: #053777;
        text-transform: uppercase;
        font-weight: 600;
        font-size: 11px;
        border: 0;
        text-shadow: 0 1px 2px #fff;
        cursor: pointer;
    }

    .form-group {
        max-width: 500px;
        margin: auto;
        margin-bottom: 30px;
    }
</style>

<script type="text/javascript">
    window.onload = function () {

        //'등록하기'버튼 클릭시 모두 입력되었는지 검사
        document.getElementById('submit1').onclick = function () {
            if (document.mfrm.subject.value.trim() == "") {
                alert('제목을 입력하셔야 합니다.');
                return false;
            }

            if (document.mfrm.media.value.trim() == "") {
                alert('파일을 입력하셔야 합니다.');
                return false;
            } else {
                const extension = document.mfrm.media.value.split('.').pop();
                if (extension != 'png' && extension != 'jpg' && extension != 'PNG' && extension != 'JPG') {
                    alert('이미지파일을 첨부하셔야 합니다.');
                    return false;
                }
            }

            //내용입력확인
            if (document.mfrm.content.value.trim() == "") {
                alert('내용을 입력하셔야 합니다.');
                return false;
            }

            document.mfrm.submit();

        };//onclick

        //파일을 선택시 파일명이 뜨도록 함
        var file_input_container = $('.js-input-file');
        if (file_input_container[0]) {
            file_input_container.each(function () {

                var that = $(this);

                var fileInput = that.find(".input-file");
                var info = that.find(".input-file__info");

                fileInput.on("change", function () {

                    var fileName;
                    fileName = $(this).val();

                    if (fileName.substring(3, 11) == 'fakepath') {
                        fileName = fileName.substring(12);
                    }

                    if (fileName == "") {
                        info.text("선택된 파일이 없습니다");
                    } else {
                        info.text(fileName);
                    }
                })

            });
        }

        //내용란 설정
        var toolbar = [
            //글꼴설정
            ['fontname', ['fontname']],
            //글자 크기 설정
            ['fontsize', ['fontsize']],
            //굵기,기울임꼴,밑줄,취소선,서식지우기
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            //글자색
            ['color', ['forecolor', 'color']],
            //표만들기
            ['table', ['table']],
            //글머리 기호, 번호매기기, 문단정렬
            ['para', ['ul', 'ol', 'paragraph']],
            //줄간격
            ['height', ['height']],
            //코드보기,확대해서보기,도움말
            ['view', ['codeview', 'fullscreen', 'help']]
        ];

        var setting = {
            height     : 300, //에디터 높이
            minHeight  : null,
            maxHeight  : null,
            focus      : true,
            lang       : "ko-KR",
            placeholder: "최대 1000자까지 쓸 수 있습니다"

        }
        $('.summernote').summernote(setting);

    };//onload

</script>


<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->
