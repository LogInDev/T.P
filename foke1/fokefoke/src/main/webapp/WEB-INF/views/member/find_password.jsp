<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<head>
<meta charset="UTF-8">
<title>포케포케 : 비밀번호 찾기</title>

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
<body class="text-center">
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="loginbody">
	<main class="form-signin w-100 m-auto">
		<div class="section-title">
			<div class="breadcrumb__links">
				<p>가입한 이메일 주소를 입력해주세요.</p>
			</div>
		</div>
		<div class="cart__discount">
			<form id="findPwForm" method="post">
			<input type="text" id="email" name="memberId" onKeyUp="chkID()"
			placeholder="이메일" style="color: #000; padding-right: 110px;" required/>
			<button type="button" class="primary-btn" id="idCkbutton">
				확인
			</button>
			</form>
			<span class="id_input_re_2" style="margin-top: 0px;">비밀번호를 재설정할 이메일 주소를 입력해주세요.</span>
			<span class="pwck_input_re_2" style="margin-top: 0px;">입력하신 아이디를 찾을 수 없습니다.</span>
		</div>
			<button type="button" class="goodbtn" id="requestNumber" disabled>
				비밀번호 재발급
			</button>
		<div class="centerplz">
			<div class="product__details__btns__option">
				<p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
			</div>
		</div>
	</main>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp" />

	<script>
	/* 상태변화 따라서 바뀌는 css */
	var idCkBtn = $('#idCkbutton');
	/* 유효성 검사 통과유무 변수 */
	var idCk = false; // 아이디
		
	$(document).ready(function(){
		/* 확인 버튼(아이디 중복 체크) */
	    $('#idCkbutton').click(function(){
	    	var id = $('#email').val(); // id 입력란
			var data = {memberId : id} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
				
			if(idCk) { // 입력값이 있을 때

				$.ajax({
					type : 'post',
					url : '/member/memberIdChk',
					data : data,
					success : function(result){
						if(result != 'fail'){
							$('#email').focus();
							$('.pwck_input_re_2').css('display','block');
							setStyleidCkBtn(idCkBtn);
							// 아이디 체크 실패시 처리 로직
						}else{
							$('#idCkbutton').prop('disabled', true);
							$('#email').prop('readonly', true);
							$('#requestNumber').prop('disabled', false);
							$('.pwck_input_re_2').css('display','none');
							setStyleidCkBtn(idCkBtn);
							// 아이디 체크 성공시 처리 로직
						}
					}	/* success 종료 */
				});	/* ajax 종료 */
			} // if문 종료
		        
	    	 /* 아이디 유효성검사 */
	        if(id == ''){
	            $('.id_input_re_2').css('display','block');
	            $('#email').focus();
	            idCk = false;
	        }else{
	            $('.id_input_re_2').css('display', 'none');
	            idCk = true;
	        }
	    	//$("#find_password_form").attr("action", "/member/find_password");
	        //$("#find_password_form").submit();
	    }); // 버튼 클릭 함수 종료
	    
	    /* 비밀번호 재발급 버튼 */
	    $('#requestNumber').click(function(){
	    	var id = $('#email').val(); // id 입력란
			var data = {memberId : id} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
			
			$('#findPwForm').attr('action', '/member/findPw');
			$('#findPwForm').submit();
			
			alert('비밀번호가 재발급 되었습니다.');
	    }); // 재발급 버튼 끝
	}); // 레디 끝
		
	function chkID(){
		var id = $('#email').val();
			 
		if(id != '') {
			$('.id_input_re_2').css('display', 'none');
			idCk = true;
		}else {
			$('.id_input_re_2').css('display','block');
	        $('.pwck_input_re_2').css('display', 'none');
	        idCk = false;
		}
	}; // chkPW()함수 끝
	
	/* 확인 버튼 css 변화 */
	function setStyleidCkBtn($idCkBtn) {
		if($idCkBtn.is(':disabled')) {
			$idCkBtn.css('background-color', '#BDBDBD');
			$idCkBtn.css('border', '1px solid #BDBDBD');
			$idCkBtn.css('color', '#fff');
	  	}
	}; // 확인 버튼 css 끝
	
	</script>
</body>
</html>
