<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>


<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>포케포케 : 주문목록보기</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	type="text/css">
	
		<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.png"
	rel="icon" />
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.png"
	rel="apple-touch-icon" />



</head>
<!-- 주문 랜덤번호 박스 -->
<style>
.order-box {
	padding: 10px;
	margin: 23px 880px -54px 300px;
	background-color: #469543;
	color: #fff;
}
</style>


<body>

<jsp:include page="/WEB-INF/views/header.jsp" />




	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<!-- <div class="container"> -->
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2 align="center">주문 내역 상세</h2>
						<div class="breadcrumb__links"></div>
					</div>
				</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	
	<!-- 주문번호 랜덤 -->
	<div class="order-box"
		style="display: flex; align-items: center;">
		<h4 style="margin-right: 10px; color:#fff;">주문번호 :</h4>
		<%
	String orderNum = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	Random random = new Random();
	StringBuilder sb = new StringBuilder(15);
	for(int i=0; i<15; i++){
		int randomNum = random.nextInt(orderNum.length());
	    sb.append(orderNum.charAt(randomNum));
	}
	String randomString = sb.toString();
	%>
		<div>
			<h4 style="color:#fff;"><%=randomString%></h4>
		</div>
	</div>	

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form action="#">
					<div class="row">
						<div class="col-lg-12 col-md-6">
							<h6 class="checkout__title">픽업매장</h6>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											매장명<span>*</span>
										</p>
										<input type="text" readonly name="storeName" value="${store.storeName }">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											매장주소<span>*</span>
										</p>
										<input type="text" readonly name="storeAddress"
											value="${store.storeAddress}">
									</div>
								</div>
							</div>

								<div class="checkout__input">
								<p>
									전화번호<span>*</span>
								</p>
								<input type="text" name="phone" value="${member.phone}"
									class="checkout__input__add">
							</div>


							<p>&nbsp;</p>
							<h6 class="checkout__title">주문내역</h6>
							<div class="checkout__input__checkbox">
								<tr>
									<td>
										<div class="name" data-target="mainItem">
											<br> <strong>${detail.productName }</strong><br>
											<strong style="font-size: 13px; font-weight: bold;">${detail.base}&nbsp;${detail.atopping }&nbsp;${detail.btopping}&nbsp;${detail.ctopping}&nbsp;${detail.dtopping}&nbsp;${detail.asource}&nbsp;${detail.bsource}&nbsp;${detail.aextratopping}&nbsp;${detail.bextratopping}&nbsp;${detail.extramain}
											</strong>
										</div>
									</td>
									<td>
										<div style="text-align: right; font-size: 14px; font-weight: bold;">
											<span>${detail.total }개</span>&nbsp;&nbsp;
											<span>${detail.price }원</span>
										</div>
									</td>
								</tr>
							</div>
							<br>
							<br>
							<!-- 결제창 -->
							<h6 class="checkout__title">총 결제 금액</h6>
							<div class="cart__total" style=" color: #E53637;">
								<p style="font-size: 16px;">상품 수량</p> 
								<div style="text-align: right; font-weight: bold; font-size: 16px;">${detail.total}개</div>
								<p style="font-size: 16px;">총 주문 금액</p>
								<div style="text-align: right; font-weight: bold; font-size: 16px;">${detail.price}원</div>
								<p style="font-size: 16px;">포인트 사용</p>
								<div style="text-align: right; font-weight: bold; font-size: 16px;">${pmember.point}Point</div>
								<p style="font-size: 16px;">잔여 결제 금액</p>
								<div id="finalPrice" style="text-align: right; font-size: 16px; font-weight: bold;" ></div>
								
								<!-- 결제 내역에서 잔여 결제 금액(총 주문 금액 - 포인트 사용 = 잔여 결제 금액) -->
								<script>
								$(document).ready(function(){
								let price = ${detail.price}
								let point = ${member.point}
								let finalPrice = price - point;
								console.log(finalPrice);
								$('#finalPrice').text(finalPrice + '원');
								});
								</script>
							</div> 
							<br>
							<br>
							<!-- 포인트 적립 -->
							<h6 class="checkout__title">포인트 적립</h6>
								<div>
								<p>포인트 적립 내역</p>
								<div id="pointAccumulation" align="right">${member.point }</div>
								</div>
							<div class="checkout__input">
									<br>
								<div style="text-align: center;" class="btn_area">
									<button type="button" onclick="location.href='http://localhost:8080'" style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">
									목록보기</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	
	<!-- 포인트 적립 부분 -->
<!-- 	<script>
	$(document).ready(function(){
	  const finalPrice = parseFloat($('#finalPrice').text().replace(/[^0-9.-]+/g,""));
	  const point = finalPrice * 0.05;
	  const pointString = point.toLocaleString('en-US'); // Formats the number with commas
	  $('#pointAccumulation').text(pointString + ' Point');
	});
	</script> -->
	
	<!-- <script>
	$(document).ready(function(){
		  const finalPrice = parseFloat($('#finalPrice').text().replace(/[^0-9.-]+/g,""));
		  const newFinalPrice = finalPrice * 0.05;
		  $('#finalPrice').text(newFinalPrice.toFixed(2) + 'won');
		});
	</script> -->
	
<!--  <script>
$(document).ready(function(){
  let price = ${detail.price};
  let point = price * 0.05;
  let pointString = point.toLocaleString('en-US'); // This formats the number with commas
  $('#pointAccumulation').text(pointString + 'Point');
});
</script> -->

	

	

	<!-- Checkout Section End -->

	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>

</head>
