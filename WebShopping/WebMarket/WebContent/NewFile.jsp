<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="menu.jsp" />
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
<style type="text/css">
div#backbody {
	background-color: #f5f5f0;
	font-size: 13pt;
	min-width: 1480px;
	width: 100%;
	padding: 50px 0;
}

#frame {
	width: 80%;
	margin: 0 auto;
	padding: 50px 50px;
	background-color: #fff;
}

#frame2 {
	border-bottom: solid 1px #e0e0eb;
	padding: 20px 0;
}

.home {
	float: right;
	clear: both;
}

table.calculation1 {
	clear: both;
	border: solid 1px #e0e0eb;
	border-collapse: collapse;
	background-color: #f5f5f0;
	width: 100%;
	font-size: 10pt;
}

table.calculation1 th {
	border: solid 1px #e0e0eb;
	padding: 10px 0;
	text-align: center;
}

table.calculation1 td {
	border: solid 1px #e0e0eb;
	text-align: center;
}

table.calculation2 {
	border: solid 1px #e0e0eb;
	border-collapse: collapse;
	background-color: #f5f5f0;
	width: 100%;
	font-size: 10pt;
}

table.calculation2 th {
	border: solid 1px #e0e0eb;
	text-align: center;
}

table.calculation2 td {
	border: solid 1px #e0e0eb;
	text-align: center;
}

.price {
	font-size: 20pt;
	font-weight: bold;
}

.lifont {
	font-size: 10pt;
	color: gray;
}

.delivery {
	border: solid 1px gray;
	border-collapse: collapse;
	width: 100%;
	font-size: 12pt;
}

table.delivery th, td {
	border: solid 1px #e0e0eb;
	padding: 12px 10px;
}

.deliverytd {
	font-size: 12pt;
	background-color: #f5f5f0;
}

/* 결제카드 */
.payArea {
	height: 218px;
	position: relative;
	padding: 0 245px 0 0;
	border: 1px solid #777;
	color: #353535;
	line-height: 1.5;
}

.payment {
	border-right: solid 1px gray;
	float: left;
	width: 100%;
	height: 100%;
}

.total {
	float: right;
	width: 240px;
	margin: 0 -240px 0 0;
	text-align: right;
	background: #fbfafa;
	font-size: 11pt;
}

/* bootstrap 버튼 */
.btn {
	border: none;
	color: white;
	padding: 5px 10px;
	font-size: 13px;
	cursor: pointer;
	border-radius: 5px;
}

.default {
	background-color: #264d73;
	border: solid 1px gray;
	color: #fff;
}

.default:hover {
	background: #ddd;
}

.backBtn {
	background: #fff;
	border: solid 1px gray;
}

/* 선택상품 삭제,해외배송 장바구니로 이동float */
.btnfloat {
	float: left;
}

/* 선택상품 장바구니, 견적서출력 float */
.btnfloat2 {
	float: right;
}

