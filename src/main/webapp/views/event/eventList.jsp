<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css" />
	<script src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>

</head>

<body>

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
							<a href="/"><img src="/images/malogo.png" alt="logo"></a>
						</div>
					</div>
					<div class="col-md-10">
						<nav id="navbar">
							<div class="main-menu stellarnav">
								<br />
								<br />
								<ul class="menu-list">
									<li class="menu-item active"><a href="/libraryList.get">서재</a></li>
									<li class="menu-item"><a href="/myBookreportList.get" class="nav-link">감상문</a></li>
									<li class="menu-item"><a href="/trackerList.go">트래커</a></li>
									<li class="menu-item"><a href="#latest-blog" class="nav-link">일정</a></li>
									<li class="menu-item"><a href="/deposit" class="nav-link">보증금</a></li>
									<li class="menu-item has-sub"><a href="#pages" class="nav-link">내 정보</a>
										<ul>
											<li class="active"><a href="index.go">회원 정보</a></li>
											<li><a href="about.move">활동 내역</a></li>
											<li><a href="styles.move">문의 내역</a></li>
										</ul>
									</li>
								</ul>								
							</div>
						</nav>
					</div>
				</div>
			</div>
		</header>


	<section class="hero-section jarallax">
		<div class="container">
			<div class="row">
				<div class="section-header align-center">
					<h2 class="section-title" style="margin-bottom: 25px;">EVENT</h2>
				</div>
			</div>
		</div>
	</section>

	<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px; padding-bottom: 10px; margin-bottom: 10px; width: 800; display: flex; left: 175px; position: relative;">
		<button class="prev slick-arrow">
			<i class="icon icon-arrow-left"></i>
		</button>
		<div class="container">
			<div class="event-slider" style="display: flex; justify-content: center; align-items: center;">
				<div class="slide-item">
					<img src="/images/이벤트 배너.png" alt="Event 1" style="width: 550px; margin: 0 auto;" onclick="location.href='eventDetail.go'">
				</div>
				<div class="slide-item">
					<img src="/images/이벤트 배너.png" alt="Event 2" style="width: 550px; margin: 0 auto;" onclick="location.href='eventDetail.go'">
				</div>
				<div class="slide-item">
					<img src="/images/이벤트 배너.png" alt="Event 3" style="width: 550px; margin: 0 auto;" onclick="location.href='eventDetail.go'">
				</div>
			</div>
		</div>
		<button class="next slick-arrow">
			<i class="icon icon-arrow-right"></i>
		</button>
	</section>

	<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 10px; padding-bottom: 10px; margin-bottom: 10px;"> 
		<div class="container">				
			<div class="tab-content">
				<div id="all-genre" data-tab-content class="active">
					<div class="row" id="event_list"></div>
					<button onclick="location.href='eventWrite.go'">이벤트 등록</button>
					<div id="paging">
						<div class="container" style="text-align: center; width: 600px;">
							<nav aria-label="Page navigation" style="text-align: center; width: 500px;">
								<ul class="pagination justify-content-center" id="pagination"></ul>
							</nav>
						</div>
					</div>
				</div>
			</div>	    
		</div>
	</section>

	<div id="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="copyright">
						<div class="row">
							<div class="col-md-12" style="text-align: center;">
								<hr />
								<p>
									© 2022 All rights reserved. Free HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	var showPage = 1;
	listCall(showPage);

	function listCall(page) {
		$.ajax({
			type: 'post',
			url: 'event_list.ajax',
			data: {
				'page': page,
			},
			dataType: 'json',
			success: function(data) {
				console.log(data);
				listPrint(data.list);

				$('#notice_pagination').twbsPagination({
					startPage: 1, // 시작 페이지
					totalPages: data.pages, // 총 페이지 수 
					visiblePages: 10, // 보여줄 페이지
					onPageClick: function(event, page) { // 페이지 클릭시 동작되는 (콜백)함수
						console.log(page, showPage);
						if (page != showPage) {
							showPage = page;
							listCall(page);
						}
					}
				});
			},
			error: function(e) {

			}
		});
	}	

	function listPrint(list) {
		var content = '';
		if (list.length > 0) {
			for (var i = 0; i < Math.min(list.length, 6); i++) {
				var item = list[i];
				var currentDate = new Date();
				var startDate = new Date(item.event_startdate);
				var endDate = new Date(item.event_enddate);
				var isOngoing = currentDate >= startDate && currentDate <= endDate;

				content += '<div class="event-item">';
				content += '	<div class="event-image" style="text-align: center;"><img src="' + item.photo + '"></div>';
				content += '	<div class="event-details" style="text-align: center;">';
				content += '		<h3 class="event-title"><a href="/noticedetail.go?notice_idx=' + item.notice_idx + '">' + item.event_title + '</a></h3>';
				content += '		<p class="event-date">' + item.event_startdate + ' ~ ' + item.event_enddate + '</p>';
				content += '		<p class="event-hit">' + item.event_hit + '</p>';

				if (isOngoing) {
					content += '		<div class="event-status">진행중인 이벤트</div>';
				} else {
					content += '		<div class="event-status">종료된 이벤트</div>';
				}

				content += '	</div>';
				content += '</div>';
			}
		} else {
			content = '<div class="no-event">등록된 이벤트가 없습니다.</div>';
		}

		$('#event_list').empty();
		$('#event_list').append(content);

		// 한 줄에 3개씩 출력하기 위해 부모 컨테이너에 클래스 추가
		$('#event_list').addClass('event-list-grid');
	}




	</script>

</body>
</html>
