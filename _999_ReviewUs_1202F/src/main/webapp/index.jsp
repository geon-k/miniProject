<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.Search{
	padding-top: 20px;
}

.SearchIn{
	width: 300px;
    height: 30px;
	border: 1px #E0E0E0 solid;
    border-radius: 10px;
}

#SearchText{
	vertical-align: middle;
	font-weight: lighter;
    font-size: 1.3rem;
}
</style>
</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>
	
	<div style="text-align: center;">
        <form class="Search">
            <input type="text" class="SearchIn" placeholder="검색어를 입력해 주세요." aria-label="Search"> 
            <a id="SearchText" href="">검색</a>
        </form>
		<h1>게시판 홈</h1>
		<p>메인페이지</p>
	</div>
	
	<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>