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
    
    <!-- Datetimepicker 라이브러리 불러오기 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
			<td>
				<c:if test="${jsp == 'trackerSearch.jsp'}">
					<input type="text" name="startDate" id="startDate"  placeholder="독서 시작일" style="width:120px; margin-top: 20px;">
				</c:if>
				<c:if test="${jsp == 'trackerDetail.jsp'}">
					<input type="text" name="startDate" id="startDate"  value="${startDate}" style="width:120px; margin-top: 20px;">
				</c:if>
			</td>
		</tr>
		<tr>
			<th>읽은 페이지 수</th>
			<td>
				<c:if test="${jsp == 'trackerSearch.jsp'}">
					<input type="text" name="readPage" id="readPage" placeholder="읽은 페이지 수" value="0" style="width:60px; margin-top: 20px;">
				</c:if>
				<c:if test="${jsp == 'trackerDetail.jsp'}">
					<input type="number" name="readPage" id="readPage" value="${readPage}" style="width:60px; margin-top: 20px;">
				</c:if>
				<input type="text" name="totalPage" id="totalPage"  placeholder="총 페이지 수" style="width:60px; margin-top: 20px;" readonly>
			</td>
		</tr>
		<tr>
			<c:if test="${jsp == 'trackerSearch.jsp'}">
				<th colspan="2"><input type=button value="저장" onclick="trackerAddReadingBook()"/></th>
			</c:if>
			<c:if test="${jsp == 'trackerDetail.jsp'}">
				<th colspan="2"><input type=button value="저장" onclick="trackerUpdateReadingBook()"/></th>
			</c:if>
		</tr>
	</table>
</body>
<script>
	
	var isbn = "${isbn}";
	var cover = "${cover}";
	var jsp = "${jsp}";
	console.log("isbn : "+isbn+"cover : "+cover+"jsp : "+jsp);
	
	$(document).ready(function() {	
	    $.ajax({
	        url: '/mypage/getTotalPage.ajax',
	        type: 'get',
	        data: {
	            'isbn': isbn,
	            'cover': cover,
	            'jsp': "trackerAddReadingBook.jsp"
	        },
	        dataType: 'json',
	        success: function(data) {
	        	console.log(data);
	        	if(data != null){
	        		$('#totalPage').val(data.totalPage);
	        	}	        	
	        },
	        error: function(e) {
	            console.log(e);
	        }
	    });
	});

	$('#readPage').on('input', function() {
		  if ($(this).val() == '' || isNaN($(this).val())) {
		    console.log("왜안와");
		    $(this).val(0);
		    alert("숫자만 입력 가능합니다.");
		  }
		
	    var readPage = parseInt($(this).val());
	    var totalPage = parseInt($('#totalPage').val());

	    if (readPage > totalPage) {
	        alert("읽은 페이지 수는 총 페이지 수를 초과할 수 없습니다.");
	        $('#readPage').val(0);
	    }
	});

	function trackerAddReadingBook() {
			
			if($('#startDate').val() != ''){
		    	    
			    $.ajax({
			        url: '/mypage/tracker/add/reading/book.ajax',
			        type: 'get',
			        data: {
			            'isbn': isbn,
			            'startDate':document.querySelector("#startDate").value,
			            'readPage':document.querySelector("#readPage").value,
			            'jsp':jsp
			        },
					dataType:'json',
					success: function(data) {
						console.log(data);
						if(data.success){
							console.log("추가 완료");
							if (window.opener && !window.opener.closed) {
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
				alert("시작일을 입력해주세요!");
			}

		}

	function trackerUpdateReadingBook() {
		
		if($('#startDate').val() != ''){
	    
		    $.ajax({
		        url: '/mypage/trackerUpdateBook.ajax',
		        type: 'get',
		        data: {
		            'isbn': isbn,
		            'startDate':document.querySelector("#startDate").value,
		            'readPage':document.querySelector("#readPage").value,
		            'jsp':jsp
		        },
				dataType:'json',
				success: function(data) {
					console.log(data);
						console.log(data);
						if (window.opener && !window.opener.closed) {
							  window.alert("수정되었습니다.");
							  window.close(); 
							  window.opener.location.reload();
						}
		        },
				error:function(e){
					console.log(e);
				}
		    });
		    
		}else{
			alert("시작일을 입력해주세요!");
		}
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
		    maxDate: new Date()
	    });
	  });
	
</script>
</html>