<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<meta charset="UTF-8">
	<head>
	
		<!-- Datetimepicker 라이브러리 불러오기 -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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

		<!-- script
		================================================== -->
		<script src="/js/modernizr.js"></script>
	<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
	body,h3{
		font-family: 'IBM Plex Sans KR', serif;	
	}
	body{
		margin:30px;	
	}
	table{
		width: 100%;
		padding: 1%;
	}
	input[type="button"]{
		margin-left: 40%;
	}
	input[type="password"]{
		margin-bottom: 1%;
	}
	span{
		display: block;	
	}
	</style>
	</head>

<body>
	<table>
		<tr>
			<th>현재 비밀번호</th>
			<td>
				<input type="password" name="exPw" id="exPw"  placeholder="현재 비밀번호를 입력해주세요" style="width:95%; margin-top: 20px;">
				<span id="exPw_msg"></span>		
			</td>
		</tr>
		<tr>
			<th>새로운 비밀번호</th>
			<td>
				<input type="password" name="newPw" id="newPw"  placeholder="새로운 비밀번호를 입력해주세요" style="width:95%; margin-top: 20px;">
				<span id="pw_msg1"></span>		
			</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td>
				<input type="password" name="newPwChk" id="newPwChk"  placeholder="비밀번호를 확인해주세요" style="width:95%; margin-top: 20px;">
				<span id="pw_msg2"></span>
			</td>
		</tr>
		<tr>
			<th colspan="2"><input type=button value="변경" onclick="pwUpdate()"/></th>
		</tr>
	</table>
</body>
<script>

	var pweq = false;
	var newPweq = false;

	$('#exPw').on('keyup', function(e){
		 var exPw = $('#exPw').val();   

		 $.ajax({
		    type: 'post'
		    ,url: '/mypage/pwChk.ajax'
		    ,data:{'exPw':exPw}
		    ,dataType:'json'
		    ,success:function(data){
				console.log(data);							
				if(data.pwChk){        
			        $('#exPw_msg').css({'font-size': '10px','color': 'darkgreen'});
			  		$('#exPw_msg').html('비밀번호가 일치합니다.');     
					pweq = true;
					console.log(pweq);
			     }else {             
					$('#exPw_msg').css({'font-size': '10px','color': 'red'});
					$('#exPw_msg').html('비밀번호가 틀립니다.');
			    }
		    }
		    ,error:function(e){
		       console.log(e);
		    }
		 });     	
	});
	
	

	$('#newPw').on('keyup',function(e){
		console.log(pweq);
		
		if($('#exPw').val()==''){
			  alert('현재 비밀번호를 입력해 주세요!');   
			  $('#newPw').val('');
			  $('#exPw').focus();      
		} else if(pweq != true){
			  alert('현재 비밀번호를 확인해주세요!');   
			  $('#newPw').val('');
			  $('#exPw').focus();      
		} else if($('#newPw').val().length <=7){
			  $('#pw_msg1').css({'font-size': '10px','color': 'red'});
		      $('#pw_msg1').html('비밀번호를 8자리 이상 입력해주세요');
		} else if (!/[!@#$%^&*]/.test($('#newPw').val())) {
			  $('#pw_msg1').css({'font-size': '10px','color': 'red'});
			  $('#pw_msg1').html('특수문자를 포함해야 합니다<br>사용가능한 특수문자 : ‘!, @, #, $, %, ^, &, *’');
			  $('#newPw').focus();
		} else{
		$('#pw_msg1').css({'font-size': '10px','color': 'darkgreen'});
		$('#pw_msg1').html('사용가능한 비밀번호 입니다');
		}
	});
	
	function newPwChk(){
		if($('#exPw').val()==''){
			  alert('현재 비밀번호를 입력해 주세요!');   
			  $('#newPwChk').val('');
			  $('#exPw').focus();      
		} else if($('#newPw').val()==''){
			  alert('새로운 비밀번호를 입력해 주세요!');   
			  $('#newPwChk').val('');
			  $('#newPw').focus();      
		} else if($('#newPwChk').val() == $('#newPw').val()){
			$('#pw_msg2').css({'font-size': '10px','color': 'darkgreen'});
			$('#pw_msg2').html('비밀번호가 일치 합니다.');
			newPweq = true;
		}else{		  
			$('#pw_msg2').css({'font-size':'10px','color': 'red'});
			$('#pw_msg2').html('비밀번호가 일치 하지 않습니다');
		}	
	}
	
	$('#newPwChk').on('keyup',function(e){
		newPwChk();
	});
	
	function pwUpdate(){
		
	  var $newPw = $('#newPw');	 
	  console.log(pweq,newPweq);

	  newPweq = false;
	  newPwChk();
	  
	  if(newPweq){

		  if($newPw.val()==''){
			  alert('비밀번호를 입력해 주세요!');      
			  $newPw.focus();      
		  } else if($newPw.val().length <= 7){
			  alert('비밀번호는 8자리 이상 입력해 주세요!');
			  $newPw.focus();
		  } else if(pweq && newPweq){
			  $.ajax({
				  url: '/mypage/pwUpdate.ajax',
				  type: 'post',
				  data: {
					  'newPw' : document.getElementById("newPw").value
				  },
				  dataType: 'json',
				  success: function(data){
				 		console.log(data);
				    if(data.success == 1){      	
				      alert('비밀번호가 변경되었습니다.');
				      window.close(); 
				    } else{
				      console.log('실패');
				      alert('실패했습니다. 다시 시도해주세요');            
				    }
				  },
				  error: function(e){
				    console.log(e);
				  }
				});
			}
		}	  
	}
	
</script>
</html>