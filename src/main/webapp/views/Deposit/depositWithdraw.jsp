<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
	    
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">
	    
		<!-- script -->
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<script src="/js/twbsPagination.js"></script>    
		<script src="/js/modernizr.js"></script>		
		<script src="/js/plugins.js"></script>
		<script src="/js/script.js"></script>
		
		
	</head>

<body style="margin:30px;">
	<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title">Deposit</h2>
			</div>
		</div>
		<div class="row" style="text-align:center;">
			<h3>본인확인을 위해 로그인한 계정의 비밀번호를 입력해 주세요</h3>
			<form action="/mypage/depositWithdrawChk" method="post">
				<input type="password" name="member_pw" placeholder="비밀번호를 입력해주세요."> &nbsp; 
				<input type="submit" value="확인">
				<input type="hidden" name="deposit_type"  value="${withdrawData.deposit_type}">
				<input type="hidden" name="deposit_price"  value="${withdrawData.deposit_price}">
				<input type="hidden" name="member_idx"  value="${withdrawData.member_idx}">
			</form>
		</div>
	</div>
</section>
	
</body>

<script>

</script>
</html>