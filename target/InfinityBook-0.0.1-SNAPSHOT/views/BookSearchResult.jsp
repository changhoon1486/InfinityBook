<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Infinite B∞k</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
		<script>

		</script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
		h3{
			font-family: 'IBM Plex Sans KR', serif;	
			font-weight: 600;
			margin: 10 0 0 0;
		}
	</style>
</head>
<body>

<div id="header-wrap">

	<c:choose>
        <c:when test="${sessionScope.loginIdx != null}">
            <jsp:include page="loginAfterBox.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="loginBeforeBox.jsp" />            
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
								<li class="menu-item active"><a href="/BookSearch.go" class="nav-link">대여/교환</a></li>
								<li class="menu-item"><a href="/BookReportList.go" class="nav-link">감상문</a></li>
								<li class="menu-item"><a href="/clubList.go" class="nav-link">독서모임</a></li>
								<li class="menu-item"><a href="/noticelist.go" class="nav-link">공지사항</a></li>							
								<li class="menu-item"><a href="/mypage/libraryList.get" class="nav-link">마이페이지</a></li>
							</ul>
						</div>
					</nav>

				</div>

			</div>
		</div>
	</header>
		
</div><!--header-wrap-->	
	
<section class="padding-large" style="padding:0;">
	<div class="container">
		<div class="row" style="margin-top: 5%;">
					<form role="search" method="get" class="search-box" action="/search.do" id ="search" style="text-align:center;"> 
						<select name="QueryType">
							<option value="Keyword">제목+저자</option>
							<option value="Title">제목</option>
							<option value="Author">저자</option>
							<option value="Publisher">출판사</option>
						</select>
						<input class="search-field text search-input" autocomplete='off' placeholder="제목 또는 저자명 "  style="width:50%; height:50px; margin:0px;" type="search" name="Query">
						<input type="submit" value="검색">	
					</form>
				</div>			
				<br>
				<br>
				<div class="products-grid grid">
					<c:if test="${search eq false}">
						<h3 style="margin:10% 40%;">검색 결과가 존재하지 않습니다. </h3>
					</c:if>								
 
					<c:forEach var="entry" items="${result}" varStatus="status">
						<c:if test="${status.index==2}"> 
							<c:forEach var="result" items="${entry.value}" varStatus="id">
								<figure class="product-style" style="margin-bottom: 20px; height: 555px;">
									<img id="cover" src="${result.cover}" class="product-item" style="width: 100%; height: 50%; padding: 10;">
									 <input type="button" onclick ="SearchUser(${id.index})" value="대여/교환" style="margin: 10% 26% 0%;">
									<figcaption style="height: 150px; margin-top:13%;">
										<h3 id="title" style="font-size: 17; font-weight: 800; height: auto;">${result.title}</h3>
										<p id="author" style="height: 11%; font-size: 15;">${result.author}</p>
									</figcaption>
									
									
									<input type="hidden" value="${result.isbn13}" name="Isbn" id="id${id.index}"/>									
								</figure>
							</c:forEach>
						</c:if>  		
					</c:forEach>



		</div>
	</div>
</section>
	<input type="hidden" value="${sessionScope.loginIdx}" id="idx"/>	
</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script>

function SearchUser(index,idx) {
	var idx = document.getElementById("idx").value;

	console.log(idx);
	
	if(idx != null){
	var isbn = document.getElementById("id"+index).value;
	var url = "/searchUser.do?Isbn="+isbn;
	var width = 500;
	var height = 600;
	var left = window.innerWidth / 2 - width / 2;
	var top = window.innerHeight / 2 - height / 2;
	var win = window.open(url, "PopupWin", 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
	}else{
		alert('로그인 해 주세요.');
		location.href="/login.go";
	};
};

</script>
</html>