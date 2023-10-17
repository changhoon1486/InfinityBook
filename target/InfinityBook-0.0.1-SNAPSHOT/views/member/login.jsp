<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/normalize.css">
<link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
<link rel="stylesheet" type="text/css" href="/css/vendor.css">
<link rel="stylesheet" type="text/css" href="/style.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
body {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

#header-wrap {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 9999;
}

input[type="submit"] {
  width: 150px;
  height: 70px;
}
</style>
<link rel="icon" href="/images/KakaoTalk_20230613_123518647.png" class="images">



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

<div class="input-container" style="margin-top: 50px;">
  <input type="email" id="member_email" name="member_email" placeholder="이메일을 입력하세요." style=" width:240px; display: block;">
  <input type="password" id="member_pw" name="member_pw" placeholder="비밀번호를 입력하세요." style=" width:240px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="button" onclick="login()" value="로그인" style="display: inline-block; margin-top: -45px;">
  <br>
  	  <input type="checkbox" id="rememberMe">&nbsp;&nbsp;&nbsp;<label for="rememberMe" style="display: inline-block; vertical-align: middle;">아이디 저장</label>
 
	
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="join.go" onclick="closePopup1()">회원가입</a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="pw_Search.go" onclick="closePopup2()">비밀번호 찾기</a>
</div>
</body>
<script>

$(document).ready(function() {
	  var email = getCookie("email");
	  var rememberMe = getCookie("rememberMe");

	  if (rememberMe === "true" && email) {
	    $('#member_email').val(email);
	    $('#rememberMe').prop('checked', true);
	    password != "";
	    login();
	  }
	});

	// 로그인
	function login() {
	  var email = $('#member_email').val();
	  var password = $('#member_pw').val();
	  var rememberMe = $('#rememberMe').is(':checked');

	  if (email === "") {
	    alert("아이디를 입력해 주세요.");
	  } else if (password === "") {
	    alert("비밀번호를 입력해 주세요.");
	  } else {
	    $.ajax({
	      type: 'post',
	      url: 'login.ajax',
	      data: {
	        member_email: email,
	        member_pw: password
	      },
	      dataType: "json",
	      success: function(data) {
	        console.log(data);
	        if(data.success == 1) {
	          setCookie("email", email, 30);
	          if(rememberMe) {
	            setCookie("rememberMe", "true", 30);
	          } else{
	            deleteCookie("rememberMe");
	          }
	          location.href = "./";
	       } else{
	          alert("아이디 또는 비밀번호를 잘못 입력했습니다.\r\n입력하신 내용을 다시 확인해주세요.");
	       }
	    },
	      error: function(e) {
	        console.log(e);
	        alert("아이디 또는 비밀번호를 잘못 입력했습니다.\r\n입력하신 내용을 다시 확인해주세요.");
	      }
	    });
	  }
	}

	function setCookie(name, value, days) {
	  var expires = "";
	  if (days) {
	    var date = new Date();
	    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
	    expires = "; expires=" + date.toUTCString();
	  }
	  document.cookie = name + "=" + (value || "") + expires + "; path=/";
	}

	// 쿠키 삭제
	function deleteCookie(name) {
	  document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
	}
	
	
	// 쿠키 가져오기
	function getCookie(name) {
	  var nameEQ = name + "=";
	  var ca = document.cookie.split(';');
	  for (var i = 0; i < ca.length; i++) {
	    var c = ca[i];
	    while (c.charAt(0) === ' ') c = c.substring(1, c.length);
	    if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
	  }
	  return null;
	}

	// 페이지 나갈 때 쿠키 저장
	$(window).on("beforeunload", function() {
	  var rememberMe = $('#rememberMe').is(':checked');

	  if (rememberMe) {
	    var email = $('#member_email').val();
	    setCookie("rememberMe", "true", 30);
	    setCookie("email", email, 30);
	  } else {
	    deleteCookie("rememberMe");
	    deleteCookie("email");
	  }
	});

	
	  $(document).ready(function() {
	    var content = $("#login").html();
	    $("#login").html(content);
	  });

	  function handleKeyPress(event) {
		    if (event.keyCode === 13) {
		      login();
		    }
		  }

		  // 엔터키 이벤트 리스너 등록
		  document.addEventListener("keypress", handleKeyPress);
		

</script>
</html>
