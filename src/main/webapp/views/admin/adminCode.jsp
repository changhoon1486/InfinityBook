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
				<h2 class="section-title" style="margin-bottom:25px;">Admin-Code</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container">

		<div class="tab-content" style="text-align:center;">
			<div id="all-genre" style="text-align:center;" data-tab-content class="active">
				<ul class="tabs" style="margin:10">
			  		
						<li class="tab"><a href="/admin/adminCode">System</a></li>							
					<c:forEach items="${codeList}" var="codeList">
						<li class="tab"><a onclick="listCall('${codeList.code_upcode}')">${codeList.code_upcode}</a></li>							
					</c:forEach>
				</ul>
				<br/>
				<div class="row" style="text-align:center;" id="list">
					<table style="width:100%; text-align:center;">
	    				<tr>
							<th width="10%"></th>
							<th width="30%" style="text-align:center;">code</th>
							<th width="50%">code_name</th>
							<th width="10%"></th>
						</tr>
						<c:forEach items="${codeList}" var="codeList" >
							<tr>
					        	<th></th>
					       		<th style="text-align:center;">
					        		System
					        	</th>
					        	<th>
					        		<input type="text" style="width:50%;" value="${codeList.code_upcode}" id="${codeList.code_idx}">
            						<input type="button" onclick="upcodeUpdate(${codeList.code_idx})" value="수정">
            						<input type="button" onclick="listCall('${codeList.code_upcode}')" value="상세코드">
					        	</th>
					        	<th></th>
					        	</tr>
						</c:forEach>
					</table>
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
	
	function listCall(code_upcode){
		$.ajax({
		      type:'post',
		      url:'/admin/adminCodeList.ajax',
		      data:{
		    	  'code_upcode':code_upcode
		      },
		      dataType:'json',           
		      success:function(data){
		         console.log(data);
		         listPrint(data.list);		         
		      }
		   });
	}
	

	function listPrint(list) {
	    var content = '';
	    
	    content += '<table style="width:100%; text-align:center;">';
	    content += '<tr>';
        content += '<th width="10%"></th>';
        content += '<th width="30%" style="text-align:center;">code</th>';
        content += '<th width="50%">code_name</th>';
        content += '<th width="10%"></th>';
        content += '</tr>';
	    list.forEach(function(item) {
	        content += '<tr>';
	        content += '<th></th>';
	        content += '<th style="text-align:center;">';
	        content += item.code_code;
	        content += '</th>';
	        content += '<th>';
	        content += '<input type="text" id="name'+item.code_idx+'"style="width:50%;" value="'+item.code_codename+'">&nbsp;<input type="button" onclick="codenameUpdate('+item.code_idx+')" value="수정">';
	        content += '</th>';
	        content += '<th></th>';
	        content += '</tr>';
	    });

	    content += '</table>'; 
	    
	    $('#list').empty();
		$('#list').append(content);
	}
	
    function upcodeUpdate(code_idx) {
        var code_upcode = document.getElementById(code_idx).value;
        console.log(code_idx);
        console.log(code_upcode);
        
        if(confirm('시스템 분류 코드명 변경시 하위 분류는 자동으로 모두 변경됩니다. \n 변경하시겠습니까?')){
        	$.ajax({
		      type:'post',
		      url:'/admin/upcodeUpdate.ajax',
		      data:{
		    	  'code_idx':code_idx,
		    	  'code_upcode':code_upcode
		      },
		      dataType:'json',           
		      success:function(data){
		    	 alert('코드 수정을 완료 했습니다. ');
		    	 window.location.reload();
		      }
		   });
        }
    }
    
    function codenameUpdate(code_idx) {
        var codename = document.getElementById("name"+code_idx).value;
        console.log(code_idx);
        console.log(codename);
        
        $.ajax({
		      type:'post',
		      url:'/admin/codenameUpdate.ajax',
		      data:{
		    	  'code_idx':code_idx,
		    	  'codename':codename
		      },
		      dataType:'json',           
		      success:function(data){
		    	 alert('코드명 수정을 완료 했습니다. ');
		    	 listCall(data.upcode);
		      }
		   });
       
    }
</script>

</html>	