/* 혹시몰라서 clear 하나 줌  */
.clearboth {
	clear: both;
}
</style>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
</head>
<body>
<body>
	<div id="backbody">
		<div id="frame">
			<form name="form" id="form"
				action="/WebMarket/controller/ShippingInfo.do" method="post"
				onsubmit="return erchk();">
				<input type="hidden" name="memberId"
					value="${productMember[0].memberId}">
				<div id="frame2">
					<span style="font-size: 16pt; font-weight: bold">주문/결제</span> <span
						class="home">장바구니> 주문/결제</span> <span></span>
				</div>
				<br />

				<!-- 상품정보 테이블 -->
				<div>
					<table class="calculation1">
						<thead>
							<tr>
								<th colspan="10" style="text-align: left; padding-left: 10px">
									일반상품</th>
							</tr>
							<tr>
								<!-- <th><input type="checkbox" name="checkbox" id="check" /></th> -->
								<th><span>상품 이미지</span></th>
								<th style="width: 550px"><span>상품정보</span></th>
								<th>판매가</th>
								<th>수량</th>
								<!-- <th style="width: 100px">적립금</th> -->
								<th>배송구분</th>
								<th>배송비</th>
								<th>합계</th>
							</tr>
						</thead>

						<tbody>
							<c:set var="total" value="0" />
							<c:forEach items="${productMember}" var="row">
								<c:set var="total"
									value="${total +(row.productCount * row.p_unitPrice)}" />
								<tr style="height: 90px; background-color: #fff">
									<!-- <td
									style="text-align: left; text-align: center; border-right: none;">
									<input type="checkbox" name="checkbox" />
								</td> -->
									<td style="border-left: none; border-right: none"><img
										style="width: 45%" src="${row.p_fileName}" /></td>
									<td
										style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">
										${row.p_description}
										<p>
											<span><b>색상:</b> ${row.productColor}&nbsp;</span> <span><b>사이즈:</b>
												${row.productSize}&nbsp;</span> <span class="text-info"><b>상품이름:</b>${row.p_name}&nbsp;</span>
										</p>
									</td>
									<td><span style="padding-left: 10px"><fmt:formatNumber
												type="number" maxFractionDigits="3"
												value="${row.p_unitPrice}" /></span>원</td>

									<td style="width: 80px"><span>${row.productCount}</span></td>

									<!-- <td>=</td> -->
									<td>기본배송</td>
									<td>고정</td>
									<td><span><fmt:formatNumber type="number"
												maxFractionDigits="3"
												value="${row.p_unitPrice * row.productCount}" /></span>원</td>
								</tr>
							</c:forEach>
						</tbody>

						<tfoot>
							<tr style="height: 60px">
								<td colspan="5"
									style="border-right: none; text-align: left; padding-left: 10px;">
									<span>[기본배송]</span>
								</td>
								<td colspan="5"
									style="border-left: none; text-align: right; padding-right: 10px;">
									상품금액합계<span><fmt:formatNumber
											type="number" maxFractionDigits="3" value="${total}" /></span> + <span>배송비 2,500 = 총 합계</span>&nbsp;<span
									style="font-weight: bold"><fmt:formatNumber
											type="number" maxFractionDigits="3" value="${total + 2500}" /></span>
									></span>
								</td>
							</tr>
						</tfoot>
					</table>

					<!-- 총액 값 전달 -->
					<input type="hidden" name="totalPrice" value="${total+2500}">
					<div
						style="border: solid ipx #e0e0eb; border-right: none; border-left: none; padding: 11px 0; background-color: aqua;">
						<!-- <img src="#"
							style="margin-left: 5px; position: relative; top: 4.5px;"> -->
						<span style="font-size: 10pt; color: red;">* 상품의 옵션 및 수량
							변경은 상품상세 또는 장바구니에서 가능합니다.</span>
					</div>
				</div>

				<div
					style="margin: 10px 0; padding-bottom: 50px; border-bottom: solid 1px gray;">
					<!-- <span style="margin: 0 10px;" class="btnfloat">선택상품을</span>
					<button type="button" class="btn default btnfloat"
						style="background-color: gary; color: #fff;">x 삭제하기</button> -->
					<button type="button" class="btn default btnfloat2"
						onclick="javascript:history.back()">이전페이지></button>
					<span class="clearboth"></span>
				</div>
				<br /> <br />

				<!-- 배송정보 -->
				<span
					style="font-size: 12pt; display: inline-block; padding-bottom: 10px;">&nbsp;배송정보</span>
				<table class="delivery">
					<thead>

						<tr>
							<td class="deliverytd">배송지 선택</td>
							<td><label for="radio1"><input type="radio"
									name="bb" value="1" /> 회원정보와 동일</label><label for="radio2"><input
									type="radio" name="bb" value="2" /> 새로운배송지</label>&nbsp; <!-- button에 id나 name class 입력해줘야 할것 같다. -->
								<button type="button"
									style="background-color: #fff; cursor: pointer; border-width: 0px;"></button>
							</td>
						</tr>

						<tr>
							<td class="deliverytd">받으시는분&nbsp;<span style="color: red">*</span></td>
							<td><input type="text" id="addressee" name="addressee" /></td>
						</tr>

						<tr>
							<td class="deliverytd" id="deliverytd">주소&nbsp;<span
								style="color: red">*</span></td>
							<td>
								<!-- <input type="text" id="postnum1" size="10" maxlength="5" /> -->
								<!-- button에 이름이나 id name 정해야 한다 --> <!-- 원래 id, name "addr1" 이었다. -->
								<input style="margin-bottom: 10px;" type="text" id="extraAddr"
								name="extraAddr" size="50" required readonly />
								<button type="button" id="addrBtn" name="addrBtn"
									onclick="goPopup();"
									style="cursor: pointer; margin-bottom: 10px; background-color: #fff">주소찾기</button>
							</td>
						</tr>

						<tr>
							<td class="deliverytd">휴대전화&nbsp;<span style="color: red">*</span></td>
							<td><input type="text" size="5" id="phone1" name="phone1" />-<input
								type="text" size="5" id="phone2" name="phone2" />-<input
								type="text" size="5" id="phone3" name="phone3" /></td>
						</tr>
						<tr>
							<td class="deliverytd">이메일&nbsp;<span style="color: red">*</span></td>
							<td><input type="text" id="email1" name="email1" />@<input
								id="domainName" name="domainName" type="text" />&nbsp; <select
								id="emailChoice" style="height: 20px;">
									<option>-이메일선택-</option>
									<option>daum.net</option>
									<option>naver.com</option>
									<option>yahoo.com</option>
									<option>gmail.com</option>
							</select> <span style="font-size: 10pt; color: gray;">
									<p>
										이메일을 통해 주문처리과정을 보내드립니다.<br /> 이메일 주소창에는 반드시 수신가능한 이메일주소를 입력해
										주세요.
									</p>
							</span></td>
						</tr>

						<tr>
							<td class="deliverytd">배송메세지</td>
							<td><textarea rows="5" cols="100" id="orderMsg"
									name="orderMsg"></textarea></td>
						</tr>
					</thead>
				</table>
				<br /> <br />

				<!-- 결제예저금액 테이블 -->
				<table class="calculation2">
					<tr>
						<th>총 상품금액</th>
						<th>총 배송비</th>
						<th style="width: 750px; padding: 22px 0;"><span>결제예정금액</span></th>
					</tr>
					<tr style="background-color: #fff;">
						<td style="padding: 23px 0;"><span class="price"><fmt:formatNumber
									type="number" maxFractionDigits="3" value="${total}" /></span>원</td>
						<td>+<span class="price">2500</span>원
						</td>
						<td>=<span class="price"><fmt:formatNumber
									type="number" maxFractionDigits="3" value="${total+2500}" /></span>원
						</td>
					</tr>
				</table>
				<br /> <br />

				<!-- 결제하기 -->
				<div class="payArea">
					<div class="payment">
						<div
							style="padding: 18px 10px; font-size: 10pt; border-bottom: solid 1px #e0e0eb;">
							<input type="radio" name="cardradio" checked /><label>실시간
								계좌이체</label>&nbsp;&nbsp; <input type="radio" name="cardradio" checked /><label>휴대폰
								결제</label>&nbsp;&nbsp; <input type="radio" name="cardradio" checked /><label>무통장
								입금</label>&nbsp;&nbsp; <input type="radio" name="cardradio" checked /><label>에스크로(가상계좌)</label>&nbsp;&nbsp;
						</div>

						<div align="left">
							<!-- <img src="#"
								style="margin-left: 5px; position: relative; top: 6px;"> -->
							<span style="font-size: 10pt; color: gray;">* 최소 결제 가능 금액은
								결제금액에서 배송비를 제외한 금액입니다.</span><br />
							<!-- <img src="#"
								style="margin-left: 5px; position: relative; top: 6px;">  -->
							<span style="font-size: 10pt; color: gray;">* 소액 결제의 경우
								PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</span>
						</div>
					</div>

					<div class="total">
						<span style="display: inline-block; padding: 20px 10px;"> <b>최종결제
								금액</b></span><br /> <span
							style="font-size: 25pt; font-weight: bold; padding: 0px 10px;"><fmt:formatNumber
									type="number" maxFractionDigits="3" value="${total+2500}" />원</span><br />
						<br />
						<button type="submit" class="btn default"
							style="width: 90%; height: 60px; margin-right: 10px; font-size: 30px;">결제하기</button>
					</div>
				</div>
				<br /> <br />

			</form>
		</div>
	</div>

	<script>

		$("#emailChoice").bind("change", function() {
			$("#domainName").val($(this).val());
		});

		$("input:radio[name=bb]").click(function() {

			const address = "<c:out value='${productMember[0].address}'/>"
			if ($("input[name=bb]:checked").val() == "1") {
				$("input:text[name=extraAddr]").attr("value", address);
				// radio 버튼의 value 값이 1이라면 활성화

			} else if ($("input[name=bb]:checked").val() == "2") {
				$("input:text[name=extraAddr]").attr("value", '');
				// radio 버튼의 value 값이 2이라면 비활성화
			}
		});

		function erchk() {
			if (form.addressee.value == "") {

				form.addressee.focus();
				alert("수령인을 입력해 주십시오.");

				return false;
			}

			if (form.extraAddr.value == "") {

				form.extraAddr.focus();
				alert("주소를 입력해 주십시오.");

				return false;
			}

			if (form.phone1.value == "") {

				form.phone1.focus();
				alert("핸드폰 번호를 입력해주세요.");

				return false;
			}
			if (form.phone2.value == "") {

				form.phone2.focus();
				alert("핸드폰 번호를 입력해주세요.");

				return false;
			}
			if (form.phone3.value == "") {

				form.phone3.focus();
				alert("핸드폰 번호를 입력해주세요.");

				return false;
			}

			if (form.extraAddr.value == "") {

				form.extraAddr.focus();
				alert("배송주소를 입력해 주십시오.");

				return false;
			}

			if (form.email1.value == "") {

				form.email1.focus();
				alert("이메일 주소를 입력해주십시오.");

				return false;
			}

			if (form.email2.value == "") {

				form.email2.focus();
				alert("이메일 주소를 입력해주십시오.");

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
</body>
</body>
</html>
