/* 입력된 마케팅 수신 동의 값 */
var consentPush = parseInt("${member.consentPush}");
var consentEmail = parseInt("${member.consentEmail}");
var consentSMS = parseInt("${member.consentSMS}");

/* 마케팅 동의 */
if ($("#consentPush").is(":checked")) {
	$("#consentPush_hidden").prop("disabled", true);
}
if ($("#consentEmail").is(":checked")) {
	$("#consentEmail_hidden").prop("disabled", true);
}
if ($("#consentSMS").is(":checked")) {
	$("#consentSMS_hidden").prop("disabled", true);
}

$(document).ready(function() {
	
	console.log('왜안되냐고요또');
	
	/* 값 받아와서 체크박스 체크 */
	if (consentPush === 0) {
		$("#consentPush_hidden").prop("checked", true);
	} else if (consentPush === 1) {
		$("#consentPush").prop("checked", true);
	}

	if (consentEmail === 0) {
		$("#consentEmail_hidden").prop("checked", true);
	} else if (consentEmail === 1) {
		$("#consentEmail").prop("checked", true);
	}

	if (consentSMS === 0) {
		$("#consentSMS_hidden").prop("checked", true);
	} else if (consentSMS === 1) {
		$("#consentSMS").prop("checked", true);
	}
}); // 레디 끝

/* div 안의 모든 체크박스 이벤트 발생 시 */
$('.checkout__input__checkbox input[type="checkbox"]').on('change', function() {
	consentPushSet();
});

/* 푸시 설정 변경 */
function consentPushSet() {
	var push = $("input[name='consentPush']:checked").val(); // 체크박스 값
	var email = $("input[name='consentEmail']:checked").val(); // 체크박스 값
	var sms = $("input[name='consentSMS']:checked").val(); // 체크박스 값
	var data = {
		memberId: "${memberId}",
		consentPush: push,
		consentEmail: email,
		consentSMS: sms
	}; // '컨트롤에 넘길 데이터 이름' : '데이터(name=consentPush에 입력되는 값)'

	$.ajax({
		type: 'post',
		url: '/member/consentPushSet',
		data: data,
		beforeSend: addCsrfTokenToAjaxRequest,
		success: function(result) {
			if (result == 'fail') { // 업뎃 실패
				alert('설정 변경을 실패했습니다. 페이지를 새로고침 해주세요.');
			} else { // 업뎃 성공
				alert('변경 완료 되었습니다.');
			}
		} /* success 종료 */
	});	/* ajax 종료 */
}; // consentPushSet 끝


// addCsrfTokenToAjaxRequest.js
$.getScript('/js/addCsrfTokenToAjaxRequest.js');