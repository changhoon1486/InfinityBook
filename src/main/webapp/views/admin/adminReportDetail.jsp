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
			@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
			
			.pagination .page-link {
	  		color: gray; /* 기본 글자색을 검정색으로 지정 */
			}
	
			.pagination .page-item.active .page-link {
		 		background-color: #C5A992;
		 		border:none;
			}
			table{
			    width: 50%;
			    height: 20%;
			    margin-left: 26%;
			    margin-top: 8%;
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

<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
		<a href="/admin/adminMain" style="font-size:20;"><h4>← Admin Main</h4></a>
			<div class="section-header align-center">
				<h2 class="section-title" style="margin-bottom:25px;">Admin-Report</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container">

		<div class="tab-content" style="text-align:center;">
			<div id="all-genre" style="text-align:center;" data-tab-content class="active">

				<h2 style="width: 50%; margin: 5% 0 1% 6%; font-weight:800; font-family: 'IBM Plex Sans KR', serif;">상세정보</h2>
				<hr style="margin: 0; width: 53%; margin-left: 24%;">
					<table style="margin-top:1%;">
						<tr>
							<th style="text-align:center; padding: 1%;">신고번호</th>
							<td>${info.report_idx}</td>
							<th>분류</th>
							<td>${info.reportType}</td>
						</tr>
						<tr>
							<th style="text-align:center; padding: 1%;">신고일시</th>
							<td>${info.report_date}</td>
							<th>신고자</th>
							<td><a onclick="profilePop(${info.reportMemberIdx})" style="cursor: pointer;">${info.reportMemberNick}</a></td>
						</tr>
						
						<c:if test="${info.code_idx == 69}">
							<tr>
								<th style="text-align:center; padding: 1%;">상세보기</th>
								<td colspan="3">${info.target} <a href="/BookReportDetail?book_report_idx=${info.idx}" style="border-bottom: 1px solid #c5a992;">바로가기</a></td>
							</tr>
							<tr>
								<th style="text-align:center; padding: 1%;">신고내용</th>
								<td colspan="3">${info.report_content}</td>
							</tr>
						</c:if>
						<c:if test="${info.code_idx == 70}">
							<tr>
								<th style="text-align:center; padding: 1%;">상세보기</th>
								<td colspan="3">${info.target} <a href="/clubDetail.go?club_idx=${info.idx}" style="border-bottom: 1px solid #c5a992;">바로가기</a></td>
							</tr>
							<tr>
								<th style="text-align:center; padding: 1%;">신고내용</th>
								<td colspan="3">${info.report_content}</td>
							</tr>
						</c:if>
						<c:if test="${info.code_idx == 71 && (info.postType == 61 || info.postType == 62)}">
							<tr>
								<th style="text-align:center; padding: 1%;">댓글내용</th>
								<td>${info.target} <a href="/clubDetail.go?club_idx=${info.postIdx}" style="cursor: pointer; border-bottom: 1px solid #c5a992;">바로가기</a></td>
								<th>신고 대상</th>
								<td><a onclick="profilePop(${info.targetMemberIdx})" style="cursor: pointer;">${info.targetMemberNick}</a></td>
							</tr>
							<tr>
								<th style="text-align:center; padding: 1%;">신고내용</th>
								<td colspan="3">${info.report_content}</td>
							</tr>
						</c:if>
						<c:if test="${info.code_idx == 71 && (info.postType == 83 || info.postType == 84)}">
							<tr>
								<th style="text-align:center; padding: 1%;">댓글내용</th>
								<td>${info.target} <a href="/BookReportDetail?book_report_idx=${info.postIdx}" style="cursor: pointer; border-bottom: 1px solid #c5a992;">바로가기</a></td>
								<th>신고 대상</th>
								<td><a onclick="profilePop(${info.targetMemberIdx})" style="cursor: pointer;">${info.targetMemberNick}</a></td>
							</tr>
							<tr>
								<th style="text-align:center; padding: 1%;">신고내용</th>
								<td colspan="3">${info.report_content}</td>
							</tr>
						</c:if>
						<c:if test="${info.code_idx == 72}">
							<tr>
								<th style="text-align:center; padding: 1%;">리뷰내용</th>
								<td>${info.target} <a onclick="profilePop(${info.recieverIdx})" style="cursor: pointer; border-bottom: 1px solid #c5a992;">바로가기</a></td>
								<th>신고 대상</th>
								<td><a onclick="profilePop(${info.targetMemberIdx})" style="cursor: pointer;">${info.targetMemberNick}</a></td>
							</tr>
							<tr>
								<th style="text-align:center; padding: 1%;">신고내용</th>
								<td colspan="3">${info.report_content}</td>
							</tr>
						</c:if>
						<c:if test="${info.code_idx == 73}">
							<tr>
								<th style="text-align:center; padding: 1%;">신고 대상</th>
								<td><a onclick="profilePop(${info.targetMemberIdx})" style="cursor: pointer;">${info.targetMemberNick}</a></td>
								<th>책제목</th>
								<td>${info.target} <a onclick="/searchDetail.do?library_idx=${info.bookIdx}" style="cursor: pointer; border-bottom: 1px solid #c5a992;">바로가기</a></td>
							</tr>
							<tr>
								<th style="text-align:center; padding: 1%;">책소개</th>
								<td colspan="3">${info.bookInfo}</td>
							</tr>
							<tr>
								<th style="text-align:center; padding: 1%;">신고내용</th>
								<td colspan="3">${info.report_content}</td>
							</tr>
						</c:if>
					</table>

		    </div>
	    </div>	  
	      
	</div>
</section>


<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container">

		<div class="tab-content" style="text-align:center;">
			<div id="all-genre" style="text-align:center;" data-tab-content class="active">
				<h2 style="width: 50%; margin: 3% 0 1% 5%; font-weight:800; font-family: 'IBM Plex Sans KR', serif;">조치</h2>
				<hr style="margin: 0; width: 54%; margin-left: 24%;">
					<table style="margin-top:1%;">
						<tr>
							<th style="text-align: center; padding-left: 3%; width: 28%;">블라인드 여부</th>
							<th style="width: 28%;">
								<select id="blind" style="margin-bottom: 0;">
									<option value="0">정상</option>
									<option value="1">블라인드</option>
								</select>
							</th>
							<th style="text-align: center; width: 20%;">회원 이용제한</th>
							<th style="; padding-right: 3%; width: 24%;">
								<select id="memberState" style="margin-bottom: 0;">
									<option value="정상">정상</option>
									<option value="7일 제한">7일 제한</option>
									<option value="15일 제한">15일 제한</option>						
									<option value="영구제한">영구제한</option>
								</select>
							</th>
						</tr>
						<tr>
							<th style="text-align: center; padding-left: 3%">조치사유</th>
							<td colspan="3" style="padding-right: 3%"><textarea id="reason" placeholder="조치사유를 작성해주세요." style="width:100%; height:100%; resize: none; margin-bottom:0;"></textarea></td>
						</tr>
						<tr>
							<th colspan="4" style="border-bottom: none;"><input type="button" onclick="reportHandling()" value="처리" style="margin:0% 45%; "></th>
						</tr>
					</table>					
			    
		    </div>
	    </div>	  
	      
	</div>
</section>


<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container">

		<div class="tab-content" style="text-align:center;">
			<div id="all-genre" style="text-align:center;" data-tab-content class="active">
				<h2 style="width: 50%; margin: 3% 0 1% -1%; font-weight:800; font-family: 'IBM Plex Sans KR', serif;">처리 기록</h2>
				<hr style="margin: 0; width: 72%; margin-left: 16%;">
				
					<div class="row" style="text-align:center;" id="list">
					
		  			</div>
					
					<div id="paging" >
				    	<div class="container" style="text-align:center; width: 600px;">
					       <nav aria-label="Page navigation"  style="text-align:center; width: 500px; margin-left: 14%;">
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


	var reportIdx = "${info.report_idx}";
	var code_idx = "${info.code_idx}";
	var idx = "${info.idx}";
	var targetMemberIdx = "${info.targetMemberIdx}";
	var target = "${info.target}";

	function reportHandling(){

		var blind = $('#blind').val();
		var memberState = $('#memberState').val();
		var reportHandlingReason = $('#reason').val();
		
		if(reportHandlingReason == ''){
			alert("조치 사유를 입력해주세요");
		} else{

			$.ajax({
				type:'post',
				url:'/admin/reportHandling.ajax',
				data:{
					'code_idx':code_idx,
					'idx':idx,
					'reportIdx':reportIdx,
		        	'blind':blind,
		        	'targetMemberIdx':targetMemberIdx,
		        	'target':target,
		        	'memberState':memberState,
		        	'reason':reportHandlingReason,
		        	'jsp':'adminReportDetail'
				},
				dataType:'json',
				success:function(data){
					console.log(data);
					if(data.success == 1){
						alert("처리되었습니다.");
						listCall(showPage);
						var temp = JSON.stringify("a");
						ws.send(temp);		
					}
				},
				error:function(e){
					console.log(e);
				}
			});		
			
		}

	}


	var showPage = 1;
	
	listCall(showPage);

	function listCall(page){
		
		   $.ajax({
		      type:'post',
		      url:'/admin/reportRecordList.ajax',
		      data:{
		    	  'page':page,
		    	  'reportIdx':reportIdx		    	  
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
			content += '<table style="margin-top:1%; height: 20%; width:70%; margin-left:17%">';
    		content += '<tr>';
   			content += '<th width="35%" style="text-align:center; padding: 1%;">조치결과<br>(블라인드 여부 / 회원 이용제한)</th>';
			content += '<th width="30%"  style="text-align:center;">조치사유</th>';
			content += '<th width="15%"  style="text-align:center;">담당자</th>';
			content += '<th width="20%"  style="text-align:center; padding: 1%;">조치일시</th>';
			content += '</tr>';
       	
        if(list.length == 0){
	        content += '<tr>';
			content += '<th colspan="4" style="text-align:center;">신고처리 기록이 없습니다.</th>';
		    content += '</tr>';
		 } else{
			 list.forEach(function(item) {
		        content += '<tr>';
		        
		        content += '<td style="text-align:center; padding: 1%;">'+item.report_result+'</td>';
		        content += '<td>'+item.report_reason+'</td>';
			    content += '<td style="text-align:center;">'+item.member_nickname+'</td>';
			    content += '<td style="text-align:center; padding: 1%;">'+item.report_handlingdate+'</td>';
			    
			    content += '</tr>';
			 })
	 	}
	
		content += '</table>';
	    
	    $('#list').empty();
		$('#list').append(content);
		
	};

	
	function profilePop(member_idx) {
		var width = 1100;
	    var height = 800;
	    var left = window.innerWidth / 2 - width / 2;
	    var top = window.innerHeight / 2 - height / 2;
	    var popupWindow = window.open('/profilePop.go?member_idx='+member_idx, 'pop', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
	};

</script>

</html>	