<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#ul_{
	  margin: 0 auto;
	  padding: 0;
	  max-height: 390px;
	  overflow-y: auto;
	  border: 1px solid rgba(0, 0, 0, 0.1);
	  padding: 5px 5px 0 5px;
	  border-left: none;
	  border-right: none;
	}

	.li_ {
	  list-style: none;
	  background-color: rgba(0, 0, 0, 0.05);
	  background-image: 
	    linear-gradient(
	      90deg,
	      #FFD32E 10px,
	      #EEE 10px,
	      #EEE 11px,
	      transparent 11px);
	  padding: 10px 15px 10px 25px;
	  border: 1px solid #CCC;
	  box-shadow: inset 1px 1px 0 rgba(255, 255, 255, 0.5);
	  margin-bottom: 5px;
	  width: 100%;
	  box-sizing: border-box;
	  cursor: pointer;
	  border-radius: 3px;
	}
</style>
    
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
			   					<span class="input-group-text"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16"><path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path></svg></span>
								<input type="text" id="searchWord" name="searchWord" class="form-control" placeholder="검색하실 식품명을 입력해주세요" onKeypress="javascript:if(event.keyCode==13){search();event.preventDefault();}"/>
								<input type="button" id="searchBtn" class="btn btn btn-info" value="검색" onkeyup="if(window.event.keyCode==13){javascropt:search()}"/>
							</div>
						</div>
					</div>
				</form>
			</div>
	    </div>
	    <form class="form-control" action="<c:url value="/fnt/writefood.do"/>" method="post" id="foodform">
		    <input type="hidden" name='postdate' value="${date}"/>
		   <!-- 
			<input type="hidden" name="id" value="${sessionScope.id}"/>
			-->
			<input type="hidden" name="id" value="hkk1239"/>
			<table id="foodtable" class="table" style="text-align: center;">
				<thead class="table-primary">
					<tr style="font-size: 1.1em; font-weight: bold;">
		 				<td><input type="checkbox" value="all"/></td>
		 				<td>식품이름</td>
		 				<td>1회 제공량</td>
		 				<td>열량(kcal)</td>
		 				<td>탄수화물(g)</td>
		 				<td>단백질(g)</td>
		 				<td>지방(g)</td>
					</tr>
				</thead>
				<tbody>	
	 			</tbody>
	 			<tr style="font-weight: bold; background-color: aqua;">
	 				<td colspan="3">종합 섭취량</td>
					<td>0 kcal</td>
	 				<td>0 g</td>
	 				<td>0 g</td>
	 				<td>0 g</td>
	 			</tr>
	  		</table>
	  		<div align="right">
				<button id="savebtn" type="button" class="btn btn btn-info">저장</button>
				<button id="deletebtn" type="button" class="btn btn btn-info">식품삭제</button>
			</div>
		</form>
	</div> <!-- end of container -->
	
	<div class="modal fade" id="dataList" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
	   		<div class="modal-content">  
	   			<div class="modal-header">
					 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="javascript:$(document).off();"></button>   					
	  				 <h3 id="modaltitle" class="modal-title"></h3>
	  			</div>
	  			<div id ="modalcontent" class="modal-body">
                </div>
  			</div>   
		</div>
   	</div>    	
	
