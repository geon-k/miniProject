<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<style>
	 #container { width: 800px; margin: 0 auto; padding-top: 30px; padding-bottom: 100px;}
	 #boardCate { width: 15%; height: 28px; margin-bottom: 10px;}
	 select option[value=""][disabled] {
	   display: none;
	 }
	 #boardTitle { margin-bottom: 10px; width:100%; height: 30px; border-width: 0 0 1px 0; font-size: 18px;}
	 #userId input[type=text] { border: none; font-size: 17px;}
	 #boardRgd { float: right; margin-right: 15px;}
	 #boardCnt { float: right; margin-bottom: 8px;}
	 #uploadFile { margin-top:8px;}
	 #boardStar { clear:both; margin-bottom: 10px;}
	 #updateForm>#boardStar {
	     display: inline-block;
	     direction: rtl;
	     border:0;
	 }
	 #updateForm input[type=radio]{
	     display: none;
	 }
	 #updateForm>#boardStar label{
	     font-size: 1.8em;
	     color: transparent;
	     text-shadow: 0 0 0 #f0f0f0;
	 }
	 #updateForm>#boardStar label:hover{
	     text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	 }
	 #updateForm>#boardStar label:hover ~ label{
	     text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	 }
	 #updateForm>#boardStar input[type=radio]:checked ~ label{
	     text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	 }
	 #boardMain { margin-bottom: 5px;}
	 #btns { margin: 10px;}
	 #btns>button { width: 80px; height: 30px; font-size: 18px;}
	 #btnList { float: left;}
     #btnDelete { float: right; margin-right: 10px;}
     #btnUpdate { float: right;}
     #image_preview { margin-bottom: 5px;}
 	 #commentTd {
 	 	padding: 13px;
 	 	text-align: center;
 	 }
 	 #commentBtn {
 	 	border-radius: 10px;
 	 	background-color: #F1F1F1;
 	 	padding: 5px;
 	 	font-size: 0.9em;
 	 	text-decoration: none;
 	 }
 	 
 	 #commentBtn:hover {
 	 	background-color: black;
 	 	color: #F1F1F1;
 	 }
 	 
 	 #commentInsertBtn {
 	 	border-radius: 10px; 
 	 	border: 1px #F1F1F1 solid;
 	 	background-color: #F1F1F1; 
 	 	padding: 5px; font-size: 0.9em; 
 	 	position:relative; left:725px;"
 	 }
 	 
 	 #commentInsertBtn:hover {
 		background-color: black;
 	 	color: #F1F1F1;
 	 	cursor: pointer;	 
 	 }
