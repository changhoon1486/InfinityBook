<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Infinite B∞k</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="format-detection" content="telephone=no">
	    <meta name="apple-mobile-web-app-capable" content="yes">
	    <meta name="author" content="">
	    <meta name="keywords" content="">
	    <meta name="description" content="">

		<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css">
		<link rel="stylesheet" href="/richtexteditor/res/style.css">
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">

		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>
		<script src="/richtexteditor/rte.js"></script>
		<script src="/richtexteditor/plugins/all_plugins.js"></script>

	<style>
	div{
	display:block;
	}
	
	</style>
</head>
<body>
<c:choose>
        <c:when test="${sessionScope.loginIdx != null}">
            <jsp:include page="loginAfterBox.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="loginBeforeBox.jsp" />            
        </c:otherwise>
    </c:choose>
	<form action="BookReportWrite.do" method="post">
	<h3>감상문 수정</h3>
	<select name="reportOpen" id="reportOpen">
	    <option value="select">공개여부</option>
	    <option value="1">공개</option>
	    <option value="0">비공개</option>
  	</select>
	<input type="text"  name="reportTitle" value="제목을 입력해주세요."/>
	<div class="form-group" style="text-align:center;">
			<a href="#" id="reportBookPop">
		 		<img src="/images/book.png" id="cover2" style="width:120px; height:150px;" alt="Books" ><br/>책 선택
			</a>
			<br/><br/>
			<br/><br/>
			   	<input type="text" readonly id="title" name="title" style=" width:90%; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;" placeholder=" 도서 제목"><br/>
				<input type="text" readonly id="author" name="author" style="width:90%; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;" placeholder="저자">					
				<input type="hidden" id="isbn" name="isbn"/>
				<input type="hidden" id="publisher" name="publisher"/>
				<input type="hidden" id="description" name="description"/>
				<input type="hidden" id="pubdate" name="pubdate"/>
				<input type="hidden" id="cover" name="cover"/>
    </div>
	<h3>텍스트 에디터 들어갈 자리</h3>
	<div id="div_editor"></div>
	<input type="button" onclick="save()" value="등록"/>
	<input type="hidden" name="content"/>
	</form>
</body>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script>
var config = {};

var win;

var link = document.getElementById('reportBookPop');

link.addEventListener('click',function(){
    win = window.open('/reportBookPop.go','Infinity_Book','width=800px,height=600px');
})

// editor 크기 조절 불가
config.editorResizeMode = "none"; 
config.toolbar = "mytoolbar";
config.toolbar_mytoolbar = "{bold,italic}|{fontname,fontsize}|{forecolor,backcolor}|removeformat|undo,redo,fullscreenenter,fullscreenexit,togglemore}";

// 파일 업로드 관련 설정
config.file_upload_handler = function(file,callback){
	console.log(file);
	// file정보 : 크기, 이름, 종류 등을 알 수 있다.
	if(file.size>(1*1024*1024)){
		alert('1MB 이하 파일만 업로드 가능합니다.');
		callback('/images/noimage.png');
	}
	console.log(callback);
}

var editor = new RichTextEditor("#div_editor", config);

function save(){
console.log('저장');
var content = editor.getHTMLCode();
console.log(content.length);
console.log(content);
if(content.length>(4*1024*1024)){
	alert('컨텐츠의 크기가 너무 큽니다. 이미지의 크기나 갯수를 줄여주세요');
}else{
	$('input[name="content"]').val(content);
	$('form').submit();
}
}

</script>
</html>