<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
	align-items: center;
    color: #000;
    max-width: 500px;
    margin: 10px auto;
    border: 1px #E0E0E0 solid;
    border-radius: 10px;
    padding: 10px;
}

.form-label-group input[type="text"], .form-label-group input[type="password"] {
    border: 1px solid silver;
    margin-top: 10px;
    height: 20px;
}
</style>
</head>
<body>
	<form class="form-signin" action="find_id" name="findform" method="post">
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
				type="submit" value="아이디 찾기">
		</div>

		<!-- 닉네임과 이메일이 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.userNm.value = "";
				opener.document.findform.userEmail.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 닉네임과 이메일이 일치할때 -->
		<c:if test="${check == 0 }">
		<label>찾으시는 아이디는 <b style="color: blue">${id}</b> 입니다.</label>
		<div class="form-label-group">
				<input class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="확인" onclick="closethewindow()">
			</div>
		</c:if>
	</form>
	
	<script>
		function closethewindow(){
			self.close();
		}
	</script>
</body>
</html>