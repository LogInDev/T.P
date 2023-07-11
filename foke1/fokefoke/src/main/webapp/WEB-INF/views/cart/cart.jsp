<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String contextPath = request.getContextPath();
int fokeingredientId = 1;
String memberId = (String)session.getAttribute("memberId");
%>
<!DOCTYPE html xmlns:th="http://www.thymeleaf.org">
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="FokeFoke">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Shopping Cart</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
    
    <style>
    .jb-small { font-size: small; }
    .jb-x-large { font-size: x-large; }
	.parent-element {
  	 	display: flex;
  	 	justify-content: space-between;
 	 	align-items: center;
	}
	
	.goodbtn {
	background-color: #469543;
    color: #fff;
    border-radius: 30px;
    padding: 10px 20px;
    border: none;
    margin: 0 auto;
}
	
	/* 수량버튼 */
	.quantity_input {
    	width: 50px;
    	border: none;
    	text-align: center;
    	color: #111111;
   		font-size: 16px;
	}
	
	.button {
	   background:#fff;
	   border: none;
	   color: #111111;
	   padding: 5px 5px;
	   text-align: center;
	   text-decoration: none;
	   display: inline-block;
	   font-size: 22px;
	   margin: 4px 2px;
	   cursor: pointer;
	}
	
	/* 체크박스 */
	.input_size_20{
		width:20px;
		height:20px;
	}
	.all_check_input{
		margin: 18px 0 18px 18px;
	}
	.all_chcek_span{
	    padding-left: 8px;
	    font-size: 20px;
	    font-weight: bold;		
	}
    	
	


     .aside-wrap {
     	position: absolute;
/*      	width: 120px; */
/*      	top: 0px; */
/*      	left: 0px; */
/*      	bottom: 0px; */
/*         	height: 100%; */
/*      	float: left; */
     }
    
     .aside-inner { 
     	position: sticky;
     	top: 0;
/*      	top:100px; */
/* 	 	  	width: 120px; */
/*       	float: left;  */
/*       	height: 500px;  */
    }
    
    	.cart__total-wrapper {
		  height: 100%;
		  overflow: auto;
		}
    
</style>
</head>

<jsp:include page="/WEB-INF/views/header.jsp" />
<body>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-16">
                    <div class="breadcrumb__text">
                        <h4>Shopping Cart</h4>
                        <div class="breadcrumb__links">
							<a href="/">Home</a>
							<a href="/store/list">매장찾기</a>
							<a href="/product/reList">메뉴선택</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
           <div class="row">
              <div class="col-lg-16">
                <div class="all_check_input_div">
					<input type="checkbox" class="all_check_input input_size_20" style="margin-left:-0.025px;" ><span class="all_chcek_span">전체선택</span>
				</div>	
                    <div class="shopping__cart__table">
                    <form id="send" method="post" >
                       <table>
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>상품</th>
                                    <th>수량</th>
                                    <th>가격</th>
                                </tr>
                            	<tr>
								</tr>
                            </thead>
                            <tbody>
                            
                         	  <c:forEach items="${cartInfo}" var="cart" varStatus="status">
<!--                                 <tr>
                                	<td style="border-bottom: none;" colspan="4">${cart.storeName} : ${cart.storeAddress}</td>
                                </tr> -->
                                
                                <tr class="cartInfo_tr">
                            	    <td class="hdn">
