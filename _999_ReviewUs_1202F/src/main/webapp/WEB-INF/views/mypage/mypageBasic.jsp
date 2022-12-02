<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    h2 { margin-left:-200px;}
    #m_content { text-align:start;  display:inline-block; margin-left:-200px;}
    #main_div { float:right; text-align: center; width: 80%;}
    
    
    .content {   font-size:1.1em; display:inline-block; width:150px; }
    .r_content { width: 150px; font-size:1.1em; margin-bottom:10px;}
	
    
    #updatebtn { text-align: center;}
  </style>
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
  
      <h2>기본페이지</h2>
 
      <br>
      <div id="m_content">
        <label for="id" class="content">아이디 : </label><input type="text" class="r_content" name="id" id="id" value="${getMypage.USER_ID}" readonly><br><br>
        <label for="nickname" class="content">닉네임 : </label><input type="text" class="r_content" name="nickname" id="nickname" value="${getMypage.USER_NM}" readonly><br><br>
        <label for="email" class="content">이메일 : </label><input type="text" class="r_content" name="email" id="email" value="${getMypage.USER_EMAIL}" readonly><br><br>
        <label for="board" class="content">게시글 수 :</label><input type="text" class="r_content" name="board" id="board" value="${getMypage.BOARD_C}" readonly>개<br><br>
        <label for="comment" class="content">댓글 수 : </label><input type="text" class="r_content" name="comment" id="comment"  value="${getMypage.COMMENT_C}" readonly>개&ensp;
        <br><br>
      </div>
      
    </div>
  </main>
  <footer>
  </footer>
</body>
</html>