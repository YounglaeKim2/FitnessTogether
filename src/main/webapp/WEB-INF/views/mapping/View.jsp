<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->
<div class="container px-4 py-5" id="featured-3">
	<h1 class="pb-2 border-bottom">Perching Service<h4>${record.title}</h4></h1>
</div>
<head>
<meta charset="utf-8">
	<title>여러개 마커에 이벤트 등록하기2</title>
	<style>
		
		.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
		.map_wrap {position:relative;width:100%;height:500px;}
		#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
		.bg_white {background:#fff;}
		#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap .option{text-align: center;}
		#menu_wrap .option p {margin:10px 0;}
		#menu_wrap .option button {margin-left:5px;}
		#placesList li {list-style: none;}
		#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
		#placesList .item span {display: block;margin-top:4px;}
		#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		#placesList .item .info{padding:10px 0 10px 55px;}
		#placesList .info .gray {color:#8a8a8a;}
		#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
		#placesList .info .tel {color:#009900;}
		#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
		#placesList .item .marker_1 {background-position: 0 -10px;}
		#placesList .item .marker_2 {background-position: 0 -56px;}
		#placesList .item .marker_3 {background-position: 0 -102px}
		#placesList .item .marker_4 {background-position: 0 -148px;}
		#placesList .item .marker_5 {background-position: 0 -194px;}
		#placesList .item .marker_6 {background-position: 0 -240px;}
		#placesList .item .marker_7 {background-position: 0 -286px;}
		#placesList .item .marker_8 {background-position: 0 -332px;}
		#placesList .item .marker_9 {background-position: 0 -378px;}
		#placesList .item .marker_10 {background-position: 0 -423px;}
		#placesList .item .marker_11 {background-position: 0 -470px;}
		#placesList .item .marker_12 {background-position: 0 -516px;}
		#placesList .item .marker_13 {background-position: 0 -562px;}
		#placesList .item .marker_14 {background-position: 0 -608px;}
		#placesList .item .marker_15 {background-position: 0 -654px;}
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:#777;}
	</style>
	
</head>
<body>
	<div class="container">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<div class="btn btn-link">
				<a href="<c:url value="/fnt/mappingList.do"/> "class="btn btn-primary">목록 보기</a>
			</div>
		</div>
		<div class="row">	
			<div class="col"></div>
			<div class="map_wrap col-10">
				
				<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;">
				</div>
				
				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								키워드 : <input type="text" value="가산" id="keyword" size="15">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
				
				
			</div>
			<div class="col"></div>
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c244899725d72b692838ccde36cbb07d&libraries=clusterer"></script>
	<script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.47893666774784, 126.87891734605707), // 지도의 중심좌표
                level: 2, // 지도의 확대 레벨
                mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
            }; 
    
        // 지도를 생성한다 
        var map = new kakao.maps.Map(mapContainer, mapOption);
        
     	// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

        // 마커 클러스터러를 생성합니다 
        var clusterer = new kakao.maps.MarkerClusterer({
            map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
            averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
            minLevel: 4 // 클러스터 할 최소 지도 레벨 
        });
		
        $.ajax({
        	url:"<c:url value="/fnt/getlatlng.do"/>",
        	data:{"no":${record.no}},
        	datatpye:"json",
        	type:"post"
        }).done(function(data){
        	console.log(data);
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



	<div class="container" style="padding-top:15px;">
		
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<table class="table table-bordered table-striped">
					<tr>
						<th class="col-md-2 text-center">번호</th>
						<td>${record.no}</td>
					</tr>
					<tr>
						<th class="text-center">제목</th>
						<td>${record.title}</td>
					</tr>
					<tr>
						<th class="text-center">작성자</th>
						<td>${record.name}</td>
					</tr>
					<tr>
						<th class="text-center">등록일</th>
						<td>${record.postDate}</td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">내용</th>
					</tr>
					<tr>
						<td colspan="2">${record.content}</td>
					</tr>
				</table>
			</div>
		</div>
		
	</div>
</body>





<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->