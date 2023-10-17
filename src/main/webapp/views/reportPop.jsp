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
	</style>
	</head>

<body>

		<input type="text" value="${code}" id="code" hidden/>
		<input type="text" value="${idx}" id="idx" hidden/>
		
		<h2>신고</h2>
		<hr style="margin:0;"/>
			<br/>	
			<textarea name="content" id="content" style="width: 500px; height: 200px; resize:none" placeholder="신고사유를 입력해 주세요."></textarea>
			<br/>	
		<input type="button" value="제출" onclick="sendReport()" style="margin: 0% 40%; font-size: 15;" class="btn btn-warning" />

</body>
<script>

	function sendReport(){
		
		var content = $('#content').val();
		console.log(content);

		if(content == ''){
			alert('신고사유를 입력해 주세요.');
			return false;
		} else{
			
		   $.ajax({
		        url: 'reportSend.ajax',
		        type: 'POST',
		        data: {
		            'code_code': document.getElementById("code").value,
		            'idx':document.getElementById("idx").value,
		            'content':document.getElementById("content").value
		        },
				dataType:'json',
				success: function(data) {
					console.log("성공");
					if(data.success == 1){
						if (window.opener && !window.opener.closed) {
							  window.alert("신고되었습니다.");
							  window.close();
							}
					}					
		        },
				error:function(e){
					console.log(e);
				}
		    });
			
		}

	}

</script>
</html>