<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<head>
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
		 <link rel="icon" href="/images/mainLogo.png" class="images">
<style>
	.slick-track{
		height:300px;
	}

	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
	h3{
		font-family: 'IBM Plex Sans KR';	
		font-weight: 600;
		margin: 10 0 0 0;
	}
	input[type="text"],input[type="password"],input[type="email"]{
		width: 300px;
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
					<br>

					<nav id="navbar">
						<div class="main-menu stellarnav">
							<ul class="menu-list">
								<li class="menu-item"><a href="/BookSearch.go" class="nav-link">대여/교환</a></li>
								<li class="menu-item"><a href="/BookReportList.go" class="nav-link" >감상문</a></li>
								<li class="menu-item"><a href="/clubList.go" class="nav-link"  >독서모임</a></li>
								<li class="menu-item"><a href="/noticelist.go" class="nav-link"  >공지사항</a></li>
								<!-- <li class="menu-item"><a href="/eventList.go" class="nav-link"  >이벤트</a></li> -->
								<li class="menu-item"><a href="/mypage/libraryList.get" class="nav-link"  >마이페이지</a></li>
							</ul>
						</div>
					</nav>

				</div>

			</div>
		</div>
	</header>
</div>
<section id="billboard" style="margin-bottom:50px;">
	<div class="container" style="margin: 1% 31%;">
		<table>
			<tr>
				<th>
					<label for="email">이메일</label>					
					
				</th>
				<td>
                    <input type="email" id="member_email" placeholder="이메일을 입력하세요.">
                    <span id="email_msg"></span>
                                        
                    &nbsp;
                    <input type="button" onclick="member_email_check()" value="메일 전송">
                    <div id="duplicate_email_message"></div>
                </td>
	        </tr>
	        <tr>
	            <th>
	            	인증번호 확인
	            </th>		
	            <td>
	            	<input type="text" id="email_confirm" placeholder="인증번호 6자리를 입력하세요."><br>
	            	<span id="email_msg2"></span>
	            </td>		
			</tr>		
			<tr >	
				<th>
					비밀번호
				</th>				
				<td>						
					<input type="password" id="member_pw" placeholder="비밀번호 8자리 이상 입력하세요."><br>
					<span id="pw_msg1"></span>					
				</td>								
			</tr>
			<tr>	
				<th>
					비밀번호 확인
				</th>				
				<td>						
					<input type="password" id="pw_confirm" placeholder="비밀번호 확인"><br>
					<span id="pw_msg2"></span>				
				</td>								
			</tr>
			<tr>				
				<th>
					닉네임
				</th>
				<td>						
					<input type="text" id="member_nickname" placeholder="닉네임을 입력하세요."><br>
					<span id="nickname_msg"></span>				
				</td>								
			</tr>
		    <tr>
		        <th>주소(시/군/구)</th>	              
				<td>
				<input type="text" id="location" name="location"  readonly /> &nbsp;&nbsp;
				<input type="button" id="address_kakao" value="주소 검색" style="width: 120px; margin: 5px; font-size: 15px; padding: 6px;" class="btn btn-outline-dark"/>

				</td>
		    </tr>
			<tr>
				<th colspan="2" style="padding-left: 25%;">
					<input type="button" onclick="join()" value="회원가입">&nbsp;&nbsp;					
					<input type="button" onclick="location.href='./login.go'" value="취소">
				</th>
			</tr>
		</table>
	</div>
</section>

<div id="footer-bottom">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="copyright">
					<div class="row">
						<div class="col-md-12" style="text-align:center;">
							<p>Â© 2022 All rights reserved. Free HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//비밀번호 체크
var pweq = false;
// 닉네임 중복 체크
var overlayNicknameChk = false;
// 이메일 중복 체크
var overlayEmailChk = false;

var check = '';

// 인증번호 전송 여부를 확인하는 함수
function isVerificationCodeSent(email) {
  // 이 함수를 구체적으로 구현해야 합니다.
  // 인증번호가 전송된 아이디인지 확인하는 로직을 작성해야 합니다.
  // 이 예제에서는 간단하게 true를 반환하도록 구현하였습니다.
  return true;
}

// 회원가입 버튼 클릭시 실행되는 함수
function join() {
  console.log('클릭');
  // 변수 선언
  var $member_email = $('#member_email');
  var $member_pw = $('#member_pw');
  var $member_nickname = $('#member_nickname');
  var $location = $('#location');
  var specialChars = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;

  // 회원가입 버튼 클릭시 실행되는 빈칸 체크
  if ($member_email.val() == '') {
    alert('이메일을 입력해 주세요!');
    $member_email.focus();
  } else if ($member_email.val().length <= 4) {
    alert('이메일을 5자리 이상 입력해 주세요!');
    $member_email.focus();
  } else if ($member_pw.val() == '') {
    alert('비밀번호를 입력해 주세요!');
    $member_pw.focus();
  } else if ($member_pw.val().length <= 7) {
    alert('비밀번호는 8자리 이상 입력해 주세요!');
    $member_pw.focus();
  } else if (!/[!@#$%^&*]/.test($member_pw.val())) {
    alert("비밀번호는 특수문자 및 영문자를 포함하여 8자리를 입력해야 합니다. 특수문자는‘!, @, #, $, %, ^, &, *’만 사용 가능합니다.");
    $member_pw.focus();
  } else if ($member_nickname.val() == '') {
    alert('닉네임을 입력해 주세요!');
    $member_nickname.focus();
  } else if ($member_nickname.val().length <= 1 || $member_nickname.val().length >= 11) {
    alert('닉네임을 2글자 이상 10글자 이하로 입력해주세요.');
    $member_nickname.focus();
  } else if ($location.val() == '') {
    alert('주소를 입력해 주세요!');
  
  } else if (pweq && overlayNicknameChk) {
    // 입력한 값을 배열에 담음
    // 회원 가입 로직 실행

    // 입력한 값을 배열에 담음
    var param = {};
    param.member_email = $member_email.val();
    param.member_pw = $member_pw.val();
    param.member_nickname = $member_nickname.val();
    param.location = $location.val();
    console.log('클릭2');
    console.log(param);
    // 컨트롤러에 통신
    $.ajax({
      type: 'post',
      url: 'join.ajax',
      data: param,
      dataType: 'json',
      success: function (data) {
        console.log(data);
        console.log('클릭3');
        if (data.success > 0) {
          alert('회원가입이 완료되었습니다.');
          location.href = './login.go';
        } else {
          console.log('회원가입실패');
          alert('회원가입에 실패했습니다. 다시 시도해 주세요');
        }
      },
      error: function (e) {
        console.log(e);
        alert('회원가입에 실패했습니다. 다시 시도해 주세요');
      }
    });
  }
}



$('#member_nickname').on('keyup', function(e) {
	  var chkNickname = $('#member_nickname').val();
	  console.log("중복체크 요청 : " + chkNickname);
	  console.log($('#member_nickname').val().length);
	  overlayNicknameChk = false;

	  var specialChars = /[ `!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;

	  if ($('#member_nickname').val().length <= 1 || $('#member_nickname').val().length >= 11 || specialChars.test(chkNickname)) {
	    $('#nickname_msg').css({
	      'font-size': '10px',
	      'color': 'red'
	    });
	    $('#nickname_msg').html('닉네임을 2글자 이상 10글자 이하로 입력해주세요. 특수문자는 사용할 수 없습니다.');
	    overlayNicknameChk = false; // 중복 체크를 실패로 간주하여 false로 설정
	  } else {
	    $.ajax({
	      type: 'get',
	      url: 'overlaynickname.ajax',
	      data: {
	        'member_nickname': chkNickname
	      },
	      dataType: 'json',
	      success: function(data) {
	        console.log(data);
			console.log(data.overlaynickname);
	        if (data.overlaynickname == 0) {
	          overlayNicknameChk = true; // 중복 체크를 성공으로 간주하여 true로 설정
	          $('#nickname_msg').css({
	            'font-size': '10px',
	            'color': 'darkgreen'
	          }).text('사용 가능한 닉네임입니다.');
	        } else {
	          overlayNicknameChk = false; // 중복 체크를 실패로 간주하여 false로 설정
	          $('#nickname_msg').css({
	            'font-size': '10px',
	            'color': 'red'
	          }).text('중복된 닉네임입니다.');
	        }
	      },
	      error: function(e) {
	        console.log(e);
	        overlayNicknameChk = false; // 중복 체크를 실패로 간주하여 false로 설정
	      }
	    });
	  }
	});







$('#member_pw').on('keyup', function(e) {
	pweq = false;
	  var password = $('#member_pw').val();
	  var confirmPassword = $('#pw_confirm').val();
	  var errorMessage = '';

	  if (password.length <= 7 || !/[!@#$%^&*]/.test(password) || !/[a-zA-Z]/.test(password) || !/\d/.test(password)) {
	    errorMessage += '비밀번호를 특수문자, 영문자, 숫자를 포함하여 8자리 이상 입력해주세요.';
	    errorMessage += '<br>특수문자는‘!, @, #, $, %, ^, &, *’만 사용 가능합니다.';
	    

	    $('#pw_msg1').css({
	      'font-size': '10px',
	      'color': 'red'
	    }).html(errorMessage);
	  } else {
	    $('#pw_msg1').css({
	      'font-size': '10px',
	      'color': 'darkgreen'
	    }).text('사용 가능한 비밀번호입니다.');
	    pweq = true;
	  }

	  // 비밀번호가 변경될 때마다 1차와 2차 비밀번호를 비교하여 일치 여부를 표시
	  if (password !== confirmPassword) {
	    $('#pw_msg2').css({
	      'font-size': '10px',
	      'color': 'red'
	    }).text('비밀번호가 일치하지 않습니다.');
	  } else {
	    $('#pw_msg2').css({
	      'font-size': '10px',
	      'color': 'darkgreen'
	    }).text('비밀번호가 일치합니다.');
	    pweq = true;
	  }
	});

	$('#pw_confirm').on('keyup', function(e) {
	  var password = $('#member_pw').val();
	  var confirmPassword = $('#pw_confirm').val();

	  if (password !== confirmPassword) {
	    $('#pw_msg2').css({
	      'font-size': '10px',
	      'color': 'red'
	    }).text('비밀번호가 일치하지 않습니다.');
	  } else {
	    $('#pw_msg2').css({
	      'font-size': '10px',
	      'color': 'darkgreen'
	    }).text('비밀번호가 일치합니다.');
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

function member_email_check() {
	var member_email = $('#member_email').val();

	if (!member_email || member_email.indexOf('@') === -1 || member_email.indexOf('.') === -1) {
		alert('이메일 주소를 올바르게 입력해주세요.');
		return;
	}

	$.ajax({
		type: 'post',
		url: 'member_email_check.ajax',
		data: {
			member_email: member_email
		},
		dataType: 'json',
		success: function (data) {
			if (data.check != null) {
				alert('입력한 이메일로 인증번호를 전송했습니다.\r\n인증번호를 확인해주세요.');
				check = data.check;
			} else {
				$('#duplicate_email_message').text('중복된 이메일입니다. 다른 이메일을 입력해주세요.').css({
					'color': 'red',
					'font-size': '12px'
				});
			}
		},
		error: function (e) {
			console.log(e);
			alert('오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
		}
	});
}

// 1. 인증번호를 입력하고 나갈떄(keyup)
// 2. 인증번호를 확인해서
// 3. msg에 일치하는지 표시

$('#email_confirm').keyup(function() {

    if (check === $('#email_confirm').val()) {
        $('#email_msg2').html('인증번호가 일치합니다.').css('color', 'green');
        $('#member_email').css('pointer-events', 'none');
    } else {
        if ($('#email_confirm').val() !== '') {
            $('#email_msg2').html('인증번호가 일치하지 않습니다.').css('color', 'red');
        } else {
            $('#email_msg2').html('인증번호를 입력해주세요.').css('color', 'red');
        }
    }
});

$('#email_confirm').keyup(function() {

    if (check === $('#email_confirm').val()) {
        $('#email_msg2').html('인증번호가 일치합니다.').css('color', 'green');
    } else {
        if ($('#email_confirm').val() !== '') {
            $('#email_msg2').html('인증번호가 일치하지 않습니다.').css('color', 'red');
        } else {
            $('#email_msg2').html('인증번호를 입력해주세요.').css('color', 'red');
        }
    }
});




</script>
</html>