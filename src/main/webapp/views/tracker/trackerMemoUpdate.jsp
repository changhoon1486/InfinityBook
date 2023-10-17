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
			<td style="height: 250;"><textarea id="content" style="width: 100%; height:100%; resize: none;">${content}</textarea></td>
		</tr>
		<tr>
			<th style="margin: 1% 40%;"><input type=button value="저장" onclick="MemoUpdate('${trackerIdx}','${memoIdx}')"/></th>
		</tr>
	</table>
</body>
<script>



	function MemoUpdate(trackerIdx,memoIdx) {
		var jsp = "${jsp}";
		var content = $('#content').val();
		console.log(trackerIdx);
		console.log(memoIdx);
		console.log(jsp);
		console.log(content);

	    $.ajax({
	        url: '/mypage/trackerMemoUpdate.ajax',
	        type: 'post',
	        data: {
	            'trackerIdx': trackerIdx,
	            'memoIdx': memoIdx,
	            'content':content,
	            'jsp':jsp
	        },
			dataType:'json',
			success: function(data) {
				console.log(data);
				if(data.success){
					console.log("수정 완료");
					if (data.success == 1) {
						  window.alert("수정되었습니다.");
						  window.close(); 
						  if (window.opener) {
							  window.opener.location.reload();
						   }
					}
				}
	        },
			error:function(e){
				console.log(e);
			}
	    });

	}	

</script>
</html>