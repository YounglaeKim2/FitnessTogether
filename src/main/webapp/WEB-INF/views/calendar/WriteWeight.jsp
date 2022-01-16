<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}

</style>
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->


	<div class="container" style="padding-top: 100px; padding-bottom: 100px">
		<div class="col-xs-12"  style="margin-bottom: 5px">
        	<div>
				<span style="font-size: 3em; font-weight: bold;">${date}</span>            	
    		</div>
    		<div align="right" style="margin-bottom: 10px">
    		</div>
    		<div align="right">
    			<button id="search" class="btn btn-info" style="font: bold; 10px; margin-right: 10px">운동영상 검색</button>
	    		<svg id="add_row" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus-circle-fill " viewBox="0 0 16 16">
				  <path d="M16 8	A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
				</svg>
				<svg id="remove_row" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-dash-circle-fill" viewBox="0 0 16 16">
				  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z"/>
				</svg>
			</div>
	    </div>
        <div class="row">
        	<form class="form-control" action="<c:url value="/fnt/writeweight.do"/>" method="post" id="dataform">
				<input type="hidden" name="postdate" value="${date}"/>
				<input type="hidden" name="id" value="${sessionScope.id}"/>
				<table id="weighttable" class="table">
					<thead class="table-primary">
						<tr align="center">
							<th scope="col">운동부위</th>
							<th scope="col">운동명</th>
							<th scope="col">무게</th>
							<th scope="col">횟수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<select name="type1" id="weightType1" class="testtype col-lg-12">
									<option value="">운동부위를 선택해주세요</option>
									<option value="하체">하체</option>
									<option value="등">등</option>
									<option value="가슴">가슴</option>
									<option value="어깨">어깨</option>
									<option value="팔">팔</option>
								</select>
							</td>
							<td>
								<select name="name1" id="weightName1" class="col-lg-12">
									<option value="">운동명을 선택해주세요</option>
								</select>
							</td>
							<td align="center">
								<input type="number" id="kg1" name="kg1" min="1"/> Kg
							</td>
							<td align="center">
								<input type="number" id="count1" name="count1" min="1"/> 회
							</td>
						</tr>
					</tbody>
				</table>
				<div align="right">
					<button id="btnform" type="button" class="btn btn-info">확인</button>
				</div>
			</form>	
		</div> <!-- end of row -->
	</div> <!-- end of container -->
<!-- 경고창 모달 시작 -->
<div class="modal fade" id="small-modal" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered">
   		<div class="modal-content"> 
   			<div class="modal-body">
   				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
   				<h5 class="modal-title">
   				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-megaphone" viewBox="0 0 16 16">
  					<path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9 6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z"/>
				</svg> &nbsp;확인 메시지</h5>
				<div style="padding-top: 15px">
  					<span id="warningMessage" style="font-weight: bold;font-size: 30px;color: red"></span>
  				</div>
   			</div>    			
   		</div>    		
   	</div>    	
</div>
<!-- 유튜브 검색 모달 시작 -->
<div class="modal fade" id="searchModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<div><span style="font-size: 35px;font-weight: bold;">운동영상 검색</span></div>  
				<div class="col-md-6">
					<div class="input-group">
						<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16"><path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path></svg></span>
						<input type="text" id="searchWord" name="searchWord" class="form-control" placeholder="검색하실 운동명을 입력해주세요" onKeypress="javascript:if(event.keyCode==13){search();event.preventDefault();}"/>
						<input type="button" id="searchBtn" class="btn btn btn-info" value="검색" onkeyup="if(window.event.keyCode==13){javascropt:search()}"/>
					</div>
					
				</div>
			</div>
			<div class="modal-body" >
				<div id="videos" style="display: inline-block;"></div>
				<br/>
				<div id="playvideo" align="center" style="margin-top: 25px"><span style="font-size: 2em;font-weight: bold;">검색된 결과가 없습니다</span></div>				
				<br/>
				<div align="right">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>


