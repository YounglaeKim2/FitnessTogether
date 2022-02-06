<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- Top 끝 -->
<div class="container px-4 py-5" id="featured-3">
	<h1 class="pb-2 border-bottom">
		Perching Service
		<h4>${record.title}</h4>
	</h1>
</div>
<head>
<meta charset="utf-8">
<title>여러개 마커에 이벤트 등록하기2</title>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}
</style>

</head>
<body>
	<div class="container">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<div class="btn btn-link">
				<a href="<c:url value="#"/> " class="btn btn-primary">참여하기</a>
			</div>
			<div class="btn btn-link">
				<a href="<c:url value="/fnt/mappingList.do"/> "
					class="btn btn-primary">목록 보기</a>
			</div>
			<div class="btn btn-link">
				<a href="<c:url value="/fnt/mappingDelete.do?no=${record.no }"/> "
					class="btn btn-primary">삭제</a>
			</div>
			<div class="btn btn-link">
				<a href="<c:url value="/fnt/mappingEdit.do?no=${record.no }"/> "
					class="btn btn-primary">수정</a>
			</div>
		</div>
		<div class="row">
			<div class="col"></div>
			<div class="map_wrap col-10">

				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;">
				</div>




			</div>
			<div class="col"></div>
		</div>
	</div>

	<div class="container" style="padding-top: 15px;">

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


				<input type="hidden" name="title" value=${record.title }> <input
					type="hidden" name="latitude" value=${record.latitude }> <input
					type="hidden" name="longitude" value=${record.longitude }>
			</div>
		</div>

		<div class="row">
			<div class="col-md-8">
				<div class="text-center">
					<h4>한줄 댓글 입력 폼</h4>
					<form class="form-inline" id="frm">
						<input type="hidden" name="no" value="${record.no}" /> <input
							type="hidden" name="lno" /> <input placeholder="댓글을 입력하세요"
							id="title" class="form-control" type="text" size="50"
							name="linecomment" /> <input class="btn btn-primary" id="submit"
							type="button" value="등록" />
					</form>
					<div class="row">
						<div id="comments" class="col-md-12"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c244899725d72b692838ccde36cbb07d&libraries=clusterer"></script>
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

		//댓글 스크립트
      	//두번째 방법-ajax를 이용해서 페이지 로딩후 다시 서버에 현재 글번호에 대한 한줄 댓글 목록 요청
      	//          View.do요청과 코멘트 목록 요청 두번이 일어난다.
      	showComments();
      	//ajax로 서버에 데이터를 요청하는 함수]
      	/*
      		※AJAX에서의 요청방식
      		 -GET, POST요청 :
      			 data:key1=value1&key2=value2&...
      			 contentType:"application/x-www-form-urlencoded"(디폴트)			 
      			 스프링에서는 @RequestParam으로 데이타를 받는다
      	 	 -POST,PUT, DELETE요청
      	 	 	data:JSON.stringify({key1:value1,key2:value2,...})
      	 		contentType:"application/json"
      	 		스프링에서는 @RequestBody 로 데이터를 받는다.
      	*/
      	function showComments(){
      		//contentType키를 생략시 디폴트:x-www-form-urlencoded
      		//post방식이라 요청바디에 데이타가 key=value형태로 변환되서 전송 
      		$.ajax({
      			url:'<c:url value="/mapping/comments/List.do"/>',
      			data:{"no":"${record.no}","${_csrf.parameterName}":"${_csrf.token}"},
      			dataType:"json",
      			type:"post",
      			success:showComments_,
      			error:function(e){console.log(e);}
      		});
      	}
      	//실제 댓글 목록을 뿌려주는 함수]
      	function showComments_(data){
      		console.log("서버에서 전송받은 데이타(댓글 목록):",data);
      		var comments ="<h4>한줄 댓글 목록</h4>";
      		comments+="<table class='table table-bordered'>";
      		comments+="<tr><th class='text-center col-md-2'>작성자</th><th class='text-center'>코멘트</th><th class='text-center col-md-2'>작성일</th><th class='text-center col-md-2'>삭제</th></tr>";
      		comments+="<tbody class=\"comment-title\">";
      		
      		if(data.length ==0){
      			comments+="<tr><td colspan='4'>등록한 한줄 댓글이 없어요</td></tr>"
      		}
      		
      		$.each(data,function(index,element){
      			comments+="<tr class='comment"+element["LNO"]+"'><td>"+element["NAME"]+"</td>";
      			comments+="<td style='cursor:pointer' class='title' title='"+element["LNO"]+"'>"+element["LINECOMMENT"]+"</td>";
      			comments+="<td>"+element["LPOSTDATE"]+"</td>";
      			
      			//씨큐리티 미 사용시
      			if("${sessionScope.id}"==element['ID'])
      			
      			//씨큐리티 사용시
      			//if('<sec:authentication property="principal.username"/>'==element['ID'])
      				comments+="<td><span href=\"#\" style='cursor:pointer' class='delete btn btn-danger' title='"+element["LNO"]+"'>삭제</span></td></tr>";
      			else
      				comments+="<td><span class='btn btn-danger'>삭제불가</span></td></tr>";
      			
      		});
      		comments+="</tbody></table>";
      		$('#comments').html(comments);
      		
      	}//////////

      	//코멘트 입력 및 수정처리]
      	var action;
      	$("#submit").click(function(){
      		console.log("클릭 이벤트 발생:",$(this).val());
      		console.log("파라미터값들:",$("#frm").serialize());
      		if($(this).val()==='등록'){
      			action="<c:url value="/mapping/comments/Write.do"/>";
      			
      		}
      		else{
      			action="<c:url value="/mapping/comments/Edit.do"/>";
      			
      		}
      		console.log("한줄 댓글 키값(lno):",$('input[name=lno]').val());
      		//ajax로 요청]
      		$.ajax({
      			url:action,
      			data:$("#frm").serialize(),
      			dataType:"text",
      			type:"post",
      			success:function(data){
      				console.log("서버로부터 받은 데이타:",data);				
      				//showComments();이래도 된다. 하지만 서버에 또 현재글에 대한 댓글 전체목록 요청하게 된다
      				//아래는 서버에 요청을 보내지 않고 자스로만 처리
      				
      				if($('#submit').val()=='등록'){					
      					//"8:김길동"
      					var lno = data.split(":")[0];
      					var name = data.split(":")[1];
      					var date = new Date();
      					var lpostdate=date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate();
      					console.log(lno,name)
      					var newComment ="<tr class='comment"+lno+"'><td>"+name+"</td><td style='cursor:pointer' class='title' title='"+lno+"'>"+$("#title").val()+"</td><td>"+lpostdate+"</td><td style='cursor:pointer' class='delete' title='"+data+"'>삭제</td></tr>";
      					$(".comment-title").prepend(newComment);
      				}
      				else{
      					//서버에 요청 안보내고 원래 글을 수정한 글로 변경
      					//title속성값은 코멘트 제목 클릭시 설정한 lno값으로  혹은 컨트롤러에서 반환한 값(data)으로
      					
      					//코멘트 제목 클릭시 설정한 lno값
      					//$('.title[title='+$('input[name=lno]').val()+']').html($("#title").val());
      					
      					//컨트롤러에서 반환값으로
      					$('.title[title='+data+']').html($("#title").val());
      					
      					//버튼의 텍스트 변경
      					$('#submit').val("등록");
      				}
      				
      				//입력이나 수정시 댓글 클리어 및 포커스 주기
      				$('#title').val("");
      				$('#title').focus();
      				
      				showComments();
      				
      			}
      			
      		});////////////////
      	
      	});/////////click
      	
      	//코멘트 제목 클릭시 수정처리하기(UI변경)
      	//반드시 click이벤트걸때 $(document).on으로
      	$(document).on('click','.title',function(){
      		console.log('클릭:',$(this).html());
      		//클릭한 제목으로 텍스트박스 값 설정
      		$('#title').val($(this).html());
      		//버튼은 "등록"에서 "수정"으로
      		$('#submit').val("수정");
      		//댓글 입력 form의 hidden타입의 속성중 name="lno"의 value속성 설정
      		$('input[name=lno]').val($(this).attr('title'));
      		console.log("lno 설정후:",$('input[name=lno]').val());
      	});
      	//삭제 클릭시 삭제처리하기
      	$(document).on('click','.delete',function(){
      		var lno = $(this).attr('title').split(":")[0];
      		if(confirm("정말로 댓글을 삭제하시겠습니까?")){
      			//삭제 처리]
      			$.ajax({
      				url:"<c:url value="/mapping/comments/Delete.do"/>",
      				type:"post",
      				data:"lno="+lno,
      				dataType:"text"				
      			}).done(function(data){
      				console.log(data);
      				//tr태그 삭제
      				$('.comment'+lno).remove();
      				
      			}).fail(function(e){
      				console.log(e)
      			});
      		}		
      	});
      	
      	function isDelete(){
      		if(confirm("정말로 삭제 하시겠습니까?")){
      			location.replace("<c:url value="/mapping/mappingDelete.do?no=${record.no}"/>");
      		}
      	}
      	
      	
	</script>




<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<!-- footer 끝 -->