<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/isLogin.jsp"%>
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝

<style>
body {
	padding-top: 75px;
	margin-bottom: 75px;
}
</style>
-->
<!-- 실제 내용 시작 -->
<html>
<head>
    <meta charset="utf-8">
    <title>좌표로 주소를 얻어내기</title>
    <style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    
	</style>
</head>

<body>
	<div class="container px-4 py-5" id="featured-3">
		<h1 class="pb-2 border-bottom">Event<h4>이벤트를 만들어 보세요!</h4></h1>
	</div>
	<div class="container">
		<div class="btn btn-link">
			<a href="<c:url value="/fnt/Verification.do"/> "class="btn btn-primary">인증하기</a>
		</div>
		<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		    <div class="hAddr">
		        <span class="title">지도중심기준 행정동 주소정보</span>
		        <span id="centerAddr"></span>
		    </div>
		    <p><em>지도를 클릭해주세요!</em></p>
			<div id="clickLatlng"></div>
		</div>
	</div>
</body>
</html>

<div class="container">
	<main>
	<form class="form-horizontal" method="post" action="<c:url value='/fnt/mappingWrite.do'/>">
		<!-- 씨큐리티 적용:csrf취약점 방어용
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />-->
		<input type="hidden" name="id" value="${sessionScope.id}"/>
	    <div class="row g-5" style="padding-top:100px;">
	      <div class="col-md-7 col-lg-8">
	        <h4 class="mb-3">Event Info</h4>
	        <form class="needs-validation" novalidate>
	          <div class="row g-3">
	            <div class="col-12">
	              <label class="form-label">Title</label>
	              <input type="text" class="form-control" name="title" placeholder="제목을 입력하세요">
	            </div>
	            <div class="col-sm-6">
	              <label class="form-label">Date</label>
	              <input type="date" class="form-control" name="eventDate" placeholder="날짜를 입력하세요">
	            </div>
	            <div class="col-12">
	            	<div class="row">
		              <label class="form-label">Content</label>
		              <textarea class="from-control" name="content" rows="5" placeholder="내용을 입력하세요"></textarea>
	            	</div>
	            </div>
	          </div>
	          
	          <hr class="my-4">
	          
	          <button class="w-100 btn btn-primary btn-lg" type="submit">Create the Event</button>
	          
	          <hr class="my-4">
	          
	        </form>
	      </div>
	      
	      <!-- 좌우 -->
	      
	      <div class="col-md-5 col-lg-4 order-md-last">
	        <h4 class="d-flex justify-content-between align-items-center mb-3">
	          <span class="text-primary">Location Info</span>
	          <!--
	          <span class="badge bg-primary rounded-pill">3</span>
	          -->
	        </h4>
	        <ul class="list-group mb-3">
	        <!--
	          <li class="list-group-item d-flex justify-content-between lh-sm">
	            <div>
	              <h6 class="my-0">ID</h6>
	              <small class="text-muted">회원 아이디</small>
	            </div>
	            <span class="text-muted" name="id">${id}</span>
	          </li>
	        -->
	          <li class="list-group-item d-flex justify-content-between lh-sm">
	            <div class="row">
	              <h6 class="my-0">Latitude</h6>
	              <small class="text-muted">위도</small>
	            </div>
	            <span class="text-muted" name="latitude2">Latitude</span>
	          </li>
	          
	          <li class="list-group-item d-flex justify-content-between lh-sm">
	            <div class="row">
	              <h6 class="my-0">Longitude</h6>
	              <small class="text-muted">경도</small>
	            </div>
	            <span class="text-muted" name="longitude2">Longitude</span>
	          </li>
	          
	          <li class="list-group-item d-flex justify-content-between lh-sm">
	            <div class="row">
	              <h6 class="my-0">Address</h6>
	              <small class="text-muted">주소</small>
	            </div>
	            <span class="text-muted" name="eventAddress2">Address</span>
	          </li>
	          
	          <!--
	          <li class="list-group-item d-flex justify-content-between bg-light">
	            <div class="text-success">
	              <h6 class="my-0">Promo code</h6>
	              <small>EXAMPLECODE</small>
	            </div>
	            <span class="text-success">−$5</span>
	          </li>
	          -->
	        </ul>
			<!--
	        <form class="card p-2">
	          <div class="input-group">
	            <input type="text" class="form-control" placeholder="Promo code">
	            <button type="submit" class="btn btn-secondary">Redeem</button>
	          </div>
	        </form>
	        -->
	        <div class="row">
				<div class="col-sm-8">
					<textarea class="form-control" name="latitude" rows="1" style=display:none
						placeholder="위도"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8">
					<textarea class="form-control" name="longitude" rows="1" style=display:none
						placeholder="경도"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8">
					<textarea class="form-control" name="eventAddress" rows="1" style=display:none
						placeholder="주소"></textarea>
				</div>
			</div>
			<!--
			<div class="row">
				<div class="col-sm-8">
					<textarea class="form-control" name="id" rows="1" style=display:none
						placeholder="아이디">${sessionScope.id }</textarea>
				</div>
			</div>
			-->
	      </div>
	    </div>
    </form>
  </main>
		<!--  
		<div class="row" style="padding-top:100px;">
			<div class="col-md-12">
				<form class="form-horizontal" method="post"
					action="<c:url value='/fnt/mappingWrite.do'/>">
					 씨큐리티 적용:csrf취약점 방어용 
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="form-group">
						<label class="col-sm-2 control-label">제목</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="title"
								placeholder="제목을 입력하세요">
						</div>
						<label class="col-sm-2 control-label">날짜</label>
						<div class="col-sm-4">
							<input type="date" class="form-control" name="eventDate"
								placeholder="날짜를 입력하세요">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">내용</label>
						<div class="col-sm-10">
							<div class="row">
								<div class="col-sm-8">
									<textarea class="form-control" name="" rows="5"
										placeholder="내용 입력하세요"></textarea>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-8">
									<textarea class="form-control" name="" rows="5"
										placeholder="위도"></textarea>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-8">
									<textarea class="form-control" name="" rows="5"
										placeholder="경도"></textarea>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-8">
									<textarea class="form-control" name="" rows="5"
										placeholder="주소"></textarea>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-8">
									<textarea class="form-control" name="" rows="5"
										placeholder="아이디">lee</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</div>
					
				</form>
			</div>
		</div>
		-->
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c244899725d72b692838ccde36cbb07d&libraries=services"></script>
<script>
var lat = "";
var lng = "";

