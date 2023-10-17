<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" />
<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css">
<link rel="stylesheet" href="/richtexteditor/res/style.css">
<link rel="stylesheet" type="text/css" href="/css/normalize.css">
<link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
<link rel="stylesheet" type="text/css" href="/css/vendor.css">
<link rel="stylesheet" type="text/css" href="/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">

<!-- script -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<script src="/js/twbsPagination.js"></script>
<script src="/js/modernizr.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script src="/richtexteditor/rte.js"></script>
<script src="/richtexteditor/plugins/all_plugins.js"></script>


<style>
.pagination .page-link {
	color: gray; /* 기본 글자색을 검정색으로 지정 */
}

.pagination .page-item.active .page-link {
	background-color: #C5A992;
	border: none;
}
</style>


</head>

<body>

	<div id="header-wrap">
		<c:choose>
			<c:when test="${sessionScope.loginIdx != null}">
				<jsp:include page="../loginAfterBox.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="../loginBeforeBox.jsp" />
			</c:otherwise>
		</c:choose>

		<header id="header">
			<div class="container">
				<div class="row">
					<div class="col-md-2">
						<div class="main-logo">
							<a href="/"><img src="/images/mainLogo.png" alt="logo"></a>
						</div>
					</div>
					<div class="col-md-10">
						<nav id="navbar">
							<div class="main-menu stellarnav">
								<br />
								<br />
								<ul class="menu-list">
									<li class="menu-item active"><a href="/libraryList.get">서재</a></li>
									<li class="menu-item"><a href="/myBookreportList.get">감상문</a></li>
									<li class="menu-item"><a href="/trackerList.go">트래커</a></li>
									<li class="menu-item"><a href="/calender.go">일정</a></li>
									<li class="menu-item"><a href="/deposit" class="nav-link">보증금</a></li>
									<li class="menu-item has-sub"><a href="#" class="nav-link">내
											정보</a>
										<ul>
											<li class="active"><a href="#">회원 정보</a></li>
											<li><a href="#">대여/교환 내역</a></li>
											<li><a href="#">문의 내역</a></li>
										</ul></li>
								</ul>
								
							</div>
						</nav>
					</div>
				</div>
			</div>
		</header>
	</div>

	<section class="hero-section jarallax">

		<div class="container">
			<div class="row">
				<div class="section-header align-center">
					<h2 class="section-title" style="margin-bottom: 10px;">Book
						Event Update Form</h2>
				</div>
			</div>
		</div>
	</section>

	<section id="latest-blog" class="scrollspy-section padding-large"
		style="padding-top: 10px; padding-bottom: 10px; margin-bottom: 10px;">
		<div class="container" style="text-align: center;">
			<form action="clubWrite.do" method="post" enctype=""
				style="text-align: center;">
				<table style="width: 100%;">
					<!-- <tr>
					<td width="5%"></td>
					<td width="45%"></td>
					<td width="15%"></td>
					<td width="15%"></td>
					<td width="15%"></td>
					<td width="5%"></td>
				</tr> -->
					<tr>
						<th>분류</th>
						<td><select id="class">
								<option id="baner">배너</option>
								<option id="list">리스트</option>
						</select></td>
					</tr>

					<tr>
						<th>제목</th>
						<td><input type="text" autocomplete='off' name="event_title"
							id="event_title"
							style="width: 500px; margin-bottom: 0px; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1; background: transparent;"
							placeholder=""></td>
					</tr>

					<tr>
						<th>유의사항</th>
						<td><textarea rows="200" cols="60"
								style="overflow: auto; word-wrap: break-word;"
								placeholder="최대 500자까지 입력이 가능합니다."></textarea></td>
					</tr>
					<!-- onchange="checkClubOnOff()"  -->
					<tr>
						<th>포스터 이미지</th>
						<td><input type="file" multiple="multiple"><span
							style="color: red;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.png,
								.jpg, .jpeg 확장자를 가진 파일만 업로드가 가능합니다.</span></td>
					</tr>

					<tr>
						<th>이벤트 기간</th>
						<td><input type="text" name="startDate" id="startDate"
							placeholder="이벤트 시작 날짜" style="width: 200px; margin-top: 20px;">
							~ <input type="text" name="endDate" id="endDate"
							placeholder="이벤트 종료 날짜" style="width: 200px; margin-top: 20px;">
						</td>
					</tr>
					<tr>
						<th>이벤트 당첨자 수</th>
						<td><input type="number" id="event_success"></td>
					</tr>
					<tr>
						<th colspan="4" style="text-align: center;"><input
							type="button" onclick="save()" value="등록" /> <input type="button"
							onclick="location.href='event.go'" value="취소" /></th>
					</tr>

				</table>
			</form>


		</div>
	</section>



	<div id="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="copyright">
						<div class="row">

							<div class="col-md-12" style="text-align: center;">
								<hr />
								<p>
									Â© 2022 All rights reserved. Free HTML Template by <a
										href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a>
								</p>
							</div>



						</div>
					</div>
					<!--grid-->

				</div>
				<!--footer-bottom-content-->
			</div>
		</div>
	</div>



