<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#alarmlist{
		position: absolute;
		z-index: 9999;	 
		right: 5px;
		top: 45px;
		width: 300px;
        background-color: white;
        border: 1px solid #f7f7f7;
  		border-radius: 15px;     
	}
	.alarm{
		position: absolute;
		color: white;
		font-size: 5px;
		background-color: red;
  		border-radius: 50%; /* 동그라미 모양 설정 */
  		left: 1376px;
  		width: 15px; /* 동그라미의 너비 */
  		height: 15px;
  		text-align: center;
  		line-height: 15px;
  		display: none;
  		bottom: 18px;  		
	}
</style>
<div id="login"></div>
<div id="alarmlist" style="height: 400px; overflow: auto; overflow-x: auto; display:none;"></div>
<script src='/js/alarm.js'></script>
<script>
    var content = "<div class='top-content'>";
    content += "<div class='container'>";
    content += "<div class='row'>";
    content += "<div class='col-md-12'>";
    content += "<div class='right-element'>";
		
    if(${sessionScope.loginGrade}){
    	content += "<a href='/admin/adminMain' style='color: red;'>[관리자 페이지]&nbsp;&nbsp;</a>";	
    }
   
   
    content += "반가워요 <b>${sessionScope.loginNickname}</b>님! <a href='/logout.do' style='color: blue;'>[로그아웃]</a>&nbsp;&nbsp;&nbsp;&nbsp;";

    content += "<a href='/message_list.go'>💬 채팅</a>&nbsp;&nbsp;&nbsp;&nbsp;";
    content += "<a onclick='alarm_list()' style='cursor: pointer;'>🔔알림 <span class='alarm'></span></a>";
    content += "</div><!--top-right-->";
    content += "</div>";
    content += "</div>";
    content += "</div>";
    content += "</div>";
    $("#login").html(content);
    
    function alarm_list(){    	
	var alarmlist = document.getElementById("alarmlist");    	    	
    	$.ajax({
    		url:"/alarm.ajax",
    		method:"get",
    		data:{
    		},
    		success:function(data){ 		
    			$('#alarmlist').html(data);

    			$('.alarm').html('');
				$('.alarm').css('display', 'none');
    			
	    		    if (alarmlist.style.display === "none") {
	    		        alarmlist.style.display = "block";
	    		        
	    		    } else {
	    		        alarmlist.style.display = "none";
	    		    }
			
    			}
    	});
    }
    
    function alarmdel_all(){
    	var alarmlist = document.getElementById("alarmlist");
    	// 알람 전체 삭제
    	$.ajax({
    		url:"/alarmdel_all.ajax",
    		method:"get",
    		data:{
    		},
    		success:function(data){
    			
    		    if (alarmlist.style.display === "none") {
    		        alarmlist.style.display = "block";
    		        
    		    } else {
    		        alarmlist.style.display = "none";
    		    }
 			
    			}
    	});
    }
    

    
</script>
