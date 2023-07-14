function CheckAddProduct() {

var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var description = document.getElementById("description");
	var manufacturer = document.getElementById("manufacturer");
	var category = document.querySelectorAll('input[type=radio][name=p_category]');
	var gender = document.querySelectorAll('input[type=radio][name=p_gender]');
	var productImage = document.getElementById("productImage");
	
	// 상품명 체크
	if (name.value.length == 0) {
		alert("상품명을 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	// 상품 가격 체크
	if (unitPrice.value.length == 0) {
		alert("가격을 입력하세요.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	if (isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}

	if (unitPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.])?$/, unitPrice,
			"[가격]\n소수점은 입력할 수 없습니다."))
		return false;

	if (description.value.length == 0) {
		alert("상세설명을 입력하세요.");
		description.select();
		description.focus();
		return false;
	}
	
	if (manufacturer.value.length == 0) {
		alert("제조사를 입력하세요.");
		manufacturer.select();
		manufacturer.focus();
		return false;
	}
	
	if (category[0].checked==false && category[1].checked==false && category[1].checked==false) {
		alert("분류를 선택하세요.");
		category.select();
		return false;
	}
	
	if (gender[0].checked==false && gender[1].checked==false) {
		alert("성별을 선택하세요.");
		gender.select();
		return false;
	}
	
	if (productImage.value.length == 0) {
		alert("이미지를 등록하세요.");
		productImage.select();
		productImage.focus();
		return false;
	}
	
	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	 document.newProduct.submit()
}