</style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
<div id="container">
	<h3>게시글 상세</h3>
	<form name="updateForm" id="updateForm" action="/board/updateBoard.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="boardNo" id="boardNo" value="${board.boardNo }">
		<input type="hidden" name="originFiles" id="originFiles">
		<select name="boardCate" id="boardCate" required>
			<option value="NOTICE" id="notice">NOTICE</option>
			<option value="HOTELS" id="hotels">HOTELS</option>
			<option value="DESSERT" id="dessert">DESSERT</option>
			<option value="BARS&PUBS" id="barsnpubs">BARS&amp;PUBS</option>
			<option value="RESTAURANT" id="restaurant">RESTAURANT</option>
		</select><br>
		<input type="text" name="boardTitle" id="boardTitle" value="${board.boardTitle }"><br>
		<label id="userId">작성자: <input type="text" name="userId" value="${board.userId }" readonly></label>
		<label id="boardCnt">조회수 ${board.boardCnt }</label>
		<label id="boardRgd">작성일: <fmt:formatDate value="${board.boardRgd }" pattern="yyyy-MM-dd"/></label><br>
		<div id="boardStar">
			<span class="text-bold">별점을 선택해주세요</span>
			<input type="radio" name="boardStar" value="5" id="rate5"><label for="rate5">★</label>
			<input type="radio" name="boardStar" value="4" id="rate4"><label for="rate4">★</label>
			<input type="radio" name="boardStar" value="3" id="rate3"><label for="rate3">★</label>
			<input type="radio" name="boardStar" value="2" id="rate2"><label for="rate2">★</label>
			<input type="radio" name="boardStar" value="1" id="rate1"><label for="rate1">★</label>
		</div>
		<textarea name="boardMain" id="boardMain" cols="116" rows="30">${board.boardMain }</textarea>
		<div id="image_preview">
			<input type="file" name="uploadFiles" id="btnAtt" multiple="multiple">
			<input type="file" name="changedFiles" id="changedFiles" style="display: none;" multiple="multiple">
			<p style="color: red; font-size: 0.9rem;">파일을 변경하려면 미리보기 이미지를 클릭하세요.</p>
			<div id="attZone">
				<c:forEach items="${boardFileList }" var="boardFile" varStatus="status">
					<div style="display: inline-block; position: relative; width: 150px; height: 120px;
					margin: 5px; border: 1px solid #00f; z-index: 1">
						<input type="hidden" id="fileNo${status.index }" name="fileNo${status.index }"
						value="${boardFile.fileNo }">
						<input type="hidden" id="fileName${status.index }" name="fileName${status.index }"
						value="${boardFile.fileName }">
						<input type="file" id="changedFile${boardFile.fileNo }" name="changedFile${boardFile.fileNo }"
						style="display: none;" onchange="fnGetChangedFileInfo(${boardFile.fileNo }, event)">
						<c:if test="${status.last }">
							<input type="hidden" id="fileCnt" name="fileCnt" value="${status.count }">
						</c:if>
						<c:choose>
							<c:when test="${boardFile.fileCate eq 'img' }">
								<img id="img${boardFile.fileNo }" src="/upload/${boardFile.fileName }"
								style="width: 100%; height: 100%; z-index: none; cursor: pointer;"
								class="fileImg" onclick="fnImgChange(${boardFile.fileNo})">
							</c:when>
							<c:otherwise>
								<img id="img${boardFile.fileNo }" src="/images/defaultFileImg.png"
								style="width: 100%; height: 100%; z-index: none; cursor: pointer;"
								class="fileImg" onclick="fnImgChange(${boardFile.fileNo})">
							</c:otherwise>
						</c:choose>
						<input type="button" class="btnDel" value="x" delFile="${boardFile.fileNo }"
						style="width: 30px; height: 30px; position: absolute; right: 0px; bottom: 0px; 
						z-index: 999; background-color: rgba(255, 255, 255, 0.1); color: #f00;"
						onclick="fnImgDel(event)">
						<p id="fileName${boardFile.fileNo }" style="display: inline-block; font-size: 8px; cursor: pointer;">
							${boardFile.oriFileName }
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="map" style="width:70%;height:300px;"></div>
		<div id="btns">
			<button type="button" id="btnList" onclick="location.href='/board/getBoardList.do'">목록</button>
			<button type="submit" id="btnUpdate">수정</button>
			<button type="button" id="btnDelete" onclick="location.href='/board/deleteBoard.do?boardNo=${board.boardNo}'">삭제</button>
		</div>
	</form>
	<br><br><br><br>
	
<!-- 댓글 시작 -->
	<h3>댓글</h3>
	<table style="border: 1px #E0E0E0 solid; border-radius: 10px; width: 800px; margin: 0px;">
		<c:forEach items="${comment }" var="comment">
			<tr>
				<td id="commentTd" style="font-weight: 600; width:15%; font-size:1em;">${comment.writer }</td>
				<td id="commentTd" style="text-align: left; font-size: 0.8em; width:50%;">${comment.content }</td>
				<td id="commentTd" style="font-size: 0.8em; width:15%;"><fmt:formatDate value="${comment.regdate }" pattern="yyyy.MM.dd"/></td>
 				<td id="commentTd" style="width:10%;"><a id="commentBtn" href="/comment/commentSelect.do?cno=${comment.cno }&boardNo=${comment.boardNo}">수정</a></td>
				<td id="commentTd" style="width:10%;"><a id="commentBtn" href="/comment/deleteComment.do?cno=${comment.cno }&boardNo=${comment.boardNo}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<br><br>
	
	<h3>댓글 쓰기</h3>
	<div style="margin: auto;">
		<form action="/comment/insertComment.do" method="post">
			<p>
				<label>작성자</label>&emsp;<input type="text" name="writer">
			</p>
			<p>
				<textarea rows="5" cols="50" name="content" style="resize:none; border: 1px #E0E0E0 solid; border-radius: 10px; padding: 8px; width: 780px;"></textarea>
			</p>
			<p>
				<input type="hidden" name="boardNo" value="${board.boardNo }">
				<button type="submit" id="commentInsertBtn" >댓글 등록</button>
			</p>
		</form>
	</div>
