<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<head>
<meta charset="UTF-8">
<title>포케포케 : 비밀번호 확인</title>

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
<jsp:include page="/WEB-INF/views/header.jsp" />
<body class="text-center">
<div class="loginbody">
	<main class="form-signin w-100 m-auto">
		<form class="check_password_form" onsubmit="return false">
			<div class="section-title">
					<h2>비밀번호 확인</h2>
				<div class="breadcrumb__links">
					<p>등록한 비밀번호를 재입력 해주세요.</p>
				</div>
			</div>
			<div class="checkout__input">
				<input type="password" class="checkout__input" id="floatingPassword"
					name="memberPw" onKeyUp="chkPW()" placeholder="비밀번호 입력"
					style="color:#000;" required/>
				<span class="id_input_re_2">비밀번호를 입력해주세요.</span>
				<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				<label for="floatingInput"></label>
			</div>
			<button class="goodbtn" id="submit" type="button">확인</button>
			<div class="centerplz">
				<div class="product__details__btns__option">
					<p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
				</div>
			</div>
		</form>
	</main>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp" />
	
<script>
	/* 유효성 검사 통과유무 변수 */
	var pwck = false;
		
	$(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
	    $('#submit').click(function(){
	    	var memberPw = $('#floatingPassword').val(); // 비밀번호 입력란
	    	var data = {
	    		memberId: "${memberId}", // memberId 값을 추가
	    		memberPw: memberPw // 비밀번호 값을 추가
	    	};
		    	
	    	 /* 비밀번호 유효성검사 */
	        if(pwck == false){
		        $('.pwck_input_re_2').css('display', 'none');
	        	$('.id_input_re_2').css('display','block');
	        	$('#floatingPassword').focus();
	        }else{
	            $.ajax({
		            type: "POST",
	                url: "/member/memberPwChk", // 서버의 Java 컨트롤러의 URL
	                data: data,
	                success : function(result){
	    				if(result == 'fail'){
	       					$('.pwck_input_re_2').css('display', 'block');
	        				$('#floatingPassword').focus();
	        			}else{
	        				location.href="edit";
	        			}
	        		} /* success 종료 */
	        	}); // ajax 종료
			}
		}); // 버튼 클릭 끝
	}); // 레디 끝
		
	function chkPW(){
		var memberPw = $("#floatingPassword").val();
			 
		if(memberPw != '') {
			$('.id_input_re_2').css('display', 'none');
			pwck = true;
		}else {
			$('.id_input_re_2').css('display','block');
	        $('.pwck_input_re_2').css('display', 'none');
	        pwck = false;
		}
	} // chkPW()함수 끝
	</script>
</body>
</html>
