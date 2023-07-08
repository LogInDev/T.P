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

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
   integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
   crossorigin="anonymous"></script>

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


<!-- 주문시 요청사항 텍스트 입력 시 없어지는 이벤트 -->
<script>
const textBox = document.querySelector('input[name="order"]');
if (textBox !== null) {
  textBox.addEventListener('input', function(){
    if (textBox.value.length > 0) {
      textBox.removeAttribute('placeholder');
    } else {
      textBox.setAttribute('placeholder', '주문시 요청 사항을 입력해 주세요.');
    }
  });
}
</script>


<!-- 무통장 입금 폼 -->
<script>
function showBankInfo() {
  $('#bank-info').append(
    '<div class="col-lg-4">' +
    '<div class="checkout__input">' +
    '<input name="bank" placeholder="입금자 이름"></li><li><strong>입금은행</strong>&nbsp;&nbsp;<select name="bankAccount" class="bankAccount"><option value="">선택해주세요</option><option value="1">국민 4444-555-6666 (주)포케포케</option><option value="2">신한 9999-888-7777 (주)포케포케</option><option value="3">우리 1111-222-3333 (주)포케포케</option></select></li></ul>'+
    '</div>' +
    '</div>'
  );
  $('#bank').prop('disabled', true); // 무통장 버튼 비활성화
}
</script>
<!-- 신용카드 폼 -->
<script>
function cartInfo() {
  $('#bank-info').append(
    '<div>' +
    '<div>' +
    '<input type="radio" name="card-type" value="personal-card"><strong>개인카드</strong>&nbsp;&nbsp;'+
    '<input type="radio" name="card-type" value="corporate-card"><strong>법인카드</strong>&nbsp;&nbsp;<select name="bankAccount" class="bankAccount"><option value="">선택해주세요</option><option value="1">국민카드</option><option value="2">신한카드</option><option value="3">우리카드</option></select></li></ul>'+
    '</div>' +
    '</div>'
  );
  $('#bank-info').append('<br>');
  $('#card-type').prop('disabled', true); 
}
</script>

 <!-- <script>
function showBankInfo() {
var bankInfo = '<ul><li><strong>입금자명</strong><input type="text" name="bank"></li><li><strong>입금은행</strong><select name="bankAccount" class="bankAccount"><option value="">선택하세요</option><option value="1">국민 4444-555-6666 (주)포케포케</option><option value="2">신한 9999-888-7777 (주)포케포케</option><option value="3">우리 1111-222-3333 (주)포케포케</option></select></li></ul>';
document.getElementById('bank').innerHTML = bankInfo;}</script> -->

<!-- 구매결제 버튼 창 누르면 실행 -->								
<script>
function validateForm() {
  var checkBox = document.getElementById("paymentAgree");
  if (!checkBox.checked){
    alert("구매조건 및 결제진행 동의에 체크해주세요.");
    return false;
  }else{
	  if(confirm("주문 후 제조가 시작되면 취소가 불가능 합니다. 주문하시겠습니까?")){
		 /*  location.href="http://localhost:8080/payment/orderView"; */
		  $('#detailForm').attr('action', '/payment/orderView').submit();
	  }
   }
}
</script>

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
						<h2 align="center">결제 페이지</h2>
						<div class="breadcrumb__links"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form id="detailForm" method="post">
				
				<input type="hidden" id="pointAccumulation" name="point" value="">
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
									포장방법<span>*</span>
								</p>
								<input type="text" readonly value="포장">
							</div>
							<div class="checkout__input">
								<p>
									전화번호<span>*</span>
								</p>
								<input type="text" name="phone" value="${member.phone}"
									class="checkout__input__add">
							</div>
							<div class="checkout__input">
								<p>주문시 요청사항</p>
								<input type="text" maxlength="50" name="order"
									placeholder="주문시 요청사항을 입력하세요">
							</div>

							<div class="checkout__input__checkbox">
								<label for="zero"> &#x1F374;일회용품(스푼, 포크 등)을 사용하지
									않겠습니다.🌍 <input type="checkbox" id="zero"> <span
									class="checkmark"></span>
								</label>
							</div>
							<!-- 할인방법 -->
							<div class="container">
							<h6 class="checkout__title">할인 방법 선택</h6>
							<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="checkout__input">
								<span>포인트 사용</span>
								<input id="pointAmt" name="point" type="text" value="0">
								<span>보유 포인트:</span>
								<span id="point" data-point="${member.point}">${member.point}</span>
								</div>
								</div>
								<div class="col-lg-4 col-md-6">
								<br>
								<button type="button" onclick="setPointAmount('${member.point}')"
										style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">전체사용</button>						
							</div>
							</div>
							</div>
							<br>
							<!-- 결제수단 -->
							<h6 class="checkout__title">결제 수단 선택</h6>
								<div class="row" id="bank-info">
								  <div class="col-lg-6">
								    <div class="checkout__input">
								      <button id="cart" type="button" class="btn btn-success"
								        style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;"
								        onclick="cartInfo()">신용카드</button>
								      &nbsp;&nbsp;&nbsp;
								      <button id="bank" type="button" class="bank-button"
								        style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;"
								        onclick="showBankInfo();">무통장입금</button>
								    </div>
								  </div>
								</div>
