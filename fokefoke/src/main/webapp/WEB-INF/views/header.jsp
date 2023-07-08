<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>FokeFoke</title>
<meta charset="UTF-8">
<meta name="description" content="FokeFoke">
<meta name="keywords" content="FokeFoke, salad, fresh, fast">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
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
<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__option">
			<div class="offcanvas__links">
				<!-- 로그인 하지 않은 상태 -->
				<c:if test="${memberId == null}">
					<a href="/member/login">로그인</a>
					<a href="/member/join">회원가입</a>
					
				</c:if>

				<!-- 로그인한 상태 -->
				<c:if test="${memberId != null}">
					<a href="#" class="gnb_logout_button">로그아웃</a>
					<a href="/member/mypage/info">마이페이지</a>
					<a href="/cart/${memberId}">장바구니</a>
					<!-- 관리자 로그인 -->
					<c:if test="${adminCk == 1}">
						<a href="/admin/main">관리자 페이지</a>
					</c:if>
				</c:if>
			</div>

		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__text">
			<p>신선함과 건강을 담은 샐러드, FokeFoke mobile</p>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-7">
						<div class="header__top__left">
							<p>신선함과 건강을 담은 샐러드, FokeFoke</p>
						</div>
					</div>
					<div class="col-lg-6 col-md-5">
						<div class="header__top__right">
							<div class="header__top__links">
								<!-- 로그인 하지 않은 상태 -->
								<c:if test="${memberId == null}">
									<a href="/member/login">로그인</a>
									<a href="/member/join">회원가입</a>
								</c:if>



								<!-- 로그인한 상태 -->
								<c:if test="${memberId != null}">
									<a href="#" class="gnb_logout_button">로그아웃</a>
									<a href="/member/mypage/info">마이페이지</a>
									<a href="/cart/${memberId}">장바구니</a>

									<!-- 관리자 로그인 -->
									<c:if test="${adminCk == 1}">
										<a href="/admin/main">관리자 페이지</a>
									</c:if>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3">
					<div class="header__logo">
						<a href="/"><img
							src="${pageContext.request.contextPath}/resources/img/logo.png"
							alt="포케포케"></a>
					</div>
				</div>
				<div class="col-lg-9 col-md-6">
					<nav class="header__menu mobile-menu">
						<ul>
							<li class="active"><a href="#">포케포케</a></li>
							<li><a href="#">새소식</a>
								<ul class="dropdown">
									<li><a href="/notice/list">이벤트·프로모션</a></li>
								</ul></li>
							<li><a href="#">온라인 주문</a>
								<ul class="dropdown">
									<li><a href="/store/list">매장찾기</a></li>
								</ul></li>
							<li><a href="#">만든사람</a>
								<ul class="dropdown">
									<li><a href="#">박지유</a></li>
									<li><a href="#">김다정</a></li>
									<li><a href="#">김진희</a></li>
									<li><a href="#">최새롬</a></li>
									<li><a href="#">김도훈</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

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
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	<script>
	    /* gnb_area 로그아웃 버튼 작동 */
	    $(".gnb_logout_button").click(function(){
	        $.ajax({
	            type:"POST",
	            url:"/member/logout.do",
	            success:function(data){
	                document.location.reload();     
	            } 
	        }); // ajax 
	    }); // 버튼 클릭 메서드 끝
    </script>

</body>
</html>
