<%@page import="dto.MemberOrder"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<title>주문 정보</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center ">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong> :${orders.extraAddr} <br> 
				<b>성명</b> :${productMember[0].name} <br> 
				<b>전화번호</b> :${orders.phone}<br> 
			</div>
			<div class="col-4" align="right">
				<p>	<em>주문일:${orders.create_timestamp} </em>
			</div>
		</div>
		<div>
	 		<table class="table table-hover">			
<!-- 			<tr>
				<th class="text-center">도서</th>
				<th class="text-center">#</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>  -->
<%-- 			<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Product>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Product product = cartList.get(i);
					int total = Integer.parseInt(product.getUnitPrice()) * Integer.parseInt(product.getQuantity());
					sum = sum + total;
			%> --%>
			<%-- <tr>
				<td class="text-center"><em><%=product.getPname()%> </em></td>
				<td class="text-center"><%=product.getQuantity()%></td>
				<td class="text-center"><%=product.getUnitPrice()%>원</td>
				<td class="text-center"><%=total%>원</td>
			</tr> --%>
<%-- 			<%
				/* } */
			%> --%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총액:<fmt:formatNumber type="number" maxFractionDigits="3" value="${orders.totalPrice}"/> 원 </strong></td>
	<%-- 			<td class="text-center text-danger"><strong><%=sum%> </strong></td> --%>
			</tr>
			</table>			
				<!-- <a href="/WebMarket/ShippingInfo.do?d="class="btn btn-secondary" role="button"> 이전 </a> -->
				<form action="/WebMarket/controller/DeleteOrder.do" method="post">
				<input type="hidden" name="memberId" value="${productMember[0].memberId}">
				<input type="submit" class="btn btn-success" value="주문완료"> 
				</form>
				<a href="/WebMarket/controller/DeleteOrder.do?memberId=${productMember[0].memberId}" class="btn btn-secondary"	role="button"> 취소 </a>			
		</div>
	</div>	
</body>
</html>
