<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">

<title>매장찾기</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	type="text/css">

</head>

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.png"
	rel="icon" />
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.png"
	rel="apple-touch-icon" />

<!-- 스크롤 style -->
<style>
.basic-scroll {
  &::-webkit-scrollbar {
    width: 8px;
    height: 8px;
    background: #ffffff;
  }
  &::-webkit-scrollbar-thumb {
    border-radius: 3.5px;
    background-color: #469543;

    &:hover {
      background-color: #adb5bd;
    }
  }
  &::-webkit-scrollbar-track {
    background: #ffffff;
  }
 }
 

 
</style>


</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />
	<jsp:include page="/WEB-INF/views/top.jsp" />
	<!-- 서브 타이틀 -->

	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>매장찾기</h4>
						<div class="breadcrumb__links">
							<a href="/">Home</a><span>매장찾기</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 서브 타이틀 끝 -->

	<!-- 맵 생성 및 위에 있는 div -->
	<div class="map-wrapper">
		<div id="map" style="width: 100%; height: 700px; background: #fff;"
			class="map-container"></div>
		<div class="table-container"
			style="width: 400px; height: 650px; background: #fff; padding: 30px; margin: 20px; border: 1px solid #469543;">
			<div>
				<form id="search-form">
					<div class="shop__sidebar__search">
						<input type="text" id="search-input" name="keywords"
							placeholder="지역 또는 매장명 입력">
						<button type="submit" id="search-btn">
							<span class="icon_search"></span>
						</button>
					</div>
				</form>
				<p style="font-size: 13px; color: #919191; text-align: center">*
					운영시간은 매장 사정에 따라 변경될 수 있습니다.</p>
				<hr>
				<div class="basic-scroll"
					style="width: 340px; height: 470px; overflow-x: hidden;">
					<table id="table">
						<thead>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 맵 생성 및 위에 있는 div 끝 -->

	<!-- 신규매장 -->
	<section class="blog-hero spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>신규매장안내</h2>
						<br>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__text">
							<span> 서울특별시</span>
							<h5>을지로3가</h5>
							<a href="#">OPEN 2023-03-27</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__text">
							<span> 서울특별시</span>
							<h5>광화문</h5>
							<a href="#">COMING SOON</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__text">
							<span> 서울특별시</span>
							<h5>종로3가</h5>
							<a href="#">COMING SOON</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- 신규매장 끝 -->


	<a id="storeList"></a>
	<!-- 전체매장 -->
	<section class="shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>전체매장</h2>
						<br>
					</div>


					<div class="shop__product__option">
						<div class="row">
							<!-- 전체매장 카운트 -->
							<div class="col-lg-8 col-md-12 col-sm-6">
								<div class="shop__product__option__left">
									<div class="nowrap">
										총 <span class="total-count"><c:out
												value="${pageMarker.total}" /></span> 개 매장이 있습니다.
									</div>
								</div>
							</div>
							<!-- 전체매장 카운트 끝 -->

							<!-- 전체매장 검색 -->
							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="shop__sidebar__search">
									<form id="searchForm" method="get"
										action="/store/list#storeList2">
										<div class="form-group d-flex align-items-center">
											<select name="type" class="mr-2">
												<option value=""
													<c:out value="${pageMarker.page.type == null?'selected':'' }" />>-----</option>
												<option value="area"
													<c:out value="${pageMarker.page.type eq 'area'?'selected':'' }" />>지역명</option>
												<option value="store"
													<c:out value="${pageMarker.page.type eq 'store'?'selected':'' }" />>매장명</option>
											</select> <input name="keyword" type="text" placeholder="지역 또는 매장명 입력"
												value="${pageMarker.page.keyword}" class="form-control">
											<input type="hidden" name="pageNum"
												value="${pageMarker.page.pageNum}"> <input
												type="hidden" name="amount"
												value="${pageMarker.page.amount}">
											<button type="submit" class="btn btn-primary ml-2">
												<span class="icon_search"></span>
											</button>
										</div>
									</form>
								</div>
							</div>
							<!-- 전체매장 검색 끝 -->
						</div>
					</div>
					<!-- 전체매장 카운트 끝 -->

					<!-- 전체매장 테이블 -->
					<table class="table">
						<thead>
							<tr>
								<th class="green" scope="col">NO</th>
								<th class="green" scope="col">매장명</th>
								<th class="green" scope="col">매장주소</th>
								<th class="green" scope="col">연락처</th>
								<th></th>
								<c:if test="${memberId eq 'admin@0' }">
									<th class="green" scope="col">수정</th>
									<th class="green" scope="col">삭제</th>
								</c:if>
							</tr>
						</thead>
						<c:if test="${empty list}">
							<tbody>
								<tr>
									<td colspan="7" align="center">등록된 매장이 없습니다.</td>
								</tr>
							</tbody>
						</c:if>
						<c:if test="${not empty list}">
							<tbody class="table-group-divider">
								<c:forEach items="${list}" var="store">
									<tr>
										<th scope="row" class="num"><c:out
												value="${store.storeId}" /></th>
										<td><c:out value="${store.storeName}" /></td>
										<td class="left"><c:out value="${store.storeAddress}" /></td>
										<td><c:out value="${store.storeTel}" /></td>

										<td><form action="/product/list" method="post"
												name="storeNamemenu">
												<input type="submit"
													style="background-color: #469543; color: #fff; border-radius: 30px; padding: 5px 7px; border: none; margin: 0 auto; font-size: 12px;"
													value="주문"> <input type="hidden" name="storeName"
													value="${store.storeName}"> <input type="hidden"
													name="storeId" value="${store.storeId}"> <input
													type="hidden" name="storeAddress"
													value="${store.storeAddress}">
											</form></td>
										<c:if test="${memberId eq 'admin@0' }">
											<td><input type="button"
												onclick="location.href='/store/modify?storeId=${store.storeId}'"
												style="background-color: #469543; color: #fff; border-radius: 30px; padding: 5px 7px; border: none; margin: 0 auto; font-size: 12px;"
												value="수정"></td>
											<td><form
													action="${pageContext.request.contextPath}/store/deleteProcess#storeList2"
													method="get">
													<input type="hidden" name="storeId"
														value="${store.storeId}"> <input type="submit"
														value="삭제" onclick="return confirm('정말로 삭제하시겠습니까?');"
														style="background-color: #469543; color: #fff; border-radius: 30px; padding: 5px 7px; border: none; margin: 0 auto; font-size: 12px;">
												</form></td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
					</table>
					<!-- 전체매장 테이블 끝 -->

					<!-- 전체매장 페이징 -->
					<div class="row">
						<div class="col-lg-12">
							<div class="product__pagination">
								<form id='actionForm' action="/store/list#storeList2"
									method='get'>
									<input type='hidden' name='pageNum'
										value='${pageMarker.page.pageNum }'> <input
										type='hidden' name='amount' value='${pageMarker.page.amount }'>
									<input type='hidden' name='type'
										value='<c:out value="${pageMarker.page.type }"/>'> <input
										type='hidden' name='keyword'
										value='<c:out value="${pageMarker.page.keyword }"/>'>
								</form>

								<c:if test="${pageMarker.prev}">
									<span class="paginate_button prev"><a
										href="${pageMarker.startPage -1}">◀</a></span>
								</c:if>

								<c:forEach var="num" begin="${pageMarker.startPage}"
									end="${pageMarker.endPage}">
									<c:if test="${pageMarker.page.pageNum == num}">
										<span class="paginate_button active">${num}</span>
									</c:if>
									<c:if test="${pageMarker.page.pageNum != num}">
										<span class="paginate_button"> <a href="${num}">${num}</a>
										</span>
									</c:if>
								</c:forEach>

								<c:if test="${pageMarker.next}">
									<span class="paginate_button next"><a
										href="${pageMarker.endPage +1}">▶</a></span>
								</c:if>

							</div>
						</div>
					</div>
					<!-- 전체매장 페이징 끝 -->

					<!-- 전체매장 버튼 -->
					<div class="col-lg-12">
						<div class="product__pagination">
							<c:if test="${memberId eq 'admin@0' }">
								<button type="submit" onclick="location.href='/store/register'"
									style="background-color: #469543; color: #fff; border-radius: 30px; padding: 7px 10px; border: none; margin: 0 auto; font-size: 13px;">
									매장등록</button>
							</c:if>
							<button onclick="location.href='/store/list#storeList'"
								style="background-color: #469543; color: #fff; border-radius: 30px; padding: 7px 10px; border: none; margin: 0 auto; font-size: 13px;">
								목록보기</button>
						</div>
					</div>
					<!-- 전체매장 끝 -->

				</div>
			</div>
		</div>
	</section>
	<!-- 전체매장 끝 -->
	<a id="storeList2"></a>
	<jsp:include page="/WEB-INF/views/footer.jsp" />

	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
