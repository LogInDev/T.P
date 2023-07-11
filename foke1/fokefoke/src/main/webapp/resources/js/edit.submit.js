/* 유효성 검사 통과유무 변수 */
	var nameCheck = false; // 이름 입력
	var birthCheck = false; // 생일 입력
	var phoneCheck = false; // 번호 입력

	$(document).ready(function(){
	/* 회원 정보 수정 버튼(회원 정보 수정 기능 작동) */
		$("#editSubmit").click(function(){
			
	    /* 최종 유효성 검사 */
		/* 이름 유효성 검사 */
			nameInputCheck();
			if(nameCheck == false){
				$('#name').focus();
				return false;
			}
			
		/* 생일 유효성 검사 */
			birthInputCheck();
			if(birthCheck == false){
				$('#birth').focus();
				return false;
			}
			
		/* 전화번호 유효성 검사 */
			phoneInputCheck();
			if(phoneCheck == false){
				$('#phone').focus();
				return false;
			}
	        $("#editMemberForm").attr("action", "/member/mypage/edit");
	        $('#editMemberForm').submit();
    		alert("회원 정보가 수정되었습니다.");
		}); // 수정 버튼 클릭 종료
	}); // 레디 종료