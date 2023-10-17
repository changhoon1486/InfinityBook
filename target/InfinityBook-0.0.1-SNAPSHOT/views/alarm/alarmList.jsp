<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${alarmlist.list.size() > 0}">
	<button onclick="alarmdel_all()" style="width: 100%; height: 45px; margin-top: 0px;">알림 전체 삭제</button>
<c:forEach var="tmp" items="${alarmlist.list}">
		<div class="alarm_list" type="button" code="${tmp.code_idx}" idx="${tmp.idx}" style="text-overflow: ellipsis;">
		<c:if test="${tmp.code_idx >= 69 && tmp.code_idx <= 73}">		
				<span style="font-size:15px; color: black;">${tmp.alarm_content}</span>
				<br/>						
				<span style="font-size:13px; color: black;">${tmp.alarm_date}</span>
				<span class="del" idx="${tmp.alarm_idx}"style="cursor: pointer; float: right; margin-right: 10px;font-size: 20px;">🗑</span>			
		</c:if>
		<c:if test="${tmp.code_idx <=69 || tmp.code_idx >=73}">
			<a href="/alarmdetail.go?code_idx=${tmp.code_idx}&idx=${tmp.idx}">
				<span style="font-size:15px; color: black;">${tmp.alarm_content}</span>
				<br/>						
				<span style="font-size:13px; color: black;">${tmp.alarm_date}</span>
			</a>									
			<span class="del" idx="${tmp.alarm_idx}"style="cursor: pointer; float: right; margin-right: 10px;font-size: 20px;">🗑</span>
		</c:if>
						
		</div>
	</c:forEach>		
</c:if>

<c:if test="${empty alarmlist.list}">

<!-- <div style="width: 50px; height: 50px; border-radius: 50%; position: relative; left:43%; top:30%"></div> -->
<div style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); font-size: 30px; text-align: center;">🔔</div>
<div style="font-size: 15px; text-align: center; margin-top: 60%;">새로운 알림이 없습니다.</div>

		
</c:if>

<script>
$('.del').on('click', function(){
	 
	var alarm_idx = $(this).attr('idx');
	console.log(alarm_idx);
	var alarmItem = $(this).closest('.alarm_list'); // 삭제할 아이템의 부모 요소를 선택
	// 알람 전체 삭제
	$.ajax({
		url:"/alarmdel.ajax",
		method:"get",
		data:{
			alarm_idx : alarm_idx 
		},
		success:function(data){
			console.log("알림 지우기 성공");    
			alarm_list();
			alarm_list();

			}
	});
});

function alarm_list(){    	
	var alarmlist = document.getElementById("alarmlist");    	    	
    	$.ajax({
    		url:"/alarm.ajax",
    		method:"get",
    		data:{
    		},
    		success:function(data){
    			console.log("알림가져오기 성공");    		
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

</script>