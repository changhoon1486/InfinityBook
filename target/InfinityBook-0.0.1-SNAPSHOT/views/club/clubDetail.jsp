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
	         h4{
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
				<h2 class="section-title" style="margin-botton:0px;">Book Club</h2>
			</div>
		</div>
	</div>
</section>



<section id="best-selling" class="leaf-pattern-overlay" style="padding-top: 50px;padding-bottom: 10px;margin-bottom: 10px;">
	<div class="corner-pattern-overlay"></div>
	<div class="container">
		<table>
			<tr>
				<th style="width: 25%; text-align:center;">
					<img src="${club.cover}" style="text-align:center; width: 90%;" alt="book" class="single-image">
				</th>
				<th style="width: 5%;">
					
				</th>
				<td style="width: 50%;">
					<c:if test="${club.club_state eq 0}"> 
	    				<input type="button" style="cursor:default; padding:5 10 5 10; color:CornflowerBlue;" class="btn btn-outline-accent btn-accent-arrow" value="모집 중 ">
					</c:if>
					<c:if test="${club.club_state eq 1}"> 
	    				<input type="button" style="cursor:default; padding:5 10 5 10; color:Crimson;" class="btn btn-outline-accent btn-accent-arrow" value="모집 종료 ">
					</c:if>
					
					<table>
						<tr>
							<th style="width: 800px;" colspan="3"><h4 class="item-title">${club.club_name}</h4></th>
						</tr>
						<tr>
							<td style="width: 30%;"><div class="author-name">모임주최</div></td>
							<td colspan="2">
								<div class="author-name">
									<a onclick="profilePop(${club.member_idx})" style="cursor: pointer;">${club.member_nickname}</a>
								</div>
							</td>
						</tr>
						<tr>
							<td><div class="author-name">선정도서</div></td>
							<td colspan="2"><div class="author-name">${club.title}</div></td>
						</tr>
						<tr>
							<td><div class="author-name">모임일시</div></td>
							<td colspan="2"><div class="author-name">${club.club_meetdate}</div></td>
						</tr>
						<tr>
							<td><div class="author-name">모임인원</div></td>
							<td colspan="2">
								<div class="author-name">
									${club.meet_num}/${club.club_num} 명 &nbsp;
									<c:if test="${loginIdx == club.member_idx}">
										<c:if test="${club.club_state eq 0}">
											<input type="button" onclick="addMember(${club.club_idx})" style=" margin: 0px; padding:5 10 5 10; color:CornflowerBlue;" class="btn btn-outline-accent btn-accent-arrow" value="참가자 불러오기">	
										</c:if>
									</c:if>
								</div>
							</td>
						</tr>
						<tr>
	                     	<td><div class="author-name">참가자 </div></td>
	                     	<td colspan="2">
	                       	 <div class="author-name">
	                            <c:forEach items="${member}" var="member">
	                               <a onclick="profilePop(${member.member_idx})" style="cursor: pointer;">${member.member_nickname}</a>
	                               
	                               <c:if test="${sessionScope.loginIdx eq club.member_idx}">                               
	                                  <button onclick="deleteMem('${member.member_idx}','${club.club_idx} ')" class="btn btn-outline-accent btn-accent-arrow" style="border:none; width:10px; height:10px;padding-top: 0px;margin-top: 0px;padding-left: 0px;top: -20;">⊗</button>
	                               </c:if>
	                            </c:forEach>
	                        </div>
	                     </td>
	                  </tr>
						<tr>
							<td><div class="author-name">모임장소</div></td>
							<td colspan="2"><div class="author-name">${club.code_codename}</div></td>
						</tr>
						<tr>
							<td colspan="3">
								<h4 class="item-title">Book ClubInfo</h4>
								${club.club_content}
							</td>
						</tr>
						<tr>
							<td colspan="3" style="text-align:center;">
							<br/><br/>
							<c:if test="${loginIdx == club.member_idx}">
								<c:if test="${club.club_state eq 0}">
									<input type="button" onclick="clubUpdate(${club.club_idx})" style="padding:5 10 5 10; color:Crimson;" class="btn btn-outline-accent btn-accent-arrow" value="모집종료">	
								</c:if>
								
							</c:if>
							<c:if test="${loginIdx != null}">
								<c:if test="${loginIdx != club.member_idx}">
									<c:if test="${club.club_state eq 0}">
										<input type="button" onclick="clubApply(${club.club_idx})" style="padding:5 10 5 10; color:CornflowerBlue;" class="btn btn-outline-accent btn-accent-arrow" value="신청">	
									</c:if>
								</c:if>
							</c:if>
								<input type="button" style="padding:5 10 5 10;" onclick="location.href='/clubList.go'" class="btn btn-outline-accent btn-accent-arrow" value="목록 ">
							</td>
						</tr>
					</table>
				</td>
				<th style="width: 20%; vertical-align: top; text-align:center;">
					<c:if test="${loginIdx == club.member_idx}">
						<input type="button" onclick="clubDelete(${club.club_idx})" style="padding:5 10 5 10;"  class="btn btn-outline-accent btn-accent-arrow" value="삭제 ">
						<h4>신청자</h4><br/>
						<c:forEach items="${apply}" var="apply">
						<a onclick="profilePop(${apply.member_idx})" style="cursor: pointer;">${apply.member_nickname}</a> <br/>
						<input type="button" style="padding:0 ; margin:0; color:CornflowerBlue; border:none; " class="btn btn-outline-accent btn-accent-arrow" onclick="location.href='/applyAccept.do?club_idx='+${club.club_idx}+'&member_idx='+${apply.member_idx}" value="수락"/> / 
						<input type="button" style="padding:0; margin:0; color:Crimson; border:none; " class="btn btn-outline-accent btn-accent-arrow" onclick="location.href='/applyReject.do?club_idx='+${club.club_idx}+'&member_idx='+${apply.member_idx}" value="거절"/><br/><br/>
						</c:forEach>
					</c:if>  
					<c:if test="${loginIdx != club.member_idx}">
						<a onclick="reportPop('club_report','${club.club_idx}')" style="font-size: 13; cursor: pointer;">신고<img src="/images/siren.png" alt="siren" style="width: 28; height: 28; margin-top:-5;"></a>
					</c:if>
				</th>
			</tr>
			
		</table>
		<br/><br/>
		<div class="subscribe-content" style="align-items: center;">
			<div style="display: flex; width: 100%;align-items: center;">
				<div style="width: 10%;"></div>
				<textarea id="reply_content" placeholder="댓글을 입력하세요." style="width: 80%; resize: none ;margin-bottom:0;"></textarea>
				<button onclick="clubReplyWrite()" class="btn-subscribe" style="width: 10%;" value="작성">
					<span>작성</span> 
					<i class="icon icon-send"></i>
				</button>
			</div> 
			<hr>
			<div id="list" style="position: relative; text-align:center;">
				
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

function reportPop(code,idx) {
	var code = code; //'bookReport_report':감상문,'club_report':모임,'reply_report':댓글,'review_report':리뷰,'book_report':도서
	var idx = idx; // 해당 idx
	var jsp = "clubDetail.jsp"; // 신고버튼 누른 페이지

	var width = 560;
    var height = 410;
    var left = window.innerWidth / 2 - width / 2;
    var top = window.innerHeight / 2 - height / 2;
    var popupWindow = window.open('reportPop.go?code='+code+'&idx='+idx+'&jsp='+jsp, 'pop', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
};

var showPage = 1;

$(document).ready(function() {	
	listCall(showPage);
});

var club_idx = ${club.club_idx};

function clubReplyWrite() {
    
    $.ajax({
        url: '/clubReplyWrite.ajax',
        type: 'post',
        data: {
        	'reply_content':document.getElementById("reply_content").value,
        	'club_idx':club_idx
        },
		dataType:'json',
		success: function(data) {
			console.log(data.success);
			if(data.success == 1){
				document.getElementById("reply_content").value = "";
				listCall(showPage);	
			}
        },
		error:function(e){
			console.log(e);
		}
    });
}

function clubReplyDelete(reply_idx) {
	
	if(confirm('정말 삭제하시겠습니까?')){
		$.ajax({
	        url: '/clubReplyDelete.ajax',
	        type: 'post',
	        data: {
	        	'reply_idx':reply_idx
	        },
			dataType:'json',
			success: function(data) {
				console.log(data.success);
				if(data.success == 1){
					listCall(showPage);	
				}
	        }
	    });
	}
    
    
}



function listCall(page){
	$.ajax({
		type:'post',
		url:'clubReplyList.ajax',
		data:{
			'page':page,
			'club_idx':club_idx
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
	  
	  content += '<table style="width:100%;">';
	  
	  list.forEach(function(item) {
	    content += '<tr>';
	    content += '<th style="width:10%;"></th>';
	    content += '<th style="width:10%;"><a onclick="profilePop('+item.member_idx+')" style="cursor: pointer;">'+item.member_nickname+'</a></th>';
	    content += '<th style="width:50%;">'+item.reply_content+'</th>';
	    content += '<th style="width:15%; text-align:right;">'+item.reg_date.split(" ")[0]+'</th>';
	    content += '<th style="width:15%;">';
	    if (${sessionScope.loginIdx} == item.member_idx) {
	      content += '<a onclick="showRe_ReplyForm(' + item.reply_idx + ')">답글 </a>/<a onclick="showEditForm(' + item.reply_idx + ')">수정 </a>/<a onclick="clubReplyDelete(' + item.reply_idx + ')"> 삭제</a>';
	    } else {
	      content += '<a onclick="showRe_ReplyForm(' + item.reply_idx + ')">답글 </a> / <a onclick="reportPop(\'reply_report\',\''+item.reply_idx+'\')" style=" cursor: pointer;">신고<img src="/images/siren.png" alt="siren" style="width: 28; height: 28; margin-top:-5;"></a>';
	    }
	    content += '</th>';
	    content += '</tr>';

	    content += '<tr id="editForm'+item.reply_idx+'" style="display: none;">'; // 입력 필드를 감싸는 행
	    content += '<th style="width:10%;"></th>';
	    content += '<th style="width:10%;"></th>';
	    content += '<th colspan="2">';
	    content += '<input style="width:100%;" type="text" value="' + item.reply_content + '">';
	    content += '</th>';
	    content += '<th style="width:15%;">'
	    content += '<button onclick="clubReplyUpdate('+item.reply_idx+')" class="btn-subscribe" style="width: 10%;" value="수정">';
	    content += '<span>수정</span> ';
	    content += '<i class="icon icon-send"></i>';
	    content += '</button>';
	    content += '</th>';
	    content += '</tr>';

	    content += '<tr id="re_ReplyForm'+item.reply_idx+'" style="display: none;">'; // 입력 필드를 감싸는 행
	    content += '<th style="width:10%;"></th>';
	    content += '<th style="width:10%;"></th>';
	    content += '<th colspan="2">';
	    content += '<input style="width:100%;" type="text" >';
	    content += '</th>';
	    content += '<th style="width:15%;">'
	    content += '<button onclick="clubReReply('+item.reply_idx+')" class="btn-subscribe" style="width: 10%;" value="수정">';
	    content += '<span>작성</span> ';
	    content += '<i class="icon icon-send"></i>';
	    content += '</button>';
	    content += '</th>';
	    content += '</tr>';

	    content += '<tr id="reReplyContent' + item.reply_idx + '">';
	    content += '<td colspan="5">'; // 전체 칼럼을 합침
	    content += '<div id="reReplyContentInner' + item.reply_idx + '"></div>'; // 리댓 내용을 출력할 내부 요소
	    content += '</td>';
	    content += '</tr>';

	    reReplyCall(item.reply_idx, function(replyContent) {
	      $('#reReplyContentInner' + item.reply_idx).html(replyContent); // 수정된 부분: 리댓 내용을 출력할 내부 요소에 추가
	    });

	  });

	  content += '</table>';
	  $('#list').empty();
	  $('#list').append(content);
	}

function reReplyCall(reply_idx, callback) {
	  console.log(reply_idx);
	  $.ajax({
	    type: 'post',
	    url: 'reReplyList.ajax',
	    data: {
	      'reply_idx': reply_idx
	    },
	    dataType: 'json',
	    success: function(data) {
	      
	     
	    	console.log(data);
	     	var replyContent = reReplyPrint(data.list);
	    	callback(replyContent);
	    }
	  });
	}

function reReplyPrint(replyList) {
	  var content = '';
	  replyList.forEach(function(reply) {
		  
		  
	    content += '<tr>';
	    content += '<th style="width:15%; text-align:right;">ㄴ</th>';
	    content += '<th style="width:10%;"><a onclick="profilePop('+reply.member_idx+')" style="cursor: pointer;">'+reply.member_nickname+'</a></th>';
	    content += '<th style="width:661px;">' + reply.reply_content + '</th>';
	    content += '<th style="width:15%; text-align:right;">' + reply.reg_date.split(" ")[0] + '</th>';
	    content += '<th style="width:10%;">';
	    if (${sessionScope.loginIdx} == reply.member_idx) {
	    	content += '<a onclick="showEditForm2(' + reply.reply_idx + ')">수정 </a>/<a onclick="clubReplyDelete(' + reply.reply_idx + ')"> 삭제</a>';
	    } else{
	    	content += '<a onclick="reportPop(\'reply_report\',\''+reply.reply_idx+'\')" style=" cursor: pointer;">신고<img src="/images/siren.png" alt="siren" style="width: 28; height: 28; margin-top:-5;"></a>';
	    }
	    content += '</th>';
	    content += '</tr>';
	    content += '<tr id="editForm'+reply.reply_idx+'" style="display: none;">'; // 입력 필드를 감싸는 행
	    //content += '<tr id="editForm' + reply.reply_idx + '" style="display: none;">'; 
	    content += '<th style="width:15%;"></th>';
	    content += '<th style="width:10%;"></th>';
	    content += '<th colspan="2">';
	    content += '<input style="width:100%;" type="text" value="' + reply.reply_content + '">';
	    content += '</th>';
	    content += '<th style="width:15%;">'
	    content += '<button onclick="clubReplyUpdate(' + reply.reply_idx + ')" class="btn-subscribe" style="width: 10%;" value="수정">';
	    content += '<span>수정</span> ';
	    content += '<i class="icon icon-send"></i>';
	    content += '</button>';
	    content += '</th>';
	    content += '</tr>';
	  });
	  return content;
	}



function showEditForm(replyIdx) {
    var editForm = document.getElementById('editForm' + replyIdx);
    var re_ReplyForm = document.getElementById('re_ReplyForm' + replyIdx);
    if (editForm.style.display === 'table-row') {
    	re_ReplyForm.style.display = 'none';
    	editForm.style.display = 'none';
	  } else {
		  re_ReplyForm.style.display = 'none';
		  editForm.style.display = 'table-row';
	  }
}

function showEditForm2(replyIdx) {
    var editForm = document.getElementById('editForm' + replyIdx);
    if (editForm.style.display === 'table-row') {
    	editForm.style.display = 'none';
	  } else {
		  editForm.style.display = 'table-row';
	  }
}


function showRe_ReplyForm(replyIdx) {
	var editForm = document.getElementById('editForm' + replyIdx);
   	var re_ReplyForm = document.getElementById('re_ReplyForm' + replyIdx);
	  if (re_ReplyForm.style.display === 'table-row') {
		  re_ReplyForm.style.display = 'none';
	    	editForm.style.display = 'none';
	  } else {
		  editForm.style.display = 'none';
	    re_ReplyForm.style.display = 'table-row';
	  }
	}



function clubReReply(reply_idx){
	var re_ReplyForm = document.getElementById('re_ReplyForm' + reply_idx);
	var inputField = re_ReplyForm.querySelector('input');
	var newContent = inputField.value;
	
	$.ajax({
        url: '/clubReReply.ajax',
        type: 'post',
        data: {
        	'reply_idx':reply_idx,
        	'reply_content':newContent,
        	'club_idx':club_idx
        },
		dataType:'json',
		success: function(data) {
			console.log(data.success);
			if(data.success == 1){
				listCall(showPage);	
				var temp = JSON.stringify("a");
				ws.send(temp);		
			}
        }
    });
	
}

function clubReplyUpdate(reply_idx){
	var editForm = document.getElementById('editForm' + reply_idx);
	var inputField = editForm.querySelector('input');
	var newContent = inputField.value;
	
	$.ajax({
        url: '/clubReplyUpdate.ajax',
        type: 'post',
        data: {
        	'reply_idx':reply_idx,
        	'reply_content':newContent
        },
		dataType:'json',
		success: function(data) {
			console.log(data.success);
			if(data.success == 1){
				listCall(showPage);	
			}
        }
    });
	
}
	
	
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}


function addMember(club_idx){
	
	window.open('/addMember.go?club_idx='+club_idx,'Infinity_Book','width=800px,height=600px');
	
}

var meetNum = ${club.meet_num};

var clubNum = ${club.club_num};
function clubUpdate(club_idx){  

	if(confirm('모집 종료시 신청은 자동으로 모두 거절 됩니다. \n 모집 종료하시겠습니까?')){
		if(meetNum>1){
			if(meetNum<=clubNum){
				location.href='/clubUpdate.do?club_idx='+club_idx;
			}else{
				alert('모집 확정 인원보다 참가 인원이 많습니다. ');
				return false;
			}
		}else{
			alert('참가 확정 인원이 2명 이상일때만 모집 종료가 가능합니다. ' );
			return false;
		}
		
	}else{
		return false;
	}
}

//onclick="location.href='/clubDelete.do?club_idx='+${club.club_idx}"
		
function clubDelete(club_idx){  

	if(confirm('모임 삭제시 모임 채팅방도 삭제되며 복구가 불가능 합니다.  \n 정말 삭제하시겠습니까?')){
		location.href='/clubDelete.do?club_idx='+club_idx;
	}else{
		return false;
	}
}

function deleteMem(member_idx,club_idx){
	if(confirm('해당 참가자를 삭제 하시겠습니까?')){
		location.href='/deleteMem.do?member_idx='+member_idx+'&club_idx='+club_idx;
	}else{
		return false;
	}
}




function clubApply(club_idx){  
	if(${sessionScope.loginIdx != null}){
		if(confirm('모임 신청시 취소가 불가능합니다. \n 정말 신청하시겠습니까?')){
				location.href='/clubApply.do?club_idx='+club_idx;
				
				var temp = JSON.stringify("a");
				ws.send(temp);		
		}
		
	}else{
		alert('모임 신청은 로그인 후 가능합니다. ');
		location.href='/login.go';
	}
	
}

function profilePop(member_idx) {
    var width = 1100;
     var height = 800;
     var left = window.innerWidth / 2 - width / 2;
     var top = window.innerHeight / 2 - height / 2;
     var popupWindow = window.open('profilePop.go?member_idx='+member_idx, 'pop', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
 };
</script>
</html>