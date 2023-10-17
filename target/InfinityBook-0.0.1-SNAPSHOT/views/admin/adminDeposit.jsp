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



<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
		<a href="/admin/adminMain" style="font-size:20;"><h4>← Admin Main</h4></a>
			<div class="section-header align-center">
				<h2 class="section-title" style="margin-bottom:25px;">Admin-Deposit</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container">

		<div class="tab-content" >
			<div id="all-genre" data-tab-content class="active">
				<div style="font-size:20;">
					<input type="radio" name="deposit_type" value="default" checked="checked"> 전체 &nbsp; 
					<input type="radio" name="deposit_type" value="출금"> 출금 &nbsp;
					<input type="radio" name="deposit_type" value="충전"> 충전 &nbsp;
					<br/><br/>
				</div>
				<div class="row" style="text-align:center;" id="list">
					
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
	var deposit_type = 'default';
	listCall(showPage);
		
	$('input[type="radio"]').click(function(){
		deposit_type = $(this).val();
		console.log(deposit_type);
		listCall(showPage);
		deposit_type = 'default';
		$('#pagination').twbsPagination('destroy');
	});
	
	
	
	function listCall(page){
		   $.ajax({
		      type:'post',
		      url:'/admin/adminDepositList.ajax',
		      data:{
		    	  'page':page,
		    	  'deposit_type':deposit_type
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
	    content += '	<th width="10%" style="text-align:center;">결제 IDX</th>';
	    content += '	<th width="10%" style="text-align:center;">회원 IDX</th>';
	    content += '	<th width="20%" style="text-align:center;">결제</th>';
	    content += '	<th width="20%" style="text-align:center;">결제 정보 </th>';
		content += '	<th width="10%" style="text-align:center;">결제 금액</th>';
		content += '	<th width="10%" style="text-align:center;">상태</th>';
		content += '	<th width="20%" style="text-align:center;">결제 일시</th>';
		content += '<tr>';
	
	    list.forEach(function(item) {
	    	content += '<tr>';
	 	    content += '	<th style="text-align:center;">'+item.deposit_idx+'</th>';
	 	    content += '	<th style="text-align:center;">'+item.member_idx+'</th>';
	 	    content += '	<th style="text-align:center;">'+item.deposit_type+'</th>';
	 	    content += '	<th style="text-align:center;">'+item.deposit_info+'</th>';
	 		content += '	<th style="text-align:center;">'+item.deposit_price+'</th>';
	 		if (item.deposit_type=="충전") {
	 			content += '	<th style="text-align:center;">결제 완료</th>';
			}else{
				content += '	<th style="text-align:center;">출금 완료</th>';
			}
	 		
	 		content += '	<th style="text-align:center;">'+item.deposit_date+'</th>';
	 		content += '<tr>';
	    });

	    content += '</table>'; 
	    
	    $('#list').empty();
		$('#list').append(content);
	}
	
	

</script>

</html>	