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
				<h2 class="section-title">Book</h2>
			</div>
		</div>
	</div>
</section>

<form action="clubBookSearch.do" role="search" method="get" class="search-box" style="text-align: center;">
	<input class="search-field text search-input" autocomplete='off' placeholder="검색어를 입력하세요." type="search" name="searchValue" >
	<input type="submit" value="검색"/>
</form>
		
	<table>
		<c:if test="${search eq false}">
			<h3>검색 결과가 존재하지 않습니다. </h3>
		</c:if>
		<c:forEach var="item" items="${list}" varStatus="status">
			<c:if test="${status.index==2}"> 						
					<c:forEach var="book" items="${item.value}" varStatus="status">
						<tr> 
							<td> 
								<img src="${book.cover}" style="width:180px; height:200px;" alt="Books" class="product-item"> 
							</td> 
							<td style="width:400px;"> 
								<div class="item-price" style="width:400px;" >${book.title}</div> 
								<div class="item-price">${book.author}</div> 
							</td>
							<td> 
								<input type="button" onclick="selectBook('${book.isbn13}','${book.cover}','${book.title}','${book.author}','${book.publisher}','${book.description}','${book.pubDate}')" value="선택">
							</td>  
						</tr>
						
					</c:forEach>							
			</c:if>	
		</c:forEach>
		
	</table>
		
		
</body>

<script>

function selectBook(isbn,cover,title,author,publisher,description,pubDate) {
	opener.document.getElementById('isbn').value = isbn;
	opener.document.getElementById('cover').value = cover;
	opener.document.getElementById('title').value = title;
	opener.document.getElementById('author').value = author;
	opener.document.getElementById('publisher').value = publisher;
	opener.document.getElementById('description').value = description;
	opener.document.getElementById('pubdate').value = pubDate;
	opener.document.getElementById('cover').setAttribute('src',cover);
	opener.document.getElementById('cover2').setAttribute('src',cover);
	window.close();
};



</script>
</html>