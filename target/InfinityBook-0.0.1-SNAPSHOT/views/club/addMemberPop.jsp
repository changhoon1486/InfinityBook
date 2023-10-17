<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
	
	</style>	
		
	</head>

<body style="margin:30px;">
	<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title">Book Club</h2>
			</div>
		</div>
	</div>
</section>
<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container">
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
		
</body>

<script>
var showPage = 1;
var club_idx = ${idx};
listCall(showPage);

function listCall(page){
	   $.ajax({
	      type:'post',
	      url:'addMemberList.ajax',
	      data:{
	    	  'page':page
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
    content += '	<th width="20%" style="text-align:center;">도서</th>';
    content += '	<th width="30%" style="text-align:center;"> 모임정보 </th>';
    content += '	<th width="20%" style="text-align:center;"> 참여인원 </th>';
    content += '	<th width="10%" style="text-align:center;"></th>';
    content += '	<th width="2%" style="text-align:center;"></th>';
	content += '<tr>';

    list.forEach(function(item) {
        
    	content += '<tr>';
    	content += '	<td></td>';
    	content += '	<td style="text-align:center;"><img src="' + item.cover + '" alt="Books" style="width:100px; height:150px;" class="product-item"></td>';
	    content += '	<td><a href="/clubDetail.go?club_idx='+item.club_idx+'"><h4><b>'+item.club_name+'</b></h4></a>';
	    content += item.member_nickname+'<br/>	';
	    content += item.title.split("-")[0]+'	</td>';
	    content += '	<td style="text-align:center;">'+item.meet_num+' 명 </td>';
	    content += '	<td style="text-align:center;"><input type="button" onclick="submit('+item.club_idx+')"style="padding:5 10 5 10; color:CornflowerBlue;" class="btn btn-outline-accent btn-accent-arrow" value="선택"></td>';
	    content += '	<td></td>';
        content += '</tr>';
    });

    content += '</table>'; 

    $('#list').empty();
	$('#list').append(content);
}

function submit(sel_club_idx){
	
	
	$.ajax({
	      type:'post',
	      url:'nicknameList.ajax',
	      data:{
	    	  'club_idx':sel_club_idx
	      },
	      dataType:'json',           
	      success:function(data){
	      	if(confirm(data.nickname+'를 불러오시겠습니까?')){
	      		$.ajax({
	      	      type:'post',
	      	      url:'checkNum.ajax',
	      	      data:{
	      	    	  'sel_club_idx':sel_club_idx,
	      	    	  'club_idx':club_idx
	      	      },
	      	      dataType:'json',           
	      	      success:function(data){
	      	    	  if(data.success==true){
	      	    		  $.ajax({
	      	    		      type:'post',
	      	    		      url:'addMember.do',
	      	    		      data:{
	      	    		    	  'sel_club_idx':sel_club_idx,
	      	    		    	  'club_idx':club_idx
	      	    		      },
	      	    		      dataType:'json',           
	      	    		      success:function(data){
	      	    		    	  window.opener.location.reload();
	      	    		    	  window.close();
	      	    		      }
	      	    		   });
	      	    	  }else{
	      	    		  alert(data.msg);
	      	    	  }
	      	    	}
	      	   });
	      	}
	      }
	   });
	
}


</script>
</html>