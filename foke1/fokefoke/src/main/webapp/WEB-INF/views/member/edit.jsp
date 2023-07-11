<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<head>
<meta charset="UTF-8">
<title>포케포케 : 회원 정보 수정</title>

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
			<li class="nav-item"><a class="nav-link active"
				href="/member/mypage/edit">회원 정보 수정</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/member/mypage/push_setting">알림 설정</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/member/mypage/edit_password">비밀번호 변경</a></li>
		</ul>
	</div>
	
	<!-- Checkout Section Begin -->
	<form id="editMemberForm" method="post">
		<section class="checkout spad">
			<div class="container">
				<div class="checkout__form">
					<div class="row gx-4 gx-lg-5 justify-content-center">
						<div class="col-md-10 col-lg-8 col-xl-7">
							<div class="1">
								<div style="margin-bottom: 50px;">
									<h4><b>회원정보수정</b></h4>
								</div>
								<div class="float-right">
									 <a class="float-right" href="/member/mypage/withdrawals"
	                                    style="color:#BDBDBD; font-size: 14px;">탈퇴하기</a>
								</div>
							</div>
							<br>
							<div class="checkout__input">
								<label for="email">이메일</label>
								<input type="email" class="id_input" id="email" name="memberId"
									placeholder="email@email.com" value="${member.memberId}"
									style="color: #b7b7b7;" readonly />
							</div>
							<div class="checkout__input name">
								<label for="name">이름</label>
								<input type="text" class="name_input" id="name" name="memberName"
								value="${member.memberName}" style="color: #000;" required />
								<div class="text-success nameError"></div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input birth">
										<label for="birthdate">생년월일</label>
										<input type="date" class="bitrh_input" id="birth" name="birth"
										style="color: #000; padding-right: 20px;" value="${member.birth}" required />
										<div class="text-success birthError"></div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input phone">
										<label for="phone">전화번호</label>
										<input type="tel" class="phone_input" id="phone" name="phone"
											maxlength="11" placeholder="'-'를 제외한 휴대폰 번호를 입력해 주세요"
											value="${member.phone}" style="color: #000;" required />
										<div class="text-success phoneError"></div>
									</div>
								</div>
							</div>
							<div class="centerplz">
								<button type="button" class="goodbtn" id="editSubmit" style="margin-top: 50px;">회원 정보 수정</button>
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
	<script src="/resources/js/name.birth.phone.js"></script>
	<script src="/resources/js/edit.submit.js"></script>

</body>
</html>
