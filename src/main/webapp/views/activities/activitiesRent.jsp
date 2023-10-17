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
			.pagination .page-link {
	  		color: gray; /* 기본 글자색을 검정색으로 지정 */
			}
	
			.pagination .page-item.active .page-link {
		 		background-color: #C5A992;
		 		border:none;
			}
			@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
			table{
				font-family: 'IBM Plex Sans KR';	
			}
			th{
				color: black;
				font-size: 18;
			}
			th,td{
				padding: 2%;
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
		                                <li><a href="/mypage/memberInfo.go" style="color:black;">회원 정보</a></li>
		                                <li><a href="/mypage/activitiesChange.go" >대여/교환 내역</a></li>
		                                <li><a href="/mypage/myinquirylist.go" style="color:black;">문의 내역</a></li>
		                             </ul>
								</li>									
							</ul>
						</div>
					</nav>

				</div>

			</div>
		</div>
	</header>
		
</div><!--header-wrap-->

<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title" style="margin-botton:0px;">My Activities</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container">
		<ul class="tabs" style="margin:10">
			  <li data-tab-target="#all-genre" class="tab"><a href="/mypage/activitiesChange.go">교환</a></li>
			  <li data-tab-target="#business" class="active tab"><a href="/mypage/activitiesRent.go">대여</a></li>
		</ul>
		<ul class="tab" style="height: 18%;">
			<li class="search-box" style="text-align:center; list-style-type: none; float: right; margin: 4% 0 4% 0; width: 35%;">
				<i class="icon icon-search"></i> 
				<input id="serchText" name="serchText" class="search-field text search-input" style="width:57%; "placeholder="제목을 입력해주세요" type="search">
				<input type="button" id="searchButton" style="padding: 2% 4%;" value="검색">	
			</li>
		</ul>
		<div class="tab-content">
			<div id="all-genre" data-tab-content class="active">
				<div class="row" id="list">
					
			    </div>
			    
			     <div  id="paging" >
			      <div class="container" style="text-align:center; width: 600px;">
			        <nav aria-label="Page navigation"  style="text-align:center; width: 500px; margin-top: 5%;">
			          <ul class="pagination justify-content-center" id="pagination"></ul>
			        </nav>
			      </div>
			    </div>
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

						<div class="col-md-12" style="text-align:center; margin: 10% 0% 3% 0%;">
							<p style="width: 97%;">Â© 2022 All rights reserved. Free HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
						</div>

						

					</div>
				</div><!--grid-->

			</div><!--footer-bottom-content-->
		</div>
	</div>
</div>



</body>

<script>

	function profilePop(member_idx) {
		var width = 1100;
	    var height = 800;
	    var left = window.innerWidth / 2 - width / 2;
	    var top = window.innerHeight / 2 - height / 2;
	    var popupWindow = window.open('/profilePop.go?member_idx='+member_idx, 'pop', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
	};

	var showPage = 1;
	var searchText = '';
	listCall(showPage);
		
	$('#searchButton').click(function(){
		searchText = $('#serchText').val();
		listCall(showPage);
		searchText = 'default';
		$('#pagination').twbsPagination('destroy');
	});
	
	
	function listCall(page){
		   $.ajax({
		      type:'post',
		      url:'/mypage/activitiesRentList.ajax',
		      data:{
		    	  'page':page,
		    	  'searchText':searchText
		      },
		      dataType:'json',           
		      success:function(data){
		         console.log(data);
		         listPrint(data.list);		         
		  	         
		         $('#pagination').twbsPagination({
						startPage:1, // 시작 페이지
						totalPages:data.pages,// 총 페이지 수 
						visiblePages:5,// 보여줄 페이지
						onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
							console.log(page,showPage);
							if(page != showPage){
								showPage=page;
								listCall(page);
								
							}
						}
			         });

		      }
		   });
		}



	function listPrint(list) {
	    var content = '';
	    
	    content += '<table style="width:100%; text-align:center; margin-left:2%;">';
	    content += '<tr>';
	    content += '	<th width="10%" style="text-align:center; padding-left: 2%; text-align: center;"> 대여 상태 </th>';
	    content += '	<th width="20%" style="text-align:center;">  대여 도서 </th>';
	    content += '	<th width="15%" style="text-align:center;"> 대출자 </th>';
	    content += '	<th width="15%" style="text-align:center;"> 대여자 </th>';
	    content += '	<th width="15%" style="text-align:center;"> 대여 일시 </th>';
	    content += '	<th width="15%" style="text-align:center;"> 반납 일시 </th>';
	    content += '	<th width="10%" style="text-align:center; padding-right: 2%;"> 보증금 </th>';
		content += '<tr>';
	
	    list.forEach(function(item) {
	        
	    	content += '<tr>';
	    	
	    	var state = parseInt(item.rent_state);
	    	var memberReview = parseInt(item.memberReview);
	    	var bookReview = parseInt(item.bookReview);
	    	var memberIdx = parseInt(item.memberIdx);
	    	console.log(memberIdx);
	    	var loginIdx = <%=session.getAttribute("loginIdx")%>;
	    	
	    	if (state == 0) {
	    		content += '	<td style="text-align: center; padding-left: 2%;"><input type="button" style="display:inline; margin-bottom:10px; padding:5 10 5 10; color:MediumSeaGreen; cursor: default;" class="btn btn-outline-accent btn-accent-arrow" value="신청"></td>';  
			}else if (state == 1){
				content += '	<td style="text-align:center; padding-left: 2%;"><input type="button" style="display:inline; margin-bottom:10px; padding:5 10 5 10; color:CornflowerBlue; cursor: default;" class="btn btn-outline-accent btn-accent-arrow" value="예약"></td>';  
			}else if (state == 2){
				content += '	<td style="text-align:center; padding-left: 2%;"><input type="button" style="display:inline; margin-bottom:10px; padding:5 10 5 10; color:Tomato; cursor: default;" class="btn btn-outline-accent btn-accent-arrow" value="대여중"></td>';  
			}else if (state == 3){
				content += '	<td style="text-align:center; padding-left: 2%;"><input type="button" style="display:inline; margin-bottom:10px; padding:5 10 5 10; cursor: default;" class="btn btn-outline-accent btn-accent-arrow" value="반납"></td>';  
			}
	    	
	    	
	    	if (loginIdx == memberIdx && state == 4 && bookReview == 0){
		    	content += '<td style="text-align:center;"><img src="' + item.cover + '" alt="Books" style="width:100px; height:150px;" class="product-item"><h4 style="font-family: IBM Plex Sans KR;">'+item.title+' <input type="button" onclick="review('+item.lenderIdx+','+item.library_idx+','+item.rent_idx+','+book+')" style="display:inline; margin-bottom:10px; padding:5 10 5 10; margin: 0%; color:CornflowerBlue;" class="btn btn-outline-accent btn-accent-arrow" value="리뷰"></h4></td>';
	    	}else {
		    	content += '<td style="text-align:center;"><img src="' + item.cover + '" alt="Books" style="width:100px; height:150px;" class="product-item"><h4 style="font-family: IBM Plex Sans KR;">'+item.title+'</h4></td>';
	    	}
	    	
	    	//대출자
	    	if (loginIdx != item.lenderIdx && state == 4 && memberReview == 0){
	    		content += '<td style="text-align:center;"><a onclick="profilePop('+item.lenderIdx+')" style="cursor: pointer;">' + item.lender + '</a> <input type="button" onclick="review('+item.lenderIdx+','+item.library_idx+','+item.rent_idx+','+member+')" style="display:inline; margin-bottom:10px; padding:5 10 5 10; margin: 0%; color:CornflowerBlue;" class="btn btn-outline-accent btn-accent-arrow" value="리뷰"></td>';
	    	}else if(loginIdx == item.lenderIdx && state == 4 && memberReview == 0){
	    		content += '<td style="text-align:center;"><a onclick="profilePop('+item.lenderIdx+')" style="cursor: pointer;">' + item.lender + '</a></td>';
	    	}else if(state == 4 && memberReview == 1){
	    		content += '<td style="text-align:center;"><a onclick="profilePop('+item.lenderIdx+')" style="cursor: pointer;">' + item.lender + '</a></td>';
	    	}else {
	    		content += '<td style="text-align:center;"><a onclick="profilePop('+item.lenderIdx+')" style="cursor: pointer;">' + item.lender + '</a></td>';
	    	}

	    	//대여자
	    	if (loginIdx != memberIdx && state == 4 && memberReview == 0){
	    		content += '<td style="text-align:center;"><a onclick="profilePop('+memberIdx+')" style="cursor: pointer;">' + item.renter + '</a> <input type="button" onclick="review('+item.memberIdx+','+item.library_idx+','+item.rent_idx+','+member+')" style="display:inline; margin-bottom:10px; padding:5 10 5 10; margin: 0%; color:CornflowerBlue;" class="btn btn-outline-accent btn-accent-arrow" value="리뷰"></td>';
	    	}else if(loginIdx == memberIdx && state == 4 && memberReview == 0){
	    		content += '<td style="text-align:center;"><a onclick="profilePop('+memberIdx+')" style="cursor: pointer;">' + item.renter + '</a></td>';
	    	}else if(state == 4 && memberReview == 1){
	    		content += '<td style="text-align:center;"><a onclick="profilePop('+memberIdx+')" style="cursor: pointer;">' + item.renter + '</a></td>';
	    	}else {
	    		content += '<td style="text-align:center;"><a onclick="profilePop('+memberIdx+')" style="cursor: pointer;">' + item.renter + '</a></td>';
	    	}  		    	
	    	
	    	content += '<td style="text-align:center;">' + item.rent_startdate + '</td>';
	    	content += '<td style="text-align:center;">' + item.rent_enddate + '</td>';
	    	
	    	if (typeof item.rent_deposit === "undefined") {
	    		content += '<td style="text-align:center;">0원</td>';
	    	}else {
		    	content += '<td style="text-align:center; padding-right: 2%;">' + item.rent_deposit + '원</td>';
    		}

	        content += '</tr>';
	    });
    
	    content += '</table>'; 

	    $('#list').empty();
		$('#list').append(content);
	}
	
	
	var member = 0;
	var book = 1;

	function review(lenderIdx,library_idx,rent_idx,review_type) {
		var my_memberIdx = ${sessionScope.loginIdx};
		var width = 787;
	    var height = 600;
	    var left = window.innerWidth / 2 - width / 2;
	    var top = window.innerHeight / 2 - height / 2;
	    var popupWindow = window.open('/Review.go?member_sender='+my_memberIdx+'&member_reciever='+lenderIdx+'&book_reciever='+library_idx+'%20&review_transaction_type=1&review_tracnsaction_idx='+rent_idx+'&review_type='+review_type+'', 'read', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
	}


</script>

</html>	