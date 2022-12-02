<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
    #main_content {display: inline-block; width: 100%;}
      
      #d_list { float: left; width: 20%; text-align: center;}
    #list_menu { margin-top: 50px;}
    #list_menu li {margin: 10px;  height:50px; list-style: none;}
    #list_menu a { text-decoration: none;}
    
    
    #main_div { float:right; text-align: center; width: 50%; margin-right:300px;}
    tr td { border: 1px solid black;}
  </style>
  <script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
  <script>
  $(function() {
		$(".pagination a").on("click", function(e) {
			e.preventDefault();
			
			$("input[name='pageNum']").val($(this).attr("href"));
			$("#searchForm").submit();
		});
		
		$("#btnSearch").on("click", function() {
			$("input[name='pageNum']").val(1);
			
			$("#searchForm").submit();
		});
	});
  </script>
</head>
<body>
	<div>
    <header>
      <br><br><br>
    </header>
  </div>
  <hr>
  <main id="main_content">
    <div id="d_list">
      <ul id="list_menu">
        <li><a href="/mypage/getMypage.do?userId=${loginUser.userId}">기본페이지</a></li>
        <li><a href="/mypage/updateMypage.do?userId=${loginUser.userId}">회원정보 수정</a></li>
        <li><a href="/mypage/deleteMypage.do?userId=${loginUser.userId}">회원탈퇴</a></li>
        <li><a href="/mypage/postMypage.do?userId=${loginUser.userId}">내가 쓴 게시글</a></li>
        <li><a href="/mypage/commentMypage.do?userId=${loginUser.userId}">내가 쓴 댓글</a></li>
      </ul>
    </div>
    <div id="main_div">
      <h2>내가 쓴 게시글</h2>
      <br>
      <table id="boardTable" border="1" style="width: 100%; text-align:center; border-collapse: collapse;">
      	<tr>
			<th style="backgrond: orange; width: 100px;">번호</th>
			<th style="backgrond: orange; width: 200px;">제목</th>
			<th style="backgrond: orange; width: 150px;">등록일</th>
			<th style="backgrond: orange; width: 100px;">조회수</th> 
		</tr>
		<c:forEach items="${boardList}" var="board">
			<tr style="height:50px;">
				<td>${board.boardNo}</td>
				<td>
					<a href="/board/updateBoardCnt.do?boardNo=${board.boardNo}">${board.boardTitle}</a>
				</td>
				<td>
					<fmt:formatDate value="${board.boardRgd}" pattern="yyyy-MM-dd"/>
				</td>
				<td>${board.boardCnt}</td>
			</tr>
		</c:forEach>
      </table>
      <br>
 
      <form id="searchForm" action="/mypage/postMypage.do" method="post">
			<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageVO.cri.amount }">
			
			<input type="text" name="searchKeyword" value="${searchKeyword }">
			<button type="submit" id="btnSearch">검색</button>
	</form>
      <br>
		<div style="text-align:center;">
			<ul class="pagination">
				<c:if test="${pageVO.prev}">
					<li class="pagination_button">
						<a href="${pageVO.cri.pageNum-1}">이전</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
					<li class="pagination_button">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageVO.next}">
					<li class="pagination_button">
						<a href="${pageVO.cri.pageNum+1}">다음</a>
					</li>
				</c:if>	
			</ul>
		</div>    
    </div>
  </main>
  <footer>
  </footer>
</body>
</html>