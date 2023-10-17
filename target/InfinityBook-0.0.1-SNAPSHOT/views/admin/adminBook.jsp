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
				<h2 class="section-title" style="margin-bottom:25px;">Admin-Book</h2>
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
						<i class="icon icon-search"></i> 
						<input id="serchText" name="serchText" class="search-field text search-input" style="width:40%;"placeholder="제목 을 입력해주세요" type="search">
						<input type="button" id="searchButton" value="검색">
					</li>
				</ul>
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
		      url:'/admin/adminBookList.ajax',
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
	    content += '	<th width="10%" style="text-align:center;"> 도서 IDX</th>';
	    content += '	<th width="10%" style="text-align:center;">회원 IDX</th>';
	    content += '	<th width="30%" style="text-align:center;">도서 제목</th>';
	    content += '	<th width="25%"><input type="checkbox" id="all" style="margin-right:40px;"/> 도서 정보 <input type="button"  onclick="resetBookInfo()" style="margin-left:20px;" value="초기화"></th>';
		content += '	<th width="15%" style="text-align:center;">블라인드</th>';
		content += '<tr>';
	
	    list.forEach(function(item) {
	        content += '<tr>';
	        content += '	<td style="text-align:center;">'+item.library_idx+'</td>';
		    content += '	<td style="text-align:center;">'+item.member_idx+'</td>';
		    content += '	<td>'+item.library_title+'</td>';
		    content += '	<td><input type="checkbox" style="margin-right:40px;" value="'+item.library_idx+'">'+item.library_info+'</td>';
		    if(item.library_blind == "1"){
		    	content += '<td style="text-align:center;"><input type="button" style="margin-right:20px; border:none; " class="btn btn-outline-accent btn-accent-arrow" onclick="bookBlind(0,'+item.library_idx+')" value="숨김 해제"/></td>';
		    }else{
		        content += '<td style="text-align:center;"><input type="button" style="margin-right:20px; border:none; " class="btn btn-outline-accent btn-accent-arrow" onclick="bookBlind(1,'+item.library_idx+')" value="숨김"/></td>';
		    }
		     
	        content += '</tr>';
	    });

	    content += '</table>'; 
	    
	    $('#list').empty();
		$('#list').append(content);
	}
	
	$(document).on('click', '#all', function() {
		  var $chk = $('input[type="checkbox"]');
		  if ($(this).is(':checked')) {
		    $chk.prop('checked', true);
		  } else {
		    $chk.prop('checked', false);
		  }
		});
	
	function bookBlind(blind,library_idx){
		console.log(blind);
		console.log(library_idx);
		$.ajax({
		      type:'get',
		      url:'/admin/bookBlind.ajax',
		      data:{
		    	  'blind':blind,
		    	  'library_idx':library_idx
		    	  },
		      dataType:'json',
		      success:function(data){
		         listCall(showPage);
		      },
		      error:function(e){
		         console.log(e);
		      }
		   });
		
	}
 	
 		
	function resetBookInfo(){
	    
	    var checkArr = [];
	    
	    // checkbox에 value를 지정하지 않으먄 스스로를 on으로 지정한다. 
	    $('input[type="checkbox"]:checked').each(function(idx,item){
	      if($(this).val() != 'on'){
	         checkArr.push($(this).val());
	      }
	       
	    });
	    
	    console.log(checkArr);
	    

		if(confirm('초기화 이후 복구가 불가능 합니다. \n 정말 초기화 하시겠습니까?')){
			$.ajax({
			      type:'get',
			      url:'/admin/resetBookInfo.ajax',
			      data:{'resetList':checkArr},
			      dataType:'json',
			      success:function(data){
			         console.log(data);
			         if(data.success){	            
			            listCall(showPage);
			         }
			      },
			      error:function(e){
			         console.log(e);
			      }
			   });
		}
	    
	   
	   
	}

</script>

</html>	