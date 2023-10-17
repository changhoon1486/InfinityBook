<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
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
	body,h3{
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
	</style>
	</head>

<body>
	<table>
		<tr>
			<th>독서 시작일</th>
			<td><input type="text" name="startDate" id="startDate"  placeholder="독서 시작일" style="width:120px; margin-top: 20px;"></td>
		</tr>
		<tr>
			<th>독서 종료일</th>
			<td><input type="text" name="endDate" id="endDate"  placeholder="독서 종료일" style="width:120px; margin-top: 20px;"></td>
		</tr>
		<tr>
			<th colspan="2"><input type=button value="저장" onclick="trackerAddReadBook('${isbn}','${cover}')"/></th>
		</tr>
	</table>
</body>
<script>



	function trackerAddReadBook(isbn,cover) {
		console.log(isbn);
		console.log(cover);
		
		if($('#startDate').val() != ''){
			
			if($('#endDate').val() != ''){
		
			    $.ajax({
			        url: '/mypage/tracker/add/read/book.ajax',
			        type: 'get',
			        data: {
			            'isbn': isbn,
			            'cover': cover,
			            'startDate':document.getElementById("startDate").value,
			            'endDate':document.getElementById("endDate").value,
			            'jsp':"trackerAddReadBook.jsp"
			        },
					dataType:'json',
					success: function(data) {
						console.log(data);
						if(data.success){
							console.log("추가 완료");
							if (data != null) {
								  window.alert("트래커에 추가 되었습니다.");
								  window.close(); 
								  if (window.opener) {
								      window.opener.location.href = '/mypage/trackerList.go';
								   }
							}
						}else{
							console.log("추가 실패");
						}
		
			        },
					error:function(e){
						console.log(e);
					}
			    });
			}else{
				alert("종료일을 입력해주세요!");
			}
		}else{
			alert("시작일을 입력해주세요!");
		}
	}	
	
	function trackerChk(){
		
		$.ajax({
	        url: '/mypage/trackerChk.ajax',
	        type: 'get',
	        data: {
	            'isbn': isbn
	        },
			dataType:'json',
			success: function(data) {
				console.log(data);
					if(data.check == 0){
						
					}else{
						alert("트래커에 존재하는 책입니다.");
					}
					
	        },
			error:function(e){
				console.log(e);
			}
	    });
		
	}

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
	});

	$(function() {
	    $('#startDate').datepicker({
	    	format: 'Y-m-d',  // 입력값의 형식을 지정
		    lang: 'ko',  // 언어 설정
		    maxDate: new Date(),
		    onSelect: function(selectedDate) {
		        $('#endDate').datepicker('option', 'minDate', selectedDate); // 선택한 시작일로 endDate의 최소값 업데이트
		      }
	    });
	  });
	
	$(function() {
	    $('#endDate').datepicker({
	      format: 'Y-m-d',  // 입력값의 형식을 지정
	      lang: 'ko',  // 언어 설정
	      maxDate: new Date()
	    });
	  });
	
	var msg = "${msg}";
	if(msg != ''){
		alert(msg);
		 window.close(); // 창 닫기
	}

</script>
</html>