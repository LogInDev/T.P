<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String contextPath = request.getContextPath();
String memberId = (String)session.getAttribute("memberId");
%>
<!DOCTYPE html>


<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>포케포케 : 결제하기</title>

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


<!-- 결제 동의 텍스트 -->
<style>
.counsel_copy {
	font-size: 0.7em;
}
</style>
<!-- 결제동의 내역에 점 없애는 효과 -->
<style>
ul li {
	list-style: none;
}
</style>
<!-- <p>태그 단락 줄이는 스타일 -->
<style>
  p {
    margin: 0;
    padding: 0;
  }
</style> 
 <style> 
  .store_name{
  color:black;
  }
</style>

<style>
.order-box {
	padding: 10px;
	margin: 23px 880px -54px 300px;
	background-color: #469543;
	color: #fff;
}
</style>




							


<!-- 포인트 사용 -->
<script>
function setPointAmount(amount){
document.getElementById('pointAmt').value = amount;
}
</script>


<script>
function calculateTotal() {
    var prices = document.getElementsByName("price"); // 가격 정보를 담은 input 태그들의 name 속성 값이 "price"인 요소들을 가져옵니다.
    var quantities = document.getElementsByName("quantity"); // 수량 정보를 담은 input 태그들의 name 속성 값이 "quantity"인 요소들을 가져옵니다.
    var total = 0; // 총 주문금액을 담을 변수를 초기화합니다.
    for (var i = 0; i < prices.length; i++) {
        var price = parseInt(prices[i].value); // 가격 정보를 가져와 정수형으로 변환합니다.
        var quantity = parseInt(quantities[i].value); // 수량 정보를 가져와 정수형으로 변환합니다.
        total += price * quantity; // 총 주문금액을 계산합니다.
    }
    document.getElementById("totalPrice").innerText = total + "원"; // 총 주문금액을 화면에 출력합니다.
}
</script>

	

<body>

<jsp:include page="/WEB-INF/views/header.jsp" />



	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2 align="center">주문 내역 상세</h2>
						<div class="breadcrumb__links"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 주문번호 랜덤 -->
	<div class="order-box" style="display: flex; align-items: center;">
  <h4 style="margin-right: 10px; color:#fff;">주문 번호:</h4>
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
    <h4 style="color:#fff;"><%=randomString %></h4>
  </div>
</div>
	
	<!-- Breadcrumb Section End -->

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
										<input type="text" class="store_name" readonly name="storeName" value="${store.storeName }">
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
							
							<br>


				
<!-- 결제 관련 이벤트 -->				


							<p>&nbsp;</p>
							<h6 class="checkout__title">주문내역</h6>
						
								<div class="checkout__input__checkbox">
								<table id="cartss">
								<c:forEach var="carts" items="${cart}">
								<tr class="cartInfo_tr">
	                           	    <td class="hdn">
										<input type="hidden" class="hdn_cartCount_input" value="${carts.cartCount}">
										<input type="hidden" class="hdn_price_input" value="${carts.price}">
										<input type="hidden" class="hdn_onePrice_input" value="${carts.onePrice}">
										
										<input type="hidden" class="hdn_totalPrice_input" value="${carts.onePrice * carts.cartCount}">
										<input type="hidden" class="hdn_point_input" value="${carts.point}">
										<input type="hidden" class="hdn_totalPoint_input" value="${carts.totalPoint}">
									</td>
									
									<td>
										<div class="cartname" data-target="mainItem">
											<br> 
