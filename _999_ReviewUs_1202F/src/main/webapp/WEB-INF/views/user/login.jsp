<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
/*1. 공통부분 작성*/
body {
    line-height:  1.7;
    color: #ffffff;
}

a {
    text-decoration: none;
    color: inherit;
    text-decoration: none;
}

img {
    max-width: 100%;
}

hr {
    margin-top: 20px;
    color: inherit;
    height: 0;
    overflow: visible;
}

/*로그인 페이지*/
.form-wrapper {
    display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
    color: #000;
    max-width: 500px;
    margin: 20px auto;
    border: 1px #E0E0E0 solid;
    border-radius: 10px;
    padding: 20px;
}

.loginForm {
    width: 410px;
    min-height: 200px;
    margin: 100px auto 100px;
    text-align: center;
    padding: 35px;
}

.loginForm input[type="text"], .loginForm input[type="password"] {
    border: 1px solid silver;
    margin-top: 20px;
    width: 100%;
}

.btn_wrap {
    margin-top: 30px;
}

.form_holder {
    text-align: left;
}

/* 아이디찾기 */
.login-btn-wrap{
	text-align: center;
	    padding: 1px;
}

/* 아이디 회원가입버튼 */
.login-btn-wrap a, .join a{
    border: 1px #E0E0E0 solid;
    border-radius: 10px;
    margin-top: 10px;
    padding: 5px;
    font-size: 1rem;
}

/* 로그인 버튼 */
.btnLogin-button button[type="button"] {
    width: 100%;
    font-size: 16px;
    padding: 5px 25px;
}

</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	<div class="form-wrapper">
		<form id="loginForm">
			<input type="hidden" id="joinMsg" value="${joinMsg }">
			<h3>로그인</h3>
			<div class="label-wrapper">
				<label for="userId">아이디</label>
			</div>
			<input type="text" id="userId" name="userId" required>
			<div class="label-wrapper">
				<label for="userPwd">비밀번호</label>
			</div>
      <div>
			<input type="password" id="userPwd" name="userPwd" required>
      </div><br>
			<div class="btnLogin-button">
				<button type="button" id="btnLogin">로그인</button>
			</div>
		</form>
	</div>
  
  <div class="login-btn-wrap">
  	<hr><br>
		<a href="javascript:void(0)" onclick="findid()">아이디 찾기</a>&emsp;
		<a href="javascript:void(0)" onclick="findpassword()">비밀번호 찾기</a><br><br>
  	<div class="join">
  		<a href="/user/join.do">회원가입</a>
  	</div>
  </div>
   
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	<script>
		$(function() {
			//회원가입 성공 시 메시지 출력
			if($("#joinMsg").val() != "" && $("#joinMsg").val() != null) {
				alert($("#joinMsg").val());
			}
			
			//로그인 시 아이디나 비밀번호가 틀렸을 경우에
			//대비하여 폼 서브밋 대신 ajax로 처리
			$("#btnLogin").on("click", function() {
				$.ajax({
					url: "/user/login.do", /* .do : jsp에서 사용하는 가상의 주소 */
					type: "post",
					data: $("#loginForm").serialize(),
					success: function(obj) {
						console.log(obj);
						//id 체크
						if(obj == "idFail") {
							alert("존재하지 않는 아이디입니다.");
							$("#userId").focus();
							return;
						}
						
						//pw 체크
						if(obj =="pwFail") {
							alert("비밀번호가 틀렸습니다. 비밀번호를 확인해주세요.");
							$("#userPwd").focus();
							return;
						}
						if(obj == "StoppedUser") {
							alert("정지된 회원입니다.")
							return;
						}
						//로그인 처리
						location.href="/index.jsp";
					},
					error: function(e) {
						console.log(e);
					}
				});
			});
		});
		
		function findid(){
			var url="find_id_form";
				window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=350");
		};
		  
		function findpassword(){
			var url="find_password_form";
				window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=600");
		};
	</script>
</body>
</html>