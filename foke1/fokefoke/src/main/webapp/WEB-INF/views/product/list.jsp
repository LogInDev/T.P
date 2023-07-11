<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>메뉴고르기</title>

<meta charset="UTF-8">
<meta name="description" content="FokeFoke">
<meta name="keywords" content="FokeFoke, salad, fresh, fast">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

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
	href="${pageContext.request.contextPath}/resources/css/style.css?after"
	type="text/css">

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.png"
	rel="icon" />
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.png"
	rel="apple-touch-icon" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
function reList(){
	console.log("${tab}");
	let tab = "${tab}";
	if(tab == "샐러드"){
		$('#tab1').trigger('click');
	}else if(tab == "사이드"){
		$('#tab2').trigger('click');
	}else if(tab == "음료수"){
		$('#tab3').trigger('click');
	}
}
$(function(){
	reList();
});

</script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- 서브메뉴 -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>포케포케 메뉴</h4>
						<div class="breadcrumb__links">
							<a href="/">Home</a>
							<a href="/store/list">매장찾기</a>
							<span>메뉴선택</span>
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
							<li class="nav-item"><a class="nav-link"
								data-toggle="tab" href="#tabs-4" role="tab">전체메뉴</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab" id="tab1"
								href="#tabs-5" role="tab">샐러드</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab" id="tab2"
								href="#tabs-6" role="tab">사이드</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab" id="tab3"
								href="#tabs-7" role="tab">음료수</a></li>
						</ul>

						<!-- 전체메뉴 -->
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-4" role="tabpanel">
								<div class="product__details__tab__content">
									<div class="row product__list">
										<c:forEach items="${list}" var="list">
											<div
												class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix list"
												onclick="window.location.href='/detail/view?productName=${list.productName}';"
												style="cursor: pointer;">
												<div class="product__item__pic set-bg"
													data-setbg="${pageContext.request.contextPath}<c:out value="${list.productImage}" />">
													<c:if test="${list.productLabel eq 'new'}">
														<span class="new">New</span>
													</c:if>
													<c:if test="${list.productLabel eq 'sale'}">
														<span class="sale">Sale</span>
													</c:if>

													<c:forEach items="${stock}" var="stockList">
														<c:if
															test="${list.productId eq stockList.productId and stockList.quantity eq 0}">
															<div class="product__item__pic disabled"
																style="background-image: url(${pageContext.request.contextPath}${list.productImage});background-size: cover;"
																${stockList.quantity eq 0 ? 'onclick="event.stopPropagation();"' : ''}>
																<span class="soldout">Sold Out</span>

															</div>
														</c:if>
													</c:forEach>
												</div>
												<div class="product__item__text">
													<h5>
														<c:out value="${list.productName}" />
													</h5>
												</div>
												<div class="product__item__text">
													<h6>
														<c:out value="${list.productEname}" />
													</h6>
												</div>
												<div class="product__item__text">
													<h4>
														<c:out value="${list.productCalorie}" />
														kcal
													</h4>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<!-- 전체메뉴 끝 -->

							<!-- 샐러드 -->
							<div class="tab-pane" id="tabs-5" role="tabpanel">
								<div class="product__details__tab__content">
									<div class="row product__list">
										<c:forEach items="${salad}" var="salad">
											<div
												class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix salad"
												onclick="window.location.href='/detail/view?productName=${salad.productName}';"
												style="cursor: pointer;">
												<div class="product__item__pic set-bg"
													data-setbg="${pageContext.request.contextPath}<c:out value="${salad.productImage}" />">
													<c:if test="${salad.productLabel eq 'new'}">
														<span class="new">New</span>
													</c:if>
													<c:if test="${salad.productLabel eq 'sale'}">
														<span class="sale">Sale</span>
													</c:if>
													<c:forEach items="${stock}" var="stockList">
														<c:if
															test="${salad.productId eq stockList.productId and stockList.quantity eq 0}">
															<div class="product__item__pic disabled"
																style="background-image: url(${pageContext.request.contextPath}${salad.productImage});background-size: cover;"
																${stockList.quantity eq 0 ? 'onclick="event.stopPropagation();"' : ''}>
																<span class="soldout">Sold Out</span>
															</div>
														</c:if>
													</c:forEach>
												</div>
												<div class="product__item__text">
													<h5>
														<c:out value="${salad.productName}" />
													</h5>
												</div>
												<div class="product__item__text">
													<h6>
														<c:out value="${salad.productEname}" />
													</h6>
												</div>
												<div class="product__item__text">
													<h4>
														<c:out value="${salad.productCalorie}" />
														kcal
													</h4>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<!-- 샐러드 끝 -->

							<!-- 사이드 -->
							<div class="tab-pane" id="tabs-6" role="tabpanel">
								<div class="product__details__tab__content">
									<div class="product__details__tab__content__item">
										<div class="row product__list">
											<c:forEach items="${side}" var="side">
												<div
													class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix side"
													onclick="window.location.href='/detail/view?productName=${side.productName}';"
													style="cursor: pointer;">
													<div class="product__item__pic set-bg"
														data-setbg="${pageContext.request.contextPath}<c:out value="${side.productImage}" />">
														<c:if test="${side.productLabel eq 'new'}">
															<span class="new">New</span>
														</c:if>
														<c:if test="${side.productLabel eq 'sale'}">
															<span class="sale">Sale</span>
														</c:if>
														<c:forEach items="${stock}" var="stockList">
															<c:if
																test="${side.productId eq stockList.productId and stockList.quantity eq 0}">
																<div class="product__item__pic disabled"
																	style="background-image: url(${pageContext.request.contextPath}${side.productImage});background-size: cover;"
																	${stockList.quantity eq 0 ? 'onclick="event.stopPropagation();"' : ''}>
																	<span class="soldout">Sold Out</span>
																</div>
															</c:if>
														</c:forEach>
													</div>
													<div class="product__item__text">
														<h5>
															<c:out value="${side.productName}" />
														</h5>
													</div>
													<div class="product__item__text">
														<h6>
															<c:out value="${side.productEname}" />
														</h6>
													</div>
													<div class="product__item__text">
														<h4>
															<c:out value="${side.productCalorie}" />
															kcal
														</h4>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<!-- 사이드 끝 -->

							<!-- 음료 -->
							<div class="tab-pane" id="tabs-7" role="tabpanel">
								<div class="product__details__tab__content">
									<div class="row product__list">
										<c:forEach items="${drink}" var="drink">
											<div
												class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix drink"
												onclick="window.location.href='/detail/view?productName=${drink.productName}';"
												style="cursor: pointer;">
												<div class="product__item__pic set-bg"
													data-setbg="${pageContext.request.contextPath}<c:out value="${drink.productImage}" />">
													<c:if test="${drink.productLabel eq 'new'}">
														<span class="new">New</span>
													</c:if>
													<c:if test="${drink.productLabel eq 'sale'}">
														<span class="sale">Sale</span>
													</c:if>
													<c:if
														test="${drink.productId eq stockList.productId and stockList.quantity eq 0}">
														<div class="product__item__pic disabled"
															style="background-image: url(${pageContext.request.contextPath}${drink.productImage});background-size: cover;"
															${stockList.quantity eq 0 ? 'onclick="event.stopPropagation();"' : ''}>
															<span class="soldout">Sold Out</span>
														</div>
													</c:if>
												</div>
												<div class="product__item__text">
													<h5>
														<c:out value="${drink.productName}" />
													</h5>
												</div>
												<div class="product__item__text">
													<h6>
														<c:out value="${drink.productEname}" />
													</h6>
												</div>
												<div class="product__item__text">
													<h4>
														<c:out value="${drink.productCalorie}" />
														kcal
													</h4>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<!-- 음료 끝 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 전체메뉴 끝 -->
	

									

	<jsp:include page="/WEB-INF/views/footer.jsp" />

	<script type="text/javascript"
		src="//openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=plyv9nfbr0"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>

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
</body>
</html>
