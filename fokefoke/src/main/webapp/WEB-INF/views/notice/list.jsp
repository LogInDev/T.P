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

	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>공지&이벤트</h4>
						<div class="breadcrumb__links">
							<a href="/">Home</a><span>공지&이벤트</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 서브 타이틀 끝 -->

	<section class="blog spad" id="js-load">
		<div class="container">
			<div class="row">
				<c:forEach items="${list}" var="notice">
					<div class="col-lg-4 col-md-6 col-sm-6 js-load">
						<div class="blog__item">
							<c:if test="${notice.noticeState eq 'N'}">
								<div class="blog__item__pic set-bg disabled" data-setbg="${notice.noticeImage}" >
								</div>
							</c:if>
							<c:if test="${notice.noticeState eq 'Y'}">
								<div class="blog__item__pic set-bg"
									data-setbg="${notice.noticeImage}"></div>
							</c:if>
							<div class="blog__item__text">
								<span> ${notice.noticeDate }</span>
								<h5>${notice.noticeTitle }</h5>
								<a href="/notice/view?noticeId=${notice.noticeId}">더보기</a>
							</div>
							<c:if test="${notice.noticeState eq 'N'}">
							<div class="blog__item__text" >
								<span> ${notice.noticeDate }</span>
								<h5>${notice.noticeTitle }</h5>
								<a href="" style="cursor:default;" onclick="event.stopPropagation();">종료된 이벤트입니다.</a>
							</div>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

															
	<div id="js-btn-wrap" class="btn-wrap">
		<a href="javascript:;" class="button">더보기</a>
	</div>


	<script>
		$(window).on('load', function() {
			load('#js-load', '3');
			$("#js-btn-wrap .button").on("click", function() {
				load('#js-load', '3', '#js-btn-wrap');
			})
		});

		function load(id, cnt, btn) {
			var notice_list = id + " .js-load:not(.active)";
			var notice_length = $(notice_list).length;
			var notice_total_cnt;
			if (cnt < notice_length) {
				notice_total_cnt = cnt;
			} else {
				notice_total_cnt = notice_length;
				$('.button').hide()
			}
			$(notice_list + ":lt(" + notice_total_cnt + ")").addClass("active");
		}
		
		
	</script>

	<a id="storeList"></a>
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


	var searchForm = $("#searchForm");

	$("#searchForm button").on("click", function(e) {

		if (!searchForm.find("option:selected").val()) {
			alert("검색종류를 선택하세요.");
			return false;
		}
		if (!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요.");
			return false;
		}

		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();

		searchForm.submit();

	});
</script>





</html>