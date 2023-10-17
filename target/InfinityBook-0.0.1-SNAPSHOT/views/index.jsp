<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<meta charset="UTF-8">
	<head>
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
		 <link rel="icon" href="/images/mainLogo.png" class="images">		
	
	<style>
		.slick-track{
			height:300px;
		}
		
		@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
		h3, h4, p{
			font-family: 'IBM Plex Sans KR';	
			font-weight: 600;
			margin: 10 0 0 0;
		}
		
	</style>
	
	</head>
	


<body>

<div id="header-wrap" class="show">
	
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
					<br>
	
					<nav id="navbar">
						<div class="main-menu stellarnav">
							<ul class="menu-list">
								<li class="menu-item"><a href="/BookSearch.go" class="nav-link">대여/교환</a></li>
								<li class="menu-item"><a href="/BookReportList.go" class="nav-link" >감상문</a></li>
								<li class="menu-item"><a href="/clubList.go" class="nav-link"  >독서모임</a></li>
								<li class="menu-item"><a href="/noticelist.go" class="nav-link"  >공지사항</a></li>
								<!-- <li class="menu-item"><a href="/eventList.go" class="nav-link"  >이벤트</a></li> -->
								<li class="menu-item"><a href="/mypage/libraryList.get" class="nav-link"  >마이페이지</a></li>
							</ul>
						</div>
					</nav>

				</div>

			</div>
		</div>
	</header>
</div>

<section id="billboard" style="margin-bottom:50px;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<br/><br/>
				<div class="action-menu">
					<form role="search" method="get" class="search-box" action="/search.do" id ="search" style="text-align:center;"> 
						<select name="QueryType">
							<option value="Keyword">제목+저자</option>
							<option value="Title">제목</option>
							<option value="Author">저자</option>
							<option value="Publisher">출판사</option>
						</select>
						<input class="search-field text search-input" autocomplete='off' placeholder="대여/교환 하고싶은 도서 제목을 입력해 주세요😊 "  style="width:50%; height:50px; margin:0px;" type="search" name="Query">
						<input type="submit" value="검색">	
					</form>
				</div>				
			</div>
		</div>
	</div>	
</section>


<section id="latest-blog2" style="margin-bottom: 100px;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="section-header align-center">
					<div class="title">
						<span>대여 건수가 가장 많은 도서</span>
					</div>
					<h2 class="section-title" >Popular Book</h2>
				</div>
				
				
					<div class="row" >
						<c:forEach items="${library}" var="library" varStatus="status">
							<div class="col-md-4">
								<article class="column" >
									<div class="meta-date" style="text-align: center; cursor:pointer; ">
											<c:if test="${status.count eq 1}">
												<input type="button" style="cursor:default; display:inline; margin-left:30px; margin-bottom:10px; padding:5 10 5 10; color:CornflowerBlue;" class="btn btn-outline-accent btn-accent-arrow" value="최다 대여 도서">
											</c:if>
												<input type="button" style="cursor:default; display:inline; margin-bottom:10px; padding:5 10 5 10; border:none;" class="btn btn-outline-accent btn-accent-arrow" value="        ">
										</div>	
									<figure style="text-align: center; height: 35%; display: flex; justify-content: center;">
										<a onclick="replaceTitle('${library.library_title}')" style="display: flex; justify-content: center; cursor:pointer; ">
											<img src="${library.library_cover}" alt="post" class="product-item"  style="width: auto; height: auto; cursor:pointer; ">	
										</a>										
									</figure>
									
									<div class="post-item" style="text-align: center;">	
									    
									    <div class="links-element" >
										    <div class="categories">${library.library_author}</div>
										</div><!--links-element-->
									    <h3><a onclick="replaceTitle('${library.library_title}')">${library.library_title}</a></h3>
									</div>
								</article>						
							</div>
						</c:forEach>
					</div>

				<div class="row">
					<hr/>
				</div>

			</div>	
		</div>
	</div>
</section>

<br/>
<br/>

<section id="latest-blog" style="margin-bottom: 100px;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="section-header align-center">
					<div class="title">
						<span>좋아요 수가 가장 많은 감상문</span>
					</div>
					<h2 class="section-title" >Popular Report</h2>
				<div class="btn-wrap align-right">
					<a href="/BookReportList.go" class="btn-accent-arrow">감상문 더보기 <i class="icon icon-ns-arrow-right"></i></a>
				</div>
				</div>
				
				
				<div class="row" style="margin-top:150px;">
					<c:forEach items="${report}" var="report">
						<div class="col-md-4">
							<article class="column" >
								<figure style="text-align: center; height: 35%; display: flex; justify-content: center;">
									<a href="/BookReportDetail?book_report_idx=${report.book_report_idx}" style="display: flex; justify-content: center;">
										<img src="${report.cover}" alt="post" class="post-image"  style="width: auto; height: auto;">		
									</a>										
								</figure>
								
								<div class="post-item" style="text-align:center;">	
									<div class="meta-date"> ❤️${report.likenum}</div>			
								    <h3><a href="/BookReportDetail?book_report_idx=${report.book_report_idx}"">${report.book_report_title}</a></h3>								    
								    <div class="links-element" style="text-align:center;">
									    <div class="categories">${report.title}</div>
									</div><!--links-element-->
								</div>
							</article>						
						</div>
					</c:forEach>
				</div>

				<div class="row">
					<hr/>
				</div>

			</div>	
		</div>
	</div>
</section>




<br/>
<br/>



<section id="billboard">

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<button class="prev slick-arrow" style="display: block; left:50px; top: 100px;">
					<i class="icon icon-arrow-left"></i>
				</button>

				<div class="main-slider" style="padding:0px;">
						<div class="slider-item">
							<img src="/images/eventbanner1.png" style="width:1000px; height:250px;" alt="banner" class="banner-image">
						</div>
						<div class="slider-item">
							<img src="/images/eventbanner2.png" style="width:1000px; height:250px;" alt="banner" class="banner-image">
						</div>
						<div class="slider-item">
							<img src="/images/eventbanner3.png" style="width:1000px; height:250px;" alt="banner" class="banner-image">
						</div>

				</div>
					
				<button class="next slick-arrow" id="rightbtn" style="display: block; right:50px; top: 100px;">
					<i class="icon icon-arrow-right"></i>
				</button>
				
			</div>
		</div>
	</div>
	
</section>


<div id="footer-bottom">
	<div class="container">
	<div class="row" style="margin-left: 30%; width: 100%; margin-bottom: 5%;">
		<div>
			<div class="col-md-1">

				<div class="footer-menu">
					<p>이명아</p>
				</div>

			</div>

			<div class="col-md-1">

				<div class="footer-menu">
					<p>이수연</p>
				</div>
			</div>

			<div class="col-md-1">

				<div class="footer-menu">
					<p>박희준</p>
				</div>
			</div>

			<div class="col-md-1">

				<div class="footer-menu">
					<p>엄상원</p>
				</div>
			</div>

			<div class="col-md-1">

				<div class="footer-menu">
					<p>이창훈</p>
				</div>
			</div>
		</div>	

		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="copyright">
					<div class="row">
						<div class="col-md-12" style="text-align:center;">
							<p>Â© 2022 All rights reserved. Free HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>


<script>

setInterval(function() {
	  var element = document.getElementById('rightbtn');
	  if (element) {
	    element.click();
	  }
	}, 5000);

function replaceTitle(librarytitle) {
	var title = librarytitle.replaceAll(' ', '');
	location.href="/search.do?QueryType=Keyword&Query="+title;
}

</script>
</html>	