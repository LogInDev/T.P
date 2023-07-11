<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<head>
<meta charset="UTF-8">
<title>포케포케 : 로그인</title>

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
		<form id="login_form" method="post">
			<div class="section-title">
				<h2>LOGIN</h2>			
				<div class="breadcrumb__links">
					<p>포케포케 회원으로 로그인하시면 제공하는<br>다양한 서비스를 이용할 수 있습니다.</p>
				</div>
			</div>
			<div class="checkout__input">
				<input type="text" class="form-control" id="floatingInput"
					name="memberId" placeholder="이메일 입력"
					style="color: #000;" required />
				<input type="password" class="form-control" id="floatingPassword"
					name="memberPw" placeholder="비밀번호 입력"
					style="color: #000; margin-top: -15px;" required />
			</div>
			<div class="checkbox mb-3">
				<label for="checkId" style="font-size: 14px;">
					<input type="checkbox" value="remember-me" id="checkId" name="checkId">
					아이디 저장
				</label>
			</div>
			<button class="goodbtn" id="loginSubmit" type="submit">로그인
			</button>
			<div class="centerplz" style="margin-top: 30px;">
				<div class="product__details__btns__option">
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link" href="/member/find_email" id="findIdBtn">아이디 찾기</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/find_password" id="findPwBtn">비밀번호 찾기</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/join">회원가입</a></li>
					</ul>
				<p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
				</div>
			</div>
		</form>
	</main>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp" />

    <script>
    $(document).ready(function() {
    	var result = parseInt("${result}");
    	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
  	    var key = getCookie("key");
  	    $("#floatingInput").val(key); 

    	/* 로그인 버튼 클릭 메서드 */
    	$('#loginSubmit').click(function() {
  	  		var memberId = $('#floatingInput').val();
    		var memberPw = $('#floatingPassword').val();

      		if(!memberId){ //아이디를 입력하지 않았을 경우
    			alert("아이디를 입력해주세요.");
    			$('#floatingInput').focus(); //커서를 해당 input 요소로 이동
    	    	return false; // form submit 방지
    	    }else if(!memberPw){ //비밀번호를 입력하지 않았을 경우
    	    	alert("비밀번호를 입력해주세요.");
    	   		$('#floatingPassword').focus(); //커서를 해당 input 요소로 이동
    	   		return false; // form submit 방지
    	    }
      		
    		// 로그인 메서드 서버 요청
    		$('#login_form').attr('action', '/member/login.do');
    		$('#login_form').find('[type="submit"]').trigger('click');
    	});

    	// result 변수의 값을 확인하여 경고창 출력
    	if(result === 0){ // 아이디 또는 비밀번호가 잘못된 경우
    		alert("아이디 혹은 비밀번호가 잘못되었습니다.");
    	}
    	
    	// 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
  	    if($("#floatingInput").val() != ""){ 
  	    	$("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
  	    }
  	     
  	    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
  	        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
  	            setCookie("key", $("#floatingInput").val(), 7); // 7일 동안 쿠키 보관
  	        }else{ // ID 저장하기 체크 해제 시,
  	            deleteCookie("key");
  	        }
  	    });
  	     
  	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
  	    $("#floatingInput").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
  	    	if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
  	            setCookie("key", $("#floatingInput").val(), 7); // 7일 동안 쿠키 보관
  	        }
  	    });
    });
    
 	// 쿠키 저장하기 
	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	// 쿠키 삭제
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
     
	// 쿠키 가져오기
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) { // 쿠키가 존재하면
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
				end = cookieData.length;
                console.log("end위치  : " + end);
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
	</script>
</body>
</html>
