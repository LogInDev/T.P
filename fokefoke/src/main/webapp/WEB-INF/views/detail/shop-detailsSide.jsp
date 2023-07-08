<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String contextPath = request.getContextPath();
String memberId = (String) session.getAttribute("memberId");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>포케포케 : 주문하기</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=contextPath%>/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="<%=contextPath%>/resources/css/style.css"
	type="text/css">
<!-- Favicons -->
<link href="/resources/img/favicon.png" rel="icon" />
<link href="/resources/img/favicon.png" rel="apple-touch-icon" />
<style type="text/css">
.container2 {
	display: flex;
	min-width: 500px;
}

.container2+.container2 {
	margin-top: 13px;
}

.image {
	display: flex;
	align-items: center;
	flex-basis: 30%;
	background-color: #008000db;
	border-radius: 50px 0 0 0;
	padding: 0 10px;
}

.image img {
	margin-right: 10px;
}



input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}


.productMenu{
 display:inline-block; padding-bottom: 12px; margin-right: 55px;
 }
 
 .productStyle{
 font-size: 20px; color: #b7b7b7; font-weight: 700; font-family: 'Noto Sans KR', sans-serif;
 }
 
 .productStyle:hover{
 font-size: 20px; color: #469543; font-weight: 700; font-family: 'Noto Sans KR', sans-serif;
 }
</style>
<script type="text/javascript" >

<!-- 수량 버튼 함수 -->
function incrementNumber(){
	let input=$('#count');
	let value = parseInt(input.val());
	input.val(value + 1);
	let value1 = parseInt(input.val());
	if(value>8){
		$('#count').css({
           	'border' : 'none',
           	'margin' : '0px -161px 0px 23px',
           	'font-size' : '40px',
           	'font-weight' : '1000'
        });
	}
	let total = $('#totalSum');
	let realPrice = $('#realPrice');
	let sum = parseInt(realPrice.val());
	total.val(value1*sum);
	const $input = $('#totalSum');
	into();
	
}
function decrementNumber(){
	let input=$('#count');
	let value = parseInt(input.val());
	if(value>1){ 
		input.val(value - 1);
		if(value<11){
			$('#count').css({
	           	'border' : 'none',
	           	'margin' : '0px -177px 0px 23px',
	           	'font-size' : '40px',
	           	'font-weight' : '1000'
	        });
		}
		let value1 = parseInt(input.val());
		let total = $('#totalSum');
		let realPrice = $('#realPrice');
		let sum = parseInt(realPrice.val());
		total.val(value1*sum);
		const $input = $('#totalSum');
	}
	into();
}

function into() {
	  let input = $('#totalSum');
	  let priceFormatted = $('#priceFormatted');
	  let price = input.val();    
	  let formatter = new Intl.NumberFormat('ko-KR');
	  let formattedPrice = formatter.format(price);
	  priceFormatted.html(formattedPrice);
}
let result=0;
function gotocart(){
	var detailString = $("#detailForm").serialize();
       $.ajax({
          type: 'post',
          url:'/cart/add',
          data : detailString,
          dataType: 'json',
          success: function(data){
             result=data;
             console.log(result);
          },
          error: function(request,status, error){
             console.log(request, status, error)
          }
       })
    }

$(function() {
	$('#cartPlus').mouseenter(function(){
		  $(this).css({
	           	'background-color' : '#f06923',
	           	'color' : '#fff'
	        });
		}).mouseleave(function(){
		  $(this).css({
	           	'background-color' : '#fff',
	           	'color' : '#f06923'
	        });
		});
	into();
	$("#cartPlus").click(function(){
		gotocart();
       if(result==0) alert("장바구니에 담겼습니다.");
       
      if (confirm("장바구니를 확인하시겠습니까?")) {
       $('#detailForm').attr('action', '/cart/${memberId}').submit();
      } else {
          return false; 
      }
   });
	$("#order").click(function(){
		$('#detailForm').attr('action', '/payment/payment1').submit();
	});
	
});
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

