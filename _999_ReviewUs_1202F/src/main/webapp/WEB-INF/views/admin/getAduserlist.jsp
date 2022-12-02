<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	h2 { text-align:center;}
	h3 { margin-left:40px; margin-bottom: 50px;}

	#section1 { width:25%; float:left; text-align:center; margin-right:100px;}
	#section1 ul li { height:80px;}
	
	
	#section2 { width:60%; float:right; margin-left:200px; }
	
	#searchForm { margin-top:36px; }
	#footer { clear:both;}
	
	.pagination { margin-left:820px;}
	.pagination a { color:black; text-decoration:none; }
	.pagination_button { clear: both;  }
   	.pagination li {  display:inline-block; margin-left:5px}
	#btnStop {
	  	border-radius: 10px; 
        border: 1px #F1F1F1 solid;
        background-color: #F1F1F1; 
        padding: 5px; font-size: 0.9em; 
	}
	#btnStop:hover {
	   	background-color: black;
        color: #F1F1F1;
        text-decoration: none;
	}
</style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>

	<div style="width:1500px; margin:20px auto;">
		<h2>게시글 관리</h2>
			<div id="section1">
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
					<li>
						<a href="/user/logout.do">로그아웃</a>
					</li>
				</ul>	
			</div>
		<div id="rb">
		  <div id="rbb">
			<form id="searchForm" action="/admin/getUserList.do" method="post">
			<input type="hidden" id="pageNum" name="pageNum" value="${pageVO.cri.pageNum }">
	        <input type="hidden" id="amount" name="amount" value="${pageVO.cri.amount }">
				<table border="1" style="width:930px; border-collapse: collapse;">
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
			
			<table id="boardTable" border="1" style="border-collapse: collapse;">
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
					<tr style="text-align:center; height:40px;">
						<td>${user.userId }</td>
						<td>${user.userPwd }</td>
						<td>${user.userNm }</td>
						<td>${user.userEmail }</td>
						<td>
							<fmt:formatDate value="${user.userRgd }" pattern="yyyy-MM-dd"/>
						</td>
						<td>${user.userRole }</td>
						<td><a href="/admin/updateUserRole.do?userId=${user.userId}" id="btnStop">정지</a></td>
					</tr>
				</c:forEach>
			</table>
			<br/>
			</div>
			 <div  id="numPage" >
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
</body>
</html>