<!-- 									<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span> -->
										<input type="hidden"  class="hdn_storeName_input" value="${cart.storeName}">
										<input type="hidden" name="a" class="hdn_cartId_input" data-cartId="${cart.cartId}" value="${cart.cartId}">
										<input type="hidden" class="hdn_cartCount_input" value="${cart.cartCount}">
										<input type="hidden" class="hdn_price_input" value="${cart.price}">
										<input type="hidden" class="hdn_onePrice_input" value="${cart.onePrice}">
										
										<input type="hidden" class="hdn_totalPrice_input" value="${cart.onePrice * cart.cartCount}">
										<input type="hidden" class="hdn_point_input" value="${cart.point}">
										<input type="hidden" class="hdn_totalPoint_input" value="${cart.totalPoint}">
									
									</td>
                                    <td class="product__cart__item">
                                    	<div >
                                    		<span class="jb-small"><strong>[${cart.storeName}  :  ${cart.storeAddress}]</strong></span>
                                    	</div>
                                        <div class="product__cart__item__pic" style="margin-top: 20px;">
                                       		<input type="checkbox" class="cart_checkbox input_size_20" style="margin-right: 10px;" id="chkBox" name="cartId"  value="${cart.cartId}">                                    	
                                            <img style="width: 170px; height: 160px;" src="${cart.cartImage }">
                                        </div>
                                        <div class="product__cart__item__text" style="margin-right:10px;">
                                           <p class="jb-large"><strong>${cart.productName} </strong></p>
                                           <p class="jb-small">
											
											<!--토핑(현미밥, 샐러드)-->
											<span>${cart.base}</span>
											
											<!--토핑(오이,파인애플, 풋콩, 병아리콩, 렌틸콩, 적양파 등)-->
											<c:if test="${cart.atopping != null}">
												<span>, ${cart.atopping}</span>
											</c:if>
											<c:if test="${cart.btopping != null}">	
												<span>, ${cart.btopping}</span>
											</c:if>
											<c:if test="${cart.ctopping != null}">
												<span>, ${cart.ctopping}</span>
											</c:if>
											<c:if test="${cart.dtopping != null}">
												<span>, ${cart.dtopping}</span>
											</c:if>										
	
											<!--소스(소금, 후추, 렌치, 허니머스타드, 스위트칠리 등)-->
											<c:if test="${cart.asource != null}">
												<span>, ${cart.asource}</span>
											</c:if>	
											<c:if test="${cart.bsource != null}">
												<span>, ${cart.bsource}</span>
											</c:if>
											
											<!--추가토핑(낫또, 아보카도, 크랩샐러드, 피코데가요, 퀴노아 등)-->
											<c:if test="${cart.aextratopping != null}">
												<span>, ${cart.aextratopping}</span>
											</c:if>
											<c:if test="${cart.bextratopping != null}">
												<span>, ${cart.bextratopping}</span>
											</c:if>
											
											<!--메인추가(연어, 참치, 새우, 부채살)-->
											<c:if test="${cart.extramain != null}">
												<span>, ${cart.extramain}</span>
											</c:if>
											
											<!--세트-->
											<c:if test="${cart.setbeverage != null}">
												<span>, ${cart.setbeverage}</span>
											</c:if>
											<c:if test="${cart.setside != null}">
												<span>, ${cart.setside}</span>
											</c:if>
											</p>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <div class="quantity">
                                            <div class="button_quantity">
											 <span>
											 	<button type="button" class="fa fa-angle-left dec qtybtn button"></button>
                                             		<input type="text" class="quantity_input" value="${cart.cartCount}">
                                             	<button type="button" class="fa fa-angle-right inc qtybtn button"></button>
                                             </span>
											</div>
                                        </div>
                                    </td>
                                    <td class="cart__price">
                                    	<fmt:formatNumber value="${cart.onePrice * cart.cartCount}" pattern="#,### 원" />                                  
                                    </td>
                                    
                                    <td class="cart__close">
                                    	<i class="fa fa-close" data-cartid="${cart.cartId}"></i>
<!-- 										<button class="fa fa-close" data-cartid="${cart.cartId}"></button> -->
                                    </td>
                                </tr>

	                      </c:forEach>
                        </tbody>
                      </table>
                      </form>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="/store/list">Continue Shopping</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-lg-4 aside-wrap">
                    <div class="cart__discount">
                        <h6></h6>
                        <form action="#">
