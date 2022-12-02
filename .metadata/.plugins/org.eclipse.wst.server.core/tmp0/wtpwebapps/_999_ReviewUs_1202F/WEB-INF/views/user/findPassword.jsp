<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
.form-label-group {
    width: 410px;
    min-height: 5px;
    margin: 10px auto 10px;
    margin-left: 140px;
    
}
.form-signin {
    display: flex;
	flex-direction: column;
	justify-content: space-between;
    max-width: 500px;
    margin: 10px auto;
    border: 1px #E0E0E0 solid;
    border-radius: 10px;
    padding: 10px;
}

.form-label-group input[type="text"], .form-label-group input[type="password"] {
    border: 1px solid silver;
    margin-top: 5px;
    height: 20px;
}
#pwChange{
	text-align: center;
}

</style>
</head>
<body>
<form method="post" class="form-signin" action="find_password" name="findform">
	<div class="form-label-group">
		<label for="userId">아이디</label><br>
		<input type="text" id="userId" name="userId" class="form-control"/>
	</div>
	
	<div class="form-label-group">
		<label for="userNm">닉네임</label><br>
		<input type="text" id="userNm" name="userNm" class="form-control"/>
	</div>
		
	<div class="form-label-group">
		<label for="userEmail">이메일</label><br>
		<input type="text" id="userEmail" name="userEmail" class="form-control"/>
	</div>

	<div class="form-label-group">
		<input class="btn btn-lg btn-secondary btn-block text-uppercase"
			type="submit" value="확인">
	</div>

		<!-- 아이디, 닉네임, 이메일이 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.userId.value = "";
				opener.document.findform.userNm.value = "";
				opener.document.findform.userEmail.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 아이디, 닉네임, 이메일이 일치할 때-->
		<c:if test="${check == 0 }">
		<div>
			<label class="form-label-group">비밀번호를 변경해주세요.</label><hr>
		</div>
		<div class="form-label-group">
		<input type="hidden" id="id" name="updateid" value="${updateid }">
		
			<label for="password">비밀번호</label><br>
			<input type="password" id="userPw" name="userPwd" class="form-control" required>
			<p id="pwValidation" style="color: red; font-size: 0.8rem;">
				비밀번호는 영문자, 숫자, 특수문자<br>조합의 9자리 이상으로 설정해주세요.
			</p>
		</div>
		
		<div class="form-label-group">
			<label for="confirmpassword">비밀번호 확인</label><br>
			<input type="password" id="userPwCheck" name="confirmpwd" class="form-control" required>
			<p id="pwCheckResult" style="font-size: 0.8rem;"></p>
		</div>
		
		<div class="form-label-group">
				<input type="button" value="비밀번호 변경" onclick="updatePassword()">
		</div>
		</c:if>
		
</form>
			
<script>
		function updatePassword(){
			if(document.findform.userPwd.value==""){
				alert("비밀번호를 입력해주세요.");
				document.findform.userPwd.focus();
			} else if(document.findform.userPwd.value != document.findform.confirmpwd.value){
				alert("비밀번호가 일치하지 않습니다.");
				document.findform.confirmpwd.focus();
			} else {
				document.findform.action="update_password";
				document.findform.submit();
			}
		}
		console(updatePassword);
	</script>
</body>
</html>