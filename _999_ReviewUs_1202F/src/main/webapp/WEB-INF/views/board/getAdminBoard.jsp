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
	 #boardCnt { float: right;}
	 #boardMain { margin-bottom: 5px;}
	 #btns { margin: 10px;}
	 #btns>button { width: 80px; height: 30px; font-size: 18px;}
	 #btnList { float: left;}
     #btnDelete { float: right; margin-right: 10px;}
     #btnUpdate { float: right;}
 	
</style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
<div id="container">
	<h3>게시글 상세</h3>
	<form name="updateAdminForm" id="updateAdminForm" action="/board/updateAdminboard.do" method="post">
		<input type="hidden" name="boardNo" id="boardNo" value="${board.boardNo }">
		<select name="boardCate" id="boardCate" required>
			<option value="NOTICE" disabled selected>NOTICE</option>
		</select><br>
		<input type="text" name="boardTitle" id="boardTitle" value="${board.boardTitle }"><br>
		<label id="userId">작성자: <input type="text" name="userId" value="[관리자]${board.userId }" readonly></label>
		<label id="boardCnt">조회수 ${board.boardCnt }</label>
		<label id="boardRgd">작성일: <fmt:formatDate value="${board.boardRgd }" pattern="yyyy-MM-dd"/></label><br>
		<textarea name="boardMain" id="boardMain" cols="116" rows="30">${board.boardMain }</textarea>
		
	</form>
	<div id="btns">
		<button type="button" id="btnList" onclick="location.href='/board/getAdminboardList.do'">목록</button>
		<button type="submit" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete" onclick="location.href='/board/deleteAdminboard.do?boardNo=${board.boardNo}'">삭제</button>
	</div>

</div>
<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
<script>
	$(function() {
		//세션, 리퀘스트 스코프에 담겨진 데이터를 빼오는 방식
		const loginUserId = '${loginUser.userId}';
		const userId = '${board.userId}';
		const loginUserRole = '${loginUser.userRole}';
		
		//관리자가 아니면 게시글 수정 못하게 설정
		if(loginUserRole != 'admin') {
			$("#btnUpdate").hide();
			$("#btnDelete").hide();
			$("#boardTitle").attr("readonly", true);
			$("#boardMain").attr("readonly", true);
		}
	})
</script>
</body>
</html>