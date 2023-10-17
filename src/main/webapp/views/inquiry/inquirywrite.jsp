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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" />
		<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css">
		<link rel="stylesheet" href="/richtexteditor/res/style.css">
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">
	    
	    
		<!-- script -->
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
		<script src="/js/twbsPagination.js"></script>    
		<script src="/js/modernizr.js"></script>		
		<script src="/js/plugins.js"></script>
		<script src="/js/script.js"></script>
		<script src="/richtexteditor/rte.js"></script>
		<script src="/richtexteditor/plugins/all_plugins.js"></script>
		
		<style>
			.pagination .page-link {
	  		color: gray; /* 기본 글자색을 검정색으로 지정 */
			}
	
			.pagination .page-item.active .page-link {
		 		background-color: #C5A992;
		 		border:none;
			}
			input[type="text"]{
				width: 100%;
				border: 1px solid lightgray;
			}
			table{
				margin-left: 45px;
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
				<h2 class="section-title" style="margin-botton:0px;">Inquiry-Write</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;">
	<div class="container">	
		<form id="inquiry" action="/mypage/inquirywrite.do" method="post">
			<table>			
				<tr>
					<td>
						<select name="code_idx" id="code_idx">
						<option value="default">문의 종류</option>
							<option value="64">이벤트 문의</option>
							<option value="65">계정 문의</option>						
							<option value="66">결제 문의</option>
							<option value="67">기타 문의</option>
						</select>						
					</td>
				</tr>
				<tr>
					<td><input type="text" name="inquiry_title" placeholder="문의 제목"/></td>
				</tr>
				<tr>
					<td>
						<div id="div_editor"></div>
						<input id="inquiry_content" type="hidden" name="inquiry_content"/>
					</td>
				</tr>	
				<tr>
					<td style="text-align:center;"><input type="button" onclick="save()" value="확인"/></td>
				</tr>	
			</table>	
		</form>
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
	var config = {};
	config.editorResizeMode = "none";// 에디터 크기조절 : none
	
	// 파일 업로드
	config.file_upload_handler = function(file, callback){// file 정보, 이미지 경로 변경 함수
		console.log(file);	// 크기, 이름, 종류 등을 알 수 있다.
		console.log(callback);		
		if(file.size>(1*1024*1024)){
			alert("1MB 이상의 파일은 업로드 할 수 없습니다.");
			callback('/upload/noimage.png');
		}
	}
	var editor = new RichTextEditor("#div_editor", config);
	
	function save(){
		console.log('저장');
		console.log($('#code_idx').val());
		var content = editor.getHTMLCode();
		console.log(content.length);
		if(content.length > (4*1024*1024)){
			alert('컨텐츠의 크기가 너무 큽니다. 이미지의 크기나 갯수를 줄여 주세요.');
		}else if($('#code_idx').val() == 'default'){
			alert('문의 종류를 선택 해 주세요.');
		}else{
			$('input[id="inquiry_content"]').val(content);
			$('form').submit();
		}
	}
	
	/*	data:image 방식
		장점 : 서버에서 별도의 파일처리 과정이 없어 사용이 간단하다. 
		단점 :	 용량제어가 어렵고, 기존파일보다 용량이 커진다.(base64 인코딩시 크기가 커진다.)
	
		tomcat 에서 post 방식으로허용하는 기본 크기는 2MB 이다.(텍스트만..)
		data:image 를 사용하면 문자열의 크기가 커지기 때문에 controller 에서 null 로 받게 된다.
		
		해결방법 1 : server.xml 에서 Connector 에 maxPostSize="-1"(무제한) 을 해 주거나  2MB(2*1024*1024) 보다 큰 수를 지정한다.
		
		해결방법 2: 내장톰캣 사용시 application.properties 에서 설정 해 준다.
	
	*/

</script>
</html>