<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 쓰기</title>
<style>
	 #container { width: 800px; margin: 0 auto; padding-top: 30px; padding-bottom: 100px;}
	 #boardCate { width: 15%; height: 28px; margin-bottom: 10px;}
	 select option[value=""][disabled] {
	   display: none;
	 }
	 #boardTitle { margin-bottom: 10px; width:100%; height: 30px; border-width: 0 0 1px 0; font-size: 18px;}
	 #userId input[type=text] { border: none; font-size: 17px;}
	 #uploadFile { margin-top:8px;}
	 #boardStar { margin-bottom: 10px;}
	 #insertForm>#boardStar {
	     display: inline-block;
	     direction: rtl;
	     border:0;
	 }
	 #insertForm input[type=radio]{
	     display: none;
	 }
	 #insertForm>#boardStar label{
	     font-size: 1.8em;
	     color: transparent;
	     text-shadow: 0 0 0 #f0f0f0;
	 }
	 #insertForm>#boardStar label:hover{
	     text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	 }
	 #insertForm>#boardStar label:hover ~ label{
	     text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	 }
	 #insertForm>#boardStar input[type=radio]:checked ~ label{
	     text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	 }
	 #boardMain { margin-bottom: 5px;}
	 #btns { margin: 10px;}
	 #btns>button { width: 80px; height: 30px; font-size: 18px;}
	 #btnList { float: left;}
     #btnDone { float: right;}
     #btnCancel { float: right; margin-right: 10px;}
     #image_preview { margin-bottom: 5px;}
 	
 	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:70%;height:300px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
<div id="container">

	<h3>리뷰 쓰기</h3>
	<form name="insertForm" id="insertForm" action="/board/insertBoard.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="placeTitle" id="placeTitle">
		<input type="hidden" name="boardCatecd" id="boardCatecd">
		<select name="boardCate" id="boardCate" required>
			<option value="" disabled selected>CATEGORY</option>
			<option value="NOTICE" disabled>NOTICE</option>
			<option value="HOTELS">HOTELS</option>
			<option value="DESSERT">DESSERT</option>
			<option value="BARS&PUBS">BARS&amp;PUBS</option>
			<option value="RESTAURANT">RESTAURANT</option>
		</select><br>
		<input type="text" name="boardTitle" id="boardTitle" placeholder="제목"><br>
		<label for="userId" id="userId">작성자: </label><input type="text" name="userId" value="${loginUser.userId}" readonly><br>
		<div id="boardStar">
			<span class="text-bold">별점을 선택해주세요</span>
			<input type="radio" name="boardStar" value="5" id="rate5"><label for="rate5">★</label>
			<input type="radio" name="boardStar" value="4" id="rate4"><label for="rate4">★</label>
			<input type="radio" name="boardStar" value="3" id="rate3"><label for="rate3">★</label>
			<input type="radio" name="boardStar" value="2" id="rate2"><label for="rate2">★</label>
			<input type="radio" name="boardStar" value="1" id="rate1"><label for="rate1">★</label>
		</div>
		<textarea name="boardMain" id="boardMain" cols="116" rows="30"></textarea>
		<div id="image_preview">
			<input type="file" name="uploadFiles" id="btnAtt" multiple="multiple">
			<div id="attZone" data-placeholder="파일선택 버튼을 눌러 파일을 첨부하세요."></div>
		</div>
		<div class="map_wrap">
		    <div id="map" style="width:100%; height:100%; position:relative; overflow:hidden;"></div>
		
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		                <div>
		                	<input type="hidden" name="boardAddr" id="boardAddr" value="">
		                    상호명 : <input type="text" id="keyword" size="15"> 
		                    <button type="button" onclick="searchPlaces(); return false;">검색하기</button> 
		                </div>
		            </div>
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div>
		<div id="btns">
			<button type="button" id="btnList" onclick="location.href='/board/getBoardList.do'">목록</button>
			<button type="submit" id="btnDone">등록</button>
			<button type="button" id="btnCancel" onclick="history.back();">취소</button>
		</div>
	</form>
