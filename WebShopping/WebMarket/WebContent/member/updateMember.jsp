<%@page import="mvc.model.MemberDAO"%>
<%@page import="mvc.model.MemberDTO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<%
	MemberDTO dto = new MemberDTO();
	MemberDAO dao = new MemberDAO();
	System.out.println("//////////" + dto);
%>
<c:set var="sessionId" value="${sessionScope.sessionId }"></c:set>
<c:set var="dao" value="<%=dao %>" />
<c:set var="dto" value="${dao.selectView(sessionId) }" />
<script type="text/javascript">
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
<title>회원 수정</title>
</head> 
<body onload="init()">
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 수정</h1>
		</div>
	</div>
	<c:set var="mail1" value="${dto.mail.split('@')[0]}" />
	<c:set var="mail2" value="${dto.mail.split('@')[1]}" />

	<c:set var="year" value="${dto.birth.split('/')[0]}" />
	<c:set var="month" value="${dto.birth.split('/')[1]}" />
	<c:set var="day" value="${dto.birth.split('/')[2]}" />
	<div class="container">
		<form name="newMember" class="form-horizontal"
			action="/WebMarket/UpdateMember.do" method="post"
			onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
				<input type="hidden" name="id" value="${dto.id }">
				<input  type="text" class="form-control" placeholder="id" value="<c:out value='${dto.id }'/>" disabled >
				</div>
			</div>
			<div class="row">
				<label class="col-sm-2" for="password">비밀번호</label> 
				<label class="col-sm-3"><input name="password" id="password"
					type="password" class="form-control" placeholder="password" value="${dto.password }"/> </label>
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
					<input name="name" id="name" type="text" class="form-control" placeholder="name" value="${dto.name }" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<c:set var="gender" value="${dto.gender }" />
					<input name="gender" type="radio" value="남"	<c:if test="${dto.gender.equals('남')}"> <c:out value="checked" /> </c:if> >남 
					<input name="gender" type="radio" value="여"	<c:if test="${dto.gender.equals('여')}"> <c:out value="checked" /> </c:if> >여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2" for="birthyy">생일</label>
				<div class="col-sm-4  ">
					<input type="text" name="birthyy" id="birthyy" maxlength="4" placeholder="년(4자)" 	size="6" value="${year}"> 
						<select name="birthmm"	id="birthmm">
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
					</select> <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" value="${day}">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2" for="mail1">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" id="mail1" maxlength="50" value="${mail1}">@
					<select name="mail2" id="mail2">
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
					<input name="phone" id="phone" type="text" class="form-control" placeholder="phone" value="<c:out value='${dto.phone}'/>">
				</div>
			</div>

			<div class="form-group  row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input style="margin-bottom: 10px;" type="text" id="extraAddr"
								name="address" size="50" value="<c:out value='${dto.address}'/>" required readonly />
								<button type="button" id="addrBtn" name="addrBtn"
									onclick="goPopup();"
									style="cursor: pointer; margin-bottom: 10px; background-color: #fff">주소찾기</button>
				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="회원수정 "> 
					<a href="/WebMarket/DeleteMember.do?id=${dto.id }"  class="btn btn-primary">회원탈퇴</a>
				</div>
			</div>
		</form>	
		</div>
</body>
</html>
<script type="text/javascript">
	function init() {
		setComboMailValue("${mail2}");
		setComboBirthValue("${month}");
	}

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		for (i = 0, j = selectMail.length; i < j; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true; 
				break;
			}
		}
	}
	function setComboBirthValue(val) {
		var selectBirth = document.getElementById('birthmm'); 
		for (i = 0, j = selectBirth.length; i < j; i++){
			if (selectBirth.options[i].value == val){
				selectBirth.options[i].selected = true; 
				break;
			}
		}
	}
	function checkForm() {
		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>