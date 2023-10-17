<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
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
	table{
		padding: 10% 20%;
		margin: 0 0 1% 28%;
    	width: 45%;
    	font-weight: 600;
	}
</style>
<link rel="icon" href="/images/KakaoTalk_20230613_123518647.png" class="images">
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
		                                <li><a href="/mypage/memberInfo.go" >회원 정보</a></li>
		                                <li><a href="/mypage/activitiesChange.go" style="color:black;">대여/교환 내역</a></li>
		                                <li><a href="/mypage/myinquirylist.go" style="color:black;">문의 내역</a></li>
		                             </ul>
								</li>									
							</ul>

							<div class="hamburger">
				                <span class="bar"></span>
				                <span class="bar"></span>
				                <span class="bar"></span>
				            </div>

						</div>
					</nav>

				</div>

			</div>
		</div>
	</header>
		
</div><!--header-wrap-->

<section id="padding-large">
	<div class="container" style="margin-top: 5%;">
		<table>
			<tr>
				<th>
					<label for="email">이메일</label>
				</th>
				<td>
                    ${info.member_email}
                </td>
	        </tr>
			<tr >	
				<th>
					비밀번호
				</th>						
				<th>
					<input type="button" id="pwUpdate" onclick="pwUpdate()" value="비밀번호 변경">
				</th>							
			</tr>
			<tr>				
				<th>
					닉네임
				</th>
				<td>						
					<input type="text" id="member_nickname" value="${info.member_nickname}"><br>
					<span id="nickname_msg"></span>				
				</td>								
			</tr>
		    <tr>
		        <th>주소(시/군/구)</th>	              
				<td>
				<input type="text" id="location" name="location" value="${info.region}" readonly /> &nbsp;&nbsp;
				<input type="button" id="address_kakao" value="검색"/>

				</td>
		    </tr>
			<tr>
				<th colspan="2" style="text-align: center;">
					<input type="button" onclick="update()" value="수정">&nbsp;&nbsp;		
					<input type="button" onclick="location.href='/mypage/memberInfo.go'" value="취소">
				</th>
			</tr>
		</table>
	</div>
</section>

<div id="footer-bottom" style="margin-top:10%">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="copyright">
					<div class="row">

						<div class="col-md-12" style="text-align:center;">
							<p>Â© 2022 All rights reserved. Free HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
						</div>

						

					</div>
				</div><!--grid-->

			</div><!--footer-bottom-content-->
		</div>
	</div>
</div>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	document.getElementById("pwUpdate").addEventListener("click", pwUpdate);

	function pwUpdate() {
		var width = 500;
	    var height = 450;
	    var left = window.innerWidth / 2 - width / 2;
	    var top = window.innerHeight / 2 - height / 2;
	    var popupWindow = window.open('/mypage/pwUpdate.go', 'pwUpdate', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
	};
	
	function update(){
	
	  var $member_nickname = $('#member_nickname');
	  var $location = $('#location');
	
	  if($member_nickname.val()==''){
	    alert('닉네임을 입력해 주세요!');
	    $member_nickname.focus();      
	  } else if($member_nickname.val().length <= 1 || $member_nickname.val().length >= 11){      
	    alert('닉네임을 2글자 이상 10글자 이하로 입력해주세요.');
	    $member_nickname.focus();
	  } else if (specialChars.test($member_nickname.val())) {
		alert('특수문자는 ‘!, @, #, $, %, ^, &, *’만 사용 가능합니다.');
		$member_nickname.focus();
	  } else if($location.val()==''){
	    alert('주소를 입력해 주세요!');
	  } else {

		    $.ajax({
		      url: '/mypage/memberInfoUpdate.ajax',
		      type: 'post',
		      data: {
		    	  'nickname' : document.getElementById("member_nickname").value,
		    	  'location' : document.getElementById('location').value
		      },
		      dataType: 'json',
		      success: function(data){
	      		console.log(data);
		        if(data.success == 1){      	
		          alert('수정되었습니다.');
		          location.href ='memberInfo.go';
		        } else{
		          console.log('실패');
		          alert('수정에 실패했습니다. 다시 시도해주세요');            
		        }
		      },
		      error: function(e){
		        console.log(e);
		      }
		    });
		}
	}
	
	//닉네임 중복 체크
	var member_nickname = "${info.member_nickname}";
	var overlayNicknameChk = false;
	var check = '';
	var specialChars = /[\\`()_+\-=\[\]{};':"\\|,.<>\/?~]/;

	$('#member_nickname').on('keyup', function(e){
		 var chkNickname = $('#member_nickname').val();      
		 
		 if(member_nickname != chkNickname){
			 console.log("중복체크 요청 : " + chkNickname);
			 overlayNicknameChk=false;
			 console.log(specialChars);
			 if($('#member_nickname').val().length <=1 || $('#member_nickname').val().length >=11){
			 	$('#nickname_msg').css({'font-size': '10px','color': 'red'});
					$('#nickname_msg').html('닉네임을 2글자 이상  10글자 이하로입력해주세요.');
				} else if(specialChars.test($('#member_nickname').val())) {
					alert('특수문자는 ‘!, @, #, $, %, ^, &, *’만 사용 가능합니다.');
					$member_nickname.focus();
			 	}else {
						
					$.ajax({
					   type: 'get'
					   ,url: 'overlaynickname.ajax'
					   ,data:{'member_nickname':chkNickname}
					   ,dataType:'json'
					   ,success:function(data){
						console.log(data);			
						
						if(data.overlaynickname == 0){             
					        overlayNicknameChk = true;
					        $('#nickname_msg').css({'font-size': '10px','color': 'darkgreen'});
					 		$('#nickname_msg').html('사용 가능한 닉네임 입니다.');
					    }else {             
					        overlayNicknameChk = false;
					        $('#nickname_msg').css({'font-size': '10px','color': 'red'});
					  		$('#nickname_msg').html('중복된 닉네임 입니다.');
					      }
					   }
					   ,error:function(e){
					      console.log(e);
					   }
					});     
				}
		 }
		 
	});
	
	document.getElementById("address_kakao").addEventListener("click", function(){ 
		//주소검색 버튼을 클릭하면 카카오 지도 발생
	    new daum.Postcode({
	        oncomplete: function(data) { //선택시 입력값 세팅
	            var sigungu = data.sigungu; // '구' 주소 넣기
	            document.getElementById("location").value = sigungu;
	            console.log($('#location').val());
	            console.log(sigungu);
	        }
	    }).open();
	});

</script>
</html>