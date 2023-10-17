 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>
<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>


<!DOCTYPE html>
<html>
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
<!-- CSS File -->
<link href="css/message_list.css" rel="stylesheet">

<!-- 메세지 전송 아이콘(종이비행기) 때문에 필요 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>
<style>

@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
h4{
   font-family: 'IBM Plex Sans KR';   
   font-weight: 600;
   margin: 10 0 0 0;
}


  input[type='file'] {
    width: 0.1px;
    height: 0.1px;
    opacity: 0;
    overflow: hidden;
    position: absolute;
    z-index: -1;
  }

  input[type='file'] + label {
    display: inline-block;
    padding: 10px;
    border: none;
    border-radius: 0;
    cursor: pointer;
    background: none;
  }

  input[type='file'] + label:before {
    content: '+';
    display: block;
    text-align: center;
    font-size: 36px;
    line-height: 1;
    color: #999;
  }

  input[type='file'] + label:hover {
    background-color: #e9e9e9;
  }

  input[type='file']:focus + label,
  input[type='file'] + label:focus {
    outline: none;
  }

  #fileName {
    display: none; /* 파일명을 숨김 */
  }
  
  .msg_send_btn {
  display: flex;
  align-items: center;
  justify-content: center;
}

  
</style>
</head>
<script>		
var code_idx = '';
var room = '';
var library = '';
var apply_user = '';
var other = '';
// 가장 처음 메세지 리스트를 가져온다.
function FirstMessageList() {
  return new Promise(function(resolve, reject) {
    $.ajax({
      url: "/message_list.ajax",
      method: "get",
      data: {},
      success: function(data) {
        $('.inbox_chat').html(data);
        $('.chat_list').on('click', function() {
          code_idx = $(this).attr('code');
          room = $(this).attr('room');
          library = $(this).attr('library');
          apply_user = $(this).attr('apply-user');
          other = $(this).attr('other');
          
          
          console.log(code_idx);
          console.log(room);
          console.log(library);
          console.log(apply_user);
          console.log(other);
          
          
          
          MessageContentList(code_idx, room, library, apply_user);
          Messagebook(code_idx, room, library, apply_user);
          $('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);
          $('.chat_list').not($(this)).removeClass('active_chat');
          $(this).addClass('active_chat');
          let send_msg = "";
          send_msg += "<div class='type_msg'>";
          send_msg += "	<div class='input_msg_write row'>";
          send_msg += "		<div class='col-11'>";
          send_msg += "			<input type='file' id='fileInput' name='photo'/>";
          send_msg += "			<label for='fileInput'></label>";
          send_msg += "			<p id='fileName'></p>";
          send_msg += "			<input type='text' class='write_msg' placeholder='메세지를 입력...' style='width:705px;'/>";
          send_msg += "		</div>";
          send_msg += "		<div class='col-1'>";
          send_msg += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
          send_msg += "		</div>";
          send_msg += "	</div>";
          send_msg += "</div>";
          $('.send_message').html(send_msg);
          $('.write_msg').on('keyup', function(ev) {
            if (ev.keyCode == 13) {
              SendMessage(code_idx, room);
              $('.chat_list:first').addClass('active_chat');
            }
          });
          $('.msg_send_btn').on('click', function() {
            SendMessage(code_idx, room);
          });
          $('#fileInput').on('change', function(event) {
            SendPhoto(code_idx, room, event.target.files[0]);
          });
        });
        resolve();
      },
      error: function(error) {
        reject(error);
      }
    });
  });
}
const Messagebook = function(code_idx,room,library,apply_user){
	
		$('.mmgs').html("");
		$('.library').html("");
	
	if(code_idx == 4){
		
		$.ajax({
			url:"/message_clubdetail.ajax",
			method:"GET",
			data:{
				code_idx : code_idx,
				idx : room	
			},							
			datatype: 'json',
			success:function(data){
											
				let book = '<div style="display: flex;">';
				book += '<img src="' + data.cover + '" style="width: 80px; height: 90px; margin-right: 10px;"/>';
				book += '<div class="library" style="width:660px;">';
				book += '<div style="width:500px; font-weight: 600;">' + data.club_name + '</div>';
				book += '<div style="font-size: 11px; font-weight: 600;">' + data.nicknames + '</div>';
				book += '</div>';
				book += '</div>';
				
				$('.mmgs').html(book);
				
				var outbutton = '<button class="chatout" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">나가기</button>';		
				
				$('.library').html($('.library').html() + outbutton);
				
				// 나가기 버튼 클릭시	 													
				$('.chatout').on('click',function(){							
					
					$.ajax({
						url: "/chatout.ajax",
						method:"GET",
						data:{
							code_idx : code_idx,
							room : room,
							library : library,
							apply_user :  apply_user
						},
						datatype: 'json',
						success:function(data){														
																																																								
							if(data == 1){
								alert('현재 약속 수락대기 상태입니다. \r\n약속 취소 후 시도해주세요.');
								
							}else if(data == 2){
								alert('현재 예약중인 상태입니다. \r\n약속 취소 후 시도해주세요.');
								
							}else if(data == 3){
								alert('현재 대여중인 상태입니다. \r\n책을 돌려받거나 돌려준 후 가능합니다.');
								
							}else{
								// 해당 채팅내역, 책 정보, 메세지 전송칸 지우기
								$('.msg_history').html("");
								$('.mmgs').html("");
								$('.send_message').html("");																					
								// 메세지 리스트 리로드
								FirstMessageList();
								
								alert('채팅방을 나갔습니다.');
							}						
						},error : function(e){
							console.log(e);
						}
					});											 
				});// 나가기 끝
			}			
		});			
	}else if (code_idx != 4){		
	
		$.ajax({
			url:"/message_librarydetail.ajax",
			method:"GET",
			data:{library : library},							
			datatype: 'json',
			success:function(data){
											
				let book = '<div style="display: flex;">';
				book += '<img src="' + data.library_cover + '" style="width: 80px; height: 90px; margin-right: 10px;"/>';
				book += '<div class="library" style="width:660px;">';
				book += '<div style="font-weight: 600;">' + data.library_title + '</div>';
				book += '<div style="font-size: 11px; font-weight: 600;">' + data.library_info + '</div>';
				book += '</div>';
				book += '</div>';
				
				$('.mmgs').html(book);
				
				
				// 상품에 대한 상태정보
				$.ajax({
					url: "/total_state.ajax",
					method:"GET",
					data:{
						code_idx : code_idx,
						room : room,
						library : library
					},
					datatype: 'json',
					success:function(data){
						
						var chkbutton = '';
						// 책 정보의 상태에 따라 다르게 표시
						if(data.librarystate == 1 && data.rentck > 0 && data.rentstate == 0){
							chkbutton ='<div style="font-weight: 600;">현재 다름사람에게 대여 중인 책입니다.</div>';
							chkbutton +='<button class="chatout" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px" >나가기</button>';
						}else if(data.rentstate == 1 && ${sessionScope.loginIdx} != apply_user){						
							chkbutton ='<div style="font-weight: 600;">현재 상대방의 의사를 기다리고 있어요!</div>';
						}else if(data.rentstate == 2 && ${sessionScope.loginIdx} != apply_user){
							chkbutton ='<button class="rentend" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">확인</button>';
							chkbutton +='<div style="float: right; margin-right: 5px; font-weight: 600;">대여 후 책을 돌려받으신 다음 확인을 눌러 주세요!</div>';							
						}else if(data.rentstate == 3 && ${sessionScope.loginIdx} != apply_user){
							chkbutton ='<button class="chatout" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">나가기</button>';
							if(data.userreview == 0){
								chkbutton +='<button onclick="reviewPop(0)" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">유저 후기 작성</button>';	
							}
																					
						}else if(!data.librarystate && data.rentck > 0 && data.rentstate == 0 || data.chgck > 0 && data.changestate == 0){
							chkbutton ='<div>현재 다른사람과 약속이 잡힌 책입니다.</div>';
							chkbutton +='<button class="chatout" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">나가기</button>';
						}else if(!data.librarystate && data.rentck == 0 && data.rentstate == 0 && ${sessionScope.loginIdx} != apply_user  || data.chgck == 0 && data.changestate == 0 && ${sessionScope.loginIdx} != apply_user){
							chkbutton ='<button class="chatout" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">나가기</button>';
							chkbutton +='<button class="reservation" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">약속 잡기</button>';						
						}else if(data.rentstate == 1 && ${sessionScope.loginIdx} == apply_user || data.changestate == 1 && ${sessionScope.loginIdx} == apply_user){
							chkbutton ='<button class="chatout" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">나가기</button>';
							chkbutton +='<button class="reservationno" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">약속 거절</button>';
							chkbutton +='<button class="reservationok" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">약속 승인</button>';												
						}else if(data.rentstate == 2 && ${sessionScope.loginIdx} == apply_user || data.changestate == 2 && ${sessionScope.loginIdx} != apply_user){						
							chkbutton +='<div style="float: right; margin-right: 5px; font-weight: 600;">대여자가 대여 후 책을 돌려받았는지 확인 중입니다.</div>';
						}else if(data.rentstate == 3 && ${sessionScope.loginIdx} == apply_user || data.changestate == 3 && ${sessionScope.loginIdx} != apply_user){
							chkbutton ='<button class="chatout" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">나가기</button>';
							if(data.userreview == 0){
								chkbutton +='<button onclick="reviewPop(0)" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">유저 후기 작성</button>';	
							}
							if(data.bookreview == 0){
								chkbutton +='<button onclick="reviewPop(1)" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">책 후기 작성</button>';	
							}							
						}else{
							chkbutton ='<button class="chatout" style="float: right; font-size:10px; height: 25px; margin-right: 5px; border-radius: 10px">나가기</button>';
						}
						
						$('.library').html($('.library').html() + chkbutton);					
						// 약속 잡기 클릭 시
						$('.reservation').on('click',function(){
	
							openPopup()
	
							function openPopup() {
							    var screenWidth = window.screen.availWidth;
							    var screenHeight = window.screen.availHeight;
							    var popupWidth = 500;
							    var popupHeight = 850;
							    var left = (screenWidth - popupWidth) / 2;
							    var top = (screenHeight - popupHeight) / 2;    
	
							    window.open('reservation.go?code_idx='+code_idx+'&idx='+room, '약속 잡기',  'width=500, height=500, left=' + left + ', top=' + top);
							}
	
						});
						
						// 수락 버튼 클릭 시
						$('.reservationok').on('click',function(){																	
							
							$.ajax({
								url: "/reservationok.ajax",
								method:"GET",
								data:{
									code_idx : code_idx,
									room : room,
									library : library
								},
								datatype: 'json',
								success:function(data){
									
									// 책 상태 다시 불러오기
									Messagebook(code_idx,room,library,apply_user);
																													
									if(data == 1){													
										alert('보증금이 부족합니다.');																										
									}else if(data == 2){
										alert('약속을 수락했습니다.');	
									}																																			
								},error : function(e){
									console.log(e);
								}
							});
							
						});
						
						// 거절 버튼 클릭 시
						$('.reservationno').on('click',function(){																							 
							
							$.ajax({
								url: "/reservationno.ajax",
								method:"GET",
								data:{
									code_idx : code_idx,
									room : room,
									library : library
								},
								datatype: 'json',
								success:function(data){																						
									
									if(data > 0){
										// 책 상태 다시 불러오기
										Messagebook(code_idx,room,library,apply_user);
										
										alert('약속 취소 했습니다.');
									}							
								},error : function(e){
									console.log(e);
								}
							});						
						});
						
						// 확인 버튼 클릭 시
						$('.rentend').on('click',function(){
							
							$.ajax({
								url: "/rentend.ajax",
								method:"GET",
								data:{
									code_idx : code_idx,
									room : room,
									library : library,
									apply_user : apply_user
								},
								datatype: 'json',
								success:function(data){
									// 책 상태 다시 불러오기
									Messagebook(code_idx,room,library,apply_user);																								
									
							
								},error : function(e){
									console.log(e);
								}
							});
							
						});
						
						
						// 유저 후기 작성 버튼 클릭 시
						$('.mreview').on('click',function(){
							location.href='/Review.go';
							
						});
						
						// 책 후기 작성 버튼 클릭 시
						$('.breview').on('click',function(){
							
							
						});
						
						
						// 나가기 버튼 클릭 시	 													
						$('.chatout').on('click',function(){							
							
							$.ajax({
								url: "/chatout.ajax",
								method:"GET",
								data:{
									code_idx : code_idx,
									room : room,
									library : library,
									apply_user :  apply_user
								},
								datatype: 'json',
								success:function(data){																	
																																																										
									if(data == 1){
										alert('현재 약속 수락대기 상태입니다. \r\n약속 취소 후 시도해주세요.');
										
									}else if(data == 2){
										alert('현재 예약중인 상태입니다. \r\n약속 취소 후 시도해주세요.');
										
									}else if(data == 3){
										alert('현재 대여중인 상태입니다. \r\n책을 돌려받거나 돌려준 후 가능합니다.');
										
									}else{
										// 해당 채팅내역, 책 정보, 메세지 전송칸 지우기
										$('.msg_history').html("");
										$('.mmgs').html("");
										$('.send_message').html("");																					
										// 메세지 리스트 리로드
										FirstMessageList();
										
										alert('채팅방을 나갔습니다.');
									}						
								},error : function(e){
									console.log(e);
								}
							});											 
						});// 나가기 끝														
					},error : function(){// 책불러오기 성공 후
						alert('에러');
					}
				});// 상태 불러오기 후							
			},error : function(){// 상태 불러오기 성공 후
				alert('서버 에러');
			}		
		});
	}
}
	
// 메세지 내용을 가져온다.
const MessageContentList = function(code_idx,room,library,apply_user) {
	
	$.ajax({
		url:"/message_content_list.ajax",
		method:"GET",
		data:{
			code_idx : code_idx,
			room : room
		},
		success:function(data){
			
			// 메세지 내용을 html에 넣는다
			$('.msg_history').html(data);
			$('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);
										
		},
		error : function() {
		}
	});


}
	
// 메세지 사진 전송	
const SendPhoto = function(code_idx,room, photo){
   
	var extidx = photo.name.lastIndexOf(".");	  
	var ext = photo.name.slice(extidx + 1).toLowerCase();
	
	if(ext != 'jpg' && ext !='png' && ext !='gif'){
		alert('확장자가 jpg,png,gif 인 파일만 전송 할 수 있습니다.');
	}else if(photo.size >= 50000000){
		alert('사이즈가 50MB 이하인 파일만 전송 할 수 있습니다.');
	}else{
		
		var formData = new FormData(); // FormData 객체 생성
	    formData.append('photo', photo); // 파일 추가
	    formData.append('code_idx', code_idx); // 나머지 필드 추가
	    formData.append('idx', room); // 나머지 필드 추가other_nick
	    
		$.ajax({
		      type: 'post',
		      url: '/chatphoto.ajax',
			  data: formData,							     
		      processData: false, // 데이터를 처리하지 않음
		      contentType: false, // 컨텐츠 타입을 설정하지 않음
		      success: function (data) {
		    	  
		    	// 웹소캣으로 실시간 전달
				send(code_idx,room,data);
		    	
				// 메세지 내용  리로드
				MessageContentList(code_idx,room,library,apply_user);
									
				// 메세지 리스트 리로드
				FirstMessageList();
	
		      },
		      error: function (e) {
		        console.log(e);
		      }
		    });
	}
};
	
// 메세지를 전송하는 함수
const SendMessage = function(code_idx,room){
	
	let content = $('.write_msg').val();

	content = content.trim();
	
	if(content == ""){
		alert("메세지를 입력하세요!");
	}else{
		$.ajax({
			url:"message_send_inlist.ajax",
			method:"GET",
			data:{
				code_idx : code_idx,
				room : room,
				content: content
			},
			success:function(data){
				
				// 웹소캣으로 실시간 전달
				send(code_idx,room,content);		
				// 메세지 입력칸 비우기
				$('.write_msg').val("");
				
				// 메세지 내용  리로드
				MessageContentList(code_idx,room,library,apply_user);
									
				// 메세지 리스트 리로드
				//FirstMessageList();	
				
				// 대화방 정보업데이트
				//Messagebook(code_idx,room,library,apply_user);
			},
			error : function() {
				alert('서버 에러');
			}
		});
	}	
};	

function getId(id){
	return document.getElementById(id);
}
	
function getName(name){
	return document.getElementsByClassName(name);
}
	
var data = {};//전송 데이터(JSON)

var ws ;
var btnSend = getName('btnSend');
var chat = getName('chat_list');
var msg = getName('write_msg');

var ws = new WebSocket("ws://" + location.host + "/chat");	

	ws.onmessage = function(msg) {
		
		var receivedData = JSON.parse(msg.data);	
		
	  // 받은 메세지가 
	  // 사진을 받았을 시 ext != 'jpg' && ext !='png' && ext !='gif'
	  if (code_idx == receivedData.code && room == receivedData.room && receivedData.content.startsWith('/upload/') && receivedData.content.endsWith('jpg') || code_idx == receivedData.code && room == receivedData.room && receivedData.content.startsWith('/upload/') && receivedData.content.endsWith('png') || code_idx == receivedData.code && room == receivedData.room && receivedData.content.startsWith('/upload/') && receivedData.content.endsWith('gif')) {
		  if(receivedData.send_nickname != "${sessionScope.loginNickname}"){
	      	let img = '<div class="incoming_msg"><div class="received_withd_msg"><span>'+receivedData.send_nickname+'</span><image src="'+receivedData.content+'"width="auto" height="auto"/><span class="time_date">'+receivedData.date+'</span></div></div>';
	      	
			  $('.msg_history').html($('.msg_history').html() + img);

			  $('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);
			  $('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);
		  }
		

			ox();
		  
		// 대화방 정보업데이트
		Messagebook(code_idx,room,library,apply_user);
		  		  			  		    
	  }else if(code_idx == receivedData.code && room == receivedData.room){
		  if(receivedData.send_nickname != "${sessionScope.loginNickname}"){
				// 그냥 메세지일시 
				let chat = '<div class="incoming_msg"><div class="received_withd_msg"><span>'+receivedData.send_nickname+'</span><p>'+receivedData.content+'</p><span class="time_date">'+receivedData.date+'</span></div></div>';
			
				$('.msg_history').html($('.msg_history').html() + chat);
	
				$('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);
				$('.msg_history').scrollTop($('.msg_history')[0].scrollHeight);
		  }
		ox();
		  

		// 대화방 정보업데이트
		Messagebook(code_idx,room,library,apply_user);
		
	  }else {
		  // 현재 열린 대화방이 아닌 곳에서 대화 중일경우		  
			ox();	
		  		  
	  }	 
}
async function ox() {
	try {
		await FirstMessageList();

	    $('.chat_list[code="'+code_idx+'"][room="'+room+'"]').addClass('active_chat');
	    $('.chat_list').not($('.chat_list[code="'+code_idx+'"][room="'+room+'"]')).removeClass('active_chat');
	} catch (error) {
		console.error('Error:', error);
	}
}

Date.prototype.toLocaleString = function() {
    var formattedDate = this.getFullYear() + "-" +
                        ("0" + (this.getMonth() + 1)).slice(-2) + "-" +
                        ("0" + this.getDate()).slice(-2) + " " +
                        ("0" + this.getHours()).slice(-2) + ":" +
                        ("0" + this.getMinutes()).slice(-2) + ":" +
                        ("0" + this.getSeconds()).slice(-2);

    return formattedDate;
};
	
function profilePop(member_idx) {
	var width = 1100;
    var height = 800;
    var left = window.innerWidth / 2 - width / 2;
    var top = window.innerHeight / 2 - height / 2;
    var popupWindow = window.open('/profilePop.go?member_idx='+member_idx, 'pop', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
};

function reviewPop(type){	
	var width = 1100;
    var height = 800;
    var left = window.innerWidth / 2 - width / 2;
    var top = window.innerHeight / 2 - height / 2;
    
	var popupWindow = window.open('/Review.go?review_type='+type+'&review_transaction_type='+code_idx+'&review_tracnsaction_idx='+room+'&book_reciever='+library+'&member_reciever='+other, 'pop', 'width=' + width + 'px,height=' + height + 'px,left=' + left + 'px,top=' + top + 'px');
	
}
	  
function send(code_idx,room,content){			
	data.	code =  code_idx;
	data.	room =  room;
	data.send_nickname = '${sessionScope.loginNickname}';
	data.content = content;
	data.date = new Date().toLocaleString();
	var temp = JSON.stringify(data);
	ws.send(temp);			
}
	
$(document).ready(function(){
	
	FirstMessageList();
	
});	
</script>
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
								<li class="menu-item active"><a href="#home">대여/교환</a></li>
								<li class="menu-item"><a href="/BookReportList.go" class="nav-link">감상문</a></li>
								<li class="menu-item"><a href="/clubList.go" class="nav-link">독서모임</a></li>
								<li class="menu-item"><a href="/noticelist.go" class="nav-link">공지사항</a></li>								
								<li class="menu-item"><a href="/mypage/libraryList.get" class="nav-link">마이페이지</a></li>
							</ul>
						</div>
					</nav>

				</div>

			</div>
		</div>
	</header>
</div>
	<br />


	<div class="msg-container">
	
		<div class="messaging">
	      <div class="inbox_msg">
	      	<!-- 메세지 목록 영역 -->
	        <div class="inbox_people">
	          <div class="headind_srch">	         
	            <div class="recent_heading">
	              <h4>List</h4>
	            </div>           
	          </div>
	          
	          <!-- 메세지 리스트 -->
	          <div class="inbox_chat">		          
	          </div>
	        </div>	        
	        <!-- 메세지 내용 영역 -->	       
	        <div class="mesgs">
				<!-- 책 정보,나가기 버튼 영역 -->
				<div class="mmgs">
				</div>
				<!-- 메세지 내용 목록 -->
				<div class="msg_history" name="contentList" id="ch">
				<!-- 메세지 내용이 올 자리 -->
				</div>
				<div class="send_message" style="height:200px; width:745px; margin-left: 15px;">
				<!-- 메세지 입력란이 올자리 -->
				</div>				
			</div>
	      </div>	      
	    </div>
	</div>
	
	
	<div id="footer-bottom" style="margin-top:10%">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<div class="copyright">
					<div class="row">

						<div class="col-md-12" style="margin-top: 5%;">
							<p>Â© 2022 All rights reserved. Free HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
						</div>

						

					</div>
				</div><!--grid-->

			</div><!--footer-bottom-content-->
		</div>
	</div>
</div>
</body>
</html>