<script type="text/javascript"
	src="//openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=plyv9nfbr0"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>



<script type="text/javascript">
		$(document).ready(
				function() {
					var actionForm = $("#actionForm");

					$(".paginate_button a").on(
							"click",
							function(e) {
								e.preventDefault();
								console.log('click');
								actionForm.find("input[name='pageNum']").val(
										$(this).attr("href"));
								actionForm.submit();

							});

				});

		var searchForm = $("#searchForm");

		$("#searchForm button").on("click", function(e) {

			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요.");
				return false;
			}
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요.");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();

			searchForm.submit();

		});
	</script>

<script>
/* 사용자의 현재 위치를 가져오고 지도를 중심으로 설정 */
async function getLocation() {
  let XY = {
    lat: 37.5799,
    lng: 126.9767
  };
  var mapDiv = document.getElementById('map');
  var map = new naver.maps.Map(mapDiv, {
    center: new naver.maps.LatLng(XY.lat, XY.lng),
    zoom: 16
  });

  try {
    let position = await new Promise((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(resolve, reject);
    });
    XY = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
    };
    console.log(XY.lat);
    console.log(XY.lng);
    map.setCenter(new naver.maps.LatLng(XY.lat, XY.lng));
  } catch(error) {
    console.log(error.message);
  }
  
  return [map, XY];
}

	$(document).ready(async function() {
		  let [map, XY] = await getLocation();
		  
		  let markers = [];
		  let infowindows = [];
		  
		  /* 지도 목록 디자인 & 내용 */
		  function createMarkerAndInfoWindow(map, list, params) {
			  if (list.storeName.includes(params.keywords) || list.storeAddress.includes(params.keywords)){

				  var table = document.getElementById("table");
				    var newRow1 = table.insertRow();
				    var newRow2 = table.insertRow();
				    var newRow3 = table.insertRow();
				    var newRow4 = table.insertRow();
				    

				    var storeNameCell = newRow1.insertCell(0);
				    storeNameCell.style.fontSize = "20px";
				    storeNameCell.style.fontWeight = "700";
				    storeNameCell.style.color = "#585858";
				    storeNameCell.style.cursor = "pointer";
				    storeNameCell.innerHTML = list.storeName;
				    
				    var storeAddressCell = newRow2.insertCell(0);
				    storeAddressCell.style.fontSize = "13px";
				    storeAddressCell.style.color = "#919191";
				    storeAddressCell.innerHTML = list.storeAddress;
				    
				    var storeTelCell = newRow3.insertCell(0);
				    storeTelCell.style.fontSize = "13px";
				    storeTelCell.style.color = "#919191";
				    storeTelCell.innerHTML = list.storeTel;
				    
				    var storeOpenCell = newRow4.insertCell(0);
				    storeOpenCell.style.fontSize = "13px";
				    storeOpenCell.style.color = "#919191";
				    storeOpenCell.innerHTML = list.storeOpen + " ~ " + list.storeClose;
				    newRow4.insertAdjacentHTML('afterend', '<tr><td colspan="4"><hr style="width: 340px"></td></tr>');
				    

				  	
			/* 지도마커 생성 디자인, 위치 */
		    let marker = new naver.maps.Marker({
		      position: new naver.maps.LatLng(list.storeLat, list.storeLng),
		      map: map,
		      title: list.storeName,
		      icon: {
		        url: "/resources/img/markerex.png",
		        size: new naver.maps.Size(50, 52),
		        origin: new naver.maps.Point(0, 0),
		        anchor: new naver.maps.Point(20, 26),
		      },
		    });
		    markers.push(marker);
		    map.setCenter(marker.getPosition());
		    
		    /* 마커 클릭시 나오는 인포윈도우 내부 css와 값 */
		    let contentString = [
		        '   <span class="close" id="closeBtn" style="position: absolute; top: 10px; right: 15px;">&times;</span>',
		        '	<div class="iw_inner" style="margin: 20px; display: flex; align-items: center; justify-content: center;">',
		        '   <div>',
		        '       <h5 style="text-align: left;">' + list.storeName + '</h5>',
		        '       <table style="font-size: 12px; color: #919191; margin: 10px auto; border-collapse: collapse;">',
		        '           <tr><th style="padding-right: 10px;  width: 70px; color: #111">주소</th><td>' + list.storeAddress + '</td></tr>',
		        '           <tr><th style="padding-right: 10px; width: 70px; color: #111">연락처</th><td>' + list.storeTel + '</td></tr>',
		        '           <tr><th style="padding-right: 10px; width: 70px; color: #111">영업시간</th><td>' + list.storeOpen + ' - ' + list.storeClose + '</td></tr>',
		        '       </table><hr>',
		        '       <form method="post" action="/product/list"> <input type="hidden" name="storeName" value="' + list.storeName + '">',
		        '       <input type="hidden" name="storeId" value="' + list.storeId + '"><input type="hidden" name="storeAddress" value="' + list.storeAddress + '">',
		        '       <div style="text-align: center;">',
		        '           <button type="submit" style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">주문하기</button>',
		        '       </div>',
		        '       </form>',
		        '   </div>',
		        '</div>',
		    ].join("");
		    
		    /* 인포윈도우 생성 및 옵션 */
			var infowindow = new naver.maps.InfoWindow({
			  content: contentString,
			  maxWidth: 300,
			  maxHeight: 100,
			  backgroundColor: "#fff",
			  borderColor: "#469543",
			  borderWidth: 1,
			  anchorSize: new naver.maps.Size(30, 30),
			  anchorSkew: true,
			  anchorColor: "#fff",
			  pixelOffset: new naver.maps.Point(10, -20),
			  contentStyle: {
				  overflowY: "scroll",
				  minWidth: "300px",
				  minHeight: "100px",
				  display: "flex",
				  flexDirection: "column",
			  },
			});
		    
			infowindows.push(infowindow);
		   	
		    /* 검색했을 때 storeName을 클릭하면 해당 마커로 이동 후 바운스 애니메이션, 인포윈도우 열기 */
			storeNameCell.addEventListener('click', function() {
			  map.setCenter({ lat: list.storeLat, lng: list.storeLng });
			  map.setZoom(17);
			  marker.setAnimation(naver.maps.Animation.BOUNCE);
			  setTimeout(function() { marker.setAnimation(null); }, 2100);
			  infowindow.open(map, marker);
			  var closeButton = infowindow.getContentElement().querySelector('#closeBtn');
		        if (closeButton) {
		            closeButton.addEventListener('click', function() {
		                infowindow.close();
		            });
		        }
			});
		    
		    
		    
		    /* 마커를 클릭하면 인포윈도우 열고 닫기 */	
			naver.maps.Event.addListener(marker, "click", function(e) {
			    if (infowindow.getMap()) {
			        infowindow.close();
			    } else {
			        infowindow.open(map, marker);
			        var closeButton = infowindow.getContentElement().querySelector('#closeBtn');
			        if (closeButton) {
			            closeButton.addEventListener('click', function() {
			                infowindow.close();
			            });
			        }
			    }
			});
		    
			  };
		  };
		
		  /* 다른 검색시 기존 배열에 담은 마커 초기화 */
		  function removeMarkers() {
			    markers.forEach((marker) => {
			      marker.setMap(null); 
			    });
			    markers = [];
			  }
		  
		  /* 다른 검색시 기존 배열에 담은 인포윈도우 닫기 */
		  function removeInfowindows() {
			  infowindows.forEach((infowindow) => {
				  infowindow.close(); 
			    });
			  infowindows = [];
			  };

		  
		  /* db 데이터 가져오기 */
		  function getDataFromDB(map, params) {
			  $.ajax({
			    type: 'GET',
			    url: '/store/listto',
			    data: params,
			    dataType: 'json',
			    success: function(data) {
			    	removeMarkers();
			        var filteredData = data.filter(list => list.storeName.includes(params.keywords) || list.storeAddress.includes(params.keywords));
			        if (filteredData.length === 0) {
			            alert('검색 결과가 없습니다.');
			        } else {
			            for (list of filteredData) {
			                createMarkerAndInfoWindow(map, list, params);
			      		}
			  	 	  }
			    },
			    error: function(request, status, error) {
			      console.log(request, status, error)
			    }
			  })
			}
			
		  	/* form의 keywords를 기반으로 db 가져오기 */
			$('#search-form').on('submit', function(e) {
			  e.preventDefault(); 
			  var keywords = $('#search-input').val();
			  if(keywords === ''){
				  alert('검색어를 입력해주세요.');
				  return;
			  }
			    var table = document.getElementById("table");
			    table.innerHTML = '';
			    removeInfowindows();
			  
			  getDataFromDB(map, { keywords: keywords } );
			  
			});
	});

</script>
</html>