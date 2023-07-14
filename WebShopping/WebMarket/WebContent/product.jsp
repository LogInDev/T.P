
<%@page import="util.ProductBoardPageproduct"%>
<%@page import="util.BoardPage"%>
<%@page import="dao.MVCBoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ListDAO.ProductDTO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="exceptionNoProductId.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
if (request.getAttribute("sessionId") != null) {
	String m_id = session.getAttribute("sessionId").toString();
}
String p_id = request.getParameter("p_id");
int totalCount = (int) request.getAttribute("totalCount");
int pageSize = (int) request.getAttribute("pageSize");
int blockPage = (int) request.getAttribute("blockPage");
int pageNum = (int) request.getAttribute("pageNum");
%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>상품 상세 정보</title>
<style type="text/css">
#select, option {
	font-family: TmonMonsori, "GodoB", "굴림";
	font-weight: bold;
}

#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 100%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}

ul.tabs {
	margin: 20px;
	padding: 0px;
	list-style: none;
	width: 100%
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
	width: 30%;
	text-align: center;
}

ul.tabs li.current {
	background: #ededed;
	color: #222;
}

.tab-content {
	display: none;
	padding: 15px 0;
	border-top: 3px solid #eee;
}

.tab-content.current {
	display: inherit;
}

* {
  margin: 0;
  padding: 0;
  box-sizing:border-box;
}

/* Slideshow container */
.slideshow-container {
  max-width: 60%;
  max-height:50%;
  position: relative;
  margin: auto;
}
.slideshow-container .mySlides img {
  height: 350px;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #grey;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  width: 100%;
  text-align: center;
}


/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 10px 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 3s;
  animation-name: fade;
  animation-duration: 3s;
}

@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
</style>


<script type="text/javascript">
	
	
	//장바구니 추가
	function addToCart() {
  
 		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
      document.addForm.submit();
   		}
	};
	
	function ListCart() {
		      location.href="/WebMarket/cartList.go?memberId=${sessionId}";
		};
	
	
	//버튼 javasc
	
	function loginBtn(){
		if (confirm("로그인하시겠습니까?")) {
			var link =  document.location.href;
			location.href="/WebMarket/member/loginMember.jsp?pageNum="+link;
		} else {
			return false;
		}
	};
	
	//버튼 jquery
	$(function (){
		$("#loginBtn2").on("click",function(){
			if (confirm("로그인하시겠습니까?")) {
				var link =  document.location.href;
				location.href="/WebMarket/member/loginMember.jsp?pageNum="+link;
			} else {
				return false;
			}
		});
	});
	
	
		 
	  
	  //탭메뉴
	  
	  $(document).ready(function(){
   
		  $('ul.tabs li').click(function(){
		    var tab_id = $(this).attr('data-tab');
		 
		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');
		 
		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		  })
		 
		});
	 
	  
	  
	  //댓글등록이벤트
	  $(function (){
		  $('#review_insert').on("click",function(){
			 if($('#reviewContents').val()==''){
				 alert("내용을 입력해주세요");
				 return false;
			 }else  if($('#review_title').val()==''){
				 alert("제목을 입력해주세요");
				 return false;
			 }
			 commentInsert();
		  });
	  });
	  
	  
	  

	    // 댓글 등록
	    function commentInsert(){
	        $.ajax({
	             url:'./ReviewInsert.po',
	            type:'post',
	            data:{
	            	"p_id":"<%=p_id%>",
	            	"star": $('input[name="reviewStar"]:checked').val(),
	            	"title" : $('#review_title').val(),
	            	"content": $('#reviewContents').val()
	            },
	            success:function(data){
	                if(data=='1'){
	                    $('#reviewContents').val('');
	                    $('#review_title').val('');
	                    $( '#table' ).empty();
	                    review_view();
	                } 
	            }, 
	        }); 
	    }; 
	  
	  
	    
	  //리뷰 출력
	  function review_view(){
		  let url="./ReviewController.po";
	    $.ajax({
	        type:"POST",
	        url:url,
	        dataType:"json",
	        data:{
	        		"p_id" : "<%=p_id%>",
	        		"pageNum" : "<%=pageNum%>"
	
			},
			success : function(data) {
				//alert('ajax POST 통신 성공'); 
				var reviewList = data.result;
				//alert(userList[0]);
				// alert(userList[0][0]["m_id"]);

				var tr = '<thead>' + '<tr>' + '<th>아이디</th>' + '<th>평점 </th>'
						+ '<th>제목 </th>' + '<th>작성날짜 </th>' + '</tr>'
						+ '</thead>';

				for (let i = 0; i < reviewList.length; i++) {

					<!--아이디-->
					tr += '<tr><td>' + reviewList[i][0]["m_id"]

					<!--별점-->
					tr += '</td><td>';
					for (let j = 0; j < reviewList[i][1]["star"]; j++) {
						tr += '★';
					}

					tr += '</td><td>';

					<!--내용-->
					tr += '<a href="./ReviewDetailController.po?index='
							+ reviewList[i][4]["index"] + '&&p_id='
							+ reviewList[i][6]["p_id"] + '">'//아이디
							+ reviewList[i][5]["title"] + '</a></td><td>';//제목
					tr += reviewList[i][3]["time"];//시간
					tr += '</td></tr>';
				}
				$("#table").append(tr); // 테이블에 추가
			},

		});
	};

	
	var slideIndex = 0; //slide index

	// HTML 로드가 끝난 후 동작
	window.onload=function(){
	  showSlides(slideIndex);

	  // Auto Move Slide
	  var sec = 3000;
	  setInterval(function(){
	    slideIndex++;
	    showSlides(slideIndex);

	  }, sec);
	}


	// Next/previous controls
	function moveSlides(n) {
	  slideIndex = slideIndex + n
	  showSlides(slideIndex);
	}

	// Thumbnail image controls
	function currentSlide(n) {
	  slideIndex = n;
	  showSlides(slideIndex);
	}

	function showSlides(n) {

	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  var size = slides.length;

	  if ((n+1) > size) {
	    slideIndex = 0; n = 0;
	  }else if (n < 0) {
	    slideIndex = (size-1);
	    n = (size-1);
	  }

	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }

	  slides[n].style.display = "block";
	  dots[n].className += " active";
	}

	

	
	$(document).ready(function() {

		review_view();

	});