<script>

	$(function(){
		var index = 1;
		var focusObject;
		
		$(document).on('input','input[type=number]',function() {
		    var maxlength = 4;
		    var value = $(this).val();
		    if (value && value.length >= maxlength) {
		        $(this).val(value.substr(0, maxlength));
		    }
		});
		
		$('#btnform').click(function(){
			$('#dataform').submit();
		});
		
		$('#small-modal').on('hidden.bs.modal',function(){
			focusObject.focus();
		});
		
		$('#dataform').on('submit',function(){
			var form = $(this).get(0);
			if($('#weightType1').val() == ""){
				$('#warningMessage').html('운동부위를 선택해주세요');
				$('#small-modal').modal('show');
				focusObject = $('#weightType1');
				return false;
			}
			if($('#weightName1').val() == ""){
				$('#warningMessage').html('운동명을 선택해주세요');
				$('#small-modal').modal('show');
				focusObject = $('#weightName1');
				return false;
			}
			if($('#kg1').val() == ""){
				$('#warningMessage').html('무게를 입력해주세요');
				$('#small-modal').modal('show');
				focusObject = $('#kg1');
				return false;
			}
			if($('#count1').val() == ""){
				$('#warningMessage').html('횟수를 입력해주세요');
				$('#small-modal').modal('show');
				focusObject = $('#count1');
				return false;
			}
		});
		
		$('.bi').mouseover(function(){
	    	$('#add_row').css('cursor','pointer');
	    	$('#remove_row').css('cursor','pointer');
	    });
		
		
		$('#add_row').click(function(){
			var addTable = '<tr><td><select name="type'+ ++index+'" id="weightType'+ index +'" class="col-lg-12"><option value="">운동부위를 선택해주세요</option><option value="하체">하체</option><option value="등">등</option><option value="가슴">가슴</option><option value="어깨">어깨</option><option value="팔">팔</option></select></td><td><select name="name'+index+'" id="weightName'+ index +'" class="col-lg-12"><option value="">운동명을 선택해주세요</option></select></td><td align="center"><input type="number" id="kg'+ index +'" name="kg'+index+'" min="1"/> Kg</td><td align="center"><input type="number" id="count'+ index +'" name="count'+index+'" min="1"/> 회</td></tr>';
			if($('#weighttable > tbody > tr').length == 10){
				alert('더이상 추가할 수 없습니다');
				return;
			}
			var num = index;
			$('#weighttable > tbody:last').append(addTable);
			
			$('#dataform').on('submit',function(){
				var form = $(this).get(0);
				
				if($('#weightType'+num).val() == ""){
					$('#warningMessage').html('운동부위를  선택해주세요');
					$('#small-modal').modal('show');
					focusObject = $('#weightType'+num);
					return false;
				}
				if($('#weightName'+num).val() == ""){
					$('#warningMessage').html('운동명을 선택해주세요');
					$('#small-modal').modal('show');
					focusObject = $('#weightName'+num);
					return false;
				}
				if($('#kg'+num).val() == ""){
					$('#warningMessage').html('무게를 입력해주세요');
					$('#small-modal').modal('show');
					focusObject = $('#kg'+num);
					return false;
				}
				if($('#count'+num).val() == ""){
					$('#warningMessage').html('횟수를 입력해주세요');
					$('#small-modal').modal('show');
					focusObject = $('#count'+num);
					return false;
				}
			});
			
			$('#weightType'+num).on("change",function(){
				$.ajax({
					url:"<c:url value="/fnt/selectOption.do"/>",
					dataType:"json",
					data:{"type":$(this).val()}
				}).done(function(data){
					console.log(data);	
					console.log(num);
					var options = "<option value=''>운동명을 선택해주세요</option>";
					$.each(data,function(num,value){ // value 는 json
						options += "<option value='"+value['NAME']+"'>"+value['NAME']+"</option>";
					});
					$('#weightName'+num).html(options);
				});
			});
			
		});
		
		$('#remove_row').click(function(){
			if($('#weighttable > tbody > tr').length == 1){
				alert('더이상 삭제할 수 없습니다');
				return;
			}
			$('#weighttable > tbody > tr:last').remove();
			--index;
		});
		
		$('#weightType1').on("change",function(){
			$.ajax({
				url:"<c:url value="/fnt/selectOption.do"/>",
				dataType:"json",
				data:{"type":$(this).val()}
			}).done(function(data){
				console.log(data);	
				console.log(index);
				var options = "<option value=''>운동명을 선택해주세요</option>";
				$.each(data,function(index,value){ // value 는 json
					options += "<option value='"+value['NAME']+"'>"+value['NAME']+"</option>";
				});
				$('#weightName1').html(options);
				
			});
		});
		
		$('#search').click(function(){
			$('#searchModal').modal('show');
		});
		
		
		
		function search(){
			var keyword = $('#searchWord').val()
			$.ajax({
				url:'http://localhost:10000/youtube/'+keyword
			}).done(function(data){
				$('#playvideo').html("");
				$('#videos').html("");
				data = JSON.parse(data);
				var divs ="";
				
				$.each(data,function(index,element){
					var num = index+1
					divs += "<a href='#' id='play"+num+"'><img style='width: 230px; height: 130px; margin-right: 25px;' src='"+element['img']+"' data-link='"+element['link']+"' data-width='560' data-height='315'/></a>"
					
					$(document).on("click",'#play'+num,function(){
						$('#playvideo').html("");
						$('#playvideo').html(element['link']);
					});
				});
				divs += "<br/>"
				
				$('#videos').html(divs);
				$('#searchWord').val("");
				
				
				
			});
		}

		$('#searchModal').on('hidden.bs.modal',function(){
			$('#videos').html("");
			$('#searchWord').val("");
			$('#playvideo').html("<span style='font-size: 2em;font-weight: bold;'>검색된 결과가 없습니다</span>");
		});
		
		//검색버튼 클릭시
		$('#searchBtn').click(function(){
			if($('#searchWord').val() == ""){
				alert("검색어를 입력해주세요");
				return
			}
			search();
		});
		
		$('#searchWord').on('keydown',function(){
			if(event.keyCode === 13) {
	        	event.preventDefault(); // 엔터키로 submit 하는거 막기
	        	if($('#searchWord').val() == ""){
	    			alert("검색어를 입력해주세요");
	    			return
	    		}
	        	search();
		    }
			
		});
		
	})

</script>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->