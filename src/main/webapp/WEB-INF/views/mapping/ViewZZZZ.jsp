<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->
<style>
#xx{
	padding-top: 5px;
	padding-bottom: 5px
}
#map{
	padding-left: 20px;
	padding-right: 20px;
}
</style>



<head>
<meta charset="utf-8">
<title>여러개 마커에 이벤트 등록하기2</title>

</head>
<div class="container">
	
	<div id="map" style="width: 100%; height: 75%; text-align=center;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c244899725d72b692838ccde36cbb07d&libraries=clusterer"></script>
	<script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.47893666774784, 126.87891734605707), // 지도의 중심좌표
                level: 2, // 지도의 확대 레벨
                mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
            }; 
    
        // 지도를 생성한다 
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 마커 클러스터러를 생성합니다 
        var clusterer = new kakao.maps.MarkerClusterer({
            map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
            averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
            minLevel: 4 // 클러스터 할 최소 지도 레벨 
        });

        var data = [
          [37.47918244596204, 126.879142796576, '<div style="padding:5px;">붕어빵</div>'],
          [37.47852824039385, 126.87920656036123, '<div style="padding:5px;">담배쟁이</div>'],
          [37.4793107563299, 126.87801098940167, '<div style="padding:5px;">INC COFFEE</div>']
        ]
        
        var markers =[];

        for (var i = 0; i < data.length; i++ ) {
          // 지도에 마커를 생성하고 표시한다
          var marker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(data[i][0], data[i][1]), // 마커의 좌표
            map: map // 마커를 표시할 지도 객체
          });

          // 마커가 지도 위에 표시되도록 설정합니다
          //marker.setMap(map);

          //var iwContent = '<div style="padding:5px;">붕어빵!</div>';

          // 인포윈도우를 생성합니다
          var infowindow = new kakao.maps.InfoWindow({
              content : data[i][2]
          });
            
          // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
          infowindow.open(map, marker);
          markers.push(marker);
          kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
          kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
          }

          // 클러스터러에 마커들을 추가합니다
          clusterer.addMarkers(markers);
        
          // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
          function makeOverListener(map, marker, infowindow) {
              return function() {
                  infowindow.open(map, marker);
              };
          }

          // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
          function makeOutListener(infowindow) {
              return function() {
                  infowindow.close();
              };
          }
	</script>
</div>
<div class="container">
	<div class="col-md-12 text-right" id="xx">
			<a href="<c:url value="/fnt/mappingList.do"/>
			"class="btn btn-success">목록</a>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table
				class="table table-bordered table-hover table-condensed text-center">
				<!-- 테이블 컬럼폭은 col-*-*계열로 설정 -->
				<tr>
					<th class="col-md-1 text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="col-md-1 text-center">작성자</th>
					<th class="col-md-2 text-center">작성일</th>
				</tr>
				<!-- 
				<c:if test="${empty listPagingData.lists }" var="isEmpty">
					<tr>
						<td colspan="4">등록된 게시물이 없어요</td>
					</tr>
				</c:if>
				 -->
						<tr>
							<td>1</td>
							<td>붕어빵</td>
							<td>이아영</td>
							<td>2021.12.1</td>
						</tr>
						<tr>
							<td>2</td>
							<td>INC COFFEE</td>
							<td>김혜란</td>
							<td>2021.12.2</td>
						</tr>
						<tr>
							<td>3</td>
							<td>담배쟁이</td>
							<td>복상일</td>
							<td>2021.12.3</td>
						</tr>
				<!-- 
				<c:if test="${not isEmpty }">
					<c:forEach var="item" items="${listPagingData.lists}" varStatus="loop">
						<tr>
							<td>${listPagingData.totalRecordCount - (((listPagingData.nowPage - 1) * listPagingData.pageSize) + loop.index)}</td>
	
							<td class="text-left"><a
								href="<c:url value="/onememo/bbs/View.do?no=${item.no}&nowPage="/><c:out value="${param.nowPage }" default="1"/>">${item.title }</a>
								<span class="badge">${item.commentCount }</span></td>
							<td>${item.name }</td>
							<td>${item.postDate }</td>
						</tr>
					</c:forEach>
				</c:if>
				 -->
			</table>
		</div>
		<!-- column -->
	</div>
	<!-- row -->
	<!-- 페이징 -->
	<c:if test="${listPagingData.lists.size() !=0 }">
		<div class="row">
			<div class="col-md-12 text-center">${listPagingData.pagingString}</div>
		</div>
	</c:if>
	
</div>
<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->