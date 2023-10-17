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
	</head>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
		h2,h3,h4,h5{
			font-family: 'IBM Plex Sans KR', serif;	
		}
	</style>

<body>



<section class="hero-section jarallax" >
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title">대여/교환 신청</h2>
			</div>
		</div>
	</div>
</section>
<div class="corner-pattern-overlay"></div>
	<div class="container" style="margin-left: 8%;">
		<table>
			<tr>
				<th rowspan="3" style="width: 40%;">
					<img src="${book.library_cover}" alt="book" class="single-image">
				</th>
				<th rowspan="3" style="width: 5%;">
					
				</th>
				<td style="width: 55%;">
					<input type="button" class="btn btn-outline-accent btn-accent-arrow" value="${book.library_use}">
					
					<table>
						<tr>
							<th colspan="3"><h3 class="item-title">${book.library_title}</h3></th>
						</tr>
						<tr>
							<td><div class="author-name">By. ${book.library_author}</div></td>
							<td><div class="author-name">${book.library_publisher}</div></td>
							<td><div class="author-name">${book.library_pubdate}</div></td>
						</tr>
						<tr>
							<td colspan="3"><h4 class="item-title">Book Info </h4><div class="author-name">${book.library_info}</div></td>
						</tr>
						<tr>
							<td colspan="3">
								<h4 class="item-title">리뷰</h4>
								<c:if test="${empty review}">
									<p>리뷰가 없습니다.</p>
								</c:if>
							<c:forEach var="re" items="${review}" >
								<tr>
									<td><div>${re.member_nickname}</div></td>
									<td><div>${re.review_content}</div></td>
									<td><div>${re.review_date}</div></td>																	
								</tr>
								<br/>
							</c:forEach>
							</td>
						</tr>
						<tr>
							<th colspan="3" style="text-align: rigtht;">

							<c:choose>
								<c:when test="${book.library_use == '대여'}">
									<input type="button" onclick="location.href='TransactionRent.do?library_idx='+${book.library_idx}" value="대여신청"> 
								</c:when>
								<c:when test="${book.library_use == '교환'}">
									<input type="button" onclick="location.href='TransactionChange.do?library_idx='+${book.library_idx}" value="교환신청"> 
								</c:when>
								<c:when test="${book.library_use == '교환대여'}">
									<input type="button" onclick="location.href='TransactionRent.do?library_idx='+${book.library_idx}" value="대여신청"> 
									<input type="button" onclick="location.href='TransactionChange.do?library_idx='+${book.library_idx}" value="교환신청"> 
								 </c:when>
							</c:choose>
							</th>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	
	</div>

</body>

</html>	