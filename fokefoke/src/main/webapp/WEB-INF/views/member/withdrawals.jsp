<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포케포케 : 회원탈퇴</title>

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
<section class="checkout spad">
	<div class="container">
		<div class="checkout__form">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div style="margin-bottom: 50px;">
						<h4><b>회원탈퇴</b></h4>
					</div>
					<form id="withdrawalsForm" method="post">
					<input type="hidden" name="memberId" value="${memberId}">
					<div style="font-weight:bold; font-size:18px; margin: 0px 0px 20px;">
						<span>아래 사항들을 확인하시고 회원탈퇴에 대해 다시 한 번 신중하게 결정해 주세요.</span>
					</div>
						<div class="blog__details__btns__item" style="padding: 25px 50px 30px; font-size: 15px;">
							<ul>
								<li style="margin: 10px 0px;">포케포케 포인트·쿠폰은 소멸되며 환불되지 않습니다.</li>
								<li style="margin: 10px 0px;">포케포케 구매 정보가 삭제됩니다.</li>
								<li style="margin: 10px 0px;">소비자보호에 관한 법률 제6조에 의거,계약 또는 청약철회 등에 관한 기록은 5년, 대금결제 및 재화등의 공급에 관한 기록은 5년, 소비자의 불만 또는 분쟁처리에 관한 기록은 3년 동안 보관됩니다. 동 개인정보는 법률에 의한 보유 목적 외에 다른 목적으로는 이용되지 않습니다.
								</li>
							</ul>
						</div>
						<div class="centerplz">
							<div class="checkout__input__checkbox">
								<label>위 내용을 모두 확인하였습니다.
								<input type="checkbox" class="consentPush_input" id="withdrawals">
									<span class="checkmark"></span>
								</label>
							</div>
						</div>
						<div class="row d-flex justify-content-center">
					        <button type="button" class="goodbtn" id="withdrawalSubmit" style="margin: 25px;">
					        회원탈퇴
					        </button>
					        <button type="button" class="notgoodbtn" id="cancel"
					        	onclick="location.href='javascript:history.back();'"
					        	style="margin: 25px;">
					        	취소
					        </button>
					   	</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/footer.jsp" />

<!-- 페이지에서 작동되는 함수들 -->
<script>
$(document).ready(function(){
	/* 회원탈퇴 버튼 클릭 시 */
	$("#withdrawalSubmit").click(function(){
	    
		/* 체크되었을 경우 폼을 서버로 제출 */
	    if ($("#withdrawals").is(":checked")) {
	    	$("#withdrawalsForm").submit();
	    	alert("회원탈퇴 되었습니다.");
	    }else{
	    	alert("확인 여부에 체크해주세요.");
	    }
	});
});
</script>
</body>
</html>