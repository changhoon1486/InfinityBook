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

		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>
		<script src="/js/jquery-1.11.0.min.js"></script>
		<script src="/js/plugins.js"></script>
		<script src="/js/script.js"></script>

	<style>
		@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
		h3{
			font-family: 'IBM Plex Sans KR', serif;	
			font-weight: 600;
			margin: 10 0 0 0;
		}
		.popup{
		  position: fixed;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
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
						<br/><br/>
							<ul class="menu-list">
								<li class="menu-item active"><a href="/mypage/libraryList.get" >서재</a></li>
								<li class="menu-item"><a href="/mypage/myBookreportList.get" >감상문</a></li>
								<li class="menu-item active"><a href="/mypage/trackerList.go" >트래커</a></li>
								<li class="menu-item"><a href="/mypage/calender.go" >일정</a></li>
								<li class="menu-item"><a href="/mypage/deposit" class="nav-link">보증금</a></li>
								<li class="menu-item has-sub">
									<a href="#" class="nav-link">내 정보</a>
									<ul>
								        <li><a href="/mypage/memberInfo.go">회원 정보</a></li>
								        <li><a href="/mypage/activitiesChange.go">대여/교환 내역</a></li>
								        <li><a href="/mypage/myinquirylist.go">문의 내역</a></li>
								     </ul>
								</li>								
							</ul>

							<div class="hamburger">
				                <span class="bar"></span>
				                <span class="bar"></span>
				                <span class="bar"></span>
				            </div>

						</div>
					</nav>

				</div>

			</div>
		</div>
	</header>
		
</div><!--header-wrap-->
<section class="padding-large" style="padding:0;">
	<div class="container">
		<div class="row" style="margin-bottom: 21%;">
		
			<div class="section-header align-center">
				<h2 class="section-title" style="margin-botton:25px;">Tracker</h2>
			</div>
				<div class="search-bar" style="width: 300px; display: inline;">
					<form action="/mypage/trackerSearch.do" role="search" method="get" class="search-box" style=" margin-top: -1%; padding-left: 66%;">
						<select name="searchType">
							<option value="Title" >제목</option>
							<option value="Author">저자</option>
							<option value="Title">ISBN</option>
						</select>
						<input class="search-field text search-input" placeholder="검색어를 입력하세요." type="search" name="searchValue" style="width: 300px;">
						<input type="submit" value="검색"/>
					</form>
				</div>			
				<br>
				<br>
				<div class="products-grid grid">
					<c:if test="${search eq false}">
						<h3 style="margin:10% 40%;">검색 결과가 존재하지 않습니다. </h3>
					</c:if>
					<c:forEach var="item" items="${list}" varStatus="status">
						<c:if test="${status.index==2}"> 						
							<c:forEach var="book" items="${item.value}" varStatus="status">
								<figure class="product-style" style="margin-bottom: 40px;">
									<input type="hidden" name=isbn value="${book.isbn13}">
									<input type="hidden" name="cover" value="${book.cover}">
									<input type="hidden" name="jsp" value="trackerSearch.jsp">
									<img id="cover" src="${book.cover}" class="product-item" style="width: 100%; height: 54%; padding: 10;">
									<button onclick="addReadBook('${book.isbn13}','${book.cover}')" class="add-to-cart" style="width: 40%; height: 40px; padding: 0; font-size: 15px; background-color: #987559; color: #ffffff; left: 20px;">완독!</button>
									<button onclick="addReadingBook('${book.isbn13}','${book.cover}')" class="add-to-cart" style="width: 40%; height: 40px; padding: 0; font-size: 15px; margin-left: 100px; background-color: #987559; color: #ffffff; left: 20px;">읽는 중!</button>
									<figcaption>
										<p style="font-weight: 600;">ISBN : ${book.isbn13}</p>
										<h3 id="title" style="font-size: 17; font-weight: 800; height: auto;">${book.title}</h3>
										<p id="author" style="height: 11%; font-size: 15;">${book.author}</p>
									</figcaption>
								</figure>												
							</c:forEach>							
						</c:if>	
					</c:forEach>
		    	</div>

		</div>
	</div>
</section>

<div id="footer-bottom">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="copyright">
					<div class="row">

						<div class="col-md-12"  style="text-align:center;">
							<p>Â© 2022 All rights reserved. Free HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
						</div>

						

					</div>
				</div><!--grid-->

			</div><!--footer-bottom-content-->
		</div>
	</div>
</div>

</body>
<script>

	var jsp = 'trackerSearch.jsp';

	function addReadBook(isbn, cover) {
	    console.log(isbn);
		var width = 473;
	    var height = 400;
	    var left = window.innerWidth / 2 - width / 2;
	    var top = window.innerHeight / 2 - height / 2;
	    var popupWindow = window.open('/mypage/tracker/add/Read/book.go?isbn=' + isbn + '&cover=' + cover + '&jsp=' + jsp + '', 'read', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
	};
	
	function addReadingBook(isbn, cover) {
	    console.log(isbn);
		var width = 473;
	    var height = 400;
	    var left = window.innerWidth / 2 - width / 2;
	    var top = window.innerHeight / 2 - height / 2;
	    
	    var popupWindow = window.open('/mypage/tracker/add/Reading/book.go?isbn=' + isbn + '&cover=' + cover + '&jsp=' + jsp + '', 'reading', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
	};
	
</script>
</html>	