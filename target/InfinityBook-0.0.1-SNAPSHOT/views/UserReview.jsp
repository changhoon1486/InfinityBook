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
			.pagination .page-link {
	  		color: gray; /* 기본 글자색을 검정색으로 지정 */
			}
	
			.pagination .page-item.active .page-link {
		 		background-color: #C5A992;
		 		border:none;
			}
			@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
			h3{
				font-family: 'IBM Plex Sans KR';	
				font: bold;
				margin: 10 0 0 0;
			}
			h2,h4{
				font-family: 'IBM Plex Sans KR';	
			}
			
		</style>	
	</head>

<body>

<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h4 class="section-title" style="margin: 30px; font-size: 35; font-weight: 600;">유저 리뷰 작성</h4>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px; padding-bottom: 10px; margin-bottom: 10px;">
	<div class="container" >
		<form action="/UserReview.do" method="post">
			<table style="display: grid; place-items: center;">
				<tr>
					<td>
						<img src="${library.library_cover}" style="height:250px;" alt="Books" class="product-item">	
					</td>
					<td>
						<div class="item-price" style="width:500px;"><h3>${library.library_title}</h3></div>
						<div class="item-price"><h4>${library.library_author}</h4></div>
						<div class="item-price"><h4>${library.library_publisher}</h4></div>
						<div class="item-price"><h4>${user}</h4></div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="text" class="review_content" name="review_content" style="width:600px;" placeholder="리뷰 내용을 입력해주세요."><br>
						<input type="submit" value="등록"/>
						<input type="button" onclick="window.close()" value="취소"/>
					</td>
				</tr>
			</table>
			<input type="hidden" name="review_type" value="${param.review_type}"/>
			<input type="hidden" name="review_transaction_type" value="${param.review_transaction_type}"/>
			<input type="hidden" name="review_tracnsaction_idx" value="${param.review_tracnsaction_idx}"/>
			<input type="hidden" name="review_reciever" value="${param.member_reciever}"/>
		</form>
	</div>
	
</section>

</body>

</html>