<!--  							<div class="row" id="bank">
								<div class="col-lg-6">
									<div class="checkout__input">
										<button type="button" class="btn btn-success"
											style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">신용카드</button>
										&nbsp;&nbsp;&nbsp;
										<button class="bank-button" type="button" 
											style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;"
											onclick="showBankInfo()">무통장입금</button>
									</div>
								</div>
							</div>  -->
							<br>
							<h6 class="checkout__title">현금영수증</h6>
						<div class="cash">
						<div class="form_radio square">
							<label>
								<button type="button" class="btn btn-success" onclick="hideForms()" style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">발급안함</button>&nbsp;&nbsp;&nbsp;
							</label> <label>
								<button id="form-container1" type="button"
									class="btn-personal" style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;" >개인소득공제</button>&nbsp;&nbsp;&nbsp;
							</label> <label>
								<button id="form-container2" type="button"
									class="btn-business" style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">사업자증빙용</button>&nbsp;&nbsp;&nbsp;
							</label>
						</div>
						<!-- 개인소득 -->
						<span id="form-container"></span>
						<!-- 사업자증빙 -->
						<div id="output-container"></div>
					</div>
				
<!-- 결제 관련 이벤트 -->				
<script>

/* 버튼 최대 2개 클릭 */
let maxNumClicks = 2;
let numClicks = 0;

let cashReceipt = document.querySelector('.cash');
let radioButtons = cashReceipt.querySelectorAll('.btn-success');

radioButtons.forEach(function(button) {
  button.addEventListener("click", function() {
    if (button.classList.contains('active')) {
      button.classList.remove('active');
      numClicks--;
    } else if (numClicks < maxNumClicks) {
      button.classList.add('active');
      numClicks++;
    }
    
    if (numClicks === maxNumClicks) {
      radioButtons.forEach(function(button) {
        if (!button.classList.contains('active')) {
          button.disabled = true;
        }
      });
    } else {
      radioButtons.forEach(function(button) {
        button.disabled = false;
      });
    }
  });
});

/* 개인, 사업자 현금 영수증 폼 구현 */
	let personalBtn = document.querySelector('.btn-personal');
	let businessBtn = document.querySelector('.btn-business');
	let formContainer = document.getElementById("form-container");

	personalBtn.addEventListener("click", function() {
		let form = document.createElement("form");
		let input = document.createElement("input");
		let submitBtn = document.createElement("button");

	  input.setAttribute("type", "text");
	  input.setAttribute("name", "text-input");

	  submitBtn.setAttribute("type", "submit");
	  submitBtn.textContent = "입력";

	  form.appendChild(input);
	  form.appendChild(submitBtn);
	  formContainer.appendChild(form);

	  form.addEventListener("submit", function(event) {
	    event.preventDefault();

	    let outputContainer = document.getElementById("output-container");
	    let inputValue = input.value;

	    form.style.display = "none";
	    outputContainer.textContent = inputValue;
	  });
	});

	businessBtn.addEventListener("click", function() {
		let form = document.createElement("form");
		let input = document.createElement("input");
		let submitBtn = document.createElement("button");

	  input.setAttribute("type", "text");
	  input.setAttribute("name", "company-name");

	  submitBtn.setAttribute("type", "submit");
	  submitBtn.textContent = "입력";

	  form.appendChild(input);
	  form.appendChild(submitBtn);
	  formContainer.appendChild(form);

	  form.addEventListener("submit", function(event) {
	    event.preventDefault();

	    let outputContainer = document.getElementById("output-container");
	    let inputValue = input.value;

	    form.style.display = "none";
	    outputContainer.textContent = inputValue;
	  });
	});
