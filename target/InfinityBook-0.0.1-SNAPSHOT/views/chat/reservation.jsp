<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<head>
	
		<!-- Datetimepicker 라이브러리 불러오기 -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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

		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
	body,h2{
		font-family: 'IBM Plex Sans KR', serif;	
	}
	body{
		margin:30px;	
	}
	table{
		width: 100%;
	}
	input[type="button"]{
		margin-left: 40%;
	}
	    font-size: 1em;
    font-weight: 600;
    border: none;
    height: 65px;
    cursor: pointer;
	
</style>
</head>
<body>

	<c:if test="${reservation.rent_idx == null}">
	<form action="changereservation.do">
		<input type="hidden" name="library_book" value="${reservation.library_idx}"/>
		<input type="hidden" name="change_idx" value="${reservation.change_idx}"/>			
		<div>교환할 책</div>
		<input type="text" name="library_book2" value="${reservation.library_book2}">
		<div>교환 일</div>
		<input type="date" name="change_date" value="${reservation.change_date}">
		<br/>
		<button type="submit" style="font-size:15px; width: 100px; height: 50px;">확인</button>	
	</form>	
	</c:if>
	
	<c:if test="${reservation.change_idx == null}">	
	<form action="rentreservation.do">
		<input type="hidden" name="library_idx" value="${reservation.library_idx}"/>
		<input type="hidden" name="rent_idx" value="${reservation.rent_idx}"/>			
		<div>보증금</div>
		<input type="number" name ="rent_deposit" value="${reservation.rent_deposit}">
		<div>대여 일</div>
		<input type="date" id="date" name ="rent_startdate" value="${reservation.rent_startdate}">
		<div>반납 일</div>
		<input type="date" id="date2" name ="rent_enddate" value="${reservation.rent_enddate}">
		<br/>
		<button type="submit" style="font-size:15px; width: 100px; height: 50px;">확인</button>							
	</form>
	</c:if>
	
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

</script>
</html>