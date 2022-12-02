

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
    
    #main_div { float:right; text-align: center; width: 80%;}
    #m_content { text-align: center;}
    #btnwithdrawal { margin-top: 20px; }
    
    #btndel { margin-top: 50px;}
    
  </style>
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
  <script>
  	$(function() {
  		$("#btnPwdCheck").on("click", function() {
  			$.ajax({
  					url: "/mypage/pwdCheck.do?userId=${loginUser.userId}",
  					type: "post",
  					data: $("#deleteForm").serialize(),
  					success: function(obj) {
  						console.log(obj);
  						
  						if(obj == 'deleteOk') {
  							$("#delBtn").attr("disabled", false);
  						} else {			
  							alert("비밀번호가 일치하지 않습니다.");
  							$("#userPwd").focus();
  							
  						}
  					},
  					error: function(e) {
  						console.log(e);
  					}
  			})				
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
      <hr>
      <h2>회원탈퇴</h2>
      <br>
      <div id="m_content">
        <form id="deleteForm" action="/mypage/deleteUser.do?userId=${loginUser.userId}" method="post">
            <div>
                <input type="password" autocomplete="off"  placeholder="비밀번호 입력" id="userPwd" name="userPwd" required>
                <button type="button" id="btnPwdCheck">비밀번호 확인</button>
            </div>
            
            <div id="btndel">
                <button type="submit" id="delBtn" disabled>회원탈퇴</button>
            </div>
        </form>
      </div>     
    </div>
  </main>
  <footer>
  </footer>
</body>
</html>