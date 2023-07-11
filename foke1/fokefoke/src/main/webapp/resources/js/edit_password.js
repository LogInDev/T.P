/* 유효성 검사 통과유무 변수 */
	var pwCheck = false; // 비번 입력
	var pwFormatCheck = false; // 비번 입력 형식
	var pwCorCheck = false; // 비번 확인 입력
	var pwCorFormatCheck = false; // 비번 확인 일치
	
	$(document).ready(function(){
		/* 비밀번호 변경 버튼(비밀번호 변경 작동) */
		$('#editPw').click(function(){
			
	        /* 최종 비밀번호 유효성 검사 */
	       	pwInputCheck();
	        if(pwCheck) pwFormCheck();
			if(pwCheck == false || pwFormatCheck == false) {
	        	$('#password').focus();
	        	return false;
			}
	        if(pwFormatCheck) pwCorInputCheck();
			if(pwCorCheck) pwCorFormCheck();
			if(pwCorFormatCheck == false) {
				$('#passwordConfirm').focus();
				return false;
			}else {
	    		$('#editPasswordForm').attr('action', '/member/mypage/edit_password');
				$('#editPasswordForm').submit();
				alert('비밀번호 변경이 완료되었습니다.');
	    	}
		}); // 버튼 함수 종료
	}); // 레디 함수 종료