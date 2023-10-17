<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
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

  <!-- script -->
  <script src="/js/modernizr.js"></script>
  <script src="/js/jquery-1.11.0.min.js"></script>
  <script src="/js/plugins.js"></script>
  <script src="/js/script.js"></script>

  <style>
	    body {
	  
	      text-align: center;
	    }
 	
		.pagination .page-link {
  		color: gray; /* 기본 글자색을 검정색으로 지정 */
		}

		.pagination .page-item.active .page-link {
	 		background-color: #C5A992;
	 		border:none;
		}
		@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
			h3,h4 {
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
			<div class="section-header align-center">
				<br><br>
				<h2 class="section-title">Library</h2>
			</div>
		</div>
	</div>
</section>

  <div class="container">
    <div style="text-align: center; margin-top:150px;">
      <h3><span class="item"> 등록이 완료되었습니다.</span></h3><br>
      <input type="button" onclick="closeRe()" id="closeBtn" value="닫기" />
    </div>
  </div>

  <script>
    function closeRe() {
      window.opener.location.reload();
      window.close();
    }
  </script>
</body>
</html>
