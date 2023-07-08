/* 유효성 검사 통과유무 변수 */
	var nameCheck = false; // 이름 입력
	var birthCheck = false; // 생일 입력
	var phoneCheck = false; // 번호 입력

/* 이름 입력 시 */
	$('#name').on('input', function(){
		nameInputCheck();
	});
	
/* 생일 입력 시 */
	$('#birth').on('input', function(){
		birthInputCheck();
	});

/* (전화번호 입력 시) 전화번호 형식 유효성 체크 */
	$('#phone').keyup(function(event){
    	var inputVal = $(this).val();
    	$(this).val(inputVal.replace(/[^0-9]/gi,''));
    	phoneInputCheck();
	}); // 전화번호 형식 유효성 함수 끝
	
/* 유효성 검사*/
/* 이름 입력 유효성 검사 */
	function nameInputCheck() {
		var name = $('#name').val();
		
		if(name == '') {
			$('.name .nameError').html('이름을 입력해주세요.');
			$('.name .nameError').removeClass('text-success').addClass('text-danger');
			nameCheck = false;
			return false;
		}else {
			$('.name .nameError').html('');
			$('.name .nameError').removeClass('text-danger').addClass('text-success');
		}
		nameCheck = true;
	}; // nameInputCheck 함수 끝
	
/* 생일 입력 유효성 검사 */
	function birthInputCheck() {
		var birth = $('#birth').val();
		
		if(birth == '') {
			$('.birth .birthError').html('생년월일을 입력해주세요.');
			$('.birth .birthError').removeClass('text-success').addClass('text-danger');
			birthCheck = false;
			return false;
		}else {
			$('.birth .birthError').html('');
			$('.birth .birthError').removeClass('text-danger').addClass('text-success');
		}
		birthCheck = true;
	}; // birthInputCheck 함수 끝
	
/* 전화번호 입력 유효성 검사 */
	function phoneInputCheck() {
		var phone = $('#phone').val();
		
		if(phone == '') {
			$('.phone .phoneError').html('전화번호를 입력해주세요.');
			$('.phone .phoneError').removeClass('text-success').addClass('text-danger');
			phoneCheck = false;
			return false;
		}else {
			$('.phone .phoneError').html('');
			$('.phone .phoneError').removeClass('text-danger').addClass('text-success');
		}
		phoneCheck = true;
	}; // phoneInputCheck 함수 끝