<!--                             <input type="text" placeholder="추후 업데이트 예정입니다. ๑◕‿‿◕๑" id="couponCode">
                            <script>
							document.getElementById("couponCode").addEventListener("click", function() {
								alert("업데이트 예정이라고.");
							});
							</script>
                            <button type="button">Apply</button> -->
                        </form>
                    </div>
                    
                    <!--종합 정보 -->
                    <div class="cart__total-wrapper">
                    <div class="cart__total aside-inner" id="cartTotal">
                        <h6>Cart total</h6>
                    	<ul>
                            <li>상품 종류<span class="cart_totalKind"></span></li>
                            <li>상품 수량<span class="cart_totalCount"></span></li>
                            <li>총 상품금액<span class="cart_totalPrice"></span></li>                            
                            <hr>
                            <li>적립 예정 포인트<span class="cart_totalPoint"></span></li>
						<!--<li>결제 금액<span class="cart_finalTotalPrice"></span></li> -->
                        </ul>
                        <input type="button" class="primary-btn goodbtn" onclick="send()" value="결 제 하 기">                   		
                    </div>
                    </div>
                </div>
            </div>
            <!-- 카트 조정 form -->
 			<form action="/cart/update" method="post" class="quantity_update_form">
				<input type="hidden" name="cartId" class="update_cartId">
				<input type="hidden" name="cartCount"  class="update_cartCount">
				<input type="hidden" name="memberId" class="update_memberId" value="${member.memberId}">
			</form>
			
			<!--카트 삭제 form -->
			<form action="/cart/delete" method="post" class="quantity_delete_form">
				<input type="hidden" name="cartId" class="delete_cartId">
				<input type="hidden" name="memberId" value="${member.memberId}">
			</form>
			
			<!--결제하기 -->

        </div>
    </section>
    <!-- Shopping Cart Section End -->

	<jsp:include page="/WEB-INF/views/footer.jsp" />


    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
<script>
// $(".quantity_modify_btn").on("click", function() {
// 	  //updateCartInfo();	
// 	  var $cartItem = $(this).closest(".cartInfo_tr");
// 	  //var cartId = $cartItem.find(".hdn_cartId_input").data("cartid");
// 	  var cartId = $(".hdn_cartId_input").data("cartid");
// 	  var cartCount = parseInt($cartItem.find(".hdn_cartCount_input").val());

// 	  $(".update_cartId").val(cartId);
// 	  $(".update_cartCount").val(cartCount);
	  
// 	  //console.log($(".update_cartId").val());
// 	  $(".update_cartId").each(function() {
// 			console.dir($(this).val());
// 	  });
	  
// 	  $(".update_cartCount").each(function() {
// 			console.dir($(this).val());
// 	  });
// 	  console.log("==========");
	  
// 	  //$(".quantity_update_form").submit();
// });
function cartDeleteSubmit(){
	var cartDelete = $(".quantity_delete_form").serialize();
       $.ajax({
          type: 'post',
          url:'/cart/delete',
          data : cartDelete,
          success: function(data){
             console.log(data);
          },
          error: function(request,status, error){
             console.log(request, status, error)
          }
       })
    };


/* 장바구니 삭제 버튼 */
$(".fa.fa-close").on("click", function(e){
	e.preventDefault();
	//const cartId = $(this).data("cartid");
	var $cartItem = $(this).closest(".cartInfo_tr");
	var cartId = $cartItem.find(".hdn_cartId_input").data("cartid");
	$(".delete_cartId").val(cartId);
	$(".quantity_delete_form").submit();
	//$cartItem.hide();
	//cartDeleteSubmit();
});


function cartInfoSubmit(){
	var cartString = $(".quantity_update_form").serialize();
       $.ajax({
          type: 'post',
          url:'/cart/update',
          data : cartString,
          success: function(data){
             console.log(data);
          },
          error: function(request,status, error){
             console.log(request, status, error)
          }
       })
    };
    
