<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->

<div id="card-search" class="card-search">
    <form action="<c:url value="/fnt/picture_list.do"/>" method="post">
        <div class="row justify-content-md center" id="search">
            <div class="col-1"></div>
            <div class="col-1">
                <div class="value" id="condition_pick" style="text-align: right;">
                    <select id="condition" name="condition" class="form-select">
                        <option value="subject"
                        ${condition eq 'subject' ? 'selected' : ''}>제목
                        </option>
                        <option value="content"
                        ${condition eq 'content' ? 'selected' : ''}>내용
                        </option>
                        <%-- <option value="name" ${condition eq 'name' ? 'selected' : ''}>닉네임</option> --%>
                    </select>
                </div>
            </div>

            <div class="col-md-8" style="padding-left: 0px; text-align: left;">
                <input value="${keyword}" type="text" name="keyword"
                       placeholder="검색어를 입력하세요" class="form-control"
                       style="padding-left: 0px;">
            </div>
            <div class="col-md-2" style="padding: 0px; text-align: left;">
                <span><button class="btn btn-success" type="submit">검색</button></span>
                <span id="writebox">
						<c:choose>
                            <c:when test="${empty sessionScope.id}">
								<button type="button"
                                        class="btn btn-dark"
                                        onclick="javascript:alert('로그인 해주십시오')">글쓰기</button>
                            </c:when>
                            <c:otherwise>
								<button type="button"
                                        class="btn btn-info"
                                        onclick="location.href='<c:url value="/fnt/picture_write.do"/>'">글쓰기</button>
                            </c:otherwise>
                        </c:choose>
				</span>
            </div>
        </div>
    </form>
</div>

<%-- 검색 키워드가 존재한다면 몇 개의 글이 검색되었는지 알려준다. --%>
<c:if test="${not empty keyword }">
    <div class="alert texgt-center">
        <strong>${totalRow }</strong> 개의 게시물이 검색되었습니다.
    </div>
</c:if>

<!-- 카드형 게시물 섹션 -->
<section id="card-list" class="card-list">
    <div class="container">
        <div class="card-list-container">
            <c:if test="${empty list}">
                <span>일치하는 데이터가 없습니다.</span>
            </c:if>
            <c:forEach var="b" items="${list}">
                <div class="card-item-wrap">
                    <div class="card-img-wrap">
                        <a href="/ft/fnt/picture_detail.do/${b.bno}">
                            <c:if test="${empty b.imgName}">
                                <img src="/ft/resources/images/mapping/FT1.jpg">
                            </c:if>

                            <c:if test="${not empty b.imgName}">
                                <img
									src="<c:url value='/resources/images/upload/picture/${b.imgName}'/>">
                            </c:if>
                        </a>
                    </div>

                    <div class="card-content-wrap">
						<span> ${ b.subject } </span> 
						<%-- <span> <img alt="하트아이콘이미지"
							src="<c:url value="/resources/images/photobbs/icons/bi bi-suit-heart-fill.png"/>"
							class="bi bi-suit-heart-fill" width="16" height="16">
						</span> <span id="heart${b.bno}">${b.heart}</span>
						댓글 아이콘
						<span> <img alt="댓글아이콘이미지"
							src="<c:url value="/resources/images/photobbs/icons/bi bi-chat-dots.png"/>"
							class="bi bi-chat-dots" width="16" height="16">
						</span> <span id="reply${b.bno}">${b.reply}</span>

						눈알 아이콘
						<span> <img alt="조회수아이콘이미지"
							src="<c:url value="/resources/images/photobbs/icons/bi bi-eye.png"/>"
							class="bi bi-eye" width="16" height="16">
						</span> <span id="hit${b.bno}">${b.hit}</span> --%>
					</div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- 카드형 게시물 섹션 끝-->

<!-- 로딩이미지 아직 미지정-->
<%--<div class="back-drop">--%>
<%--	 <img src="<c:url value="/resources/images/photobbs/background/loading.gif"/>" />--%>
<%--</div>--%>

<script>
    //페이지가 처음 로딩될때 보여줄 페이지
    var currentPage = 1;
    //현재 페이지가 로딩중인지 여부를 저장할 변수
    var isLoading = false;

    //웹브라우저의 창을 스크롤 할 때 마다 호출되는 함수 등록
    $(window).on("scroll", function () {
        //위로 스크롤된 길이
        var scrollTop = $(window).scrollTop();
        //웹브라우저 창의 높이
        var windowHeight = $(window).height();
        //문서 전체의 높이
        var documentHeight = $(document).height();
        //바닥까지 스크롤 되어쓴지 여부를 알아낸다.
        var isBottom = scrollTop + windowHeight + 10 >= documentHeight;

        if (isBottom) {
            //현재페이지가 마지막 페이지라면
            if (currentPage == ${totalPageCount} || isLoading) {
                return; //여기에서 끝낸다
            }

            //현재 로딩중이라고 표시하기
            isLoading = true;
            //로딩바를 띄우기
            $(".back-drop").show();
            //요청할 페이지 번호를 1 증가시키기
            currentPage++;
            //추가로 받아올 페이지를 서버에 ajax 요청을 하고
            console.log("inscroll" + currentPage);
            GetList(currentPage);
        };
    });

</script>

<script>
    const GetList = function (currentPage) {
        //무한 스크롤
        $.ajax({
            url   : "<c:url value="/fnt/photoList.do"/>",
            method: "POST",
            //검색기능이 있는 경우 condition과 keyword를 함께 넘겨줘야한다.(검색결과만 출력하기 위해서)
            data: "pageNum=" + currentPage + "&condition=${condition}&keyword=${keyword}",
            //PhotoList.jsp의 내용이 data로 들어오도록 함.
            success: function (data) {
                console.log(data);
                //응답된 문자열은 html 형식이다.(PhotoList.jsp에 응답내용이 있다.)
                //해당 문자열을 .card-list-container div에 html로 해석하라고 추가
                $(".card-list-container").append(data);
                //로딩바를 숨긴다.
                $(".back-drop").hide();
                //로딩중이 아니라고 표시한다.
                isLoading = false;
                console.log("ajax");
            }
        });
    };
</script>

<script>
	
		//조회수 올리기 시작
		$(document).on('click','card-img',function(){
			//게시물 번호(bno)를 idx로 전달받아 저장합니다.
			var bno = $(this).attr('idx');
			
			console.log(bno+"에 hit(조회수) + 1을 함");
			
			// +1된 hit값 불러오기
			$.ajax({
				url : "<c:url value="/fnt/picture_write.do"/>",
				type: 'get',
				data: {
					bno : bno
				},
				success : function(to){
					var hit = to.hit;
					
					$('#_hit'+bno).text(hit);
					$('#hit'+bno).text(hit);
				
				},
				error: function(){
					alert('서버 에러');
				}
			});
		});
	
	
	//창 크기 변해도 가로세로 맞추기 위해
	$(window).resize(function(){
		$('.box').each(function(){
			$(this).height($(this).width());
		});
	}).resize();

</script>

<style>
    .card-search {
        padding: 4rem;
    }

    .back-drop {
        display: flex;
        justify-content: center;
        align-items: center;
        padding-bottom: 16rem;
    }

    .card-list-container {
        cursor: pointer;
        display: grid;
        grid-template-columns: repeat(4, calc((100% / 4) - 10px));
        justify-content: space-between;
    }

    .card-img-wrap > a > img {
        width: 100%;
        height: 100%;
    }

    .card-content-wrap {
        margin-top: 10px;
        margin-bottom: 30px;
    }

    .card-content-wrap {
        display: flex;
        justify-content: space-between;
    }
</style>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->