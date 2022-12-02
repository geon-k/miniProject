<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img {
		position:relative;
		left: 100px;
	}
	ul, li {
		list-style: none;
	}
	
	a {
		 text-decoration: none;
		 color: black;
		 font-weight: 500;
		 font-size: 1.5rem;
	}
	
	a:hover {
		text-decoration: underline;
	}
	
	nav ul li{
		display: inline-block;
	}
	nav * {
	  vertical-align: middle;
	}
	
	.main-div li a {
		font-size: 1.125rem;
	}
	
	.user-nav {
		display: flex;
		align-items: center;
		margin-right: 100px;
	}
	
	.user-nav li {
		margin-left: 10px;
	}
	
	.user-nav li a {
		font-size: 0.9rem;
	}

</style>
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
</head>
<body>
	<header style="display: flex; align-items: center; justify-content: space-between">
		<h1>
		<!-- /를 붙이면 무조건 루트주소 뒤에 붙는다. -->
		<!-- localhost:8090/user/login.do -->
		<!-- localhost:8090/hello.do -->
			<a href="/index.jsp"><img src="/images/(small)ReviewUs.png" width="200px"></a>
		</h1>
		<nav id="main">
			<ul class="main-nav">
				<li>
					<a href="/board/getBoardList.do">&ensp;BARS ＆ PUBS&emsp;</a>
				</li>			
				<li>
					<a href="/board/getBoardList.do">&ensp;DESSERT PLACES&emsp;</a>
				</li>			
				<li>
					<a href="/board/getBoardList.do">&ensp;RESTAURANTS&emsp;</a>
				</li>			
				<li>
					<a href="/board/getBoardList.do">&ensp;HOTEL</a>
				</li>			
			</ul>
		</nav>
		<nav id="user">
			<ul class="user-nav">
				<c:choose>
					<c:when test="${loginUser eq null}">
						<li>
							<a href="/user/login.do">로그인</a>
						</li>
						<li>
							<a href="/user/join.do">회원가입</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="/mypage/getMypage.do?userId=${loginUser.userId }"><b>${loginUser.userId } 님</b></a>
						</li>
						<li>
							<a href="/user/logout.do">로그아웃</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>	
		</nav>
	</header>
</body>
</html>