<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
		<a href="/admin/adminMain" style="font-size:20;"> ← Admin Main</a>
			<div class="section-header align-center">
				<h2 class="section-title" style="margin-bottom:25px;">Admin-Inquiry</h2>
			</div>
		</div>
	</div>
	</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container">

		<div class="tab-content" style="text-align:center;">
			<div id="all-genre" style="text-align:center;" data-tab-content class="active">
			
	<ul class="tab">
		<li class="search-box" style="text-align:center;list-style-type: none;">	
		
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
	
			
			<i class="icon icon-search"></i> 
			<input id="serchText" name="serchText" class="search-field text search-input" style="width:40%; "placeholder="닉네임 을 입력해주세요" type="search">
			<input type="button" id="searchButton" value="검색">	
		</li>
	</ul>
	
	
	<hr/>
	
		<table style="width:100%; text-align:center;">
			<thead>
				<tr id="thead">
					<th width="20%" style="text-align:center"> 종류 </th>
					<th width="20%" style="text-align:center"> 제목 </th>				
					<th width="20%" style="text-align:center"> 작성자 </th>
					<th width="20%" style="text-align:center"> 작성 일자 </th>
					<th width="20%" style="text-align:center">  상태 </th>
				</tr>
			</thead>  
			<tbody id="inquiry_list">
			<!-- 출력 장소 -->
			</tbody>					
			<tr>
				<td  colspan="5" id="inquiry_paging" >
				<div class="container" style="text-align:center; width: 600px;">
					<nav aria-label="Page navigation"  style="text-align:center; width: 500px;">
				          <ul class="pagination justify-content-center" id="inquiry_pagination"></ul>
				    </nav>
				</div>
			</td>
			</tr>
		</table>
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
<script>
var showPage = 1;
var selectedcategoryCode = 'default';
var selectedprocess = 'default';
var searchText = 'default';


listCall(showPage);



// 문의 종류 필터링
$('#categoryCode').change(function(){
    $('#inquiry_list').empty();
	selectedcategoryCode = $(this).val();
  	listCall(showPage);
   $('#inquiry_pagination').twbsPagination('destroy');
});

// 처리 여부 필터링
$('#inqProcess').change(function(){
    $('#inquiry_list').empty();
	selectedprocess = $(this).val();
	listCall(showPage);
   $('#inquiry_pagination').twbsPagination('destroy');
});

// 검색 
$('#searchButton').click(function(){
	searchText = $('#serchText').val();
	listCall(showPage);
	searchText = 'default';
	$('#inquiry_pagination').twbsPagination('destroy');
	$('#serchText').val('');
});

// 엔터키 입력시
$('#serchText').on('keyup',function(ev){
	if(ev.keyCode == 13){
		searchText = $('#serchText').val();
		listCall(showPage);
		searchText = 'default';
		$('#inquiry_pagination').twbsPagination('destroy');
		$('#serchText').val('');
	}	
	
});

function listCall(page){
	   $.ajax({
	      type:'post',
	      url:'/admin/inquirylist.ajax',
	      data:{
	    	  'page':page,
	    	  'categoryCode' : selectedcategoryCode,
	    	  'inqProcess' : selectedprocess,
	    	  'searchText': searchText
	      },
	      dataType:'json',           
	      success:function(data){
	         console.log(data);
	         listPrint(data.list);
	         
	         $('#inquiry_pagination').twbsPagination({
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
            content += '	<td width="20%" style="text-align:center;">'+'<a href="/admin/inquirydetail.go?inquiry_idx='+item.inquiry_idx+'">'+item.inquiry_title+'</a></td>';      
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
    
    $('#inquiry_list').empty();
	$('#inquiry_list').append(content);
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
		content += '<td style="width:20%; text-align:center;">'+'<a href="/admin/inquiryreplydetail.go?inquiry_idx='+reply.inquiry_idx+'">'+reply.inquiry_title+'</a></td>';
	    content += '<td style="width:20%; text-align:center;">' + reply.member_nickname + '</td>';
	    content += '<td style="width:20%; text-align:center;">' + reply.inquiry_regdate+'</td>';
	    content += '<th style="width:20%; text-align:center;"></th>';
	    
	  });
	  return content;
}

</script>
</html>