/* 발급안함 버튼 누르면 기존 폼 사라지게 하는 부분(발급안함 버튼에 onclick 줌) */
function hideForms(){
	let forms = document.querySelectorAll(".cash form");
	let formContainer = document.querySelector("#form-container");
	let outputContainer = document.getElementById("output-container");

	forms.forEach(function(form){
		formContainer.removeChild(form);
	});
	outputContainer.textContent="";
}

</script>
							<p>&nbsp;</p>
							<h6 class="checkout__title">주문내역</h6>
						
								<div class="checkout__input__checkbox">
								<table id="cartss">
								<c:forEach var="carts" items="${cart}">
								<input type="hidden" name="cartId" value="${carts.cartId}">
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
											 <input type="hidden" id="sum" name="price" value="${carts.onePrice * carts.cartCount}">
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
                            
                            <li>포인트 사용가능<span class="cart_usePoint"></span></li>
                           
                            <li>잔여 결제 금액<span class="cart_totalPay"></span></li>
                        </ul>		
                        </div>
                        
								<!-- 결제 내역에서 잔여 결제 금액(총 주문 금액 - 포인트 사용 = 잔여 결제 금액) -->
								<script>
								function finalPriceFn(){
									let price = "${detail.price}";
									let point = "${pmember.point}";
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
								
						
							
							<%-- <c:forEach var="carts" items="${cart}">
							<div>
								<p>총 주문 금액</p>
								<div style="text-align: right; font-size: 14px; font-weight: bold;">
								<c:if test="${not empty carts.cartPrice }">${carts.cartPrice }원</c:if></div>
								<p>포인트 사용</p>
								<div style="text-align: right; font-size: 14px; font-weight: bold;">사용 포인트</div>
								<p>잔여 결제 금액</p>
								<div style="text-align: right; font-size: 14px; font-weight: bold;">
								<c:if test="${not empty carts.cartPrice}">${carts.cartPrice}원</c:if></div>
							</div>
							
							</c:forEach> --%>
							<br>
							<br>
							<div class="checkout__input">
								<div class="checkout__input__checkbox">
									<label for="paymentAgree"><input id="paymentAgree"
										type="checkbox" value="Y" /> <span class="checkmark"></span>
										<strong>구매조건및 결제진행 동의</strong>
									</label>
								</div>
								<ul>
									<li class="counsel_copy">주문할 메뉴와 가격, 매장정보를 명확히 확인하였으며
										결제진행에 동의합니다.</li>
									<li class="counsel_copy">제조시간은 매장상황에 따라 상이할 수 있습니다.</li>
									<li class="counsel_copy">주문자 정보가 서비스 제공을 위해 주문 매장에 제공됩니다.</li>
									<li class="counsel_copy on">주문 후 제조가 시작되면 주문을 취소할 수 없습니다.</li>
								</ul>
								<br>
								<div style="text-align: center;" class="btn_area">
									<button onclick="validateForm()" type="button"
											style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">결제하기</button>
									
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	
	
<script>
	/*종합 정보 세팅*/
	let totalPrice = 0;	
function TotalCartInfo() {
	
	let totalCount = 0;		  //총 갯수
	totalPrice = 0;		  //총 가격
	let usePoint = 0;		  //사용 마일리지
	let totalPay = 0;  		  //최종 결제(총 가격 - 마일리지)

	$(".cartInfo_tr").each(function(index, element) {
		
		/* 총 갯수 */
		totalCount += parseInt($(element).find(".hdn_cartCount_input").val());
		
		/* 총 가격 */
		totalPrice += parseInt($(element).find(".hdn_totalPrice_input").val());

		/* 총 마일리지 */
		//totalPoint += parseInt($(element).find(".hdn_totalPoint_input").val());
 		
	});
		/* 사용 포인트 */
		usePoint = "${member.point}";
		
		/* 최종 결제 */
		totalPay = totalPrice - usePoint;
		
		/*값 입력*/
		$(".cart_totalCount").text(totalCount + " 개");
		$(".cart_totalPrice").text(totalPrice.toLocaleString() + " 원");
		$(".cart_usePoint").text(usePoint + " Point");
		$(".cart_totalPay").text(totalPay.toLocaleString() + " 원");
	};
</script>
	<script>
$(document).ready(function() {
	TotalCartInfo();
	console.log(TotalCartInfo());
	  let price = totalPrice;
	  let point = price * 0.05;
	  let pointString = parseInt(point); // This formats the number with commas
	console.log(totalPrice);
	  $('#pointAccumulation').val(pointString);
	  
	console.log($('#pointAccumulation').val());
});
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