function updateCartInfo() {
	$(".fa.fa-angle-right.inc.qtybtn").on("click", function() {
	  var $quantityInput = $(this).closest(".quantity__item").find(".quantity_input");
	  var currentQuantity = parseInt($quantityInput.val());
	  var newQuantity = currentQuantity + 1;
	  $quantityInput.val(newQuantity);
	
	  var $cartItem = $(this).closest(".cartInfo_tr");
	  
	  var onePrice = parseInt($cartItem.find(".hdn_onePrice_input").val());
	  var newTotalPrice = onePrice * newQuantity;
	  
	  var onePoint = parseInt($cartItem.find(".hdn_totalPoint_input").val() / $cartItem.find(".hdn_cartCount_input").val());
	  var newTotalPoint = onePoint * newQuantity;
	  $cartItem.find(".hdn_cartCount_input").val(newQuantity);
	  $cartItem.find(".hdn_totalPrice_input").val(newTotalPrice);
	  $cartItem.find(".hdn_totalPoint_input").val(newTotalPoint);
	  $cartItem.find(".cart__price").text(newTotalPrice.toLocaleString() + " 원");
	
	  TotalCartInfo();
	  
	  //$(".quantity_modify_btn").on("click", function(){
		  var $cartItem = $(this).closest(".cartInfo_tr");
		  var cartId = $cartItem.find(".hdn_cartId_input").data("cartid");
		  //var cartId = $(".hdn_cartId_input").data("cartid");
		  var cartCount = parseInt($cartItem.find(".hdn_cartCount_input").val());
	
		  $(".update_cartId").val(cartId);
		  $(".update_cartCount").val(cartCount);
		  
		  //console.log($(".update_cartId").val());
// 		  $(".update_cartId").each(function() {
// 				console.dir($(this).val());
// 		  });
		  
// 		  $(".update_cartCount").each(function() {
// 				console.dir($(this).val());
// 		  });
// 		  console.log("==========");
	  //});
		  
		  cartInfoSubmit();
		  //$(".quantity_update_form").submit();
	});
		
	$(".fa.fa-angle-left.dec.qtybtn").on("click", function(){
	  var $quantityInput = $(this).closest(".quantity__item").find(".quantity_input");
	  var currentQuantity = parseInt($quantityInput.val());
		
	  if(currentQuantity > 1){
		  var newQuantity = currentQuantity - 1;
		  $quantityInput.val(newQuantity);
		
		  var $cartItem = $(this).closest(".cartInfo_tr");
		  
		  var onePrice = parseInt($cartItem.find(".hdn_onePrice_input").val());
		  var newTotalPrice = onePrice * newQuantity;
		  
		  var onePoint = parseInt($cartItem.find(".hdn_totalPoint_input").val() / $cartItem.find(".hdn_cartCount_input").val());
		  var newTotalPoint = onePoint * newQuantity;
		  $cartItem.find(".hdn_cartCount_input").val(newQuantity);
		  $cartItem.find(".hdn_totalPrice_input").val(newTotalPrice);
		  $cartItem.find(".hdn_totalPoint_input").val(newTotalPoint);
		  $cartItem.find(".cart__price").text(newTotalPrice.toLocaleString() + " 원");
		
		  TotalCartInfo();
		  
		  //$(".quantity_modify_btn").on("click", function(){
		  var $cartItem = $(this).closest(".cartInfo_tr");
		  var cartId = $cartItem.find(".hdn_cartId_input").data("cartid");
		  //var cartId = $(".hdn_cartId_input").data("cartid");
		  var cartCount = parseInt($cartItem.find(".hdn_cartCount_input").val());
	
		  $(".update_cartId").val(cartId);
		  $(".update_cartCount").val(cartCount);
		  
		  //console.log($(".update_cartId").val());
// 		  $(".update_cartId").each(function() {
// 				console.dir($(this).val());
// 		  });
		  
// 		  $(".update_cartCount").each(function() {
// 				console.dir($(this).val());
// 		  });
// 		  console.log("==========");
	  //});
		  
		  cartInfoSubmit();
		  //$(".quantity_update_form").submit();
	  }
	});
	
};
// $(".quantity_modify_btn").on("click", function(){
// 		let cartId = $(this).data("cartid");
// 		let cartCountInput = $(this).closest(".quantity__item").find(".quantity_input");
// 		let cartCount = parseInt(cartCountInput.val());
// 		 if (isNaN(cartCount)) {
// 		  // show an error message or handle the invalid input in some other way
// 		 } else {
// 			  $(".update_cartId").val(cartId);
// 			  $(".update_cartCount").val(cartCount);
// 			  $(".quantity_update_form").submit();
// 			}
// });