</div>
<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
<script>
	// 추가된 파일들을 담아줄 배열. File 객체로 하나씩 담음
	let uploadFiles = [];
	
	$(function() {
		// input type="file"이 변경되면 미리보기 동작
		$("#btnAtt").on("change", function(e) {
			// input type="file"에 추가된 파일들을 변수로 받아옴
			const files = e.target.files;
			// 변수로 받아온 파일들을 배열 형태로 변환
			const fileArr = Array.prototype.slice.call(files);
			
			// 배열에 있는 파일들을 하나씩 꺼내서 처리
			for(f of fileArr) {
				imageLoader(f);
			}
	
		});
		
		$("#insertForm").on("submit", function(e) {
			
			// 마지막으로 btnAtt에 uploadFiles에 있는 파일들을 담아준다.
			dt = new DataTransfer();
			
			for(f in uploadFiles) {
				const file = uploadFiles[f];
				dt.items.add(file);
			}
			
			$("#btnAtt")[0].files = dt.files;

			// boardCate value값을 boardCatecd로 전달
			const boardCatecd = $("#boardCate").val();
			
			switch(boardCatecd) {
			case 'HOTELS' :
					$("#boardCatecd").val(1);
					break;
			case 'DESSERT' :
					$("#boardCatecd").val(2);
					break;
			case 'BARS&amp;PUBS' :
					$("#boardCatecd").val(3);
					break;
			case 'RESTAURANT' :
					$("#boardCatecd").val(4);
					break;
			default :
					$("#boardCatecd").val(0);
					break;
			}
			
		});
		
	});
	
	// 미리보기 영역에 들어갈 img태그 생성 및 선택된 파일을 Base64 인코딩된 문자열 형태로 미리보기 가능하게 해줌
	function imageLoader(file) {
		uploadFiles.push(file);
		
		const reader = new FileReader();
		
		reader.onload = function(e) {
			// 이미지를 표출해 줄 img태크 선언
			let img = document.createElement("img");
			img.setAttribute("style", "width: 100%; height: 100%; z-index: none;");
			
			// 이미지 파일인지 아닌지 체크
			if(file.name.toLowerCase().match(/(.*?)\.(jpg|jpeg|png|gif|svg|bmp)$/)) {
				// 이미지 파일 미리보기 처리
				img.src = e.target.result;				
			} else {
				// 일반 파일 미리보기 처리
				img.src = "/images/defaultFileImg.png";
			}
			
			// 미리보기 영역에 추가
			// 미리보기 이미지 태그와 삭제 버튼, 파일명을 표출하는 p태그를 묶어주는 div를 만들어 미리보기 영역에 추가
			$("#attZone").append(makeDiv(img, file));
		};
		
		// 파일을 Base64 인코딩된 문자열로 변경
		reader.readAsDataURL(file);
	};
	
	// 미리보기 영역에 들어갈 div(img + button + p)를 생성하고 리턴
	function makeDiv(img, file) {
		// div 생성
		let div = document.createElement("div");
		div.setAttribute("style", "display: inline-block; position: relative;"
		 + " width: 150px; height: 120px; margin: 5px; border: 1px solid #848484; z-index: 1;");
		
		// button 생성
		let btn = document.createElement("input");
		btn.setAttribute("type", "button");
		btn.setAttribute("value", "x");
		btn.setAttribute("delFile", file.name);
		btn.setAttribute("style", "width: 30px; height: 30px; position: absolute;"
		+ " right: 0px; bottom: 0px; z-index: 999; background-color: rgba(255, 255, 255, 0.1);"
		+ " color: #f00;");
		
		// 버튼 클릭 이벤트
		// 버튼 클릭 시 해당 파일이 삭제되도록 설정
		btn.onclick = function(e) {
			// 클릭된 버튼
			const ele = e.srcElement;
			// delFile(파일이름) 속성 꺼내오기: 삭제될 파일명
			const delFile = ele.getAttribute("delFile");
			
			for(let i = 0; i < uploadFiles.length; i++) {
				// 배열에 담아놓은 파일들 중에 해당 파일 삭제
				if(delFile == uploadFiles[i].name) {
					// 배열에서 i번째 한 개만 제거
					uploadFiles.splice(i, 1);
				}
			}
			
			// 버튼 클릭 시 btnAtt에 첨부된 파일도 삭제
			// input type=file은 첨부된 파일들을 fileList 형태로 관리
			// fileList에 일반적인 File객체를 넣을 수 없고
			// DataTransfer라는 클래스를 이용하여 완전한 fileList 형태로 만들어서
			// input.files에 넣어줘야 된다.
			dt = new DataTransfer();
			
			for(f in uploadFiles) {
				const file = uploadFiles[f];
				dt.items.add(file);
			}
			
			console.log($("#btnAtt"));
			$("#btnAtt")[0].files = dt.files;
			
			// 해당 img를 담고있는 부모태그인 div 삭제
			const parentDiv = ele.parentNode;
			$(parentDiv).remove();
		}
		
		// 파일명 표출할 p태그 생성
		const fName = document.createElement("p");
		fName.setAttribute("style", "display: inline-block; font-size: 8px;");
		fName.textContent = file.name;
		
		// div에 하나씩 추가
		div.appendChild(img);
		div.appendChild(btn);
		div.appendChild(fName);
		
		// 완성된 div 리턴
		return div;
	}
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=74dadd665477bb479ae9a0d793b563cd&libraries=services"></script>
<script>
	//현재 위치 좌표
	let latitude;
	let longitude;
	
	getUserLocation();
	
	// 마커를 담을 배열입니다
	var markers = [];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	
	    var keyword = document.getElementById('keyword').value;
	
	    /* if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('상호명을 입력해주세요!');
	        return false;
	    } */
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);
	
	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	
	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	            
	            // 마커를 클릭했을 때 좌표 구하기 
	        	kakao.maps.event.addListener(marker, 'click', function (){
	        		var position = this.getPosition();
	        	    //console.log(position);
	        	    $("#placeTitle").val(title);
	        	    kakao.maps.event.addListener(marker, 'mouseout', function() {
	                	displayInfowindow(marker, title);
	            	});
	        	    
	        	    // 좌표를 주소로 변환
	        	    var geocoder = new kakao.maps.services.Geocoder();

	        	    var coord = position;
	        	    var callback = function(result, status) {
	        	        if (status === kakao.maps.services.Status.OK) {
	        	        	
	        	            console.log(result[0].road_address.address_name);
	        	            $("#boardAddr").attr("value", result[0].road_address.address_name);
	        	        }
	        	    };

	        	    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	        	});
	
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);
	
	        fragment.appendChild(itemEl);
	    }
	    
	
	    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	    //map.setCenter(new kakao.maps.LatLng(latitude, longitude));
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}
	
	function success({ coords, timestamp }) {
        latitude = coords.latitude;   // 위도
        longitude = coords.longitude; // 경도
        
        //alert(`위도: ${latitude}, 경도: ${longitude}, 위치 반환 시간: ${timestamp}`);
        //location.href = `https://www.openstreetmap.org/#map=18/${latitude}/${longitude}`;
    }

    function getUserLocation() {
        if (!navigator.geolocation) {
            throw "위치 정보가 지원되지 않습니다.";
        }
        navigator.geolocation.getCurrentPosition(success);
    }
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
</script>
<script>
	$("#btnDone").click(function() {
		if(!$("#boardCate").val()) {
			alert("카테고리를 선택해주세요.");
			return false;
		}
		if(!$("#boardTitle").val()) {
			alert("제목을 입력해주세요.");
			$("#boardTitle").focus();
			return false;
		}
		if($("input:radio[name=boardStar]:checked").length < 1) {
			alert("별점을 선택해주세요.");
			return false;
		}
		if(!$("#boardMain").val()) {
			alert("내용을 입력해주세요.");
			$("#boardMain").focus();
			return false;
		}
		if (!$("#boardAddr").val()) {
	        alert('지도에 장소를 표시해주세요.');
	        return false;	    	
	    }
	
	})
</script>
</body>
</html>