</body>

<script>
	/* var config = {};

	 var win;

	 var link = document.getElementById('clubBookPop');

	 link.addEventListener('click',function(){
	 win = window.open('/clubBookPop.go','Infinity_Book','width=800px,height=800px');
	 })

	 // editor 크기 조절 불가
	 config.editorResizeMode = "none"; 

	 // 파일 업로드 관련 설정
	 config.file_upload_handler = function(file,callback){
	 console.log(file);
	 // file정보 : 크기, 이름, 종류 등을 알 수 있다.
	 if(file.size>(1*1024*1024)){
	 alert('1MB 이하 파일만 업로드 가능합니다.');
	 callback('/images/noimage.png');
	 }
	 console.log(callback);
	 } */
	/* 
	 $.datepicker.setDefaults({
	 dateFormat: 'yy-mm-dd',
	 prevText: '이전 달',
	 nextText: '다음 달',
	 monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	 monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	 dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	 dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	 showMonthAfterYear: true,
	 yearSuffix: '년'
	 }); */

	$(function() {
		$('#startDate').datetimepicker(
				{
					format : 'Y-m-d H:i', // 입력값의 형식을 지정
					lang : 'ko', // 언어 설정
					step : 60, // 분 단위로 선택 가능한 간격을 지정
					dayOfWeekStart : 1, // 주의 시작일을 월요일로 설정
					minDate : 0, // 오늘 이후의 날짜만 선택 가능하도록 설정
					allowTimes : [ '09:00', '10:00', '11:00', '12:00', '13:00',
							'14:00', '15:00', '16:00', '17:00', '18:00',
							'19:00', '20:00', '21:00' ]
				// 선택 가능한 시간을 지정
				});
	});
	$(function() {
		$('#endDate').datetimepicker(
				{
					format : 'Y-m-d H:i', // 입력값의 형식을 지정
					lang : 'ko', // 언어 설정
					step : 60, // 분 단위로 선택 가능한 간격을 지정
					dayOfWeekStart : 1, // 주의 시작일을 월요일로 설정
					minDate : 0, // 오늘 이후의 날짜만 선택 가능하도록 설정
					allowTimes : [ '09:00', '10:00', '11:00', '12:00', '13:00',
							'14:00', '15:00', '16:00', '17:00', '18:00',
							'19:00', '20:00', '21:00' ]
				// 선택 가능한 시간을 지정
				});
	});

	/* 
	 $(function() {
	 $('#startDate').datepicker({
	 format: 'Y-m-d',  // 입력값의 형식을 지정
	 lang: 'ko',  // 언어 설정
	 maxDate: new Date(),
	 onSelect: function(selectedDate) {
	 $('#endDate').datepicker('option', 'minDate', selectedDate); // 선택한 시작일로 endDate의 최소값 업데이트
	 }
	 });
	 }); */

	$(function() {
		$('#endDate').datepicker({
			format : 'Y-m-d', // 입력값의 형식을 지정
			lang : 'ko', // 언어 설정
			maxDate : new Date()
		});
	});
</script>

</html>
