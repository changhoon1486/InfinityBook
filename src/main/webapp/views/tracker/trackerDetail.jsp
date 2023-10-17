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
		

	</head>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
		.item-price{
			font-family: 'IBM Plex Sans KR', serif;	
		}
		.pagination .page-link {
	 		color: gray; /* 기본 글자색을 검정색으로 지정 */
		}
	
		.pagination .page-item.active .page-link {
	 		background-color: #C5A992;
	 		border:none;
		}
		progress {	   
			width: 100%;
		    height: 3%;
		    color: #c5a992;
		    border-radius: 50px;		    
		}
		progress::-webkit-progress-bar {
		   background-color: azure;
		}
		progress::-webkit-progress-value {
		   background-color: #c5a992e3;
		}
		.memo-div{
			position: relative; 
			width: 100%; 
			height:auto; 
			resize: none; 
			background-color: #dcc8b799; 
			margin-bottom: 0%; 
			box-sizing: border-box; 
			margin-top: 8%;
		}
	</style>
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
								<li class="menu-item"><a href="/mypage/libraryList.get" >서재</a></li>
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

<section id="padding-large">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

	<div class="section-header align-center"">
		<h2 class="section-title" style="margin-botton:25px;">Tracker</h2>
	</div>					
	<input type="button" value="삭제" onclick="trackerDelete()" style="float: right; bottom: 80px; margin-right: 1%; margin-top: 2%;">
	<input type="button" value="수정" onclick="trackerUpdate()" style="float: right; bottom: 80px; margin-right: 1%; margin-top: 2%;">

	<input type="hidden" id="trackerIdx" name="trackerIdx" value="${book.tracker_idx}">
	<div class="corner-pattern-overlay"></div>
	<div class="container">	
		<div class="row" style=" margin-top: 11%; padding-right: 17%;">			
			<div class="col-md-8 col-md-offset-2">				
				<div class="row">	
					<div class="col-md-6" style="height: 48%; margin-top: -5%;">
						<figure class="products-thumb" style="height: 96%; width: 100%; display: flex; justify-content: center; align-items: center;">
							<img src="${book.cover}" alt="book" class="single-image" style="height: 90%; width: 72%;">
						</figure>	
					</div>

					<div class="col-md-6">
						<div class="product-entry">
							<h2 class="section-title divider" style=" width: 161%; height: 12%; font-size: 30px; font-weight: 600; margin-bottom: 5%; top: -43px; font-family: 'IBM Plex Sans KR', serif; line-height: 40px;">${book.title}</h2>

							<div class="products-content">
								<div class="item-price" style=" font-size: 20px; font-weight: 600; height: 9%; width: 160%; margin-bottom: 5%;">${book.author}</div>
								<div class="links-element" style="width: 155%;">
								    <div class="categories" style="float: left; font-size: 16; font-weight: 600;">${book.startDate}</div>
								    <div class="categories" style="float: right; font-size: 16; font-weight: 600;">${book.endDate}</div>
								    <div class="social-links" ><progress value="${book.progress}" min="0" max="100"></progress></div>
								    <div class="categories" style="float: left; font-size: 16; font-weight: 600;">${book.progress}%</div>
								    <div class="categories" style="float: right; font-size: 16;">${book.readPage} / ${book.totalPage} page</div>
								</div>
							</div>

						</div>
					</div>

				</div>
				<!-- / row -->

			</div>

		</div>
	</div>


			<h2 class="section-title divider" style="margin: 9% 17% 6%;">MEMO</h2>
		</div>
	</div>
	<div class="container">
		<div class="row">

			<div class="col-md-8 col-md-offset-2" style="width: 75%; margin-left: 14%;">
				<div class="row">

					<div class="col-md-6" style="width: 94%; margin-left: 4%;">

						<div class="subscribe-content" data-aos="fade-up">
							<div style="display: flex; align-items: center;">
								<textarea id="content" placeholder="메모할 내용을 입력하세요." style="width: 90%; resize: none;"></textarea>
								<button onclick="trackerAddMemo()" class="btn-subscribe" style="width: 11%; margin-bottom: 2%;">
									<span>save</span> 
									<i class="icon icon-send"></i>
								</button>
							</div>
							<hr style="marigin: 3%;">
							<div id="list" style="position: relative;">
								<!-- list 출력 영역 -->
							</div>							
						</div>

					</div>
					
				</div>
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

						<div class="col-md-12"  style="text-align:center;">
							<p style="margin-top: 5%;">Â© 2022 All rights reserved. Free HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
						</div>				

					</div>
				</div><!--grid-->

			</div><!--footer-bottom-content-->
		</div>
	</div>
