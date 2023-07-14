<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
<link rel="stylesheet" href="/WebMarket/resources/css/bootstrap.min.css" />

<title>장바구니</title>
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
					<a href="/WebMarket/deleteCart.go?memberId=${memberId}" class="btn btn-danger">삭제하기</a>
						
					</td>
					<td align="right">
					<input type="button" id="orderBtn" name="orderBtn" class="btn btn-success" value="주문하기">
<%-- 						<a href="/WebMarket/controller/ShippingInfo.do?cartId=${memberId}" 
						id="orderBtn" name="orderBtn" class="btn btn-success">주문하기</a> --%>
					</td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				
				<!-- 장바구니에 물건이 있을 때 표출되는 영역 -->
				<c:set var="sum" value="0" />
				<c:forEach var="cart" items="${cartList}">
					<c:set var="total" value="${cart.initTotalPrice()}" />
					<c:set var="sum" value="${sum + total}" />
				<tr>
					<td class="product">
						<dl>
							<dt><a href="/WebMarket/Bcontroller.po?p_id=${cart.productId}">
								<img src="${cart.p_fileName}" width="62px" class="order_thumb" alt="${cart.p_name}">
							</a></dt>
							<dd><a href="/WebMarket/Bcontroller.po?p_id=${cart.productId}"
							title="${cart.p_name}" class="order_name">${cart.p_name}
							</a>
							<div></div>
							<div class="order_option mt3">
								[ ${cart.productSize} / ${cart.productColor} ]
							</div>
							</dd>
						</dl>
					</td>
					<td>${cart.p_unitPrice}</td>
					<td>${cart.productCount}</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total}" /></td>
					<td>
						<a href="/WebMarket/removeCart.go?cartId=${cart.cartId}" class="badge badge-danger"> 삭제</a>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3" value="${sum}" /></th>
					<th></th>
				</tr>
				
				
				<!-- 장바구니에 물건이 없을 때 표출되는 영역 -->
			<!-- 	
				<tr >
					<td colspan="4" class="product" style="text-align:center; padding-top: 20px; padding-bottom: 20px;" width="100%" >
						<span><b>장바구니에 물건이 없습니다 ^^. 물건을 등록해주세요.</b></span>
					</td>
				</tr> -->
				
			</table>
			<a href="/WebMarket/allview.po?pageNum=1" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
	
<script>

$('#orderBtn').on('click', function() {
	
	const memberId = "<c:out value='${param.memberId}'/>"
	console.log("orderBtnclick event 진입");
	console.log("memberId : " + memberId);
	
	$.ajax({
	    type : 'post', // 타입 (get, post, put 등등)
	    url : '/WebMarket/controller/cartValidation.do', // 요청할 서버url
	   /*  dataType : 'json', */ // 데이터 타입 (html, xml, json, text 등등)
	    data : { // 보낼 데이터 (Object , String, Array)
	      "memberId" : memberId
	    },
	    success : function(result) { // 결과 성공 콜백함수
	        console.log(result);
	    	if(result == "success"){
	    		console.log("success 분기진입");
	    		location.href = "/WebMarket/controller/ShippingInfo.do";
	    	}else if(result == "fail"){
	    		alert("장바구니에 상품이 없습니다.상품페이지로 이동합니다.");
	    		location.href = "/WebMarket/allview.po?pageNum=1";
	    	}
	    },
	    error : function(request, status, error) { // 결과 에러 콜백함수
	        console.log(error)
	    }
	})

	/* //현재 row의 정보 가져오기 
	var thisRow = $(this).closest('tr');

	//주소 input 값 가져오기
	var addr = thisRow.find('td:eq(0)').find('input').val();
	//섦졍 input 값 가져오기
	var txt = thisRow.find('td:eq(1)').find('input').val();

	alert(addr + ", " + txt + "을(를) 클릭하였습니다.");
 */
})
</script>
</body>
</html>
