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
  		@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
	    h2,h4 {
			font-family: 'IBM Plex Sans KR';		  
	        text-align: center;
	    }
	
	</style>	
</head>

<body>
<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title" style="margin: 30px; font-size: 35; font-weight: 600;">대여/교환</h2>
			</div>
		</div>
	</div>
</section>

  <div class="container">
    <div style="text-align: center; margin-top:200px;">
      <h4><span class="item"> 신청되었습니다. 채팅방을 확인해주세요.</span></h4>
      <input type="button" onclick="closeRe()" id="closeBtn" value="닫기" />
    </div>
  </div>

  <script>
    function closeRe() {
      window.close();
    }
  </script>
</body>
</html>
