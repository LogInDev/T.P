<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포케포케 : 가입완료</title>

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
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>회원가입</h2>
                        <div class="breadcrumb__links">
                            <a style="color: #afafaf;"><span style="color: #afafaf;">01 정보입력</span></a>
                        	<span style="font-weight: 700; color: #469543;">02 가입완료</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
<section class="checkout spad">
	<div class="container">
		<div class="checkout__form">
			<div class="row gx-4 gx-lg-5 justify-content-center">
					<div class="centerplz2" style="text-align:center;">
						<h4><b>포케포케의 가족이 되신 것을</b></h4>
						<h4><b>환영합니다.</b></h4>
					</div>
					<div class="section_subway1">
						<div class="utilization1">
							<p>
							지금 바로
							<br>
							포케포케를!
							</p>
							<a class="btn1" href="/store/list">
							<span>주문하기</span>
							</a>
						</div>
						<div class="utilization1">
							<p>
							500년 역사를 가진
							<br>
							No.1 포케포케
							</p>
							<a class="btn1" href="/">
							<span>홈으로</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>