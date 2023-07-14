<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Welcome</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
	integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
</head>
<body>

	<jsp:include page="menu.jsp" />
	<main>
	<jsp:include page="jumbotron.jsp" />
				<div class="row">
					<div class="col-lg-6">
						<div class="card" style="width: 100%; height: 100%;">
							<a href="/WebMarket/Male/maleview.po?pageNum=1"> <img
								src="
					https://media.matchesfashion.com/prehome/aw21/mens-hero-large.jpg?quality=60
					"
								class="card-img-top" alt="..."></a>
							<div class="card-body">
								<h5 class="card-title">남성 옷</h5>
								<p class="card-text">아주 좋은 옷</p>
								<a href="/WebMarket/Male/maleview.po?pageNum=1"
									class="btn btn-outline-secondary">보러가기</a>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="card" style="width: 100%; height: 100%;">
							<a href="/WebMarket/Female/femaleview.po?pageNum=1"> <img
								src="
					https://media.matchesfashion.com/prehome/aw21/womens-hero-large.jpg?quality=60
					"
								class="card-img-top" alt="..."></a>
							<div class="card-body">
								<h5 class="card-title">여성 옷</h5>
								<p class="card-text">소재가 짱짱해요</p>
								<a href="/WebMarket/Female/femaleview.po?pageNum=1" class="btn btn-outline-secondary">보러가기</a>
							</div>
						</div>
					</div>
				</div>
	</main>
	<jsp:include page="footer.jsp" />
</body>
</html>