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
		                                <li><a href="/mypage/activitiesChange.go" style="color:black;">대여/교환 내역</a></li>
		                                <li class="active"><a href="/mypage/myinquirylist.go">문의 내역</a></li>
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
				<h2 class="section-title" style="margin-botton:0px;">My Inquiry</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;">
	<div class="container">
	<!-- 문의 종류 필터링  -->
	<select id="categoryCode">
		<option value="default">문의 종류</option>
		<option value="64">이벤트 문의</option>
		<option value="65">계정 문의</option>						
		<option value="66">결제 문의</option>
		<option value="67">기타 문의</option>
	</select>
	
	<!-- 처리 여부 필터링  -->
	<select id="inqProcess">
		<option value="default">처리 여부 필터링</option>
		<option value="false">미처리</option>
		<option value="true">처리완료</option>
	</select>
	
	<div style="text-align: right;">			
		<button onclick="location.href='/mypage/inquirywrite.go'">문의 하기</button>				
	</div>
	
	<hr/>
	
		<table style="width:100%; text-align:center;">
			<thead>
				<tr id="thead">
					<th width="20%" style="text-align:center"> 종류 </th>
					<th width="20%" style="text-align:center"> 제목 </th>				
					<th width="20%" style="text-align:center"> 작성자 </th>
					<th width="20%" style="text-align:center"> 작성 일자 </th>
					<th width="20%" style="text-align:center"> 상태 </th>
				</tr>
			</thead>  
			<tbody id="myinquiry_list">
			<!-- 출력 장소 -->
			</tbody>					
			<tr>
				<td  colspan="5" id="club_paging" >
				<div class="container" style="text-align:center; width: 600px;">
					<nav aria-label="Page navigation"  style="text-align:center; width: 500px;">
				          <ul class="pagination justify-content-center" id="myinquiry_pagination"></ul>
				    </nav>
				</div>
			</td>
			</tr>
		</table>
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
var selectedcategoryCode = 'default';
var selectedprocess = 'default';


listCall(showPage);



// 문의 종류 필터링
$('#categoryCode').change(function(){
    $('#myinquiry_list').empty();
	selectedcategoryCode = $(this).val();
  	listCall(showPage);
   $('#myinquiry_pagination').twbsPagination('destroy');
});

// 처리 여부 필터링
$('#inqProcess').change(function(){
    $('#myinquiry_list').empty();
	selectedprocess = $(this).val();
	listCall(showPage);
   $('#myinquiry_pagination').twbsPagination('destroy');
});


function listCall(page){
	   $.ajax({
	      type:'post',
	      url:'/mypage/myinquirylist.ajax',
	      data:{
	    	  'page':page,
	    	  'categoryCode' : selectedcategoryCode,
	    	  'inqProcess' : selectedprocess
	      },
	      dataType:'json',           
	      success:function(data){
	         console.log(data);
	         listPrint(data.list);
	         
	         $('#myinquiry_pagination').twbsPagination({
					startPage:1, // 시작 페이지
					totalPages:data.pages,// 총 페이지 수 
					visiblePages:10,// 보여줄 페이지
					onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
						console.log(page,showPage);
						if(page != showPage){
							showPage=page;
							listCall(page);
							
						}
					}
		         });
	      },error:function(e){
			
	      }
	   });
}	

function listPrint(list) {
	var content = '';
    if (list.length > 0 ){
    	list.forEach(function(item) {
    		content += '<tr>';
    		 if(item.code_idx == 64){
             	content += '	<td width="20%" style="text-align:center;">이벤트 문의</td>';            	      	
             }else if(item.code_idx == 65){
             	content += '	<td width="20%" style="text-align:center;">계정 문의</td>';	  
             }else if(item.code_idx == 66){
             	content += '	<td width="20%" style="text-align:center;">결제 문의</td>';
             }else if(item.code_idx == 67){
             	content += '	<td width="20%" style="text-align:center;">기타 문의</td>';
             } 
            content += '	<td width="20%" style="text-align:center;">'+'<a href="/mypage/myinquirydetail.go?inquiry_idx='+item.inquiry_idx+'">'+item.inquiry_title+'</a></td>';                
            content += '	<td width="20%" style="text-align:center;">'+item.member_nickname+'</td>';
            content += '	<td width="20%" style="text-align:center;">'+item.inquiry_regdate+'</td>';
            if (item.inquiry_state == 1) {
            	content += '	<td width="20%" style="text-align:center;">처리</td>';	
    		}else if(item.inquiry_state == 0){
    			content += '	<td width="20%" style="text-align:center;">미처리</td>';
    		}            
    		content += '</tr>'    		
    		content += '<tr id="reReplyContentInner' + item.inquiry_idx + '">'; // 답글을 출력할 내부 요소
    	    content += '</tr>';
    	    
    	    reReplyCall(item.inquiry_idx, function(replyContent) {
				$('#reReplyContentInner' + item.inquiry_idx).html(replyContent); // 수정된 부분: 리댓 내용을 출력할 내부 요소에 추가
	    	});
    		
    	});	
    }else {
    	content = '<tr><td colspan="5" style="text-align:center;">문의 내역이 없습니다.</td></tr>';    	
    }
    
    $('#myinquiry_list').empty();
	$('#myinquiry_list').append(content);
}

function reReplyCall(inquiry_idx, callback) {
	  console.log(inquiry_idx);
	  $.ajax({
	    type: 'post',
	    url: '/inquiryreplylist.ajax',
	    data: {
	      'inquiry_idx': inquiry_idx
	    },
	    dataType: 'json',
	    success: function(data) {
	      console.log(data);
	      var replyContent = reReplyPrint(data.list);
	      callback(replyContent);
	    }
  });
}

function reReplyPrint(replyList) {
	  var content = '';
	  replyList.forEach(function(reply) {
		content += '<th style="width:20%; text-align:center;">'+'ㄴ [답변]'+'</th>';		
		content += '<td style="width:20%; text-align:center;">'+'<a href="/myinquiryreplydetail.go?inquiry_idx='+reply.inquiry_idx+'">'+reply.inquiry_title+'</a></td>';
	    content += '<td style="width:20%; text-align:center;">' + reply.member_nickname + '</td>';
	    content += '<td style="width:20%; text-align:center;">' + reply.inquiry_regdate+'</td>';
	    content += '<th style="width:20%; text-align:center;"></th>';
	    
	  });
	  return content;
}




</script>
</html>