<!-- 댓글 끝 -->

</div>
<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
<script>
	
	// 추가된 파일들을 담아줄 배열. File 객체로 하나씩 담음
	let uploadFiles = [];
	// 기존 첨부파일 배열
	let originFiles = [];
	// 변경된 첨부파일 배열
	let changedFiles = [];

	$(function() {
		const boardStar = '${board.boardStar}';
		
		for(let i = 1; i <= $("input[name='boardStar']").length; i++) {
			if(boardStar == $("#rate" + i).val()) {
				$("#rate" + i).attr("checked", "checked");
			}
		}
		
	 	const boardCate = '${board.boardCate}';
		
		if(boardCate == $("#hotels").val()) {
			$("#hotels").attr("selected", "selected");
		} else if(boardCate == $("#dessert").val()) {
			$("#dessert").attr("selected", "selected");
		} else if(boardCate == $("#barsnpubs").val()) {
			$("#barsnpubs").attr("selected", "selected");
		} else if(boardCate == $("#restaurant").val()) {
			$("#restaurant").attr("selected", "selected");
		} else if(boardCate == $("#notice").val()) {
			$("#notice").attr("selected", "selected")
		}
		
		if(boardCate == $("#hotels").val()) {
			$("#hotels").attr("selected", "selected");
		} else if(boardCate == $("#dessert").val()) {
			$("#dessert").attr("selected", "selected");
		} else if(boardCate == $("#barsnpubs").val()) {
			$("#barsnpubs").attr("selected", "selected");
		} else if(boardCate == $("#restaurant").val()) {
			$("#restaurant").attr("selected", "selected");
		} else {
			$("#notice").attr("selected", "selected")
		} 
		
		//세션, 리퀘스트 스코프에 담겨진 데이터를 빼오는 방식
		const loginUserId = '${loginUser.userId}';
		const userId = '${board.userId}';
		const loginUserRole = '${loginUser.userRole}';
		
		//게시글 작성자와 로그인 유저가 다르면 게시글 수정 못하게 설정
		if(loginUserId !== userId && loginUserRole != 'admin') {
			$("#btnUpdate").hide();
			$("#btnDelete").hide();
			$("#boardTitle").attr("readonly", true);
			$("#boardMain").attr("readonly", true);
			$("#boardCate").attr("disabled", true);
			$("#boardStar").attr("onclick", "return(false)");
			$("#boardStar>span").hide();
			$("#image_preview>#btnAtt").hide();
			$("#image_preview>p").hide();
		}
		
		if(userId.search('관리자') != -1) {
			$("#hotels").attr("disabled", true);
			$("#dessert").attr("disabled", true);
			$("#barsnpubs").attr("disabled", true);
			$("#restaurant").attr("disabled", true);
			$("#boardStar").hide();
			$("#image_preview").hide();
			$("#map").hide();
			$("btnList").attr("onclick", "location.href='/admin/getAdboardlist.do'");
		}
		
		if(userId.search('관리자') == -1) {
			$("#notice").attr("disabled", true);
		}
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
		
		$("#updateForm").on("submit", function(e) {
			dt = new DataTransfer();
			
			for(f in uploadFiles) {
				let file = uploadFiles[f];
				dt.items.add(file);
			}
			
			$("#btnAtt")[0].files = dt.files;
			
			// changedFiles 배열에 담겨있는 파일들을 input에 옮겨담기
			// 위에서 사용한 DataTransfer객체 비워주기
			dt.clearData();
			
			for(f in changedFiles) {
				let file = changedFiles[f];
				dt.items.add(file);
			}
			
			$("#changedFiles")[0].files = dt.files;
			
			// 변경된 파일정보와 삭제된 파일정보를 담고있는 배열 전송
			// 배열 형태로 전송 시 백단(Java)에서 처리불가 => JSON String 형태로 변환하여 전송한다.
			$("#originFiles").val(JSON.stringify(originFiles));
		});
		
		for(let i = 0; i < $("#fileCnt").val(); i++) {
			const originFileObj = {
				boardNo: $("#boardNo").val(),
				fileNo: $("#fileNo" + i).val(),
				fileName: $("#fileName" + i).val(),
				// 업로드 파일 경로가 각각 다를 때는 boardFilePath 속성도 추가
				// 파일 상태값(수정되거나 삭제된 파일은 변경)
				fileStatus: "N"
			};
			
			originFiles.push(originFileObj);
		}
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
		 + " width: 150px; height: 120px; margin: 5px; border: 1px solid #00f; z-index: 1;");
		
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
	
	function fnImgChange(fileNo) {
		// 기존 파일의 이미지를 클릭했을 때 같은 레벨의 input type="file"을 가져온다.
		let changedFile = document.getElementById("changedFile" + fileNo);
		// 위에서 가져온 input 강제클릭 이벤트 발생시킴
		changedFile.click();
	}
	
	function fnGetChangedFileInfo(fileNo, e) {
		// 변경된 파일 받아오기
		const files = e.target.files;
		// 받아온 파일 배열 형태로 변경(싱글파일 업로드여서 파일배열 한 개의 인자만 담김)
		const fileArr = Array.prototype.slice.call(files);
		
		// 변경된 파일들을 변경된 파일 배열에 담아준다.
		changedFiles.push(fileArr[0]);
		
		// 미리보기 화면에서 새로 변경된 파일의 이미지로 출력
		const reader = new FileReader();
		
		reader.onload = function(ee) {
			const img = document.getElementById("img" + fileNo);
			const p = document.getElementById("fileName" + fileNo);
			
			p.textContent = fileArr[0].name;
			
			// 이미지인지 체크
			if(fileArr[0].name.toLowerCase().match(/(.*?)\.(jpg|jpeg|png|gif|bmp|svg)$/))
				img.src = ee.target.result;
			else
				img.src = "/images/defaultFileImg.png";
		}
		
		reader.readAsDataURL(fileArr[0]);
		
		// 기존 파일을 담고있는 배열에서 변경이 일어난 파일 수정
		for(let i = 0; i < originFiles.length; i++) {
			if(fileNo == originFiles[i].fileNo) {
				originFiles[i].fileStatus = "U";
				originFiles[i].newFileNm = fileArr[0].name;
			}
		}
	}
	
	// x버튼 클릭시 동작하는 메소드
	function fnImgDel(e) {
		// 클릭된 태그 가져오기
		let ele = e.srcElement;
		// delFile 속성 값 가져오기(boardFileNo)
		let delFile = ele.getAttribute("delFile");
		
		for(let i = 0; i < originFiles.length; i++) {
			if(delFile == originFiles[i].fileNo) {
				originFiles[i].fileStatus = "D";
			}
		}
		
		// 부모 요소인 div 삭제
		let div = ele.parentNode;
		$(div).remove();
	}
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=74dadd665477bb479ae9a0d793b563cd&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 2 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	const boardAddr = '${board.boardAddr}';
    const placeTitle = '${board.placeTitle}';
	
	geocoder.addressSearch(boardAddr, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + placeTitle + '</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>
<script>
	$("#btnUpdate").click(function() {
		if(!$("#boardTitle").val()) {
			alert("제목을 입력해주세요.");
			$("#boardTitle").focus();
			return false;
		}
		/* if($("input:radio[name=boardStar]:checked").length < 1) {
			alert("별점을 선택해주세요.");
			return false;
		} */
		if(!$("#boardMain").val()) {
			alert("내용을 입력해주세요.");
			$("#boardMain").focus();
			return false;
		}
	})
	
</script>
</body>
</html>