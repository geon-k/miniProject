<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container { width:1300px; margin:20px auto; }
	
	
	#main {  margin:30px 0; text-align:center;}
	
	
	.sidebar li { width:145px; margin:10px 0 10px 55px; display:inline-block; }
	.sidebar li a:hover { color:red; font-weight:bold; text-decoration:none; }
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div id="container">
		<div id="main">
			<ul class="sidebar">
				<li>
					<a href="/board/index.do">메인페이지로</a>
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