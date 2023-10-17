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
			h3, h4{
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
					<br>
					<nav id="navbar">
						<div class="main-menu stellarnav">
							<ul class="menu-list">
								<li class="menu-item"><a href="/BookSearch.go" class="nav-link">대여/교환</a></li>
								<li class="menu-item"><a href="/BookReportList.go" class="nav-link" >감상문</a></li>
								<li class="menu-item active"><a href="/clubList.go" class="nav-link"  >독서모임</a></li>
								<li class="menu-item"><a href="/noticelist.go" class="nav-link"  >공지사항</a></li>
								<li class="menu-item"><a href="/mypage/libraryList.get" class="nav-link"  >마이페이지</a></li>
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
				<h2 class="section-title" style="margin-botton:0px;">Book Club</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container">
		<ul class="tabs" style="margin:10">
			  <li data-tab-target="#all-genre" class="active tab"><a href="/clubList.go">전체</a></li>
			  <li data-tab-target="#business" class="tab"><a href="/myClubList.go">참여 모임</a></li>
		</ul>
		<ul class="tab">
			<li class="search-box" style="text-align:center;list-style-type: none;margin-left: 300px;">
				<input type="button" value="모임 등록" onclick="clubWriteGo()" style="float: right; padding:10px; margin-right:180px;">
				<i class="icon icon-search"></i> 
				<input id="serchText" name="serchText" class="search-field text search-input" style="width:40%; "placeholder="제목 을 입력해주세요" type="search">
				<input type="button" id="searchButton" value="검색">	
			</li>
		</ul>
		<div class="tab-content">
			<div id="all-genre" data-tab-content class="active">
				<div class="row" id="list">
					
			    </div>
			    
			     <div  id="paging" >
			      <div class="container" style="text-align:center; width: 600px;">
			        <nav aria-label="Page navigation"  style="text-align:center; width: 500px;">
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
		      url:'clubList.ajax',
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
	    
	    content += '<table style="width:100%; text-align:center;">';
	    content += '<tr>';
	    content += '	<th width="2%" style="text-align:center;"></th>';
	    content += '	<th width="8%" style="text-align:center;"> 모집 상태 </th>';
	    content += '	<th width="8%" style="text-align:center;"> 인원 </th>';
	    content += '	<th width="20%" style="text-align:center;">도서</th>';
	    content += '	<th width="40%" style="text-align:center;"> 모임정보 </th>';
	    content += '	<th width="20%" style="text-align:left;"> 모임장소 / 일시 </th>';
	    content += '	<th width="2%" style="text-align:center;"></th>';
		content += '<tr>';
	
	    list.forEach(function(item) {
	        
	    	content += '<tr>';
	    	content += '	<td></td>';
	    	if (item.club_state=="0") {
	    		content += '	<td style="text-align:center;"><input type="button" style="cursor:default; display:inline; margin-bottom:10px; padding:5 10 5 10; color:CornflowerBlue;" class="btn btn-outline-accent btn-accent-arrow" value="모집"></td>';
			}else{
	    		content += '	<td style="text-align:center;"><input type="button" style="cursor:default; display:inline; margin-bottom:10px; padding:5 10 5 10; color:Crimson;" class="btn btn-outline-accent btn-accent-arrow" value="종료"></td>';
			}
	    	content += '	<td style="text-align:center;"><input type="button" style=" cursor:default; border:none; display:inline; margin-bottom:10px; padding:5 10 5 10;" class="btn btn-outline-accent btn-accent-arrow" value="' + item.meet_num+'/'+item.club_num + '"></td>';  
	    	content += '	<td style="text-align:center;"><img src="' + item.cover + '" alt="Books" style="width:100px; height:150px;" class="product-item"></td>';
		    content += '	<td><a href="/clubDetail.go?club_idx='+item.club_idx+'"><h3><b>'+item.club_name+'</b></h3></a>';
		    content += '<a onclick="profilePop('+item.member_idx+')" style="cursor: pointer;">'+item.member_nickname+'</a><br/>	';
		    content += item.title.split("-")[0]+'	</td>';
		    content += '	<td>';
		    content += item.code_codename+'<br/>	';
		    content += item.club_meetdate.split(" ")[0]+'<br/>'+item.club_meetdate.split(" ")[1]+'</td>';
		    
		    content += '	<td></td>';
	        content += '</tr>';
	    });
    
	    content += '</table>'; 

	    $('#list').empty();
		$('#list').append(content);
	}

	
	function clubWriteGo(){  

		if(${sessionScope.loginIdx != null}){
			location.href="/clubWrite.go";
		}else{
			alert('모임 등록은 로그인이 필요합니다. ');
			location.href="/login.go";
		}
	   
	}
	
	function profilePop(member_idx) {
	    var width = 1100;
	     var height = 800;
	     var left = window.innerWidth / 2 - width / 2;
	     var top = window.innerHeight / 2 - height / 2;
	     var popupWindow = window.open('profilePop.go?member_idx='+member_idx, 'pop', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
	 };
</script>

</html>	