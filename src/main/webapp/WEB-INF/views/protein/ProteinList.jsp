<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!-- Top 시작 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- Top 끝 -->
<body>
	<div class="container px-4 py-5" id="featured-3">
		<h1 class="pb-2 border-bottom">Protein<h4>프로틴 추천!</h4></h1>
	</div>
	
	<div class="container">
      <div id="list_1" class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      </div>
	</div>
	
	<div class="container px-4 py-5" id="featured-3">
		<h1 class="pb-2 border-bottom"><h4>추가제품 추천!</h4></h1>
	</div>
	
	<div class="container">
      <div id="list_2" class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="margin-bottom: 15px">
      </div>
	</div>
	
</body>

<script>

	$.ajax({
		url:"http://127.0.0.1:10000/protein",
		dataType:"json"
	}).done(function(data){
		console.log(data);
		var array = data["protein"];
		$.each(array,function(index,element){
			$('#list_1').append("<div class='col'><div style='height:382px' class='card shadow-sm'><a href='"+element['link']+"'><img class='bd-placeholder-img card-img-top' width='100%' height='225' alt='image' src='"+element['src']+"'></a><div class='card-body'><div><a href='"+element['link']+"'><p class='card-text'>"+element['title']+"</p></a></div><div><p class='card-text'>"+element['price']+"</p> </div></div></div></div>");
		});
		
	});

	
	$.ajax({
		url:"http://127.0.0.1:10000/dietfood",
		dataType:"json"
	}).done(function(data){
		console.log(data);
		var array = data["proteinBar"];
		$.each(array,function(index,element){
			$('#list_2').append("<div class='col'><div style='height:382px' class='card shadow-sm'><a href='"+element['link']+"'><img class='bd-placeholder-img card-img-top' width='100%' height='225' alt='image' src='"+element['src']+"'></a><div class='card-body'><div><a href='"+element['link']+"'><p class='card-text'>"+element['title']+"</p></a></div><div><p class='card-text'>"+element['price']+"</p> </div></div></div></div>");
		});
	});
	

</script>

<!-- footer 시작 -->
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<!-- footer 끝 -->