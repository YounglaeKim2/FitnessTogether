<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->

<form action="" method="get" name="frm">
    <h1> 게시물 상세 </h1>

    <c:if test="${not empty sessionScope.id }">
        <input type="hidden" name="id" value="${sessionScope.id}">
    </c:if>

    <input type="hidden" name="bno" value="${item.bno}">
    <div class="board-wrap">
        <div class="board-title-wrap">
            <h2> ${item.subject} </h2>
        </div>

        <div class="board-content-wrap">
            <div class="board-image-wrap">
                <c:if test="${empty item.imgName}">
                    <img src="/ft/resources/images/mapping/FT1.jpg">
                </c:if>

                <c:if test="${not empty item.imgName}">
                    <img src="<%=request.getRealPath("/") %>/${item.imgName}">
                </c:if>
            </div>

            <div class="board-desc-wrap">
                ${item.content}
            </div>
        </div>

        <div class="board-button-wrap">
            <button class="btn btn-radius btn--blue-2" type="submit" name="btn_modify">수정</button>
            <button class="btn btn-radius btn--blue-2" type="submit" name="btn_delete">삭제</button>
        </div>
    </div>
</form>

<script>

    jQuery(document).ready(function ($) {
        $("[name=btn_modify]").click(function () {
            $("[name=frm]").attr('action', '/ft/fnt/picture_modify.do/' + $("[name=bno]").val());
            $("[name=frm]").attr('method', 'get');
            $("[name=frm]").submit();
        });

        $("[name=btn_delete]").click(function () {
            $("[name=frm]").attr('action', '/ft/fnt/picture_delete.do/' + $("[name=bno]").val());
            $("[name=frm]").attr('method', 'post');
            $("[name=frm]").submit();
        });
    });

</script>

<style>
    .board-wrap {
        text-align: center;
    }

    .board-image-wrap > img {
        max-width: 500px;
    }

    .board-button-wrap,
    .board-desc-wrap {
        margin-top: 30px
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


<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->
