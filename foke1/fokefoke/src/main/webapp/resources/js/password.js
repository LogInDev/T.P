/* 유효성 검사 통과유무 변수 */
	var pwCheck = false; // 비번 입력
	var pwFormatCheck = false; // 비번 입력 형식
	var pwCorCheck = false; // 비번 확인 입력
	var pwCorFormatCheck = false; // 비번 확인 일치
	
 	/* 비밀번호 입력시 */ 
	$('#password').on('input', function(){
		pwInputCheck();
		if(pwCheck) pwFormCheck();
	});	/* function 종료 */

	/* 비밀번호 확인 입력시 */
	$('#passwordConfirm').on('input', function(){
		pwCorInputCheck();
		if(pwCorCheck) pwCorFormCheck();
	}); /* funchtion 종료 */
	
	/* 비밀번호 입력 유효성 검사 */
	function pwInputCheck() {
		var pw = $('#password').val();
		
		if(pw == '') {
			$('.password .pwError').html('비밀번호를 입력해주세요.');
			$('.password .pwError').attr('class', 'pwError text-danger');
			pwCheck = false;
			return false;
		}
		pwCheck = true;
	}; // pwInputCheck 함수 끝
	
	/* 비밀번호 입력 형식 유효성 검사 */
	function pwFormCheck() {
		var pw = $('#password').val();
		var pwCk = $('#passwordConfirm').val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			 
		if(pw.search(/\s/) != -1) {
			$('.password .pwError').html('비밀번호는 공백 없이 입력해주세요.');
		}else if(pw.length < 8 || pw.length > 20){
			$('.password .pwError').html('8자리 ~ 20자리 이내로 입력해주세요.');
		}else if(num < 0 || eng < 0 || spe < 0 ) {
			$('.password .pwError').html('영문,숫자, 특수문자를 혼합하여 입력해주세요.');
		}else {
			$('.password .pwError').removeClass('text-danger').addClass('text-success');
			pwFormatCheck = true;
			return false;
		}
		$('.password .pwError').removeClass('text-success').addClass('text-danger');
		pwFormatCheck = false;
	}; // pwFormCheck 함수 끝
	
	/* 비밀번호 확인 입력 유효성 검사 */
	function pwCorInputCheck() {
		var pwCk = $('#passwordConfirm').val();
		
		if(pwCk == '') {
			$('.passwordConfirm .pwCkError').html('확인을 위해 비밀번호를 한 번 더 입력해주세요.');
			$('.passwordConfirm .pwCkError').attr('class', 'pwCkError text-danger');
			pwCorCheck = false;
			return false;
		}
		pwCorCheck = true;
	}; // pwCorInputCheck 함수 끝;
	
	/* 비밀번호 확인 일치 유효성 검사 */
	function pwCorFormCheck() {
		var pw = $('#password').val();
		var pwCk = $('#passwordConfirm').val();
		
		if(pw != pwCk) {
			$('.passwordConfirm .pwCkError').html('비밀번호가 일치하지 않습니다.');
		}else {
			$('.passwordConfirm .pwCkError').removeClass('text-danger').addClass('text-success');
			pwCorFormatCheck = true;
			return false;
		}
		$('.passwordConfirm .pwCkError').removeClass('text-success').addClass('text-danger');
		pwCorFormatCheck = false;
	}; // pwCorFormCheck 함수 끝