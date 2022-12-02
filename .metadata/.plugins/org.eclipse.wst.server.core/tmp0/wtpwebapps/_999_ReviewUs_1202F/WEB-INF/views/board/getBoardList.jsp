<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
<style>
#container {
   width: 1000px;
   margin: 0 auto;
}

/* nav */
#nav {
   text-align:right;
   margin-right:35px;
   color: black;
}

#nav_ul li {
   list-style: none;
   display:inline-block;
}

#nav a {
   text-decoration: none;
}

#nav a:hover {
   font-weight: bold;
   text-decoration: underline;
}

/* header */
header {
   margin: 20px auto;
   text-align: left;
   margin-left: 70px;
}

#T_img {
	width: 250px;

   margin-left:-70px;
   margin-bottom: 20px;

}

/* body */
#body {
   width: 100%;
}

/* main_left bar */
#main_left {
   width: 25%;
   float: left;
}

.ml {
   width: 90%;
   height: 70px;
   padding: 10px;
   font-size: 1.4em;
   font-weight: bold;
   border: 1px solid black;
   line-height: 70px;
   text-align: center;
}

#main_left a {
   text-decoration: none;
   color: black;
   text-shadow: 3px -3px #E0E0E0;
}

#main_left a:hover {
   color: red;
}



/* Main right */
#main_r {
   width: 60%;
   float: right;
   margin-right: 50px;
}

#tr td { text-align:center; }
#tr td a { color:black; text-decoration:none; }

.tr .td { width:300px; height:34px; text-align:center; font-weight:bold; font-size:1.2em;}
.tr { border-right:none;}

th, td { height:34px;}


/* 좋아요 */
.like {
   width: 25px;
   text-align: right;
   margin-left: 180px;
}

/* 페이지 번호 */
#numPage { width:100%; }


.pagination {
   list-style: none;
   width: 70%;
   margin-left:190px;
}

.pagination a { color:black; text-decoration:none;}

.pagination_button {
   float: left;
   margin-left: 5px;
}

.pagination li { margin:-20px 0 20px 10px}


/* footer */
#footer {
   clear: both;
}
</style>
</head>
<body>
   <div id="container">
      <!-- nav -->
      <div id="nav">
         <ul id="nav_ul">
            <c:choose>
               <c:when test="${loginUser eq null }">
                  <li class="nav_li"><a href="/user/login.do" style="color: black">&ensp;로그인</a>
                      <a href="/user/join.do" style="color: black">&ensp;회원가입</a>
                  </li> 
               </c:when>
               <c:otherwise>
                  <li><a href="/user/logout.do">&ensp;로그아웃</a></li>&emsp;
                  <li><a href="/board/insertBoard.do">게시글 등록</a></li>                  
               </c:otherwise>
            </c:choose>
         </ul>
      </div>

      <!-- header -->
      <header id="header">
         <a href="./index.do"><img src="../images/(small)ReviewUs.png"
            id="T_img"></a>
      </header>

      <div id="body">
         <!-- main_left -->
         <div id="main_left">
            <div class="ml">
               <a href="/board/getBoardList.do?boardCatecd=0">All
               </a>
            </div>
            <div class="ml">
               <a href="/board/getBoardList.do?boardCatecd=1">HOTELS</a>
            </div>
            <div class="ml">
               <a href="/board/getBoardList.do?boardCatecd=2">DESSERT & PLACES</a>
            </div>
            <div class="ml">
               <a href="/board/getBoardList.do?boardCatecd=3">BARS
                  & PUBS </a>
            </div>
            <div class="ml">
               <a href="/board/getBoardList.do?boardCatecd=4">RESTAURANTS</a>
            </div>
         </div>

         <!-- main_right -->
         <div id="main_r"
            style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
            <form id="searchForm" action="/board/getBoardList.do" method="post">
            <input type="hidden" id="pageNum" name="pageNum" value="${pageVO.cri.pageNum }">
            <input type="hidden" id="amount" name="amount" value="${pageVO.cri.amount }">
            <input type="hidden" id="boardCatecd" name="boardCatecd">
               <!-- 페이지 번호:hidden 이유 -->
               <table border="1" style="width: 650px; border-collapse: collapse;">
                  <tr class="tr">
                     <c:if test="${boardCatecd == 0 }">
                        <td class="td">All</td>
                     </c:if>
                     <c:if test="${boardCatecd == 1 }">
                        <td class="td">HOTELS</td>
                     </c:if>
                     <c:if test="${boardCatecd == 2 }">
                        <td class="td">DESSERT & PLACES</td>
                     </c:if>
                     <c:if test="${boardCatecd == 3 }">
                        <td class="td">BARS & PUBS</td>
                     </c:if>
                     <c:if test="${boardCatecd == 4 }">
                        <td class="td">RESTAURANTS</td>
                     </c:if>

                     <td align="right"><select name="searchCondition">
                           <option value="all"
                              <c:if test="${searchCondition eq 'all' || searchCondition eq '' || searchCondition eq null}">
                                 selected="selected"
                              </c:if>>전체</option>
                           <option value="title"
                              <c:if test="${searchCondition eq 'title' }">
                                 selected="selected"
                              </c:if>>제목</option>
                           <option value="main"
                              <c:if test="${searchCondition eq 'main' }">
                                 selected="selected"
                              </c:if>>내용</option>
                           <option value="id"
                              <c:if test="${searchCondition eq 'id' }">
                                 selected="selected"
                              </c:if>>작성자</option>
                     </select> <input type="text" name="searchKeyword"
                        value="${searchKeyword }">
                        <button type="button" id="btnSearch">검색</button></td>
                  </tr>
               </table>
            </form>

            <table class="mr" id="boardTable" border="1"
               style="width: 650px; border-collapse: collapse;">
               <tr>
                  <th style="background: skyblue; width: 10%;">번호</th>
                  <th style="background: skyblue; width: 45%;">제목</th>
                  <th style="background: skyblue; width: 16%;">작성자</th>
                  <th style="background: skyblue; width: 16%;">등록일</th>
                  <th style="background: skyblue; width: 13%;">조회수</th>
               </tr>
               <!-- var에는 아무거나 상관없음 -->
               <c:forEach items="${boardList }" var="board">
                  <tr id="tr">
                      <c:if test="${userRole == 'admin' }">
                         
                      </c:if>
                     <td>${board.boardNo }</td>
                     <td>

                        <!-- ? 다음에 오는 BoardNO 콜할려면 @RequestParam("boardNo") 필요 --> <a
                        href="/board/updateBoardCnt.do?boardNo=${board.boardNo }">${board.boardTitle }</a>
                     </td>
                     <td>${board.userId }</td>
                     <td><fmt:formatDate value="${board.boardRgd }"
                           pattern="yyyy-MM-dd" /></td>
                     <td>${board.boardCnt }</td>
                  </tr>
               </c:forEach>
            </table>
            <br />
            <div style="text-align: center;" id="numPage">
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
         <div id="footer">
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
      </div>
   </div>
</body>
</html>