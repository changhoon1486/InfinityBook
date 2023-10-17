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
	         h4{
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
					
						<a href="/"><img src="/images/KakaoTalk_20230630_091136316.png" alt="logo"></a>
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
			  <li class="tab"><a href="/clubList.go">전체</a></li>
			  <li class="active  tab"><a href="/myClubList.go">참여 모임</a></li>
		</ul>
		
		<h4 class="menu-item">신청 내역</h4>
			<div style="text-align:center;">
				<hr/>	
				<div class="row" id="apply_list">
				
				</div>
					    
				<div  id="apply_paging" >
					<div class="container" style="text-align:center; width: 600px;">
						<nav aria-label="Page navigation"  style="text-align:center; width: 500px;">
					          <ul class="pagination justify-content-center" id="apply_pagination"></ul>
					    </nav>
					</div>
				</div>
			</div>
			
			
			
		<h4 class="menu-item">참여 모임</h4>
			<div style="text-align:center;">
				<hr/>	
				<div class="row" id="club_list">
				</div>
					    
				<div  id="club_paging" >
					<div class="container" style="text-align:center; width: 600px;">
						<nav aria-label="Page navigation"  style="text-align:center; width: 500px;">
					          <ul class="pagination justify-content-center" id="club_pagination"></ul>
					    </nav>
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
	listCall(showPage);
		
	function listCall(page){
		   $.ajax({
		      type:'post',
		      url:'myApplyList.ajax',
		      data:{
		    	  'page':page
		      },
		      dataType:'json',           
		      success:function(data){
		         console.log(data);
		         listPrint(data.list);
		         
		         $('#apply_pagination').twbsPagination({
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
	    // ca.club_idx ,c.club_name , ca.member_idx ,ca.club_appstate ,c.club_state , ca.club_appdate 
	    content += '<table style="width:100%; text-align:center;">';
	    content += '<tr>';
	    content += '	<th width="2%" style="text-align:center;"></th>';
	    content += '	<th width="8%" style="text-align:center;"> 모집상태 </th>';	    
	    content += '	<th width="8%" style="text-align:center;"> 신청상태</th>';
	    content += '	<th width="20%" style="text-align:center;">도서</th>';
	    content += '	<th width="40%" style="text-align:center;"> 모임정보 </th>';
	    content += '	<th width="20%" style="text-align:left;"> 모임장소 및 일시 </th>';
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
	        
	        if (item.club_appstate=="0") {
	    		content += '	<td style="text-align:center;"><input type="button" style="cursor:default; display:inline; margin-bottom:10px; padding:5 10 5 10; color:gray;" class="btn btn-outline-accent btn-accent-arrow" value="신청 대기"></td>';
			}else{
	    		content += '	<td style="text-align:center;"><input type="button" style="cursor:default; display:inline; margin-bottom:10px; padding:5 10 5 10; color:black;" class="btn btn-outline-accent btn-accent-arrow" value="확정"></td>';
			}
	        
	        content += '	<td style="text-align:center;"><img src="' + item.cover + '" alt="Books" style="width:100px; height:150px;" class="product-item"></td>';
		    content += '	<td><a href="/clubDetail.go?club_idx='+item.club_idx+'"><h4><b>'+item.club_name+'</b></h4></a>';   
		    content += item.member_nickname+'<br/>	';
		    content += item.title+'	</td>';
		    content += '	<td>';
		    content += item.code_codename+'<br/>	';
		    content += item.club_meetdate.split(" ")[0]+'<br/>'+item.club_meetdate.split(" ")[1]+'</td>';
		    
		    content += '	<td></td>';
	        content += '</tr>';
	    });

	    content += '</table>';

	    $('#apply_list').empty();
		$('#apply_list').append(content);
	}
	
	function profilePop(member_idx) {
	    var width = 1100;
	     var height = 800;
	     var left = window.innerWidth / 2 - width / 2;
	     var top = window.innerHeight / 2 - height / 2;
	     var popupWindow = window.open('profilePop.go?member_idx='+member_idx, 'pop', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
	 };
	
	
	
	var showPage2 = 1;
	listCall2(showPage2);
	
	function listCall2(page){
		   $.ajax({
		      type:'post',
		      url:'myClubList.ajax',
		      data:{
		    	  'page':page
		      },
		      dataType:'json',           
		      success:function(data){
		         console.log(data);
		         listPrint2(data.list);
		         
		        
		         
		         $('#club_pagination').twbsPagination({
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



	function listPrint2(list) {
	    var content = '';
	    
	    content += '<table style="width:100%; text-align:center;">';
	    content += '<tr>';
	    content += '	<th width="2%" style="text-align:center;"></th>';
	    content += '	<th width="8%" style="text-align:center;"> 모집 상태 </th>';
	    content += '	<th width="8%" style="text-align:center;"> 인원 </th>';
	    content += '	<th width="20%" style="text-align:center;">도서</th>';
	    content += '	<th width="40%" style="text-align:center;"> 모임정보 </th>';
	    content += '	<th width="20%" style="text-align:left;"> 모임장소 및 일시 </th>';
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
	    	content += '	<td style="text-align:center;"><input type="button" style="cursor:default; display:inline; margin-bottom:10px; padding:5 10 5 10;" class="btn btn-outline-accent btn-accent-arrow" value="' + item.meet_num+'/'+item.club_num + '"></td>';  
	    	content += '	<td style="text-align:center;"><img src="' + item.cover + '" alt="Books" style="width:100px; height:150px;" class="product-item"></td>';
		    content += '	<td><a href="/clubDetail.go?club_idx='+item.club_idx+'"><h4><b>'+item.club_name+'</b></h4></a>';
		    content += item.member_nickname+'<br/>	';
		    content += item.title+'	</td>';
		    content += '	<td>';
		    content += item.code_codename+'<br/>	';
		    content += item.club_meetdate.split(" ")[0]+'<br/>'+item.club_meetdate.split(" ")[1]+'</td>';
		    
		    content += '	<td></td>';
	        content += '</tr>';
	    });
 
	    content += '</table>'; 

	    $('#club_list').empty();
		$('#club_list').append(content);
	}
	

	 
</script>

</html>	