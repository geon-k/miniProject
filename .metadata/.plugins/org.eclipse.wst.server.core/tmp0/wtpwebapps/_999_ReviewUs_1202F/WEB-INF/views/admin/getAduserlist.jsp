<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<form id="searchForm" action="/admin/getAduserlist.do" method="post">
			<table border="1" style="width: 700px; border-collapse: collapse;">
				<tr>
					<td align="right">
						<select name="searchCondition">
							<option value="all"
								<c:if test="${searchCondition eq 'all' || searchCondition eq '' || searchCondition eq null}">
									selected="selected"
								</c:if>
							>전체</option>
							<option value="userId"
								<c:if test="${searchCondition eq 'userId' }">
									selected="selected"
								</c:if>
							>아이디</option>
							<option value="userNm"
								<c:if test="${searchCondition eq 'userNm' }">
									selected="selected"
								</c:if>
							>닉네임</option>
						</select>
						<input type="text" name="searchKeyword" value="${searchKeyword }">
						<button type="button" id="btnSearch">검색</button>
					</td>
				</tr>
			</table>
		</form>
		
		<table id="boardTable" border="1" style="width: 1000x; border-collapse: collapse;">
			<tr>
				<th style= "width: 100px;">ID</th>
				<th style= "width: 150px;">비밀번호</th>
				<th style= "width: 150px;">닉네임</th>
				<th style= "width: 150px;">이메일</th>
				<th style= "width: 100px;">가입일</th>
				<th style= "width: 100px;">회원등급</th>
				<th style= "width: 100px;">정지</th>
			</tr>
			<c:forEach items="${aduserList }" var="user">
				<tr>
					<td>${user.userId }</td>
					<td>${user.userPwd }</td>
					<td>${user.userNm }</td>
					<td>${user.userEmail }</td>
					<td>
						<fmt:formatDate value="${user.userRgd }" pattern="yyyy-MM-dd"/>
					</td>
					<td>${user.userRole }</td>
					<td><a href="/admin/updateUserRole.do?userId=${user.userId}">정지</a></td>
				</tr>
			</c:forEach>
		</table>
		<br/>
	</div>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	<script>
	$(function() {
		$("#btnSearch").on("click", function() {
			$.ajax({
					url: "/admin/getAduserlist.do",
					type: "post",
					data: $("#searchForm").serialize(),
					success: function(obj) {
						console.log(obj);
						$("#searchForm").submit();
					},
					error: function(e) {
						console.log(e);
					}
			})
		});
	});
	</script>
</body>
</html>