<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>매장 수정하기</title>

<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
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
<jsp:include page="/WEB-INF/views/header.jsp" />
<body>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>매장등록</h4>
						<div class="breadcrumb__links">
							<a href="/">Home</a> <a href="./shop.html">매장찾기</a> <span>매장등록</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form action="/store/register" method="post" name="form1">
					<div class="row">
						<div class="col-lg-12 col-md-12">
							<h6 class="coupon__code">
								<span class="icon_tag_alt"></span> 매장 등록시 제대로 검수 부탁드립니다.
							</h6>
							<h6 class="checkout__title">포케포케 매장등록</h6>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											<span>* </span>매장이름
										</p>
										<input type="text" id="storeName" name="storeName">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											<span>* </span>매장번호
										</p>
										<input type="text" id="storeTel" name="storeTel">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											<span>* </span>우편번호
										</p>
										<input type="text" name="zipcode" readonly>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											<span>* </span>매장주소
										</p>
										<input type="button" id="btn" value="우편번호 검색">
									</div>
								</div>
							</div>
							<input type="hidden" name="storeAddress" id="storeAddress">
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											<span>* </span>주소
										</p>
										<input type="text" name="addr1" id="addr1" readonly>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											<span>* </span>상세주소
										</p>
										<input type="text" name="addr2" id="addr2">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											<span>* </span>매장오픈
										</p>
										<input type="text" id="storeOpen" name="storeOpen">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											<span>* </span>매장마감
										</p>
										<input type="text" id="storeClose" name="storeClose">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											<span>* </span>매장위도
										</p>
										<input type="text" id="storeLat" name="storeLat">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											<span>* </span>매장경도
										</p>
										<input type="text" id="storeLng" name="storeLng">
									</div>
								</div>
							</div>
							<div align="center">
								<button type="submit" value="Submit"
									onclick="return form_check();"
									style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">등록하기</button>
							<button type="button" onclick="location.href='/store/list'" style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">목록보기</button>
							</div>

						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />

	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>

	function form_check() {
		  var storeName = document.getElementById("storeName");
		  var storeTel = document.getElementById("storeTel");
		  var storeOpen = document.getElementById("storeOpen");
		  var storeClose = document.getElementById("storeClose");
		  var storeLat = document.getElementById("storeLat");
		  var storeLng = document.getElementById("storeLng");

		  if (storeName.value === "") {
		    alert("매장 이름을 입력해주세요.");
		    storeName.focus();
		    return false;
		  }
		  
		  if (storeTel.value === "") {
			    alert("매장 번호를 입력해주세요");
			    storeTel.focus();
			    return false;
		  }
		  
		  if (addr1.value === "") {
			    alert("우편번호를 입력주세요.");
			    addr1.focus();
			    return false;
		  }
		  
		  if (addr2.value === "") {
			    alert("상세주소를 입력해주세요");
			    addr2.focus();
			    return false;
		  }
		  if (storeOpen.value === "") {
			    alert("매장 오픈시간을 입력해주세요");
			    storeOpen.focus();
			    return false;
		  }
		  if (storeClose.value === "") {
			    alert("매장 마감시간을 입력해주세요");
			    storeClose.focus();
			    return false;
		  }
		  if (storeLat.value === "") {
			    alert("매장 위도 위치를 입력해주세요");
			    storeLat.focus();
			    return false;
		  }
		  if (isNaN(document.getElementById("storeLat").value)) {
			    alert("위도는 숫자만 입력해주세요");
			    storeLat.focus();
			    return false;
		  }

		  if (storeLng.value === "") {
			    alert("매장 경도 위치를 입력해주세요");
			    storeLng.focus();
			    return false;
		  }
		  if (isNaN(document.getElementById("storeLng").value)) {
			    alert("경도는 숫자만 입력해주세요");
			    storeLng.focus();
			    return false;
		  }
		  
		  document.form_check.submit();

		}


	
	
	const btn = document.querySelector("#btn");
	btn.addEventListener("click", () => {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	        	let fullAddr = '';
	        	let extraAddr = '';
	        	
	        	if(data.userSelectedType === 'R'){
	        		fullAddr = data.roadAddress;
	        	}else {
	        		fullAddr = data.jibunAddress;
	        	}
	        	
	        	if(data.userSelectedType === 'R'){
	        		if(data.bname !== ''){
	        			extraAddr += data.bname;
	        		}
	        		if(data.buildingName !== ''){
	        			extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	        		}
	        		fullAddr += (extraAddr !== ''? ' (' + extraAddr + ')' : '');
	        	}
	        	
	        	document.form1.addr1.value = fullAddr;
	        	document.form1.zipcode.value = data.zonecode;
	        	document.form1.addr2.focus();
	        	
	            var addr1 = document.getElementById("addr1").value;
	            var addr2 = document.getElementById("addr2").value;
	            var storeAddress = addr1 + " " + addr2;
	            document.getElementById("storeAddress").value = storeAddress;
	            
	            console.log(addr1);
	            console.log(addr2);
	            console.log(storeAddress);
	        }
	    }).open();
	});

	
	
</script>

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