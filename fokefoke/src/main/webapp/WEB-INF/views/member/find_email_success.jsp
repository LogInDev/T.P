<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포케포케 : 아이디 찾기</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="/resources/css/join.css" type="text/css">

<!-- Favicons -->
<link href="/resources/img/favicon.png" rel="icon" />
<link href="/resources/img/favicon.png" rel="apple-touch-icon" />

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="loginbody" style="display: block; padding-top: 0px;">
<section class="checkout spad">
	<div class="container">
		<div class="checkout__form">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7"
					style=" background-color: #fff; padding: 100px 70px 70px 70px;
					border-radius: 10px;">
					<div class="centerplz"
						style="font-weight:bold; font-size:18px; margin: 0px 0px 20px;">
						<h5>아이디를 확인해 주세요.</h5>
					</div>
					<div class="blog__details__btns__item" style="padding: 25px 50px 30px;
						font-size: 15px; border: 1px solid #469543;">
						<div class="centerplz">
						${memberId}
						</div>
					</div>
					<div class="row d-flex justify-content-center">
						<button type="button" class="goodbtn" id="login"
					       	style="margin: 25px;">
						로그인
					    </button>
					    <button type="button" class="goodbtn" id="find_password"
					    	style="margin: 25px;">
					      	비밀번호 찾기
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</div>
<form id="go"><input type="hidden"></form>
<jsp:include page="/WEB-INF/views/footer.jsp" />

<!-- 페이지에서 작동되는 함수들 -->
<script>
/* 로그인 버튼 클릭 시 */
$('#login').click(function(){
	$('#go').attr('action', '/member/login');
	$('#go').submit();
}); // 로그인 버튼 끝

/* 로그인 버튼 클릭 시 */
$('#find_password').click(function(){
	$('#go').attr('action', '/member/find_password');
	$('#go').submit();
}); // 로그인 버튼 끝

</script>
</body>
</html>