<%-- 												<c:if test="${not empty carts.productName and not empty cart }"> --%>	
										<c:if test="${not empty carts.productName}">${carts.productName}</c:if><br>
										<%-- 	<strong>${not empty carts.productName }</strong><br> --%>
											<span class="carts" style="font-size: 13px; font-weight: bold;"></span> 
											<c:if test="${not empty carts.base}">${carts.base}</c:if>&nbsp;
											<c:if test="${not empty carts.atopping }">${carts.atopping }</c:if>&nbsp;
											<c:if test="${not empty carts.btopping}">${carts.btopping}</c:if>&nbsp;
											<c:if test="${not empty carts.ctopping}">${carts.ctopping}</c:if>&nbsp;
											<c:if test="${not empty carts.dtopping}">${carts.dtopping}</c:if>&nbsp;
											<c:if test="${not empty carts.asource}">${carts.asource}</c:if>&nbsp;
											<c:if test="${not empty carts.bsource}">${carts.bsource}</c:if>&nbsp;
											<c:if test="${not empty carts.aextratopping}">${carts.aextratopping}</c:if>&nbsp;
											<c:if test="${not empty carts.bextratopping}">${carts.bextratopping}</c:if>&nbsp;
											<c:if test="${not empty carts.extramain}">${carts.extramain}</c:if>&nbsp;
											 <span style="display:inline-block;margin:0 0 0 980px; font-size: 13px; font-weight: bold;"><c:if test="${not empty carts.cartCount }">${carts.cartCount }</c:if>개&nbsp;&nbsp;
											 <c:if test="${not empty carts.cartCount}">${carts.onePrice * carts.cartCount}</c:if>원</span> 
										</div>
									</td>
								</tr>
								</c:forEach>
							
										</table>
							</div>
							
							<br>
							<!-- 결제창 -->
							<h6 class="checkout__title">총 결제 금액</h6>
							<div class="cart__total">
                    	<ul>
                            
                            <li>상품 수량<span class="cart_totalCount"></span></li>
                            
                            <li>총 주문 금액<span class="cart_totalPrice"></span></li>
                            
                            <li>포인트 사용<span class="cart_usePoint"></span></li>
                           
                            <li>잔여 결제 금액<span class="cart_totalPay"></span></li>
                        </ul>		
                        </div>
                        
								<!-- 결제 내역에서 잔여 결제 금액(총 주문 금액 - 포인트 사용 = 잔여 결제 금액) -->
								<script>
								function finalPriceFn(){
									let price = "${detail.price}";
									let point = "${member.point}";
									let finalPrice = price - point;
									$('#finalPrice').text(finalPrice + '원');
								}
								$(document).ready(function(){
									finalPriceFn();
								//console.log(finalPrice);
								 //jquery 사용
								//이 코드를 사용했을 때 콘솔에는 값이 제대로 찍히지만 화면에는 finalPrice 의 값을 제대로 받지 못함 이유는 finalPrice의 변수의 값이 문자열 형태로 넣어지게 되는데 해당 변수의 값이 숫자로 변환이 되면서 에러가 나는거 같음
								//document.getElementById('finalPrice').innerHTML = `${finalPrice}원`; 
								});
								</script>
					
							<br>
							<br>
							<!-- 포인트 적립 -->
							<h6 class="checkout__title">포인트 적립</h6>
								<div>
								<p>포인트 적립 내역</p>
								<div id="pointAccumulation" align="right"></div>
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
		<script>
$(document).ready(function() {
	TotalCartInfo();
	console.log(TotalCartInfo());
});
</script>	
<script>
function TotalCartInfo() {
	  let totalCount = 0; //total count
	  let totalPrice = 0; //total price
	  let usePoint = 0; //used mileage
	  let totalPay = 0; //final payment (total price - mileage)

	  $(".cartInfo_tr").each(function(index, element) {
	   
	    totalCount += parseInt($(element).find(".hdn_cartCount_input").val());
	  
	    totalPrice += parseInt($(element).find(".hdn_totalPrice_input").val());
	  });

	  usePoint = "${pmember.point}";

	  totalPay = totalPrice - usePoint;

	  $(".cart_totalCount").text(totalCount + " 개");
	  $(".cart_totalPrice").text(totalPrice.toLocaleString() + " 원");
	  $(".cart_usePoint").text(usePoint + " Point");
	  $(".cart_totalPay").text(totalPay.toLocaleString() + " 원");

	  let finalPrice = parseFloat($('.cart_totalPrice').text().replace(/[^0-9.-]+/g,""));
	  let pointsEarned = finalPrice * 0.05;
	  $('#pointAccumulation').text(pointsEarned.toLocaleString('en-US') + ' Point');
	}
</script>

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