<script>
$(function(){
	
	var totalkcal = 0;
	var totaltan = 0;
	var totaldan = 0;
	var totalgi = 0;
	var count = 1;
	function search(){
		
		$.ajax({
			url:"<c:url value="/fnt/searchFood.do"/>",
			data:$('#dataform').serialize(),
			dataType:"json",
			type:"post"
		}).done(function(data){	
			
			var list="<ul id='ul_'>";
			
			if(data[0][['CODE']] == "INFO-200") {
				alert($('#searchWord').val()+"으로 검색된 결과가 없습니다");
				$('#searchWord').focus();
				return
			}
			
			$('#dataList').modal('show');
			$('#modaltitle').html($('#searchWord').val()+'으로 검색한 결과');
			$('#searchWord').val("");
			
			$.each(data,function(index,value){
				/*
					DESC_KOR : 식품이름
					GROUP_NAME : 식품종류
					MAKER_NAME : 브랜드명
					SERVING_SIZE : 총 내용량
					NUTR_CONT1 : 칼로리
					NUTR_CONT2 : 탄수화물
					NUTR_CONT3 : 단백질
					NUTR_CONT4 : 지방
				*/
				var num = index;
				++num;
				var kcal = isNaN(Math.round(parseInt(value['NUTR_CONT1'])))?0:Math.round(parseInt(value['NUTR_CONT1']));
				var tan = isNaN(Math.round(parseInt(value['NUTR_CONT2'])))?0:Math.round(parseInt(value['NUTR_CONT2']));
				var dan = isNaN(Math.round(parseInt(value['NUTR_CONT3'])))?0:Math.round(parseInt(value['NUTR_CONT3']));
				var gi = isNaN(Math.round(parseInt(value['NUTR_CONT4'])))?0:Math.round(parseInt(value['NUTR_CONT4']));
				list += "<li id='li_"+num+"' class='li_'> <stron style='font-weight: vold;'>"+value['DESC_KOR']+" ["+value['MAKER_NAME']+"]</strong><p style='font-size:13px'>[1회 제공량: "+Math.round(parseInt(value['SERVING_SIZE']))+" g] [칼로리: "+kcal+" kcal] [탄수화물: "+tan+" g] [단백질: "+dan+" g] [지방: "+gi+" g]</p></li>";
				var tr = "<tr><td><input type='checkbox' value='checked"+num+"'/></td><td>"+value['DESC_KOR']+"</td><td>"+Math.round(parseInt(value['SERVING_SIZE']))+" g</td><td>"+kcal+" kcal</td><td>"+tan+" g</td><td>"+dan+" g</td><td>"+gi+" g</td></tr>";
				$(document).on("click","#li_"+num,function(){
					$('#foodtable > tbody:last').prev().append(tr);
					var hidden = "<input name='food"+count++ +"' type='hidden' value='"+value['DESC_KOR']+"_"+Math.round(parseInt(value['SERVING_SIZE']))+"_"+kcal+"_"+tan+"_"+dan+"_"+gi+"'/>"
					$('#foodform').append(hidden);
					totalkcal += kcal;
					totaltan += tan;
					totaldan += dan;
					totalgi += gi;
					$('#dataList').modal('hide');
					$(document).off();
				});
			}); // each
			
			list += "</ul>";
			
			$('#modalcontent').html(list);
			
			$(document).on("click","li",function(){
				$('#foodtable > tbody:eq(1) > tr').html("<td colspan='3'>종합 섭취량</td><td>"+totalkcal+" kcal</td><td>"+totaltan+" g</td><td>"+totaldan+" g</td><td>"+totalgi+" g</td>");
				$(document).off();
			});
			
			
						
			
		}); //done
			
	}

	$('#deletebtn').click(function(){
		size_ = $(':checkbox:checked').length;
		for(var j=0;j<size_;j++){
			if($(':checkbox:checked').eq(j).val() != "all"){
				m_kcal = parseInt(($(':checkbox:checked').eq(j).parent().parent().children('td').eq(3).html()).replace(" kcal",""));
				m_tan = parseInt(($(':checkbox:checked').eq(j).parent().parent().children('td').eq(4).html()).replace(" g",""));
				m_dan = parseInt(($(':checkbox:checked').eq(j).parent().parent().children('td').eq(5).html()).replace(" g",""));
				m_gi = parseInt(($(':checkbox:checked').eq(j).parent().parent().children('td').eq(6).html()).replace(" g",""));
				totalkcal -= m_kcal;
				totaltan -= m_tan;
				totaldan -= m_dan;
				totalgi -= m_gi;
				$('#foodtable > tbody:eq(1) > tr').html("<td colspan='3'>종합 섭취량</td><td>"+totalkcal+" kcal</td><td>"+totaltan+" g</td><td>"+totaldan+" g</td><td>"+totalgi+" g</td>");
				$(':checkbox:checked').eq(j).parent().parent().remove();
				$('#foodform > input[type=hidden]:last').remove();
				count--;
			}
		}
	});
	
	$('#savebtn').click(function(){
		$('#foodform').submit();
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