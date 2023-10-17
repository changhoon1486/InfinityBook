var ws = new WebSocket("ws://" + location.host + "/chat");	

alarmchk();

ws.onmessage = function(msg) {
console.log(msg);
	if(msg.data == "\"a\""){
		console.log("들어와?");
		setTimeout(alarmchk, 1000); // 1초 후에 alarmchk() 함수를 실행
	}  		  
}

var data = {};//전송 데이터(JSON)





function alarm_send(){			

	var temp = JSON.stringify("a");
	ws.send(temp);			
}


function alarmchk(){
	
	console.log('들와?');

		$.ajax({
			url:"/alarmchk.ajax",
			method:"GET",
			data:{
			},
			success:function(data){
				if(data > 0){
					$('.alarm').html(data);
					$('.alarm').css('display', 'block');
				}
				
			},
			error : function() {

			}
		});
}	 
