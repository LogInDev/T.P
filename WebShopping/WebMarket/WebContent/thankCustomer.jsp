<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 완료</title>
</head>
<body>

	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<%-- <p>주문은	<%	out.println(shipping_shippingDate);	%>에 배송될 예정입니다! !	 --%>
		<%-- <p>주문번호 :	<%	out.println(shipping_cartId);	%> --%>
	</div>
	<div class="container">
		<p><a href="/WebMarket/welcome.jsp" class="btn btn-secondary"> &laquo; 홈</a>
	</div>
</body>
</html>

