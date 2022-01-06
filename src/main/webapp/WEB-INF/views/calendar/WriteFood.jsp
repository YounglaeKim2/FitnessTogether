<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->
   	<div class="container" style="padding-top: 100px; padding-bottom: 100px">
       	<div class="row"  style="margin-bottom: 10px;">
	       	<div>
				<span style="font-size: 3em; font-weight: bold;">${date}</span>            	
	    	</div>
    	</div>
    	<div class="row" style="margin-bottom: 35px;">
    		<div class="col-md-12">
	   			<form id="dataform" method="post">
	   				<div class="row align-items-end">
	   					<div class="col-md-7">
	   						　
	   					</div>
	   					<div class="col-md-5">
	   						
			   				<div class="input-group">
								<input type="text" name="searchWord" class="form-control" placeholder="검색하실 식품명을 입력해주세요"/>
								<input type="button" id="searchBtn" class="btn btn btn-info" value="검색" />
							</div>
						</div>
					</div>
				</form>
			</div>
	    </div>
	    <form class="form-control" action="<c:url value="/fnt/writeweight.do"/>" method="post" id="foodform">
		    <input type="hidden" value="${date}"/>
			<table class="table" style="text-align: center;">
				<thead class="table-primary">
					<tr style="font-size: 1.1em; font-weight: bold;">
		 				<td><input type="checkbox" value="all"/></td>
		 				<td>식품이름</td>
		 				<td>총내용량</td>
		 				<td>열량(kcal)</td>
		 				<td>탄수화물(g)</td>
		 				<td>단백질(g)</td>
		 				<td>지방(g)</td>
					</tr>
				</thead>
				<tbody>	
		 			<tr>
		 				<td><input type="checkbox" name="select_food" value="food1"/></td>
		 				<td>닭꼬치</td>
		 				<td>70 g</td>
		 				<td>176.72 kcal</td>
		 				<td>13.35 g</td>
		 				<td>11.56 g</td>
		 				<td>8.57 g</td>
		 			</tr>
		 			<tr>
		 				<td><input type="checkbox" name="select_food" value="food2"/></td>
		 				<td>국물떡볶이</td>
		 				<td>310 g</td>
		 				<td>605 kcal</td>
		 				<td>128 g</td>
		 				<td>17 g</td>
		 				<td>2.9 g</td>
		 			</tr>
		 			<tr style="font-weight: bold; background-color: aqua;">
		 				<td colspan="3">종합 섭취량</td>
						<td>781.72 kcal</td>
		 				<td>141 g</td>
		 				<td>28.56 g</td>
		 				<td>11.47 g</td>
		 			</tr>
	 			</tbody>
	  		</table>
	  		<div align="right">
				<button id="btnform" type="button" class="btn btn btn-info">저장</button>
				<button id="" type="button" class="btn btn btn-info">식품삭제</button>
			</div>
		</form>
	</div> <!-- end of container -->
<script>
$(function(){
	
	//검색버튼 클릭시
	$('#searchBtn').click(function(){
		$.ajax({
			url:"<c:url value="/fnt/searchFood.do"/>",
			data:$('#dataform').serialize(),
			dataType:"json",
			type:"post"
		}).done(function(data){	
			console.log(data);
			console.log(typeof data);
			if(data[0][['CODE']] == "INFO-200") alert("검색된 결과가 없습니다")
		});
	});
	
	// 체크박스용
	$(':checkbox').click(function(){
		if($(this).val()=='all'){
			if($(this).prop('checked')){
				$(':checkbox:gt(0)').each(function(){
					$(this).prop('checked',true);
				});
			}
			else{
				$(':checkbox:gt(0)').each(function(){
					$(this).prop('checked',false);
				});
			}
		}
		else{
			if($(this).prop('checked')){
				if($(':checkbox:gt(0)').length == $(':checkbox:checked').length)
					$(':checkbox:first').prop('checked',true);
			}
			else{
				$(':checkbox:first').prop('checked',false);
			}
		}
	});
	
	
});
</script>
<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->