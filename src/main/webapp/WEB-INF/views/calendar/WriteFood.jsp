<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->
    <!-- Header -->
    <header id="header" class="header">
        <div class="container">
        <div class="col-xs-12"  style="margin-bottom: 5px">
        	<div class="col-">
				<span style="font-size: 3em; font-weight: bold;">${date}</span>            	
	    	</div>
	    	<!-- 검색용 UI -->
	    	<div class="row">
              <div class="text-center">
             	<div class="col-lg-12" style="padding-left: 65%;">
					<form class="form-line" method="post" action="<c:url value='/fnt/gowritefood.do'/>">
						<input type="hidden" value="${date}"/>
						<div class="form-group" style="padding-left: 30%;">
							<select name="searchColumn" class="form-control" style="padding-right: 70%;">
								<option selected value="">검색 내용 선택</option>
								<option value="title">음식 이름</option>
								<option value="name">음식 종류</option>
							</select>
						</div>
						<div class="form-group" style="padding-left: 30%;" >
							<input type="text" name="searchWord" class="form-control" />
						</div>
						<div class="form-line" style="padding-left: 80%;">	
							<button id="searchBtn" type="submit" class="btn btn-primary" >검색</button>
						</div>
					</form>
				</div>
				</div>
			   </div>
			  
            </div> <!-- end of row -->    
            <br/>
             	<div class="form-control" id="myTabContent" style="paddng-left: 20% ">
							<div class="tab-pane fade show active" id="food" role="tabpanel" aria-labelledby="food-tab">
		   						<table id="weighttable" class="table">
		   							<tr style="font-size: 1.1em; font-weight: bold;">
		   								<td>음식이름</td>
		   								<td>음식 종류</td>
		   								<td>칼로리</td>
		   								<td><input type="checkbox" value="all"/></td>
		   							</tr>
		   							<tr>
		   								<td>라면</td>
		   								<td>인스턴스</td>
		   								<td>750kcal</td>
		   								<td><input type="checkbox" name="select_food" value="food1"/></td>
		   								
		   							</tr>
		   							<tr>
		   								<td>부대찌개</td>
		   								<td>찌개류</td>
		   								<td>1200kcal</td>
		   								<td><input type="checkbox" name="select_food" value="food2"/></td>
		   							</tr>
		   							<tr>
		   								<td>아이스크림</td>
		   								<td>유제품류</td>
		   								<td>450kcal</td>
		   								<td><input type="checkbox" name="select_food" value="food3"/></td>
		   							</tr>
		   							<tr>
		   								<td>삼겹살</td>
		   								<td>고기류</td>
		   								<td>1250kcal</td>
		   								<td><input type="checkbox" name="select_food" value="food4"/></td>
		   							</tr>
		   						</table>
		   						<div align="right">
									<button id="btnform" type="button" class="btn btn-primary">확인</button>
								</div>
		   					</div>
		   					  						
            </div>
        </div> <!-- end of container -->
    </header> <!-- end of header -->
    <!-- end of header -->
<script>
//검색버튼처리(검색기능은 미완성)
$(function(){
	var searchBtn = $("#searchBtn");
	
	$('#searchBtn').click(function(){
		if(searchBtn.find("option:selected").val()){
			alert("검색할 항목을 선택하세요.");
			return false;
		}
		if(!searchBtn.find("input[name='searchWord']").val()){
			alert("검색하고 싶은 키워드를 입력하세요.");
			return false;
		}
		//e.preventDefalut();
		searchBtn.submit();
	});
	
	//체크박스 선택여부
	$(':checkbox').click(function(){
		if($(this).val()=='all'){//"전체선택" 클릭
			if($(this).prop('checked')){//체크한 경우
				$(':checkbox:gt(0)').each(function(){
					$(this).prop('checked',true);
				});
			}
			else{//해제한 경우
				$(':checkbox:gt(0)').each(function(){
					$(this).prop('checked',false);
				});
			}
		}
		else{//"전체선택"이 아닌 체크박스 클릭
			if($(this).prop('checked')){//체크한 경우
				//체크된 모든 체크박스의 수와 전체 선택을 제외한 체크박스의 수가 같다면 
				//즉 모두 선택되었다면 
				if($(':checkbox:gt(0)').length == $(':checkbox:checked').length)
					$(':checkbox:first').prop('checked',true);
			}
			else{//해제한 경우
				$(':checkbox:first').prop('checked',false);
			}
		}
	});
	
	
});
</script>
<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->