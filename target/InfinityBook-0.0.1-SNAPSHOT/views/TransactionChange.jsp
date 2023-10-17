<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<meta charset="UTF-8">
	<head>
		<title>Infinite B∞k</title>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="format-detection" content="telephone=no">
	    <meta name="apple-mobile-web-app-capable" content="yes">
	    <meta name="author" content="">
	    <meta name="keywords" content="">
	    <meta name="description" content="">

	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">

		<!-- script -->
		<script src="/js/modernizr.js"></script>
		<script src="/js/jquery-1.11.0.min.js"></script>
		<script src="/js/plugins.js"></script>
		<script src="/js/script.js"></script>
			
			<style>
			@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
         h2,h3,h4{
            font-family: 'IBM Plex Sans KR';   
            font-weight: 600;
            margin: 10 0 0 0;
         }
			</style>
	</head>

<body>

<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title">교환</h2>
			</div>
		</div>
	</div>
</section>

<section id="best-selling" class="leaf-pattern-overlay" style="margin-bottom: 0px; padding:0px;">
	<div class="corner-pattern-overlay"></div>
	<div class="container">
		<table style="width:100%">
		<tr>
			<th style="width:28%">
				<img src="${book.library_cover}" alt="book" class="single-image" style="width: 89%; height: 46%; padding: 10;">
				<h3 id="title" style="font-size: 22; font-weight: 800; height: auto;">${book.library_title}</h3>
				<form action="changeapply.do" method="post" onsubmit='return formSubmit();'>
				<input type="hidden" name="library_book" value="${book.library_idx}"/>
				<h3>교환 일정 선택</h3> <input type="date" id="date" name="change_date"/>
				<input type="hidden" id="library_book2" name="library_book2" value=""/>
				</form>
			</th>
			<th style="width:80%">
				<c:if test="${mybook.size() == 0}">
				<h3>교환할 책이 없습니다.</h3>
				</c:if>
					<h3>내 책 목록</h3>
							<div class="products-grid grid">						
							<c:forEach var="mybook" items="${mybook}" varStatus="status">
								<figure class="product-style" style="margin-bottom: 20px; height: 555px;">
									<img id="cover" src="${mybook.library_cover}" class="product-item" style="width: 100%; height: 25%; padding: 10;">
									<figcaption style="height: 200px; margin-top:13%;">
										<h3 id="title" style="font-size: 17; font-weight: 800; height: auto;">${mybook.library_title}</h3>
										<input type="button" onclick="(function(){
												var div = $('#'+'${mybook.library_idx}').val();
												$('input[name=library_book2]').val(div);
												$('form').submit();
											})()" value="교환"/>
									</figcaption>
									<input type="hidden" id="${mybook.library_idx}" value="${mybook.library_idx}"/>						
								</figure>
							</c:forEach>
						</div>
		
			</th>
		</tr>
		</table>
		
		
		
		
		
	
		
		
	</div>
</section>

</body>
				<script>
		var now_utc = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
		// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		document.getElementById("date").setAttribute("min", today);
		
		function formSubmit() {
			
			
			if(document.getElementById("date").value == ""){
				alert('날짜를 선택 해 주세요.');
				  return false;
			}else{
				 return true;
			 }
		};
		
		
		</script>
</html>	