</div>

</body>
<script>

	$(document).ready(function() {	
		listCall();
	});
	
	function trackerAddMemo() {
	    
	    $.ajax({
	        url: '/mypage/trackerAddMemo.ajax',
	        type: 'post',
	        data: {
	        	'content':document.getElementById("content").value,
	        	'trackerIdx':document.getElementById("trackerIdx").value,
	            'jsp':"trackerDetail.jsp"
	        },
			dataType:'json',
			success: function(data) {
				console.log(data.success);
				if(data.success == 1){
					document.getElementById("content").value = "";
					listCall();	
				}
	        },
			error:function(e){
				console.log(e);
			}
	    });
	}
	
	function listCall(){
		$.ajax({
			type:'post',
			url:'/mypage/getMemoList.ajax',
			data:{
	        	'trackerIdx':document.getElementById("trackerIdx").value
			},
			dataType:'json',
			success:function(data){
				console.log(data);
				listPrint(data.list);					
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function listPrint(list){
		var content = '';
		
		list.forEach(function(list){			
			content +='<div class="memo-div" style="margin: 7% 5% 0%; width: 90%;">';
			content +='<p style="width: 90%; height: 4%; padding:0.5% 1% 0.5% 1%; margin-bottom: 0px; display: inline;">'+list.content.replace(/\n/g, "<br>")+
						'<input type="button" onclick="memoDelete(\''+list.tracker_idx+"\',\'"+list.memo_idx+'\')" id="delete" value="삭제" style="margin: 0.5%; float: right; padding: 0.5%; width: auto; height: auto; font-size: 11px; float: right;">'+
						'<input type="button" class="update" onclick="memoUpdate(\''+list.tracker_idx+"\',\'"+list.memo_idx+'\')" id="update" value="수정" style="margin: 0.5%; float: right; padding: 0.5%; width: auto; height: auto; font-size: 11px; float: right;">';	
			content +='</div>';
			content +='<p style="position: absolute; right: 0; margin: 0% 5%; font-size: 13px;">'+list.regDate+'</p>';
		}); 
		$('#list').empty();
		$('#list').append(content);

	}
	
	function memoDelete(trackerIdx,memoIdx){
		console.log(trackerIdx);
		console.log(memoIdx);
		
		$.ajax({
			type:'post',
			url:'/mypage/memoDelete.ajax',
			data:{
	        	'trackerIdx':trackerIdx,
	        	'memoIdx':memoIdx
			},
			dataType:'json',
			success:function(data){
				console.log(data.success);
				if(data.success == 1){
					alert("삭제되었습니다.");
					listCall();	
				}				
			},
			error:function(e){
				console.log(e);
			}
		});
		
	}
	
	function memoUpdate(trackerIdx,memoIdx){
		console.log(trackerIdx);
		console.log(memoIdx);
		
		var jsp = "trackerDetail.jsp";
		var width = 473;
	    var height = 400;
	    var left = window.innerWidth / 2 - width / 2;
	    var top = window.innerHeight / 2 - height / 2;
	    window.open('/mypage/trackerMemoUpdate.go?trackerIdx=' + trackerIdx + '&memoIdx=' + memoIdx + '&jsp=' + jsp + '\'', 'updateMemo', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
		
	}
	

	// 트래커 정보 수정
	var isbn = "${book.isbn}";
	var readPage = "${book.readPage}";
	var startDate = "${book.startDate}";
	var jsp = 'trackerDetail.jsp';

	function trackerUpdate() {
		console.log(isbn);
		window.open('/mypage/trackerUpdateBook.go?isbn='+isbn+'&readPage='+readPage+'&jsp='+jsp+'&startDate='+startDate,'읽는 중','width=473px,height=400px');
	};
	
	function trackerDelete() {
		var result = confirm("정말 삭제하시겠습니까?"); 

		if (result) {
			
			$.ajax({
		        url: '/mypage/trackerDeleteBook.ajax',
		        type: 'get',
		        data: {
		            'isbn': isbn
		        },
				dataType:'json',
				success: function(data) {
					console.log(data);
					if(data.success){
							console.log("삭제 완료");
							alert("삭제되었습니다.");
					      	window.location.href = '/mypage/trackerList.go';
					}else{
						console.log("삭제 실패");
					}
		
		        },
				error:function(e){
					console.log(e);
				}
		    });
			
		} 
	};
	
</script>
</html>	