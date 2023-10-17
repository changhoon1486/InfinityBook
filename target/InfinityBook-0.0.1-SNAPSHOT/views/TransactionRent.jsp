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
			<div class="section-header align-center"><br><br>
				<h2 class="section-title">대여</h2><br><br>
			</div>
		</div>
	</div>
</section>
	<div style="margin: 5% 0% 0% 20%; height: 76%;">
		<div class="container" style="float: left; width: 36%; margin-right:5%;">
			<img src="${book.library_cover}" alt="book" class="single-image">		
		</div>
		<div class="container" style="line-height: 5; width: 47%; ">
			<h3 class="item-title">${book.library_title}</h3>
			<form action="rentapply.do"  method="post" onsubmit='return formSubmit();'>
				<input type="hidden" name="library_idx" value="${book.library_idx}">
				<div>현재 보증금 : ${rent_deposit}</div>
				<input type="number" id="rent_deposit" name="rent_deposit" placeholder="희망 보증금액">
				<input type="date" id ="date" name="rent_startdate" placeholder="희망 대여일자" style="height: 30px; position:static">
				<input type="date" id ="date2" name="rent_enddate" placeholder="희망 반납일자" style="height: 30px;"><br>
				<button type="submit" style="    height: 47px;">신청</button>
			</form>
		</div>
	</div>
</body>
		<script>
		var now_utc = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
		// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		document.getElementById("date").setAttribute("min", today);
		document.getElementById("date2").setAttribute("min", today);
		
		window.onload = () => {
		var date = document.getElementById("date");
		  date.addEventListener("change", (e) => {
			  var val = document.getElementById("date").value;
			  document.getElementById("date2").setAttribute("min", val);
			  });
		};
		
		function formSubmit() {
			
		
			if(document.getElementById("rent_deposit").value == ""){
				alert('보증금을 입력 해 주세요.');
				  return false;
			}else if(document.getElementById("date").value == ""){ 
				alert('시작 기간을 입력해주세요.');
				return false;
			}else if(document.getElementById("date2").value == ""){
				alert('종료 기간을 입력해주세요.');
				  return false;
			}else if(document.getElementById("rent_deposit").value >${rent_deposit}){
				alert('최대 보증금을 넘을 수 없습니다.');
				  return false;
			}else if(document.getElementById("rent_deposit").value == 0){
				alert('보증금은 0원 이상 입력해주세요.');
				  return false;
			}else{
				 return true;
			 }
		};
		</script>

</html>	