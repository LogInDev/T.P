<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
	integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<!-- 필수 입력 값 체크 -->
<script type="text/javascript">
	function checkForm() {
		var gender = document.querySelectorAll('input[type=radio][name=gender]');
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			document.newMember.id.focus();
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			document.newMember.password.focus();
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호와 동일하게 입력하세요.");
			return false;
		}
		
		if (!document.newMember.name.value) {
			alert("이름을 입력하세요");
			document.newMember.name.focus();
			return false;
		}
		if (gender[0].checked==false && gender[1].checked==false) {
			alert("성별을 선택하세요.");
			return false;
		}
		
		if (!document.newMember.mail1.value) {
			alert("이메일을 입력하세요");
			document.newMember.mail1.focus();
			return false;
		}
		
		if (!document.newMember.phone.value) {
			alert("전화번호를 입력하세요");
			document.newMember.phone.focus();
			return false;
		}
		
		if (!document.newMember.address.value) {
			alert("주소을 입력하세요");
			document.newMember.address.focus();
			return false;
		}
	}
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open(
				"http://localhost:8080/WebMarket/address/jusoPopup.jsp",
				"pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	function jusoCallBack(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		let addr = document.querySelector('#extraAddr');
		addr.value = roadFullAddr;
		/* document.form.roadFullAddr.value = roadFullAddr; */

	}
</script>
<script>
const getAJAX = function(){
	const id = $('#id').val();
	if(id == ""){
		alert('ID 넣어주세요');
		$('#id').focus();
		return;
	}
    $.ajax({
        type:'GET', //POST, DELETE, PUT 으로 변경 가능.
        url:'./IdCheck.jsp',
        dataType :'json',
        data : {id},
        success : function(resp) {
        	//alert(resp);
        	//alert(resp["status"]);
			if(resp["status"]){
	    		$('#true').show();
	    		$('#false').hide();
	    		$('#submit').attr("disabled", true);
			}else{
				$('#true').hide();
	    		$('#false').show();
	    		$('#submit').attr("disabled", false); 
			};
        },
        error:function(request,status, error){
            console.log(request,status, error);
        }
    });//key:value를 바로 넣을 수 있게 함.
};
//$(document).ready()는 생략 가능
$(function(){
    $('#true').hide();
    $('#false').hide();
    $('#submit').attr("disabled", true);  
	 $('#idcheckBtn').on('click',function () {
		 $('#hidden').hide();
    	//let id = $('#id').val();
        getAJAX();
    });
    
});
</script>
<script type="text/javascript">
let passBtn = (function (){
	let isShow = true;
	return function(){
	$('#password').attr("type", isShow ? "text" : "password");
	isShow = !isShow;
	};
	})();
let passCheckBtn = (function (){
	let isShow = true;
	return function(){
	$('#password_confirm').attr("type", isShow ? "text" : "password");
	isShow = !isShow;
	};
	})();
</script>
<style type="text/css">
input.btn-image {
	margin: 0px;
	height: 23px;
	padding: 3px 22px 1px 8px;
	border: 0px solid #B6B6B6;
	background-image: url('../resources/images/pass.png');
}
</style>
<title>회원 가입</title>

</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>

	<div class="container">
		<form name="newMember" class="form-horizontal"
			action="/WebMarket/AddMember.do" method="post"
			onsubmit="return checkForm()">
			<div class="row">
				<label class="col-sm-2" for="id">ID</label> <label class="col-sm-3 "><input
					name="id" id="id" type="text" class="form-control" placeholder="id"></label>
				<label class="col-sm-6"><input type="button" id="idcheckBtn"
					value="ID 중복체크"> <span id="hidden" style="color: red;">ID
						중복체크는 필수입니다.</span> <span id="true">중복된 ID입니다.</span> <span id="false">사용가능한
						ID입니다.</span></label>
			</div>
			<div class="row">
				<label class="col-sm-2" for="password">비밀번호</label> <label
					class="col-sm-3"><input name="password" id="password"
					type="password" class="form-control" placeholder="password"></label>
				<label class="col-sm-2"><input type="button"
					class="btn-image" onclick="passBtn()" value=""></label>
			</div>
			<div class="row">
				<label class="col-sm-2" for="password_confirm">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" id="password_confirm"
						type="password" class="form-control"
						placeholder="password confirm">
				</div>
				<label class="col-sm-2"><input type="button"
					class="btn-image" onclick="passCheckBtn()" value=""></label>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2" for="name">성명</label>
				<div class="col-sm-3">
					<input name="name" id="name" type="text" class="form-control"
						placeholder="name">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<input name="gender" type="radio" value="남" /> 남 <input
						name="gender" type="radio" value="여" /> 여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2" for="birthyy">생일</label>
				<div class="col-sm-4  ">
					<input type="text" name="birthyy" id="birthyy" maxlength="4"
						placeholder="년(4자)" size="6"> <select name="birthmm">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> <input type="text" name="birthdd" maxlength="2" placeholder="일"
						size="4">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2" for="mail1">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" id="mail1" maxlength="50">@
					<select name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2" for="phone">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" id="phone" type="text" class="form-control"
						placeholder="phone">

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input style="margin-bottom: 10px;" type="text" id="extraAddr"
						name="address" size="50" required readonly />
					<button type="button" id="addrBtn" name="addrBtn"
						onclick="goPopup();"
						style="cursor: pointer; margin-bottom: 10px; background-color: #fff">주소찾기</button>


				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" id="submit" class="btn btn-primary "
						value="등록 "> <input type="reset" class="btn btn-primary "
						value="취소 " onclick="reset()">
				</div>
			</div>
		</form>
	</div>
</body>
</html>