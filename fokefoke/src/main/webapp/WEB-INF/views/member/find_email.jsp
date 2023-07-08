<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
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
<body class="text-center">
<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="loginbody">
	<main class="form-signin w-100 m-auto">
		<div class="section-title">
			<div class="breadcrumb__links">
				<p>회원정보에 등록한<br>이름과 전화번호를 입력해주세요.</p>
			</div>
		</div>
		<div class="checkout__input">
			<input type="text" class="form-control" id="memberName"
				name="memberName" onKeyUp="chkName()" placeholder="이름"
				style="color: #000;" required/>
			<input type="tel" class="form-control" id="phone"
				name="phone" maxlength="11" placeholder="전화번호"
				style="color: #000; margin-top: -15px;"
				required/>
			<span class="id_input_re_2">이름을 입력해주세요.</span>
			<span class="pwck_input_re_2">'-'를 제외한 휴대폰 번호를 입력해주세요.</span>
			<span class="pwck_input_re_3">일치하는 아이디가 존재하지 않습니다.</span>
		</div>
			<button type="button" class="goodbtn" id="findIdSubmit">
				다음
			</button>
		<div class="centerplz">
			<div class="product__details__btns__option">
				<p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
			</div>
		</div>
	</main>
	<form id="findEmailForm" method="post">
	<input type="hidden" name="memberId">
	</form>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp" />

	<script>
	/* 유효성 검사 통과유무 변수 */
	var nameCk = false; // 이름 입력 확인
	var phoneCk = false; // 번호 입력 확인
	var findIdCk = false; // 최종 아이디 확인
		
	$(document).ready(function(){
		console.log('e');
			
		//다음 버튼(아이디 찾기 기능 작동)
		$("#findIdSubmit").click(function(){
	    	var memberName = $('#memberName').val(); // 이름 입력란
	    	var phone = $('#phone').val(); // 번호 입력란
			var data = {
				memberName : memberName,
				phone : phone
			};
    	
			/* 아이디 입력 유효성 검사 */
		    if(memberName == ''){
		    	$('.pwck_input_re_2').css('display', 'none');
		    	$('.id_input_re_2').css('display','block');
		        $('#memberName').focus();
		        nameCk = false;
		        return false;
		    }else {
		    	nameCk = true;
		    	
				/* 번호 입력 유효성 검사 */
			    chkPhone();
				if(phoneCk == false){
					$('#phone').focus();
					return false;
				}
		    }
				
			if(nameCk && phoneCk) { // 입력값이 있을 때
				$.ajax({
					type : "post",
					url : "/member/findId",
					data : data,
					success : function(result){
						if(result == 'fail'){
							$('.pwck_input_re_3').css('display','block');
							findIdCk = false;
							return false;
								// 체크 실패시 처리 로직
								// 모달 띄울까봐 ...
						}else{
							$("input[name='memberId']").val(result);
							findIdCk = true;
							
							/* 최종 유효성 체크 */
						    if(memberName && phoneCk && findIdCk){
							    $("#findEmailForm").attr("action", "/member/findId/success");
							    $("#findEmailForm").submit();
						    }
							//$("#findEmailForm").attr("action", "/member/findId/success");
						    //$("#findEmailForm").submit();
							// 체크 성공시 처리 로직
						}
					} // success 종료
				});	// ajax 종료
			} // if문 종료
		}); // 버튼 클릭 함수 종료
	}); // 레디 끝
	
	/* (전화번호 입력 시) 전화번호 형식 유효성 체크 */
	$('#phone').keyup(function(event){
		var memberName = $('#memberName').val(); // 이름 입력란
    	var inputVal = $(this).val();
    	$(this).val(inputVal.replace(/[^0-9]/gi,''));
    	
    	$('.id_input_re_2').css('display', 'none');
	    chkPhone();
	}); // 전화번호 형식 유효성 함수 끝
	
	function chkName(){
		var memberName = $('#memberName').val();
			
		$('.pwck_input_re_3').css('display','none');
			 
		if(memberName != "") {
			$('.id_input_re_2').css('display', 'none');
			nameCk = true;
		}else {
			$('.id_input_re_2').css('display','block');
		    $('.pwck_input_re_2').css('display', 'none');
		    $('.pwck_input_re_3').css('display', 'none');
		    nameCk = false;
		}
	} // chkName()함수 끝
	
	function chkPhone(){
		var phone = $('#phone').val();
		
		$('.pwck_input_re_3').css('display','none');
			 
		if(phone == '') {
			$('.pwck_input_re_2').css('display', 'block');
			phoneCk = false;
	    }else{
	    	$('.pwck_input_re_2').css('display','none');
			$('.pwck_input_re_3').css('display','none');
			phoneCk = true;
	    }
	} // chkPhone()함수 끝
	
	</script>
</body>
</html>
