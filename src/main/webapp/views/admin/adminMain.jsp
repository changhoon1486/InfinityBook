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

<section id="popular-books" class="bookshelf" style="margin-bottom: 0px;">
	<div class="container">
	<div class="row">
		<a href="/" style="font-size:20;"><h4> ← Main</h4></a>
			<div class="section-header align-center">
				<h2 class="section-title">Admin</h2>
			</div>
			
			<div class="tab-content">
			  <div id="all-genre" data-tab-content class="active">
			  	<div class="row">
			  		<br/>
				  	<div id="products-grid" class="products-grid grid">
				  		<figure class="product-style">
					  		<figcaption>
								<button type="button" onclick="location.href='/'" class="btn btn-outline-accent btn-accent-arrow" style="width:200px; border:none; height:150px;">
									<img src="/images/mainLogo.png" alt="logo">
								</button>
							</figcaption>
						</figure>
						
					  	<figure class="product-style">
					  		<figcaption>
								<button type="button" onclick="location.href='/admin/adminMember'" class="btn btn-outline-accent btn-accent-arrow" style="width:200px; border:1px solid black; height:150px;"><h4>회원관리</h4></button>
							</figcaption>
						</figure>
					
					
					  	<figure class="product-style">
					  		<figcaption>
								<button type="button" onclick="location.href='/admin/adminBook'" class="btn btn-outline-accent btn-accent-arrow" style="width:200px; border:1px solid black; height:150px;"><h4>도서관리</h4></button>
							</figcaption>
						</figure>
					
					  	<figure class="product-style">
					  		<figcaption>
								<button type="button" onclick="location.href='/admin/adminDeposit'"  class="btn btn-outline-accent btn-accent-arrow" style="width:200px; border:1px solid black; height:150px;"><h4>보증금관리</h4></button>
							</figcaption>
						</figure>
					
					  	<figure class="product-style">
					  		<figcaption>
								<button type="button" onclick="location.href='/admin/adminBookReport'" class="btn btn-outline-accent btn-accent-arrow" style="width:200px; border:1px solid black; height:150px;"><h4>감상문관리</h4></button>
							</figcaption>
						</figure>
					
					  	<figure class="product-style">
					  		<figcaption>
								<button type="button" onclick="location.href='/admin/noticelist.go'" class="btn btn-outline-accent btn-accent-arrow" style="width:200px; border:1px solid black; height:150px;"><h4>공지사항관리</h4></button>
							</figcaption>
						</figure>
									
					  	<figure class="product-style">
					  		<figcaption>
								<button type="button" onclick="location.href='/admin/adminClub'" class="btn btn-outline-accent btn-accent-arrow" style="width:200px; border:1px solid black; height:150px;"><h4>모임관리</h4></button>
							</figcaption>
						</figure>
					
					  	<figure class="product-style">
					  		<figcaption>
								<button type="button" onclick="location.href='/admin/adminReport.go'" class="btn btn-outline-accent btn-accent-arrow" style="width:200px;border:1px solid black;  height:150px;"><h4>신고관리</h4></button>
							</figcaption>
						</figure>
					
					  	<figure class="product-style">
					  		<figcaption>
								<button type="button" onclick="location.href='/admin/inquirylist.go'" class="btn btn-outline-accent btn-accent-arrow" style="width:200px;border:1px solid black;  height:150px;"><h4>문의관리</h4></button>
							</figcaption>
						</figure>
					
					  	<figure class="product-style">
					  		<figcaption>
								<button type="button" onclick="location.href='/admin/adminCode'" class="btn btn-outline-accent btn-accent-arrow" style="width:200px;border:1px solid black;  height:150px;"><h4>코드관리</h4></button>
							</figcaption>
						</figure>
					</div>

		    	 </div>
			  </div>

			</div>

		</div><!--inner-tabs-->
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
</script>

</html>	