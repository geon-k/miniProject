<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
		<h2>게시글 관리</h2>
		<div id="sidebar">
			<h3>관리자 메뉴</h3>
			<ul>
				<li>
					<a href="/admin/adMain.do">메인화면으로</a>
				</li>
			
				<li>
					<a href="/board/insertAdminboard.do">공지 작성</a>
				</li>
				<li>
					<a href="/admin/getAdboardlist.do">게시글 관리</a>
				</li>
				<li>
					<a href="/admin/getUserList.do">회원 관리</a>
				</li>
				<!-- <li>
					<a href="/admin/getAdCommentList">댓글 관리</a>
				</li>  -->
				<li>
					<a href="/user/logout.do">로그아웃</a>
				</li>
			</ul>	
		</div>
		<form id="searchForm" action="/board/getCommentList.do" method="post">
			<table border="1" style="width: 1400px; border-collapse: collapse;">
				<tr>
					<td align="right">
						<select name="searchCondition">
							<option value="all"
								<c:if test="${searchCondition eq 'all' || searchCondition eq '' || searchCondition eq null}">
									selected="selected"
								</c:if>
							>전체</option>
							<option value="title"
								<c:if test="${searchCondition eq 'title' }">
									selected="selected"
								</c:if>
							>제목</option>
							<option value="content"
								<c:if test="${searchCondition eq 'content' }">
									selected="selected"
								</c:if>
							>내용</option>
							<option value="writer"
								<c:if test="${searchCondition eq 'writer' }">
									selected="selected"
								</c:if>
							>작성자</option>
						</select>
						<input type="text" name="searchKeyword" value="${searchKeyword }">
						<button type="button" id="btnSearch">검색</button>
					</td>
				</tr>
			</table>
		</form>
		
		<table id="boardTable" border="1" style="width: 100px; border-collapse: collapse;">
			<tr>
				<th style= "width: 100px;">번호</th>
				<th style= "width: 150px;">제목</th>
				<th style= "width: 150px;">작성자</th>
				<th style= "width: 150px;">등록일</th>
				<th style= "width: 100px;">조회수</th>
				<th style= "width: 100px;">신고수</th>
				<th style= "width: 100px;">삭제</th>
			</tr>
			<c:forEach items="${commentList }" var="comment">
				<tr>
					<td>${comment.cmmNo }</td>
					<td>${comment.cmmNo }</td>
					<td>${comment.cmmTitle }</td>
					<td>${comment.userId }</td>
					<td>
						<fmt:formatDate value="${comment.cmmRgd }" pattern="yyyy-MM-dd"/>
					</td>
					<td>${comment.rprtCnt }</td>
					<td><button type="button" id="btnDel" onclick="location.href=/board/deleteComment.do?commNo=${board.boardNo }"
					style="cursor:pointer">삭제</button></td>
				</tr>
			</c:forEach>
		</table>
		<br/>
		<br/>
	</div>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	<script>
	</script>
</body>
</html>