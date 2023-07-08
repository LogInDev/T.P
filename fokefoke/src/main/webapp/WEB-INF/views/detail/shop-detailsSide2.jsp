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


</style>

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
							<span>메뉴 상세정보</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 서브메뉴 끝 -->
	

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