/*수량 수정 버튼*/
// $(".quantity_modify_btn").on("click", function(){
// 	let cartId = $(this).data("cartid");
// 	let cartCount = $(this).closest(".cartInfo_tr").find(".hdn_cartCount_input").val(newQuantity);
// // 	/*2번째*/
// // 	let cartCount = $(this).parent(".quantity__item").find(".quantity_input").val();
// // 	console.log(cartCount);
// 	//let cartCount = $("#cartcount").val();
	
// 	/*3번째*/
// // 	let cartCountInput = $(this).parent(".quantity__item").find(".quantity_input");
// // 	let cartCount = !isNaN(parseInt(cartCountInput.val())) ? parseInt(cartCountInput.val()) : 0;
 	
// 	/*1번째 방법*/
// 	//let cartCount = 4;
	
//     $(".update_cartId").val(cartId);
//     $(".update_cartCount").val(cartCount);
//     $(".quantity_update_form").submit();

// });

// $(".quantity_modify_btn").on("click", function(){
//     let cartId = $(this).data("cartid");
//     let cartCount = $(this).closest(".quantity__item").find(".quantity_input").val();
//     $(".update_cartId").val(cartId);
//     $(".update_cartCount").val(cartCount);
//     $(".quantity_update_form").submit();
// });

</script>
    