</script>
</head>
<body>

	<jsp:include page="menu.jsp" />


	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<p>
	<form name="addForm" action="/WebMarket/addCart.go?p_id=${dto.p_id }"
		method="post">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<img src="${dto.p_fileName }" style="width: 100%" />
				</div>
				<div class="col-md-6">
					<h3>${dto.p_name}</h3>
					<h4>
						<b>가격</b> ${dto.p_unitPrice}:원
					</h4>

					<!-- 사이즈 -->
					<br> 사이즈 : <select style="width: 200px;" id="select"
						name="size" onclick="size()">

						<c:choose>
							<c:when test="${dto.p_category eq '상의'}">
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
								<option value="XL">XL</option>
								<option value="XXL">XXL</option>
							</c:when>

							<c:when test="${dto.p_category eq '하의'}">
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="32">32</option>
								<option value="34">34</option>
								<option value="36">36</option>
								<option value="38">38</option>
							</c:when>

							<c:when test="${dto.p_category eq '신발'}">
								<option value="240">240</option>
								<option value="245">245</option>
								<option value="250">250</option>
								<option value="255">255</option>
								<option value="260">260</option>
								<option value="265">265</option>
								<option value="270">270</option>
								<option value="275">275</option>
								<option value="280">280</option>
								<option value="285">285</option>
								<option value="290">290</option>
								<option value="295">295</option>
								<option value="300">300</option>
							</c:when>
						</c:choose>


					</select><br> <br>

					<!-- 색상 -->
					색상 : <select style="width: 150px" id="select" name="color">
						<option>red</option>
						<option>blue</option>
						<option>white</option>
					</select><br> <br>

					<!-- 상품주문 -->
					<c:choose>
						<c:when test="${sessionId ne null }">
							<a href="#" class="btn btn-info" onclick="addToCart()">
								상품담기&raquo;</a>
							<a href="#" class="btn btn-warning" onclick="ListCart()">
								장바구니&raquo;</a>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-info" onclick="loginBtn()">상품
								구매하러가기!</button>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${dto.p_gender =='male' or dto.p_gender =='Male' }">
							<a href="/WebMarket/Male/maleview.po?pageNum=1"
								class="btn btn-secondary"> 상품목록 &raquo;</a>
							<br>
						</c:when>
						<c:when
							test="${dto.p_gender =='female' or dto.p_gender =='Female' }">
							<a href="/WebMarket/Female/femaleview.po?pageNum=1"
								class="btn btn-secondary"> 상품목록 &raquo;</a>
							<br>
						</c:when>
					</c:choose>
					
					<br>

					<!-- 테스트중 서버때문에 안될거같음 -->
					<a href="http://facebook.com"> <img
						src="https://img.etnews.com/photonews/1804/1059670_20180408132425_241_0001.jpg"
						style="width: 30px; height: 30px">
					</a> <a href="http://twitter.com"> <img
						src="https://play-lh.googleusercontent.com/8sc6LSo3dRf54GaLdQR8UZfzd_fgHgWMJlNxGLP1HWPEU7YY4UxkyHc8-qCNwtyiqO55"
						style="width: 30px; height: 30px">
					</a> <a href="https://www.instagram.com/"> <img
						src="https://t1.daumcdn.net/cfile/tistory/99B6AB485D09F2132A"
						style="width: 30px; height: 30px">
					</a> <br> <br>

					<p>배송비 2500원
					
						<!-- 슬라이드 관련 상품 -->
						<!-- 자료 받아야됨 -->
						
					 <div class="slideshow-container" >
						<p style="font-size:2em;"></p>비슷한 상품

				      <!-- Full-width images with number and caption text -->
				      
				      <c:forEach items="${slide}" var="slide">
				      <div class="mySlides fade">
				        <a href="./Bcontroller.po?p_id=${slide.p_id }"><img src="${slide.p_fileName}" style="width:100%"></a>
				        <div class="text">${slide.p_name }</div>
				      </div>
				      </c:forEach>
				      
				    <br/>
				
				    <!-- The dots/circles -->
				    <div style="text-align:center">
				      <span class="dot" onclick="currentSlide(0)"></span>
				      <span class="dot" onclick="currentSlide(1)"></span>
				      <span class="dot" onclick="currentSlide(2)"></span>
				    </div>
					</div>
				</div>
			</div>
		</div>
	</form>

