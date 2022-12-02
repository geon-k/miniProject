<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#container { width: 1500px; margin:20px auto;}
	
	/* display: flex;
	flex-direction: column; justify-content: center; align-items: center;  margin-bottom: 50px; */
	
	h2 { text-align:center; margin-bottom:-40px;}
	
	#sidebar { width:20%;  float:left; margin-left: 30px; margin-top: 50px; text-align:center;}
	
	#content { width:70%; float:right; margin-left: 80px; }
	.ad_menu_s {margin-bottom: 40px; height:50px; line-height:80px;}

	.ad_menu_s { margin-top: 10px;}
	
	#numPage { width:100%; }
	
	.pagination { margin-left:850px;}
	.pagination a { color:black; text-decoration:none; }
	.pagination_button { 	clear: both;   	}
   	.pagination li {  display:inline-block; margin-left:5px}
   	
   	

</style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div  id="container">
		<h2>게시글 관리</h2>
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
		<br><br><br>
		<form id="searchForm" action="/admin/getAdboardlist.do" method="post">
		 <input type="hidden" id="pageNum" name="pageNum" value="${pageVO.cri.pageNum }">
         <input type="hidden" id="amount" name="amount" value="${pageVO.cri.amount }">
			<table border="1" style="width: 100%; border-collapse: collapse;">
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
		
		<table id="boardTable" border="1" style="width: 100%; border-collapse: collapse;">
			<tr style= "text-align: center;">
				<th style= "width: 10%;">카테고리</th>
				<th style= "width: 40%;">제목</th>
				<th style= "width: 20%;">작성자</th>
				<th style= "width: 20%;">등록일</th>
				<th style= "width: 10%;">조회수</th>
			</tr>
			<c:forEach items="${AdboardList }" var="board">
				<tr style= "text-align: center;">
				<c:if test="${board.boardCate eq 'NOTICE' }">
                  	<tr id="tr" style="background: lemonchiffon; text-align: center">
                 </c:if>
					<td>${board.boardNo }</td>
					<td style="font-size:1em;">
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
		<div id="pageNum">
             <ul class="pagination">
                <c:if test="${pageVO.prev }">
                   <li class="pagination_button"><a
                        href="${pageVO.cri.pageNum - 1 }">이전</a></li>
                </c:if>

                <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
                   <li class="pagination_button"><a href="${num }">${num }</a>
                   </li>
                </c:forEach>

                <c:if test="${pageVO.next }">
                   <li class="pagination_button"><a href="${pageVO.cri.pageNum + 1 }">다음</a></li>
                </c:if>
               </ul>
         </div>  
	</div>
	<div >
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	</div>
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
</body>
</html>