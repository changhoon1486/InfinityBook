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
	    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="/style.css">
	    
		<!-- script -->
		<!-- jQuery -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<!-- iamport.payment.js -->
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<script src="/js/twbsPagination.js"></script>    
		<script src="/js/modernizr.js"></script>		
		<script src="/js/plugins.js"></script>
		<script src="/js/script.js"></script>
		
		<style>
			.pagination .page-link {
	  		color: gray; /* 기본 글자색을 검정색으로 지정 */
			}
	
			.pagination .page-item.active .page-link {
		 		background-color: #C5A992;
		 		border:none;
			}
			
			@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
			h3,h4{
				font-family: 'IBM Plex Sans KR';	
				font-weight: 600;
				margin: 10 0 0 0;
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
					<nav id="navbar">
						<div class="main-menu stellarnav">
						<br/><br/>
							<ul class="menu-list">
								<li class="menu-item "><a href="/mypage/libraryList.get" >서재</a></li>
								<li class="menu-item"><a href="/mypage/myBookreportList.get" >감상문</a></li>
								<li class="menu-item"><a href="/mypage/trackerList.go" >트래커</a></li>
								<li class="menu-item"><a href="/mypage/calender.go" >일정</a></li>
								<li class="menu-item active"><a href="/mypage/deposit" class="nav-link">보증금</a></li>
								<li class="menu-item has-sub">
									<a href="#" class="nav-link">내 정보</a>
									<ul>
		                                <li><a href="/mypage/memberInfo.go">회원 정보</a></li>
		                                <li><a href="/mypage/activitiesChange.go">대여/교환 내역</a></li>
		                                <li><a href="/mypage/myinquirylist.go">문의 내역</a></li>
		                             </ul>
								</li>								
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
				<h2 class="section-title" style="margin-botton:25px;">Deposit</h2>
			</div>
		</div>
	</div>
</section>

<section id="latest-blog" class="scrollspy-section padding-large" style="padding-top: 0px;"> 
	<div class="container">
		<h4 class="menu-item">충전 / 결제</h4>
		<hr/>
		<div style="text-align:center;">
			<form onsubmit="submitForm(event)" id="depositForm">
				<h4 style="display:inline; margin-right:100px;">현재 잔액 : ${deposit_now} 원</h4>
				<select name="deposit_type">
					<option value="충전">충전</option>
					<option value="출금">출금</option>
				</select>
				<select name="deposit_price_sel" id="deposit_price_sel">
					<option value="0">직접 입력하기</option>
					<option value="1000">1,000 원</option>
					<option value="5000">5,000 원</option>
					<option value="10000">10,000 원</option>
				</select>
				<input type="hidden" id="member_idx" name="member_idx" value="${member_idx}">
				<input type="number" id="deposit_price" name="deposit_price" style="text-align:right;" placeholder="0" step="1000" min="0" max="100000" onblur="checkInput()"> 원
				<input type="submit" value="요청" style="margin-left:100px; ">
			</form>
		</div>
		
		
		
			
		<h4 class="menu-item">사용 내역</h4>
			<div style="text-align:center;">
				<hr/>	
				<div class="row" id="list">
				</div>
					    
				<div  id="paging" >
					<div class="container" style="text-align:center; width: 600px;">
						<nav aria-label="Page navigation"  style="text-align:center; width: 500px;">
					          <ul class="pagination justify-content-center" id="pagination"></ul>
					    </nav>
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

<script>

var amount = document.getElementById("deposit_price").value;
var member_idx = document.getElementById("member_idx").value;
 
document.getElementById("deposit_price").addEventListener("input", function() {
   amount = document.getElementById("deposit_price").value;
    console.log(amount);
});

function checkInput() {
	  var deposit = document.getElementsByName("deposit_price")[0].value;
	  if (deposit % 1000 !== 0) {
	    alert(" 충전은 1000원 단위로만 가능 합니다.");
	    var depositPrice = document.getElementsByName("deposit_price")[0];
	    depositPrice.value = 0;
	    return false;
	  }
	  
	  var depositType = document.getElementsByName("deposit_type")[0].value;
	  var depositPrice = parseInt(document.getElementById("deposit_price").value);
	  var depositNow = parseInt("${deposit_now}");

	  if (depositType === "출금" && depositPrice > depositNow) {
	    alert("현재 잔액보다 큰 금액은 출금이 불가능합니다.");
	    depositPrice.value = 0;
	  }
	}

var IMP = window.IMP; 
IMP.init("imp58827418");

var today = new Date();
var merchant_uid = member_idx +'-'+today.getYear()+today.getMonth()+today.getDay()+'-'+today.getTime();
console.log(member_idx +'-'+today.getYear()+today.getMonth()+today.getDay()+'-'+today.getTime());

//var buyer_name = ${sessionScope.loginIdx};
 function requestPay() {
     
      IMP.request_pay({ // param
          pg: "INIBillTst",
          pay_method : 'card',
          merchant_uid: merchant_uid, 
          name : 'InfinityBook',
          amount : amount,
          buyer_email : 'Iamport@chai.finance',
          buyer_name : '${sessionScope.loginNickname}',
          buyer_tel : '010-1234-5678',
          buyer_addr : '서울특별시 강남구 삼성동',
          buyer_postcode : '123-456'
          
          
      }, function (rsp) { // callback
    	  if (rsp.success) {
             alert("보증금 충전이 완료되었습니다. ");
             var formData = new FormData(document.getElementById("depositForm")); 
             // 카드 승인번호
             formData.append("apply_num", rsp.apply_num);
 			
             // AJAX 요청 보내기
             var xhr = new XMLHttpRequest();
             xhr.open('post', '/mypage/depositCharge.ajax', true);
             xhr.send(formData);
             
             window.location.reload();
             
          } else {
        	  alert("보증금 충전이 중 문제가 발생했습니다. 다시 시도해 주세요.");
        	  
        	  
              
          }
      });
    }


 function submitForm(event) {
	  event.preventDefault();

	  var depositType = document.getElementsByName('deposit_type')[0].value;
	  var formElement = event.target;
	  
	  if (depositType === '출금') {
		  
		  var depositType = document.getElementsByName("deposit_type")[0].value;
		  var depositPrice = parseInt(document.getElementById("deposit_price").value);
		  var depositNow = parseInt("${deposit_now}");

		  if (depositType === "출금" && depositPrice > depositNow) {
		    alert("현재 잔액보다 큰 금액은 출금이 불가능합니다.");
		    depositPrice.value = 0;
		  } else{
				var url = '/mypage/depositWithdraw.go';
			    
			    // 팝업창 열기
			    var popupWindow = window.open('', 'Infinity_Book', 'width=600px,height=500px');
			    
			    // 폼 데이터를 팝업창에 전송하는 코드
			    formElement.target = 'Infinity_Book';
			    formElement.action = url;
			    formElement.method = 'POST';
			    formElement.submit();
			    
			    // 팝업창에 전송된 데이터 확인
			    popupWindow.onload = function() {
			      console.log('데이터 전송 완료');
			    };
		  }  
		  
		  
	   
	  } else if (depositType === '충전') {
	    requestPay();
	  }
	}


function handleOptionChange() {
    var selectedOption = document.getElementById("deposit_price_sel").value; // 선택된 옵션의 값 가져오기
    var depositPrice = document.getElementsByName("deposit_price")[0]; // deposit_price 필드 가져오기
    amount=selectedOption;
    console.log(amount);
    depositPrice.value = selectedOption; // deposit_price 필드에 선택된 값 설정
  }

  // 선택 옵션 변경 이벤트 처리
  var selectElement = document.getElementById("deposit_price_sel");
  selectElement.addEventListener("change", handleOptionChange);




var showPage = 1;
	listCall(showPage);
	
	function listCall(page){
		   $.ajax({
		      type:'post',
		      url:'/mypage/depositUseList.ajax',
		      data:{
		    	  'page':page,
		      },
		      dataType:'json',           
		      success:function(data){
		         console.log(data);
		         listPrint(data.list);
		         
		        
		         
		         $('#pagination').twbsPagination({
						startPage:1, // 시작 페이지
						totalPages:data.pages,// 총 페이지 수 
						visiblePages:5,// 보여줄 페이지
						onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
							console.log(page,showPage);
							if(page != showPage){
								showPage=page;
								listCall(page);
								
							}
						}
			         });
		         
		         
		         
		      }
		   });
		}

	function listPrint(list) {
	    var content = '';
	    
	    content += '<table style=" text-align:center; width:90%;">';
	    content += '<tr>';
	    content += '	<th style="width:30%; text-align:center;"> 사용일자 </th>';
	    content += '	<th style="width:30%; text-align:center;"> 사용금액 </th>';
	    content += '	<th style="width:40%;"> 사용내역 </th>';
	    content += '</tr>';
	    
	   
	    list.forEach(function(item) {
	    	content += '<tr>';
		    content += '	<td style=" text-align:center;">'+item.deposit_use_date.split("-")[0]+'년 '+item.deposit_use_date.split("-")[1]+'월 '+item.deposit_use_date.split("-")[2]+'일</td>';
		    content += '	<td style=" text-align:center;">'+item.deposit_use_price+'원</td>';
		    if(item.deposit_use_state == "충전"){ 
		    	content += '	<td>'+item.deposit_use_state+' 했습니다.</td>';
		    }else if(item.deposit_use_state == "출금"){
		    	content += '	<td>'+item.deposit_use_state+' 했습니다.</td>';
		    }else if(item.deposit_use_state == "사용"){
		    	content += '	<td>도서 대여 보증금으로 '+item.deposit_use_state+' 했습니다.</td>';		    	
		    }else if(item.deposit_use_state == "반환"){
		    	content += '	<td>도서 대여 보증금을 '+item.deposit_use_state+' 받았습니다.</td>';		    	
		    }else if(item.deposit_use_state == "배상금"){
		    	content += '	<td>도서 대여 보증금으로 '+item.deposit_use_state+' 을 받았습니다.</td>';		    	
		    }else{}
		    
		    content += '</tr>';
	    });

	    content += '</table>';

	    $('#list').empty();
		$('#list').append(content);
	}
 
</script>

</html>	