<section class="breadcrumb-option" >
		<div class="container container2">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>포케포케 메뉴</h4>
						<div class="breadcrumb__links">
							<a href="/">Home</a><a href="/store/list">매장찾기</a><a href="/product/reList">메뉴선택</a><span>Customizing</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 서브메뉴 끝 -->
	
	<!-- 포케포케 메뉴 -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<a href="/product/reList" class="productStyle"><span class = "productMenu"> 전체메뉴</span></a>
							<a href="/product/reList?num=1" class="productStyle"><span class = "productMenu">샐러드</span></a>
							<a href="/product/reList?num=2" class="productStyle"><span class = "productMenu">사이드</span></a>
							<a href="/product/reList?num=3" class="productStyle"><span class = "productMenu">음료수</span></a>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Product section-->
	<form id="detailForm" method="post">
	<input type="hidden" name="memberId" value=<%=memberId %>>
	<input type="hidden" name="productName" value="${product.productName }">
	<input type="hidden" name="productImage" value="${product.productImage }"> 
	<section class="py-5" style="margin:-70px 0 0 0;">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="${product.productImage }"
						alt="..." />
				</div>
				<div class="col-md-6">
					<div class="small mb-1">${product.productType }</div>
					<h1 class="display-5 fw-bolder">${product.productName }</h1>
						<span class="text-decoration-line-through">${product.productEname }</span> <br>
						<div class="fs-5 mb-5">
					<p class="lead" style="margin-top: 50px;">${product.productDetail }</p>
					</div>
				</div>
			</div>
		</div>
		<c:choose>
		<c:when test="${not empty nutritional.weight}">
		<span style="display:inline-block;font-size:20pt;font-weight: 550;color:#00000094;margin:0 0 14px 126px;">영양성분표</span>
		<div class="table-responsive">
						<table class="table" style="font-size:15pt;font-weight: bold;text-align:center;width:80%;height:120px;margin:0 0 0 130px;">
							<tr>
							<th style="border-top: 2px solid #008000db;color:#008000db;">중량(g)</th>
							<th style="border-top: 2px solid #008000db;color:#008000db;">열량(kcal)</th>
							<th style="border-top: 2px solid #008000db;color:#008000db;">단백질(g)</th>
							<th style="border-top: 2px solid #008000db;color:#008000db;">포화지방(g)</th>
							<th style="border-top: 2px solid #008000db;color:#008000db;">당류(g)</th>
							<th style="border-top: 2px solid #008000db;color:#008000db;">나트륨(mg)</th>
							</tr>
							<tr>
							<td style="border-top: 0.5px solid #008000db;color:#00000094;">${nutritional.weight}</td>
							<td style="border-top: 0.5px solid #008000db;color:#00000094;">${nutritional.calorie}</td>
							<td style="border-top: 0.5px solid #008000db;color:#00000094;">${nutritional.protein}</td>
							<td style="border-top: 0.5px solid #008000db;color:#00000094;">${nutritional.saturatedFat}</td>
							<td style="border-top: 0.5px solid #008000db;color:#00000094;">${nutritional.sugarContent}</td>
							<td style="border-top: 0.5px solid #008000db;color:#00000094;">${nutritional.sodium}</td>
							</tr>
						</table>
					</div>
		</c:when>
		<c:otherwise>
		<br><br><br><br>
		</c:otherwise>
		</c:choose>


			<!-- Plus, minus button -->
			<div class="container container2">
				<div class="btn" style="margin:0 0 0 0;">
					<span style="font-size: 25px; font-weight: 1000;">수량 </span>
					<button type="button" class="btn" onclick="decrementNumber()"
						style="border: 3px solid #008000db; border-radius: 80px; color: #008000db; margin-left: 13px; font-size: 24px; font-weight: 1000; padding: 0px 14px 0px 14px;">-</button>
					<span> <input type="number" id="count" name="total"
						value="1" min="1" max="9999"
						style="border: none; margin: 0px -177px 0px 23px; font-size: 40px; font-weight: 1000;">
					</span>
					<button type="button" class="btn" onclick="incrementNumber()"
						style="border: 3px solid #008000db; border-radius: 80px; color: #008000db; font-size: 24px; font-weight: 1000; padding: 0px 11px 0px 11px;">+</button>
				</div>
				<div class="total"
					style="margin-left: 390px; font-size: 30px; font-weight: 1000;">
					<span id="realreal"><input type="hidden" id="realPrice" value="${product.productPrice}"></span>
					<div class="comeon" style="margin:0 0 0 0;">
					<span >총 주문 금액 
					<span id="priceFormatted" style="border: none; margin: 0  10px 0 70px; font-size: 55px; color: #008000db; font-weight: 1000;">
 						 <fmt:formatNumber type="number" maxFractionDigits="3" value="" />
					</span>원
					<input type="hidden" name="price" id="totalSum" value="${product.productPrice}">
				</span> 
					</div>
				</div>
			</div>
<hr>
<br><br>
			<div class="container" >
				<div class="modal_btn">
					<div class="d-flex justify-content-center">
						<button type="button" id="cartPlus" class="btn btn-lg "
							style="color: #f06923; width: 170px; border: 2px solid #f06923; border-radius: 30px; margin-left: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;장바구니&nbsp;&nbsp;&nbsp;&nbsp;</button>
						<button type="button" id="order" class="btn btn-lg text-white"
							style="background-color: #f06923; width: 170px; border-radius: 30px; margin-left: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;주문하기&nbsp;&nbsp;&nbsp;&nbsp;</button>
					</div>
				</div>
			</div>
</section>
		<br> <br> <br> <br>
</form>

	<!-- Js Plugins -->
	<script src="<%=contextPath%>/resources/js/jquery-3.3.1.min.js"></script>
	<script src="<%=contextPath%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=contextPath%>/resources/js/jquery.nice-select.min.js"></script>
	<script src="<%=contextPath%>/resources/js/jquery.nicescroll.min.js"></script>
	<script
		src="<%=contextPath%>/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=contextPath%>/resources/js/jquery.countdown.min.js"></script>
	<script src="<%=contextPath%>/resources/js/jquery.slicknav.js"></script>
	<script src="<%=contextPath%>/resources/js/mixitup.min.js"></script>
	<script src="<%=contextPath%>/resources/js/owl.carousel.min.js"></script>
	<script src="<%=contextPath%>/resources/js/main.js"></script>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>

</html>