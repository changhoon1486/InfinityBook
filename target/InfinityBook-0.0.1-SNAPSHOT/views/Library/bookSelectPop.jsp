<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
      
      </style>   
   </head>

<body style="margin:30px;">
   <section class="hero-section jarallax">
   
   <div class="container">
      <div class="row">
         <div class="section-header align-center">
            <h2 class="section-title">Library</h2>
         </div>
      </div>
   </div>
</section>
   <form onsubmit="event.preventDefault(); call();" class="search-box" style="text-align:center;" id="form">
      
      <input type="hidden" name=start value="1">
      <i class="icon icon-search"></i> 
      <input id="text" name="text" autocomplete='off' class="search-field text search-input" placeholder="제목 또는 글쓴이를 입력해주세요" type="search">
      <input type="button" onclick="call()" value="검색">
   </form>
   <table>
     <tbody id="list">
     
     </tbody>
     <tr>
       <th colspan="3" id="paging" >
         <div class="container" style="text-align:center; width: 600px;">
           <hr/>
           <nav aria-label="Page navigation"  style="text-align:center; width: 500px;">
             <ul class="pagination justify-content-center" id="pagination"></ul>
           </nav>
         </div>
       </th>
     </tr>
   </table>



   
</body>

<script>

var showPage = 1;
var text = '';

function call() {
   text=$('#text').val();
   listCall(showPage,text);
}


function listCall(page,text){
      $.ajax({
         type:'get',
         url:'/mypage/bookSearch.ajax',
         data:{
            'text':text,
            'start':page
         },
         dataType:'json',           
         success:function(data){
            console.log(data);
            listPrint(data);
                       
            $('#pagination').twbsPagination({
            startPage:1, // 시작 페이지
            totalPages:data.length/10+1,// 총 페이지 수 
            visiblePages:5,// 보여줄 페이지
            onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
               console.log(page,showPage);
               if(page != showPage){
                  showPage=page;
                  listCall(page,text);
                  
               }
            }
            });
         }
      });
   }

   function listPrint(list){
      var content ='';
      
      list.forEach(function(item,idx){
         
         content += '  <tr>';
         content += '    <td>';
         content += '      <img src="' + item.image + '" style="width:200px; height:200px;" alt="Books" class="product-item">';
         content += '    </td>';
         content += '    <td>';
         content += '      <div class="item-price" style="width:400px;">' + item.title + '</div>';
         content += '      <div class="item-price">' + item.author + '</div>';
         content += '      <div class="item-price">' + item.publisher + '</div>';
         content += '      <div class="item-price">' + item.pubdate + '</div>';
         content += '    </td>';
         content += '    <td>';
         content += '      <form  method="post" name="bookForm">';
         content += '            <input type="hidden" name="library_title" id="library_title" value="' + item.title + '">';
         content += '            <input type="hidden" name="library_author" id="library_author" value="' + item.author + '">';
         content += '            <input type="hidden" name="library_publisher" id="library_publisher" value="' + item.publisher + '">';
         content += '            <input type="hidden" name="library_cover" id="library_cover" value="' + item.image + '">';
         content += '            <input type="hidden" name="library_price" id="library_price"  value="' + item.discount + '">';
         content += '            <input type="hidden" name="library_isbn" id="library_isbn"  value="' + item.isbn + '">';
         content += '            <input type="hidden" name="library_pubdate"  id="library_pubdate" value="' + item.pubdate + '">';
         content += '            <input type="hidden" name="library_description"  id="library_description" value="' + item.description + '">';
         content += '         <input type="submit" formaction="/mypage/libraryWrite.go" value="등록"><br/>';
         content += '      <input type="button" onclick="wishRegistAjax(this)" value="위시">';
         content += '    </td>';
         content += '  </tr>';
         content += '</form>';

      });
      
      $('#list').html(content);
      
      
      console.log(content);
   }
   

   function wishRegistAjax(button) {
        var form = button.closest("form");
        var formData = new FormData(form);

        // AJAX 요청을 보내는 코드 작성
        // 예를 들어, jQuery를 사용하여 AJAX 요청을 보낼 경우:
        $.ajax({
          url: "/mypage/wishRegist.ajax",
          type: "POST",
          data: formData,
          processData: false,
          contentType: false,
          success: function(data) {
             console.log(data);
             alert(data.msg);
          }
        });
        
        window.opener.location.reload();
      }






</script>
</html>