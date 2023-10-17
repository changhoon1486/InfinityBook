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
			<h3>출금 가능한 계좌를 입력해 주세요</h3>
			<p> 출금은 영업일 기준 3-5일 이내로 처리됩니다. </p>
			<form action="/mypage/depositWithdraw.do" id="withdrawForm" method="post">
				<select name="bank">
					<option value="default">은행선택</option>
					<c:forEach items="${bankList}" var="bankList">
						<option value="${bankList.code_codename}"> ${bankList.code_codename}</option>
					</c:forEach>
				</select>
				<input type="hidden" name="deposit_type"  value="${withdrawData.deposit_type}">
				<input type="hidden" name="deposit_price"  value="${withdrawData.deposit_price}">
				<input type="hidden" name="member_idx"  value="${withdrawData.member_idx}">
				<input type="text" name="name" placeholder="예금주명" style="width:150px;" /> <br/>
				<input type="text" name="account" placeholder="계좌번호를 입력해주세요." pattern="[0-9]+" title="계좌번호는 숫자로만 이루어져야 합니다." style="width:300px;"/> <br/>
				<input type="submit" value="확인">
			</form>
		</div>
	</div>
</section>
	
</body>

<script>

$(document).ready(function() {
    $('#withdrawForm').submit(function(event) {
        event.preventDefault();

        // 데이터 전송
        var formData = $(this).serialize();
        $.post($(this).attr('action'), formData, function(response) {
           
        });
        alert('출금 요청이 완료되었습니다.');
        window.opener.location.reload();
        window.open('', '_self').close(); // 현재 창을 닫기
    });
});
</script>
</html>