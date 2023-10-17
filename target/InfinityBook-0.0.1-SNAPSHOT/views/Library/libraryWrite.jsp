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
				font-weight: 600;
				margin: 10 0 0 0;
			}
			
		</style>	
	</head>

<body>

<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title" style="margin: 30px;">Library</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;">
	<div class="container" >
		<form action="/mypage/libraryWrite.do" method="post">
			<table>
				<tr>
					<td>
						<select name="library_use">
						  <option value="소장">책의 용도</option>
						  <option value="소장">소장</option>
						  <option value="대여">대여 가능</option>
						  <option value="교환">교환 가능</option>
						  <option value="교환대여">대여/교환 가능</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<img src="${book.library_cover}" style="width:200px; height:200px;" alt="Books" class="product-item">	
					</td>
					<td>
						<div class="item-price" style="width:500px;"><h3>${book.library_title}</h3></div>
						<div class="item-price"><h4>${book.library_author}</h4></div>
						<div class="item-price"><h4>${book.library_ppublisher}</h4></div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="text" name="library_info" id="library_info" style="width:600px;" placeholder="책 상태를 설명해 주세요 ex) 표지 찢김 있지만 읽는 데 문제는 없습니다. ">
						<input type="submit"value="등록"/>
					</td>
				</tr>
			</table>
			<input type="hidden" name="library_cover" value="${book.library_cover}">		
			<input type="hidden" name="library_title" value="${book.library_title}">				
			<input type="hidden" name="library_author" value="${book.library_author}">				
			<input type="hidden" name="library_publisher" value="${book.library_publisher}">				
			<input type="hidden" name="library_price" value="${book.library_price}">						
			<input type="hidden" name="library_isbn" value="${book.library_isbn}">							
			<input type="hidden" name="library_pubdate" value="${book.library_pubdate}">
			<input type="hidden" name="library_description" value="${book.library_description}">
		</form>
	</div>
	<div style="text-align:center;">
		<input type="button" onclick="location.href='/mypage/bookSelectPop.go?text='" value="재검색"/>
		<input type="button" onclick="window.close()" id="closeBtn" value="닫기"/>
	</div>
	
</section>

</body>

</html>