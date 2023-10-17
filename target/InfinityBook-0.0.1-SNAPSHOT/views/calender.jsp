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

		<!-- script	 -->
		<script src="/js/modernizr.js"></script>
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
		<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
		<script src="/js/jquery-1.11.0.min.js"></script>
		<script src="/js/plugins.js"></script>
		<script src="/js/script.js"></script>
	</head>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
		h3{
			font-family: 'IBM Plex Sans KR', serif;	
			font-weight: 600;
			margin: 10 0 0 0;
		}
		.post-item{
			font-family: 'IBM Plex Sans KR', serif;	
		}
		#calendar {
	        margin: 10% 7%;
	        height: 90%;
  	   }
		:root {
			--fc-button-bg-color: #c5a992;			
			--fc-button-border-color: #c5a992;
  			--fc-button-hover-bg-color: #c5a992;
 			--fc-button-hover-border-color: #c5a992;
			--fc-event-border-color: none;
			--fc-toolbar-ltr-height:20px;
		}
		.fc-scrollgrid-sync-table{
		    height: 800;
		    margin: 0;
		}
		table{
			margin-top: 20px;
		}
		tbody{
	 	   height: 700px;
		}
		.fc-col-header{
			margin: 0;
		}
		button{
			height: 41px;
			padding-top: 5;
		}
		#fc-dom-1{
			margin-left: 52%;
   			width: 100%;   			
			font-family: 'IBM Plex Sans KR', serif;	
		}
		.fc-event-time, .fc-event-title{
			color: black;
  	  		font-weight: bold;
		}
	</style>
<body>

<div id="header-wrap">

	<c:choose>
        <c:when test="${sessionScope.loginIdx != null}">
            <jsp:include page="loginAfterBox.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="loginBeforeBox.jsp" />            
        </c:otherwise>
    </c:choose>

	<header id="header">
		<div class="container">
			<div class="row">

				<div class="col-md-2">
					<div class="main-logo">
						<a href="../"><img src="/images/mainLogo.png" alt="logo"></a>
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
								<li class="menu-item active"><a href="/mypage/calender.go" >일정</a></li>
								<li class="menu-item"><a href="/mypage/deposit" class="nav-link">보증금</a></li>
								<li class="menu-item has-sub">
									<a href="#" class="nav-link">내 정보</a>
									<ul>
								        <li><a href="/mypage/memberInfo.go">회원 정보</a></li>
								        <li><a href="/mypage/activitiesChange.go">대여/교환 내역</a></li>
								        <li><a href="/mypage/myinquirylist.go">문의 내역</a></li>
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
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="section-header align-center">
					<h2 class="section-title">Calendar</h2>
				</div>					
				<div id='calendar'></div>
			</div>	
		</div>
	</div>
</section>

<div id="footer-bottom" style="margin-top:5%">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="copyright">
					<div class="row">
						<div class="col-md-12" style="margin-top: 5%; text-align:center;">
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

	$(document).ready(function(){

		$.ajax({
	        url: '/mypage/calendarGetEvents.ajax',
	        type: 'get',
			dataType:'json',
			success: function(data) {
				console.log(data);
				if(data.events != ''){
					calendar(data.events);
				}
	        },
			error:function(e){
				console.log(e);
			}
	    });
		
	});

	function calendar(events){
		
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	height: 'auto',
	    	locale: 'ko',
	    	dayCellContent:function(e){
	    		var number = document.createElement("a");
	    		number.classList.add("fc-daygrid-day-number");
	    		number.innerHTML = e.dayNumberText.replace("일","").replace("日","");
	    		if(e.view.type == "dayGridMonth"){
	    			return {
	    				html: number.outerHTML
	    			};
	    		}
	    		return{
	    			domNodes:[]
	    		};
	    	},
	    	headerToolbar: {
                left: false,
                center: 'title',
                right: 'today prev,next'
               	
            },
            events:events,
            eventTextColor: 'black',
            selectable: true,
            selectMirror: true,

            navLinks: true, 
            editable: false,
            eventDidMount: function(info) {
                var eventElement = info.el;
                var titleElement = eventElement.querySelector('.fc-event-title');
                titleElement.style.fontWeight = 'bold';
                tippy(info.el, {
                    content: info.event.title,
                    placement: 'bottom'
                });
            },
	    });
	    calendar.render();
	  };

</script>
</html>	