<script>
$(document).ready(function() {
	updateCartInfo();
	TotalCartInfo();


// 	var table = $(".shopping__cart__table");
// 	var infoSection = table.find(".general__info__section");
// 	var sectionTop = infoSection.offset().top;
// 	var sectionHeight = infoSection.outerHeight();
// 	var windowHeight = $(window).height();

// 	$(window).scroll(function() {
// 	  var scroll = $(window).scrollTop();
// 	  if (scroll + windowHeight > sectionTop + sectionHeight) {
// 	    infoSection.css({
// 	      position: "absolute",
// 	      top: scroll + windowHeight - sectionHeight + "px"
// 	    });
// 	  } else {
// 	    infoSection.css({
// 	      position: "fixed",
// 	      top: "0"
// 	    });
// 	  }
// 	});
/* 	var currentPosition = $(".cart__total").position().top;
	
	$(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".cart__total").stop().animate({"top":position+currentPosition+"px"},1000);
	    
	    if (position > 100) {
	        $(".cart__total").css("opacity", 1);
	      } else {
	        $(".cart__total").css("opacity", 0);
	      }
	    
	  }).scroll();
	
	var moveToTopSmooth = function() {
		document.body.scrollIntoView({ behavior: 'smooth' });
		}; */
	
	
	let n = 0;
	$(".quantity_input").each(function() {
		  n++;
		  console.dir($(this).val());
	});
//  	let cartCount = $("#cartcount").val();
//  	console.log(cartCount);
 


/* 개별 체크 박스*/
$(".cart_checkbox").on("change", function(){
// 	var checkbox = $(this);
// 	var storeName = "";
	
// 	$(".cartInfo_tr").each(function(index, element) {
// 		storeName += $(element).find(".hdn_storeName_input").val();
// 	});
	
// 	if(storeName == storeName) {
// 		checkbox.prop("checked", true);
// 	} else if(storeName !== storeName){
// 		alert("같은 지점에서 주문 가능합니다!");
// 	    checkbox.prop("checked", false);
// 	}
	if (!$(this).prop("checked")) {
    	$(".all_check_input").prop("checked", false);
 	}
	
	TotalCartInfo($(".cartInfo_tr"));
 });

/* 체크박스 전체 선택 */
$(".all_check_input").on("click", function() {
	
	/* 체크박스 체크/해제 */
	if($(".all_check_input").prop("checked")){     //.prop():요소의 속성(상태,동작)의 현재 값을 가져올 수 있음
		$(".cart_checkbox").prop("checked", true); 
	} else {
		$(".cart_checkbox").prop("checked", false);
	}
	
	TotalCartInfo($(".cartInfo_tr"));
});
});
/*종합 정보 세팅*/
function TotalCartInfo() {
	
	let totalKind = 0;		  // 1.총 종류
	let totalCount = 0;		  // 2.총 갯수
	let totalPrice = 0;		  // 3.총 가격
	let totalPoint = 0;		  // 4.적립예정포인트
	let finalTotalPrice = 0;  // 6.최종 가격(총 가격)

	$(".cartInfo_tr").each(function(index, element) {
		// 1.find매서드를 통해 정보가 저장된 <input>태그에 접근
		// 2.순회는 "cart_info_td"로 <td>태그에 접근 할 경우 같은이름의 식별자를 가진 <td>태그 객체가 
		//   장바구니 상품 수만큼 존재하게 되는데 제이쿼리의 "each(index, element)" 메서드를 통해서 
		//   객체의 수만큼 순회할 수 있음.
		if($(element).find(".cart_checkbox").is(":checked") === true) {
		//element(<td> 객체)에 있는 체크박스가 checked 상태일 때 true이며 참이 된다
		
		/* 1.총 종류 */
		totalKind  += 1;
		
		/* 2.총 갯수 */
		totalCount += parseInt($(element).find(".hdn_cartCount_input").val());
		
		/* 3.총 가격 */
		totalPrice += parseInt($(element).find(".hdn_totalPrice_input").val());
		//접근한 <td> 객체에 있는 'individual_totalPrice_input' <input> 태그에 값을 
		//totalPrice 변수의 값에 더해준다.
        //모든 상품 <td> 객체를 순회하게 되면 totalPrice는 모든 상품의 가격이 더해져서 
        //'총 상품 가격'이 구해지게 된다.

		/* 4. 총 마일리지 */
		totalPoint += parseInt($(element).find(".hdn_totalPoint_input").val());
 		
 		}
	});

		/* 5. 최종 가격 */
		finalTotalPrice = totalPrice;
		
		/*값 입력*/
		$(".cart_totalKind").text(totalKind + " 종");
		$(".cart_totalCount").text(totalCount + " 개");
		$(".cart_totalPrice").text(totalPrice.toLocaleString() + " 원");
		$(".cart_totalPoint").text(totalPoint + " Point");
		//$(".cart_finalTotalPrice").text(finalTotalPrice.toLocaleString() + " 원");
	};
	let chk=false;
	   function checkStoreNames() {
	        let checkedStores = []; // 체크된 가게의 이름을 담을 배열
	        let cartItems = document.getElementsByClassName("product__cart__item");

	        for (let i = 0; i < cartItems.length; i++) {
	          let checkbox = cartItems[i].querySelector("input[type='checkbox']");
	          if (checkbox.checked) { // 체크된 경우에만 처리
	            let storeName = cartItems[i].querySelector("strong").textContent;
	           
	          for (let j = 0; j < checkedStores.length; j++) {
	              if (storeName !== checkedStores[j]) { // 다른 가게 이름이 이미 배열에 있는 경우
	                alert("같은 지점에서만 주문이 가능합니다.");
	                checkbox.checked = false;
	              /*   $(".all_check_input").each(function() {
	        		    $(this).prop('checked', false);
	        		}); */
	               $(".all_check_input").prop("checked", false);
	                TotalCartInfo($(".cartInfo_tr"));
	                chk= false; // submit 이벤트 취소
	                return false;
	              }
	            }
	            checkedStores.push(storeName); // 배열에 가게 이름 추가
	          }
	        }
	        
	        chk= true; // 모든 체크박스가 유효한 경우 submit 이벤트 실행
	        return true;
	      }
	   function send(){
		   checkStoreNames() ;
		   if(chk){
			  $('#send').attr('action', '/payment/payment').submit();
		   }else{
			   $(".all_check_input").prop("checked", false);
		   }
		   chk=true;
		   console.log( chk);
	   }
</script>

</body>
</html>