<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
		<title>Infinite B∞k</title>
		<meta charset="utf-8">
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
	     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>
		<script src="/richtexteditor/rte.js"></script>
		<script src="/richtexteditor/plugins/all_plugins.js"></script>
		<script src="/js/twbsPagination.js"></script>    

	<style>		
		@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
         h3,h4{
            font-family: 'IBM Plex Sans KR';   
            font-weight: 600;
            margin: 10 0 0 0;
         }
		#btn{
			background-color: #C5A992;
			border: none; /* 테두리 제거 */
			background-color: transparent;
		}
		#like{
			display:block;
		}
		#btn{
			float:right;
		}
		#aLike{
			float:right;
			margin-top:27px;
		}
		
		i{
			color:ff0000;
		}
		.author-name{
			line-height:2.5;
		}			
		.fa{
			font-size: x-large;
		}
		.fa-heart:before {
		    content: "\f08a";
		}
		.fa-heart-o:before {
		    content: "\f004";
		}
	</style>
</head>
<body>

  <div id="header-wrap">
	<c:choose>
        <c:when test="${sessionScope.loginIdx != null}">
            <jsp:include page="./loginAfterBox.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="./loginBeforeBox.jsp" />            
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
								<li class="menu-item active"><a href="/BookReportList.go" class="nav-link" >감상문</a></li>
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

<section class="hero-section jarallax">
	
	<div class="container">
		<div class="row">
			<div class="section-header align-center">
				<h2 class="section-title" style="margin-botton:0px;">Book Report</h2>
			</div>
		</div>
	</div>
</section>



<section id="best-selling" class="leaf-pattern-overlay" style="padding-top: 50px;padding-bottom: 10px;margin-bottom: 10px;">
	<div class="corner-pattern-overlay"></div>
	<div class="container">
		<table>
            <tr>
            
                <td></td>
                <td><h3 style="display:inline;">${report.book_report_title}</h3><h4 style="display:inline;float:right;   "> ${name}&nbsp; | &nbsp;${report.book_report_date}</h4></td>
                
            </tr>
			<tr>
				<th style="width: 20%; text-align:center;">
					<img src="${book.cover}" style="text-align:center; width: 90%;" alt="book" class="single-image">
				</th>
				<th style="width: 50%;">
					<br><br>
					<div class="author-name"><h4 style="display:inline;">제목 &nbsp; </h4> ${book.title}</div>
                    <div class="author-name"><h4 style="display:inline;">저자 &nbsp; </h4> ${book.author} &nbsp;&nbsp;&nbsp;${book.publisher}</div>
                    <br>
                    <div class="author-name">${report.book_report_content}</div>
                    <div class="author-name" id="aLike" style="margin-right: 550px;  margin-top: 125px">${like}</div>
                    <button id='btn' style="margin-right: 2px; margin-top: 111px; margin-bottom: -20px;">
                        <i id="like" class="fa fa-heart"></i>
                    </button>
				</th>
			</tr>
			
		</table>
    </div>
	<input type="hidden" id ="myLike" value="${myLike}"/>
	<input type="hidden" id ="isbn" value="${report.isbn}"/>
</section>
			
	<div class="subscribe-content" style="align-items: center;">
			<div style="display: flex; width: 100%;align-items: center;">
				<div style="width: 10%;"></div>
				<c:choose>
				  <c:when test="${loginIdx != null}">
				    <textarea id="reply_content" placeholder="댓글을 입력하세요." style="width: 80%; resize: none ;margin-bottom:0;"></textarea>
				  </c:when>
				  <c:otherwise>
				    <textarea id="replycontent" placeholder="댓글은 로그인 이후 이용가능합니다." style="width: 80%; resize: none ;margin-bottom:0;"></textarea>
				  </c:otherwise>
				</c:choose>

				<button class="btn-subscribe" style="width: 10%;" value="작성">
					<span>작성</span> 
					<i class="icon icon-send" style="color: black;"></i>
				</button>
			</div> 
			<hr>

								
		</div>



</body>
<script src="/js/twbsPagination.js"></script>    
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
<script>
var showPage = 1;

window.onload = () => {
	  var like = document.querySelector('.fa');
	  if(${sessionScope.loginIdx == null}){
	  }else{
	  if(document.getElementById("myLike").value == "0"){
		  like.addEventListener("click", (e) => {
			  	var val = 0;
			  	if(e.target.className == 'fa fa-heart'){
			  		val = 1;
			  	}else{
			  		val = -1;
			  	}
			    e.target.classList.toggle('fa-heart');
			    e.target.classList.toggle('fa-heart-o');
			    likeCheck(val);
			  });
	  }else{
		  document.getElementById('like').className = 'fa fa-heart-o'
		  like.addEventListener("click", (e) => {
			  	var val = 0;
			  	if(e.target.className == "fa fa-heart-o"){
			  		val = -1;
			  	}else{
			  		val = 1;
			  	}
			    e.target.classList.toggle("fa-heart-o");
			    e.target.classList.toggle('fa-heart');
			    likeCheck(val);
		  });
	  };
	  
	  };
	};
	

function likeCheck(val){
	$.ajax({
        url: '/like.ajax',
        type: 'post',
        data: {
        	'book_report_idx':${report.book_report_idx}
			,'like_state':val
        },
		dataType:'json',
		async: false,
		success: function(data) {
			console.log(data.success);
			if(data.success == 1){
				document.getElementById("aLike").innerText = data.like;
			}
        },
		error:function(e){
			console.log(e);
		}
    }); 	
}

var book_report_idx = ${report.book_report_idx};

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}



</script>
</html>