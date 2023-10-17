<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
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
<style>
	table{
	    margin: 0 0 1% 28%;
    	width: 45%;
	}
	th,td{
		padding: 4%;
	}
</style>
</head>
<body>	

<div id="header-wrap" class="show">

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
								<li class="menu-item"><a href="/mypage/libraryList.get" >서재</a></li>
								<li class="menu-item"><a href="/mypage/myBookreportList.get" >감상문</a></li>
								<li class="menu-item"><a href="/mypage/trackerList.go" >트래커</a></li>
								<li class="menu-item"><a href="/mypage/calender.go" >일정</a></li>
								<li class="menu-item"><a href="/mypage/deposit" class="nav-link">보증금</a></li>
								<li class="menu-item has-sub active">
									<a class="active">내 정보</a>
									<ul>
		                                <li><a href="/mypage/memberInfo.go" >회원 정보</a></li>
		                                <li><a href="/mypage/activitiesChange.go" style="color:black;">대여/교환 내역</a></li>
		                                <li><a href="/mypage/myinquirylist.go" style="color:black;">문의 내역</a></li>
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
			<div class="col-md-12">
	
				<div class="section-header align-center">
					<h2 class="section-title">Profile</h2>
				</div>					
				<div>
					<table>
						<colgroup>
							<col width="5%"/>
							<col width="30%"/>
							<col width="60%"/>
							<col width="5%"/>
						</colgroup>
						<tr>
							<th></th>
							<th>
								<label for="email">이메일</label>
							</th>
							<td>
			                    ${info.member_email}
			                </td>
							<th></th>
				        </tr>
						<tr>				
							<th></th>
							<th>닉네임</th>
							<td>						
								<a onclick="profilePop(${info.member_idx})" style="cursor: pointer;">${info.member_nickname}</a>
							</td>		
							<th></th>						
						</tr>
					    <tr>
							<th></th>
					        <th>주소(시/군/구)</th>	              
							<td>
								${info.region}
							</td>
							<th></th>
					    </tr>
						<tr>
							<th colspan="4" style="text-align: center; padding: 2%; border-bottom: none;">
								<input type="button" onclick="location.href='/mypage/memberInfoUpdate.go'" value="회원정보 수정">
							</th>
						</tr>
					</table>
					<a href='leave.go' style="margin-left: 68%">회원탈퇴</a>
				</div>
	
			</div>	
		</div>
	</div>
</section>

<div id="footer-bottom" style="margin-top:10%">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="copyright">
					<div class="row">

						<div class="col-md-12" style="margin-top: 5%;" style="text-align:center;"> 
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
	
	//프로필 팝업창 오픈 
	function profilePop(member_idx) {
		var width = 1100;
	    var height = 800;
	    var left = window.innerWidth / 2 - width / 2;
	    var top = window.innerHeight / 2 - height / 2;
	    var popupWindow = window.open('/profilePop.go?member_idx='+member_idx, 'pop', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
	};

</script>
</html>