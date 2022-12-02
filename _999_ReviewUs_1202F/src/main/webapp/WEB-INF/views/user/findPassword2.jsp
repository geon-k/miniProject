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
			<input type="password" id="pwValidation" name="userPwd" class="form-control" required>
			<p id="pwValidation" style="color: red; font-size: 0.8rem;">
				비밀번호는 영문자, 숫자, 특수문자<br>조합의 9자리 이상으로 설정해주세요.
			</p>
		</div>
		
		<div class="form-label-group">
			<label for="confirmpassword">비밀번호 확인</label><br>
			<input type="password" id="pwCheckResult" name="confirmpwd" class="form-control" required>
			<p id="pwCheckResult" style="font-size: 0.8rem;"></p>
		</div>
		
		<div class="form-label-group">
				<input type="button" value="비밀번호 변경" onclick="updatePassword()">
		</div>
		</c:if>
		
</form>
<script>
	//id 중복체크 했는지 확인하는 플래그
	var checkId = false;
	//password가 형식에 맞게 작성됐는지(특수문자 + 영문자 + 숫자 8자리)
	var pwValidation = false;
	//password가 확인란과 일치하는지
	var pwCheck = false;
			
		$("#pwValidation").hide();
		$("#pwCheckResult").hide();
	//비밀번호 유효성 검사
	function validatePassword(character) {
		return /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{9,}$/.test(character);
	}
			
	//비밀번호 입력될때마다 유효성 검사
	$("#userPw").on("change", function() {
		//비밀번호 유효성 처리
		if(!validatePassword($("#userPw").val())) {
			pwValidation = false;
			$("#pwValidation").show();
			$("#userPw").focus();
		} else {
			pwValidation = true;
			$("#pwValidation").hide();
		}
				
		//비밀번호 확인까지 입력한 후 다시 비밀번호 재설정
				if($("#userPw").val() == $("#userPwCheck").val()) {
					pwCheck = true;
					$("#pwCheckResult").css("color", "green");
					$("#pwCheckResult").text("비밀번호가 일치합니다.");
				} else {
					pwCheck = false;
					$("#pwCheckResult").css("color", "red");
					$("#pwCheckResult").text("비밀번호가 일치하지 않습니다.");
				}
			});
			
			//비밀번호 확인란 입력할 때 일치여부 체크
			$("#userPwCheck").on("change", function() {
				$("#pwCheckResult").show();
				
				if($("#userPw").val() == $("#userPwCheck").val()) {
					pwCheck = true;
					$("#pwCheckResult").css("color", "green");
					$("#pwCheckResult").text("비밀번호가 일치합니다.");
				} else {
					pwCheck = false;
					$("#pwCheckResult").css("color", "red");
					$("#pwCheckResult").text("비밀번호가 일치하지 않습니다.");
				}
			});
			
			//회원가입 진행
			$("#joinForm").on("submit", function(e) {
				//서브밋이 실행될 때 구현할 동작
				//아이디 중복체크가 안됐거나 중복된 아이디를 사용했을 때
				if(!checkId) {
					alert("아이디 중복체크를 진행하세요.");
					$("#userId").focus();
					e.preventDefault();
					return;
				}
				
				//비밀번호 유효성 검사가 틀렸을 때
				if(!pwValidation) {
					alert("비밀번호는 영문자, 숫자, 특수문자 조합의 9자리 이상으로 설정하세요.");
					$("#userPw").focus();
					e.preventDefault();
					return;
				}
				
				//비밀번호와 비밀번호 확인이 일치하지 않을 때
				if(!pwCheck) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#userPwCheck").focus();
					e.preventDefault();
					return;
				}
			});
		});

</script>
	<!-- <script>
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
	</script> -->
</body>
</html>