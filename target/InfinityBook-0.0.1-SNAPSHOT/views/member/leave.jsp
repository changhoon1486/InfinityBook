<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  		<link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
	body,h2{
		font-family: 'IBM Plex Sans KR', serif;	
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
							<ul class="menu-list">
								<li class="menu-item active"><a href="/mypage/libraryList.get" >서재</a></li>
								<li class="menu-item"><a href="/mypage/myBookreportList.get" >감상문</a></li>
								<li class="menu-item"><a href="/mypage/trackerList.go" >트래커</a></li>
								<li class="menu-item"><a href="/mypage/calender.go" >일정</a></li>
								<li class="menu-item"><a href="/mypage/deposit" class="nav-link">보증금</a></li>
								<li class="menu-item has-sub">
									<a href="#" class="nav-link">내 정보</a>
									<ul>
								        <li class="active"><a href="/mypage/memberInfo.go">회원 정보</a></li>
								        <li><a href="/mypage/activitiesChange.go">대여/교환 내역</a></li>
								        <li><a href="#">문의 내역</a></li>
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

<section id="padding-large">
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="margin-top:5%;">
	
				<div class="section-header align-center">
					<h2 class="section-title">회원탈퇴</h2>
				</div>					
				<div style="margin: 10% 10% 0% 28%;">
					<p>
						<b>사용하고 계신 아이디(${sessionScope.loginEmail})은 탈퇴할 경우 재가입 및 복구가 불가능합니다.</b>
						<br>탈퇴한 아이디로 본인과 타인 모두 재가입 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.
					</p>
					
					<p>
						<b>탈퇴 후에도 일부 서비스에 등록한 게시물은 그대로 남아 있습니다.</b>
						<br>모임, 감상문 등에 올린 게시글 및 댓글, 대여/교환 내역은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
						<br>삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.
						<br>탈퇴 후에는 임의로 삭제해드릴 수 없습니다.
					</p>
					
					<p style="margin: 10% 18% 1%;">
						비밀번호 확인 : 
						<input type="password" id="pw" placeholder="비밀번호를 입력해주세요">
					</p>
					
					<input type="button" onclick="leave()" value="탈퇴" style="margin-left: 32%; background-color: crimson;">
				</div>
	
			</div>	
		</div>
	</div>
</section>

<div id="footer-bottom" style="margin-top:5%">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="copyright">
					<div class="row">

						<div class="col-md-12" style="margin-top: 5%;">
							<p>Â© 2022 All rights reserved. Free HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
						</div>

						

					</div>
				</div><!--grid-->

			</div><!--footer-bottom-content-->
		</div>
	</div>
</div>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	function leave() {
		
		$.ajax({
		    type: 'post'
		    ,url: '/mypage/leave.ajax'
		    ,data:{'pw':document.getElementById("pw").value}
		    ,dataType:'json'
		    ,success:function(data){
				console.log(data);							
				if(data.success == true){     
			        alert("탈퇴되었습니다.");
			        location.href = '../';
			    } else{
			    	alert("비밀번호가 일치하지 않습니다.");
			    }
		    }
		    ,error:function(e){
		       console.log(e);
		    }
		 });     
		
	}













</script>
</html>