<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="FokeFoke">
<meta name="keywords" content="FokeFoke, salad, fresh, fast">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script type="text/javascript"
	src="//openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=plyv9nfbr0"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>


<title>공지&이벤트</title>





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

</head>

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.png"
	rel="icon" />
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.png"
	rel="apple-touch-icon" />

<!-- 스크롤 style -->
<style>
.basic-scroll { &::-webkit-scrollbar { width:8px;
	height: 8px;
	background: #ffffff;
}

&
::-webkit-scrollbar-thumb {
	border-radius: 3.5px;
	background-color: #469543;
	&:
	hover
	{
	background-color
	:
	#adb5bd;
}

}
&
::-webkit-scrollbar-track {
	background: #ffffff;
}
}
</style>

<style>
.js-load {
	display: none;
}

.js-load.active {
	display: block;
}

.is_comp.js-load:after {
	display: none;
}

.btn-wrap {
	position: relative;
	bottom: 90px;
	left: 92%;
	transform: translateX(-50%);
}

.button {
	display: inline-block;
	background-color: #469543;
	color: #fff;
	padding: 10px 100px;
	border-radius: 30px;
	text-decoration: none;
	border: 1px solid #469543;
	transition: all 0.3s ease-in-out;
	position: relative;
}

.button:hover {
	background-color: #fff;
	color: #469543;
	border: 1px solid #469543;
}

.btn-wrap.fixed .button {
	position: absolute;
	bottom: -50px;
	left: 50%;
	transform: translateX(-50%);
	margin-bottom: 100px;
}
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<!-- 서브 타이틀 -->



	<!-- Blog Details Hero Begin -->
	<section class="blog-hero spad">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-9 text-center">
					<div class="blog__hero__text">
						<c:forEach items="${noticeList }" var="notice">
							<h2>${notice.noticeTitle }</h2>
							<ul>
								<li>${notice.noticeDate}</li>
							</ul>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Hero End -->

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12">
					<div class="blog__details__pic">
						<img src="/" alt="">
					</div>
				</div>
				<div class="col-lg-8">
					<div class="blog__details__content">
						<c:forEach items="${noticeList }" var="notice">
							<div class="blog__details__text">
								<p>${notice.noticeContent }</p>
							</div>
						</c:forEach>
						<div class="blog__details__comment">
							<form action="/notice/list" method="get">
								<div class="row">
									<div class="col-lg-12 text-center">
										<button type="submit" class="site-btn"> 목록보기</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->



	<jsp:include page="/WEB-INF/views/footer.jsp" />

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



<script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
			
			

		});

	});


</script>





</html>