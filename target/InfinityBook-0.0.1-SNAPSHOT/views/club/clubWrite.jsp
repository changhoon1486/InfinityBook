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
		
		</style>	
	
	</head>

<body>

<div id="header-wrap">
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
					<br>
					<nav id="navbar">
						<div class="main-menu stellarnav">
							<ul class="menu-list">
								<li class="menu-item"><a href="/BookSearch.go" class="nav-link">대여/교환</a></li>
								<li class="menu-item"><a href="/BookReportList.go" class="nav-link" >감상문</a></li>
								<li class="menu-item active"><a href="/clubList.go" class="nav-link"  >독서모임</a></li>
								<li class="menu-item"><a href="/noticelist.go" class="nav-link"  >공지사항</a></li>
								<li class="menu-item"><a href="/mypage/libraryList.get" class="nav-link"  >마이페이지</a></li>
							</ul>
						</div>
					</nav>

				</div>
			</div>
		</div>
	</header>
</div>

<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title" style="margin-bottom:10px;">Book Club</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;"> 
	<div class="container" style="text-align:center;">
		<form action="clubWrite.do" method="post" style="text-align:center;">			
			<table style="width:100%;">
				<tr>
					<td width="5%"></td>
					<td width="45%"></td>
					<td width="15%"></td>
					<td width="15%"></td>
					<td width="15%"></td>
					<td width="5%"></td>
				</tr>
				<tr>
					<td></td>
					<td rowspan="5">
						<div class="form-group" style="text-align:center;">
							<a href="#" id="clubBookPop">
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
					</td>
					<td>모임명</td>
					<td colspan="2">
						<input type="text" id="club_name" autocomplete='off' name="club_name" style="margin-bottom:0px; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;" placeholder="모임명">
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td></td>
					<td>모임일시</td>
					<td colspan="2">
						<input type="text" autocomplete='off' name="club_meetdate" id="club_meetdate" style="margin-bottom:0px; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;" placeholder="모임일시">
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td></td>
					<td>모임인원</td>
					<td colspan="2">
						<input type="number" autocomplete='off' name="club_num" id="club_num" min="2" max="10" style="margin-bottom:0px; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;" value="2"> 명
					</td>
					<td></td>
				</tr>
				<!-- onchange="checkClubOnOff()"  -->
				<tr>
					<td></td>
					<td>모임방식</td>
					<td colspan="2">
						<select name="club_onoff" autocomplete='off' id="club_onoff" style="margin-bottom:0px; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;">
							<option value="0">대면</option>
							<option value="1">비대면</option>
						</select>
						<select name="code_idx" autocomplete='off'  id="code_idx" style="margin-bottom:0px; border-top-width: 0; border-left-width: 0; border-right-width: 0; border-bottom-width: 1;background: transparent;">
							<option value="31">대면지역</option>
							<c:forEach items="${location}" var="location">
								<option value="${location.code_idx}">${location.code_codename}</option>
							</c:forEach>
							
						</select>
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td></td>
					<td colspan="4">
						<div id="div_editor"></div>
						<input type="hidden" name="club_content"> 
					</td>
					<td></td>
				</tr>
				
				<tr>
					<td></td>
					<td colspan="4" style="text-align:center;">
						<input type="button" onclick="save()" value="등록"/>
					
					</td>
					<td></td>
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

	var win;

    var link = document.getElementById('clubBookPop');

    link.addEventListener('click',function(){
        win = window.open('/clubBookPop.go','Infinity_Book','width=800px,height=800px');
    })

// editor 크기 조절 불가
config.editorResizeMode = "none"; 

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



config.toolbar = "mytoolbar";
config.toolbar_mytoolbar = "{bold,italic}|{fontname,fontsize}|{forecolor,backcolor}|removeformat|undo,redo,fullscreenenter,fullscreenexit,togglemore}";

var editor = new RichTextEditor("#div_editor",config);


function save(){
	
	var content = editor.getHTMLCode();
	
	if(content.length>(4*1024*1024)){
		alert('컨텐츠의 크기가 너무 큽니다. 이미지의 크기나 갯수를 줄여주세요');
	}else if($('#title').val()==''){
		alert('도서 선택은 모임 등록시 필수입니다.');
		return false;
	}else if($('#club_name').val()==''){
		alert('모임명을 작성해 주세요');
		return false;
	}else if($('#club_name').val()!=''){
		if($('#club_name').val().length > 20){
			alert('모임명은 20자 이하로 입력해주세요');
			return false;
		}
		$('input[name="club_content"]').val(content);
		$('form').submit();
	}else if($('#club_meetdate').val()==''){
		alert('모임일시를 선택해 주세요');
		return false;
	}else if($('#club_num').val()==''){
		alert('모임인원을 설정해 주세요. \n 최소 2인 이상 등록 가능합니다. ');
		return false;
	}else if($('#club_num').val()==1){
		alert('모임인원을 수정해주세요 \n 최소 2인 이상 등록 가능합니다. ');
		return false;
	}
	else if($('#club_num').val()==''){
		alert('모임인원을 설정해 주세요. \n 최소 2인 이상 10인 이하로 등록 가능합니다. ');
		return false;
	}else if($('#club_onoff').val()=='0'){
		if($('#code_idx').val()=='26'){
			alert('모임이 대면인 경우 지역구를 선택해야만 모임 등록이 가능합니다. ');
			return false;
		}else{
			if(!confirm('등록된 모임은 수정이 불가능 합니다. \n 등록 전 입력 정보를 한번더 확인해 주세요. \n 이대로 등록 하시겠습니까?')){
				return false;
			}
			$('input[name="club_content"]').val(content);
			$('form').submit();
		}
	}else if($('#club_onoff').val()=='1'){
		if(!confirm('비대면 방식으로 선택시, 선택한 지역구는 저장되지 않습니다. \n 비대면으로 진행하시겠습니까?')){
			return false;
		}else{
			$('#code_idx').val('26');
			if(!confirm('등록된 모임은 수정이 불가능 합니다. \n 등록 전 입력 정보를 한번더 확인해 주세요. \n 이대로 등록 하시겠습니까?')){
				return false;
			}
			$('input[name="club_content"]').val(content);
			$('form').submit();
		}	
	}else{
		if(!confirm('등록된 모임은 수정이 불가능 합니다. \n 등록 전 입력 정보를 한번더 확인해 주세요. \n 이대로 등록 하시겠습니까?')){
			return false;
		}
		$('input[name="club_content"]').val(content);
		$('form').submit();
	}
	
}

$(function() {
    $('#club_meetdate').datetimepicker({
      format: 'Y-m-d H:i',  // 입력값의 형식을 지정
      lang: 'ko',  // 언어 설정
      step: 60,  // 분 단위로 선택 가능한 간격을 지정
      dayOfWeekStart: 1,  // 주의 시작일을 월요일로 설정
      minDate: 0,  // 오늘 이후의 날짜만 선택 가능하도록 설정
      allowTimes: [
        '09:00', '10:00', '11:00', '12:00', '13:00',
        '14:00', '15:00', '16:00', '17:00', '18:00',
        '19:00', '20:00', '21:00'
      ]  // 선택 가능한 시간을 지정
    });
  });




</script>

</html>	