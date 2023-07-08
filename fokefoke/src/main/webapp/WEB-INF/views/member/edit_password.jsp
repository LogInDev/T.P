<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<head>
<meta charset="UTF-8">
<title>포케포케 : 비밀번호 변경</title>

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
	<!-- Checkout Section Begin -->
	<div class="product__details__tab" style="padding-top: 0;">
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link"
				href="/member/mypage/edit">회원 정보 수정</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/member/mypage/push_setting">알림 설정</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="/member/mypage/edit_password">비밀번호 변경</a></li>
		</ul>
	</div>
	<form id="editPasswordForm" method="post">
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<div class="row gx-4 gx-lg-5 justify-content-center">
					<div class="col-md-10 col-lg-8 col-xl-7">
						<div style="margin-bottom: 50px;">
							<h4><b>비밀번호 변경</b></h4>
						</div>
						<div class="checkout__input password">
							<label for="password">새 비밀번호</label>
							<input type="password" class="pw_input" id="password"
								name="memberPw" style="color: #000;" required/>
							<div class="text-success pwError"></div>
							<input type="hidden" name="memberId" value="${memberId}" required/>
						</div>
						<div class="checkout__input passwordConfirm">
							<label for="passwordConfirm">새 비밀번호 확인</label>
							<input type="password" class="pwck_input" id="passwordConfirm"
								name="passwordConfirm" style="color: #000;">
							<div class="text-success pwCkError"></div>
						</div>
						<div class="row d-flex justify-content-center">
							<button type="button" class="goodbtn" id="editPw"
								style="margin-top: 50px;">
							비밀번호 변경
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</form>
	<!-- Checkout Section End -->
<jsp:include page="/WEB-INF/views/footer.jsp" />

	<!-- Js Plugins -->
	<script src="/resources/js/password.js"></script>
	<script src="/resources/js/edit_password.js"></script>
</body>
</html>
