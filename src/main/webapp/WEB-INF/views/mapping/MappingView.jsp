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
		
	</style>
	
</head>
<body>
	<div class="container">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<div class="btn btn-link">
				<a href="<c:url value="#"/> "class="btn btn-primary">참여하기</a>
			</div>
			<div class="btn btn-link">
				<a href="<c:url value="/fnt/mappingList.do"/> "class="btn btn-primary">목록 보기</a>
			</div>
			<div class="btn btn-link">
				<a href="<c:url value="/fnt/mappingDelete.do?no=${record.no }"/> "class="btn btn-primary">삭제</a>
			</div>
			<div class="btn btn-link">
				<a href="<c:url value="/fnt/mappingEdit.do?no=${record.no }"/> "class="btn btn-primary">수정</a>
			</div>
		</div>
		<div class="row">	
			<div class="col"></div>
			<div class="map_wrap col-10">
				
				<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;">
				</div>
				
				
				
				
			</div>
			<div class="col"></div>
		</div>
	</div>
	
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
		
				<input type="hidden" name="title" value=${record.title }>
				<input type="hidden" name="latitude" value=${record.latitude }>
				<input type="hidden" name="longitude" value=${record.longitude }>
			</div>
		</div>
		
	</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c244899725d72b692838ccde36cbb07d&libraries=clusterer"></script>
	<script>
	    var title = document.getElementsByName("title")[0].value;
		var latitude = document.getElementsByName("latitude")[0].value;
		var longitude = document.getElementsByName("longitude")[0].value;
		
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
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
        
		var data = [latitude, longitude, '<div style="padding:5px;">'+title+'</div>'];

	
        var markers =[];

          // 지도에 마커를 생성하고 표시한다
          var marker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(data[0], data[1]), // 마커의 좌표
            map: map // 마커를 표시할 지도 객체
          });

          // 마커가 지도 위에 표시되도록 설정합니다
          //marker.setMap(map);

          //var iwContent = '<div style="padding:5px;">붕어빵!</div>';

          // 인포윈도우를 생성합니다
          var infowindow = new kakao.maps.InfoWindow({
              content : data[2]
          });
            
          // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
          infowindow.open(map, marker);
          markers.push(marker);
          kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
          kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        

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




<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->