<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#container { width: 800px; margin-bottom: 50px; display: flex;
	flex-direction: column; justify-content: center; align-items: center;}
#sidebar { text-align: center; float: left; margin-left: 10; margin-top: 50px;}
#content { float: right;}
#ad_menu_title { border: 1px solid lightgray;}
#ad_menu_mn { border: 1px solid lightgray;}
.ad_menu_s { margin-top: 10px;}


</style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div  id="container">
			<div id="sidebar">
			<div id="ad_menu_title">
			<h3>관리자 메뉴</h3>
			</div>
			<div id="ad_menu_mn">
				<div class="ad_menu_s">
					<a href="/admin/adMain.do">
					<span class="menu">메인화면으로</span></a>
				</div>
				<div class="ad_menu_s">
					<a href="/board/insertAdminboard.do">
					<span class="menu">공지사항 작성</span></a>
				</div>		
				<div class="ad_menu_s">
					<a href="/admin/getAdboardlist.do">
					<span class="menu">게시글 관리</span></a>
				</div>	
				<div class="ad_menu_s">
					<a href="/admin/getUserList.do">
					<span class="menu">회원 관리</span></a>
				</div>				
				<!-- <li>
					<a href="/admin/getAdCommentList">댓글 관리</a>
				</li>  -->
				<div class="ad_menu_s">
					<a href="/user/logout.do">
					<span class="menu">로그아웃</span>
					</a>
				</div>
			</div>
		</div>
		<div id="content">
		<h2>게시글 관리</h2>
		<hr>
		<form id="searchForm" action="/admin/getAdboardlist.do" method="post">
			<table border="1" style="width: 500px; border-collapse: collapse;">
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
		
		<table id="boardTable" border="1" style="width: 500px; border-collapse: collapse;">
			<tr style= "text-align: center;">
				<th style= "width: 100px;">카테고리</th>
				<th style= "width: 100px;">제목</th>
				<th style= "width: 100px;">작성자</th>
				<th style= "width: 100px;">등록일</th>
				<th style= "width: 50px;">조회수</th>
			</tr>
			<c:forEach items="${boardList }" var="board">
				<tr style= "text-align: center;">
				<c:if test="${board.boardCate eq 'NOTICE' }">
                  	<tr id="tr" style="background: lemonchiffon; text-align: center">
                 </c:if>
					<td>${board.boardCate }</td>
					<td>
						<a href="/board/updateBoardCnt.do?boardNo=${board.boardNo }">${board.boardTitle }</a>
					</td>
					<td>${board.userId }</td>
					<td>
						<fmt:formatDate value="${board.boardRgd }" pattern="yyyy-MM-dd"/>
					</td>
					<td>${board.boardCnt }</td>
				</tr>
			</c:forEach>
		</table>
		<br/>
		<br/>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	<script>
		$(function() {
			$("#btnSearch").on("click", function() {
				$("#searchForm").submit();
			})
		});
	</script>
</body>
</html>