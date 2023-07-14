<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
	<h1 align="center">장바구니에 담긴 상품이 없습니다.</h1>
	<h3 align="center" >원하는 상품을 장바구니에 담아보세요!</h3>
	<a href="/WebMarket/allview.po?pageNum=1" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
	</div>
</body>
</html>