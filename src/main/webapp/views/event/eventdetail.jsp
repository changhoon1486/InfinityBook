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
	.centered-container {
        display: inline;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .centered-container img {
        max-width: 100%;
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
								<li class="menu-item active"><a href="/libraryList.get" >서재</a></li>
								<li class="menu-item"><a href="/myBookreportList.get" >감상문</a></li>
								<li class="menu-item"><a href="/trackerList.go" >트래커</a></li>
								<li class="menu-item"><a href="/calender.go" >일정</a></li>
								<li class="menu-item"><a href="/deposit" class="nav-link">보증금</a></li>
								<li class="menu-item has-sub">
									<a href="#" class="nav-link">내 정보</a>
									<ul>
								        <li class="active"><a href="#">회원 정보</a></li>
								        <li><a href="#">대여/교환 내역</a></li>
								        <li><a href="#">문의 내역</a></li>
								     </ul>
								</li>								
							</ul>
							
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
</div>
<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title" style="margin-botton:0px;">Book Event Detail</h2>
			</div>
		</div>
	</div>
</section>

<div class="centered-container">
    <img alt="poster" src="${dto.poster}">
    
</div>

<div class="centered-container">
	<button id="event_SignUp">이벤트 신청하기</button>
</div>
<br>

<div class="centered-container">
	${dto.content}
</div>
<br>

<div class="centered-container">
<button onclick="location.href='signUpDelete.go'">삭제</button>
<button onclick="location.href='signUpUpdate.go'">수정</button>
<button onclick="location.href='eventList.go'">목록</button>
</div>
<div id="footer-bottom">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="copyright">
					<div class="row">
						<div class="col-md-12" style="text-align:center;">
							<hr/>
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

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

function clubUpdate(club_idx){  

	if(confirm('모집 종료시 신청은 자동으로 모두 거절 됩니다. \n 모집 종료하시겠습니까?')){
		location.href='/clubUpdate.do?club_idx='+club_idx;
	}else{
		return false;
	}
}

//onclick="location.href='/clubDelete.do?club_idx='+${club.club_idx}"
		
function clubDelete(club_idx){  

	if(confirm('모임 삭제시 모임 채팅방도 삭제되며 복구가 불가능 합니다.  \n 정말 삭제하시겠습니까?')){
		location.href='/clubDelete.do?club_idx='+club_idx;
	}else{
		return false;
	}
}

function clubApply(club_idx){  
	if(${sessionScope.loginIdx != null}){
		if(confirm('모임 신청시 취소가 불가능합니다. \n 정말 신청하시겠습니까?')){
				location.href='/clubApply.do?club_idx='+club_idx;
		}
		
	}else{
		alert('모임 신청은 로그인 후 가능합니다. ');
		location.href='/login.go';
	}
	
}
</script>
</html>	