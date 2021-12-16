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
	    		<div align="right">
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
					<input type="hidden" value="${date}"/>
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
									<select name="type1" id="wieghtType1" class="testtype col-lg-12">
										<option value="">운동부위를 선택해주세요</option>
										<option value="reg">하체</option>
										<option value="back">등</option>
										<option value="chest">가슴</option>
										<option value="shoulder">어깨</option>
										<option value="arms">팔</option>
									</select>
								</td>
								<td>
									<select name="name1" id="weightName1" class="col-lg-12">
										<option value="">운동명을 선택해주세요</option>
									</select>
								</td>
								<td align="center">
									<input type="text" name="kg1" > Kg
								</td>
								<td align="center">
									<input type="text" name="count1" > 회
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
    </header> <!-- end of header -->
    <!-- end of header -->

<script>

	$(function(){
		
		var index = 1;
		
		$('#btnform').click(function(){
			$('#dataform').submit();
		});
		
		$('#add_row').mouseover(function(){
	    	$('#add_row').css('cursor','pointer');
	    });
		
		$('#remove_row').mouseover(function(){
	    	$('#remove_row').css('cursor','pointer');
	    });
		/*
		$('#add_row').click(function(){
			var addTable = '<tr><td><select name="type'+ ++index+'" id="wieghtType'+ index +'" class="col-lg-12"><option value="">운동부위를 선택해주세요</option><option value="reg">하체</option><option value="back">등</option><option value="chest">가슴</option><option value="shoulder">어깨</option></select></td><td><select name="name'+index+'" id="weightName'+ index +'" class="col-lg-12"><option value="">운동명을 선택해주세요</option></select></td><td align="center"><input type="text" name="kg'+index+'" > Kg</td><td align="center"><input type="text" name="count'+index+'" > 회</td></tr>';
			if($('#weighttable > tbody > tr').length == 10){
				alert('더이상 추가할 수 없습니다');
				return;
			}
			$('#weighttable > tbody:last').append(addTable);
			
			$('#wieghtType'+index).on("change",function(){
				$.ajax({
					url:"<c:url value="/fnt/selectOption.do"/>",
					dataType:"json",
					data:{"type":$(this).val()}
				}).done(function(data){
					console.log(data);	
					console.log(index);
					var options = "<option value=''>운동명을 선택해주세요</option>";
					$.each(data,function(index,value){ // value 는 json
						options += "<option value=''>"+value['NAME']+"</option>";
					});
					$('#weightName'+index).html(options);
				});
			});
			
		});
		*/
		$('#add_row').click(function(){
			var addTable = '<tr><td><select name="type'+ ++index+'" id="wieghtType'+ index +'" class="testtype col-lg-12"><option value="">운동부위를 선택해주세요</option><option value="reg">하체</option><option value="back">등</option><option value="chest">가슴</option><option value="shoulder">어깨</option><option value="arms">팔</option></select></td><td><select name="name'+index+'" id="weightName'+ index +'" class="col-lg-12"><option value="">운동명을 선택해주세요</option></select></td><td align="center"><input type="text" name="kg'+index+'" > Kg</td><td align="center"><input type="text" name="count'+index+'" > 회</td></tr>';
			if($('#weighttable > tbody > tr').length == 10){
				alert('더이상 추가할 수 없습니다');
				return;
			}
			$('#weighttable > tbody:last').append(addTable);
			
			$('.testtype').on("change",function(){
				var num = $(this).prop('id').substr(10);
				
				$.ajax({
					url:"<c:url value="/fnt/selectOption.do"/>",
					dataType:"json",
					data:{"type":$(this).val()}
				}).done(function(data){
					console.log(data);	
					var options = "<option value=''>운동명을 선택해주세요</option>";
					$.each(data,function(index,value){ // value 는 json
						options += "<option value=''>"+value['NAME']+"</option>";
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
		
		$('#wieghtType1').on("change",function(){
			$.ajax({
				url:"<c:url value="/fnt/selectOption.do"/>",
				dataType:"json",
				data:{"type":$(this).val()}
			}).done(function(data){
				console.log(data);	
				console.log(index);
				var options = "<option value=''>운동명을 선택해주세요</option>";
				$.each(data,function(index,value){ // value 는 json
					options += "<option value=''>"+value['NAME']+"</option>";
				});
				$('#weightName1').html(options);
				
			});
		});
		
			
		
		
		
	})

</script>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->