<br>
<br>
	<!-- 탭메뉴 -->
	<div class="container">
		<!-- 탭메뉴 -->
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">리뷰</li>
			<li class="tab-link" data-tab="tab-2">제품상세정보</li>
			<li class="tab-link" data-tab="tab-3">판매자정보(반품/교환)</li>
		</ul>


		<!-- 첫번째탭 -->
		<div id="tab-1" class="tab-content current">
			<c:choose>
				<c:when test="${sessionId ne null }">

					<form class="mb-3" name="myform" id="myform" method="post">

						<fieldset>
							<span class="text-bold">별점을 선택해주세요</span> 
							<input type="radio"name="reviewStar" value="5" id="rate1">
							<label for="rate1">★</label> 
							<input type="radio" name="reviewStar"value="4" id="rate2">
							<label for="rate2">★</label> 
							<input type="radio" name="reviewStar" value="3" id="rate3" checked>
							<label for="rate3">★</label> 
							<input type="radio" name="reviewStar"value="2" id="rate4">
							<label for="rate4">★</label> <input type="radio" name="reviewStar" value="1" id="rate5">
						</fieldset>

						<br>&nbsp;제목 : <input type="text" id="review_title"
							style="width: 300px;">&nbsp;



						<div>

							<textarea class="col-auto form-control" id="reviewContents"
								placeholder="좋은 리뷰을 남겨주시면 판매자에게 큰 힘이 됩니다!!"></textarea>
						</div>
						<button type="button" name="review_insert" id="review_insert">등록</button>
					</form>
				</c:when>
				<c:otherwise>
					<div style="text-align: center;">
						<button class="btn btn-secondary" id="loginBtn2">리뷰작성하러가기!</button>
					</div>
					<br>
				</c:otherwise>

			</c:choose>

			<table class="table" id="table"
				style="text-align: center; border: 1px solid #dddddd">
				<!-- ajax를 통해 리뷰 출력공간 -->
			</table>
			<table>
				<%=ProductBoardPageproduct.pagingStr(totalCount, pageSize, blockPage, pageNum, "./Bcontroller.po?p_id=" + p_id)%>
			</table>
		</div>


		<!-- 두번째탭 -->
		<div id="tab-2" class="tab-content">
			<p>
				<b>브랜드</b> :${dto.p_manufacturer}
			<p>
				<b>분류</b> :${dto.p_category}
			<p>
				<b>상품 설명 : </b><span>${dto.p_description}</span>
			<div>
				<!--상의 사이즈 -->
				<c:choose>
					<c:when test="${dto.p_category eq '상의'}">
						<c:choose>
							<c:when
								test="${dto.p_gender eq 'Male' or dto.p_gender eq 'male'}">
								<img alt=""
									src="https://mblogthumb-phinf.pstatic.net/MjAyMDEwMDZfMjg5/MDAxNjAxOTUxNDUxOTg0.bPJt5agwS54v2e5DvMCVloVwXt8kKM94BWhKjuHgybYg.mJ2QkwNJ59tYUuK0tVdFhI0M189tgfAdmwCXctdL_QUg.JPEG.kkkkk6846/SE-64afa05b-2e49-420f-9198-df18156072b2.jpg?type=w800">
							</c:when>
							<c:when
								test="${dto.p_gender eq 'female' or dto.p_gender eq 'Female'}">
								<img alt=""
									src="https://mblogthumb-phinf.pstatic.net/MjAyMDEwMDZfMjg5/MDAxNjAxOTUxNDUxOTg0.bPJt5agwS54v2e5DvMCVloVwXt8kKM94BWhKjuHgybYg.mJ2QkwNJ59tYUuK0tVdFhI0M189tgfAdmwCXctdL_QUg.JPEG.kkkkk6846/SE-64afa05b-2e49-420f-9198-df18156072b2.jpg?type=w800">
							</c:when>
						</c:choose>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${dto.p_category eq '하의'}">
						<c:choose>
							<c:when
								test="${dto.p_gender eq 'Male' or dto.p_gender eq 'male'}">
								<img alt=""
									src="https://mblogthumb-phinf.pstatic.net/MjAyMDEwMDZfMjg5/MDAxNjAxOTUxNDUxOTg0.bPJt5agwS54v2e5DvMCVloVwXt8kKM94BWhKjuHgybYg.mJ2QkwNJ59tYUuK0tVdFhI0M189tgfAdmwCXctdL_QUg.JPEG.kkkkk6846/SE-64afa05b-2e49-420f-9198-df18156072b2.jpg?type=w800">
							</c:when>
							<c:when
								test="${dto.p_gender eq 'female' or dto.p_gender eq 'Female'}">
								<img alt=""
									src="https://mblogthumb-phinf.pstatic.net/MjAyMDEwMDZfMjg5/MDAxNjAxOTUxNDUxOTg0.bPJt5agwS54v2e5DvMCVloVwXt8kKM94BWhKjuHgybYg.mJ2QkwNJ59tYUuK0tVdFhI0M189tgfAdmwCXctdL_QUg.JPEG.kkkkk6846/SE-64afa05b-2e49-420f-9198-df18156072b2.jpg?type=w800">
							</c:when>
						</c:choose>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${dto.p_category eq '신발'}">
						<c:choose>
							<c:when
								test="${dto.p_gender eq 'Male' or dto.p_gender eq 'male'}">
								<img alt=""
									src="http://www.w-shop.store/data/file/notice/833264833_zru5D3Hv_07c39b5e6fc358408cd0c32aede18ac21265146c.png">
							</c:when>
						</c:choose>
					</c:when>
				</c:choose>


				<br>

			</div>
		</div>


		<!-- 세번째탭 -->
		<div id="tab-3" class="tab-content">

			<b style="font-size: 2em">반품/교환 정보</b>
			<hr>
			<table>
				<tr>
					<th style="width: 25%">반품/교환 배송비</th>
					<td>(구매자귀책) 2,500원/5,000원 초기배송비 무료시 반품배송비 부과방법 : 왕복(편도x2)</td>
				</tr>
				<tr>
					<th style="width: 25%; background:">반품/교환지 주소</th>
					<td>서울특별시 종로구 번지 3호 4 KR 서울특별시 종로구 관철동 180 5 층</td>
				</tr>
				<tr>
					<th style="width: 25%; background:">반품/교환 안내</th>
					<td>더 조은 종각점 고객센터 102-738-5001</td>
				</tr>
			</table>
			<br> <b style="font-size: 2em">반품/교환 기준</b>
			<hr>
			상품 수령 후 7일 이내에 신청하실 수 있습니다. 단, 제품이 표시·광고 내용과 다르거나, 계약과 다르게 이행된 경우는 제품
			수령일부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 교환/반품이 가능합니다.
			<p>
			<ul>
				<li>추가적으로 다음의 경우 해당하는 반품/교환은 신청이 불가능할 수 있습니다.</li>
				<li>소비자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단지, 상품 확인을 위한 포장 훼손 제외)</li>
				<li>소비자의 사용 또는 소비에 의해 상품 등의 가치가 현저히 감소한 경우</li>
				<li>시간의 경과에 의해 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</li>
				<li>복제가 가능한 상품 등의 포장을 훼손한 경우</li>
				<li>소비자의 주문에 따라 개별적으로 생산되는 상품이 제작에 들어간 경우</li>
			</ul>
		</div>

	</div>
	<!-- 탭메뉴 끝 -->

	<hr>
	<jsp:include page="footer.jsp" />
	
	
	
</body>
</html>