if (navigator.geolocation) {
	//브라우저의 geolocation 지원 여부 판단

	//PositionOptions객체 설정용]
	var options = {
		timeout : 3000,
		maximumAge : 5000
	};
	//현재 위치 정보를 한번만 얻기
	navigator.geolocation.getCurrentPosition(successCallback);
}
//현재 위치를 성공적으로 수신시 자동으로 호출되는 콜백함수
function successCallback(position) {
	lat = position.coords.latitude;
	lng = position.coords.longitude;
	
	////////////////////////////////////////////////////////////////////////

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
	    level: 4 // 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 지도 타입 변경 컨트롤을 생성한다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	

	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);

	//중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});

	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}

	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}

	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('centerAddr');

	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {
	                infoDiv.innerHTML = result[i].address_name;
	                break;
	            }
	        }
	    }    
	}

	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            
	            var content = '<div class="bAddr">' +
	                            '<span class="title">법정동 주소정보</span>' + 
	                            detailAddr + 
	                        '</div>';

	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);
	            
	         	// 클릭한 위도, 경도 정보를 가져옵니다 
	            var latlng = mouseEvent.latLng; 

	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	            
	            var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	            message += '경도는 ' + latlng.getLng() + ' 입니다';
	            
	            var resultDiv = document.getElementById('clickLatlng'); 
	            resultDiv.innerHTML = message;
	            
	            document.getElementsByName('latitude')[0].innerHTML = latlng.getLat();
	            document.getElementsByName('longitude')[0].innerHTML = latlng.getLng();
	            document.getElementsByName('eventAddress')[0].innerHTML = result[0].address.address_name;
	            document.getElementsByName('latitude2')[0].innerHTML = latlng.getLat();
	            document.getElementsByName('longitude2')[0].innerHTML = latlng.getLng();
	            document.getElementsByName('eventAddress2')[0].innerHTML = result[0].address.address_name;
	        }   
	    });
	});
}

</script>

<!-- 실제 내용 끝-->

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->