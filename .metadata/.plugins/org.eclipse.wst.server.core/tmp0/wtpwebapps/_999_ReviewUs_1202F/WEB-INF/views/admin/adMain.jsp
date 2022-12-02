<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container { width: ; height ;

}
#sidebar { float: left;}
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div id="">
		<div>
			<ul class="sidebar">
				<li>
					<a href="/admin/adMain.do">메인페이지로</a>
				</li>
				<li>
					<a href="/board/insertAdminboard.do">공지 작성</a>
				</li>
				<li>
					<a href="/admin/getAdboardlist.do">게시글 관리</a>
				</li>
				<li>
					<a href="/admin/getAduserlist.do">회원 관리</a>
				</li>
				<li>
					<a href="/admin/getAdCommentlist.do">댓글 관리</a>
				</li>
				<li>
					<a href="/user/logout.do">로그아웃</a>
				</li>
			</ul>	
		</div>
		<div id="content">
		<!-- 대시보드 구현  -->
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
</body>
</html>