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
		  function createMarkerAndInfoWindow(map, paging, params) {
			  if (paging.storeName.includes(params.keyword) || paging.storeAddress.includes(params.keyword)){

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
				    storeNameCell.innerHTML = paging.storeName;
				    
				    var storeAddressCell = newRow2.insertCell(0);
				    storeAddressCell.style.fontSize = "13px";
				    storeAddressCell.style.color = "#919191";
				    storeAddressCell.innerHTML = paging.storeAddress;
				    
				    var storeTelCell = newRow3.insertCell(0);
				    storeTelCell.style.fontSize = "13px";
				    storeTelCell.style.color = "#919191";
				    storeTelCell.innerHTML = paging.storeTel;
				    
				    var storeOpenCell = newRow4.insertCell(0);
				    storeOpenCell.style.fontSize = "13px";
				    storeOpenCell.style.color = "#919191";
				    storeOpenCell.innerHTML = paging.storeOpen + " ~ " + paging.storeClose;
				    newRow4.insertAdjacentHTML('afterend', '<tr><td colspan="4"><hr style="width: 340px"></td></tr>');
				    

				  	
			/* 지도마커 생성 디자인, 위치 */
		    let marker = new naver.maps.Marker({
		      position: new naver.maps.LatLng(paging.storeLat, paging.storeLng),
		      map: map,
		      title: paging.storeName,
		      icon: {
		        url: "/img/markerex.png",
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
		        '       <h5 style="text-align: left;">' + paging.storeName + '</h5>',
		        '       <table style="font-size: 12px; color: #919191; margin: 10px auto; border-collapse: collapse;">',
		        '           <tr><th style="padding-right: 10px;  width: 70px; color: #111">주소</th><td>' + paging.storeAddress + '</td></tr>',
		        '           <tr><th style="padding-right: 10px; width: 70px; color: #111">연락처</th><td>' + paging.storeTel + '</td></tr>',
		        '           <tr><th style="padding-right: 10px; width: 70px; color: #111">영업시간</th><td>' + paging.storeOpen + ' - ' + paging.storeClose + '</td></tr>',
		        '       </table><hr>',
		        '       <form method="get" action="/product/list"> <input type="hidden" name="storeName" value="' + paging.storeName + '">',
		        '       <input type="hidden" name="storeId" value="' + paging.storeId + '"><input type="hidden" name="storeAddress" value="' + paging.storeAddress + '">',
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
			  map.setCenter({ lat: paging.storeLat, lng: paging.storeLng });
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
			        var filteredData = data.filter(paging => paging.storeName.includes(params.keyword) || paging.storeAddress.includes(params.keyword));
			        if (filteredData.length === 0) {
			            alert('검색 결과가 없습니다.');
			        } else {
			            for (paging of filteredData) {
			                createMarkerAndInfoWindow(map, paging, params);
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
			  var keyword = $('#search-input').val();
			  if(keyword === ''){
				  alert('검색어를 입력해주세요.');
				  return;
			  }
			    var table = document.getElementById("table");
			    table.innerHTML = '';
			    removeInfowindows();
			  
			  getDataFromDB(map, { keyword: keyword } );
			  
			});
	});