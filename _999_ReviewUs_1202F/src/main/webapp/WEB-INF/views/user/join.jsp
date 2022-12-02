<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰어스 계정 만들기</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
<style>
#container {
    margin: 100px auto;
    width: 525px; height: 525px;
    border: 1px #E0E0E0 solid;
    border-radius: 10px;
}

#review_us_logo {
    width: 230px;
    margin: 25px 10px 5px 25px;
}

h3 {
    margin: 10px 10px 10px 25px;
    font-weight: 600;
}

input[type="text"] {
    width: 176px; height: 20px;
    margin: 10px 10px 10px 25px;
    padding: 6px 8px;
    font-size: 15px;
}

input[type="password"] {
    width: 176px; height: 20px;
    margin: 10px 0px 10px 25px;
    padding: 6px 8px;
    font-size: 15px;
}

#pwdValidation, #pwdCheckResult {
	display: inline-block;
	margin: auto auto auto 25px;
}

button[type="button"] {
    height: 35px;
    font-size: 15px;
}

#selectEmail {
    height: 20px;
}

button[type="submit"] {
    height: 35px;
    font-size: 15px;
    position: absolute; top: 570px;
    margin-left: 435px;
}
</style>
</head>
<body>
<div id="container">
        <form id="joinForm" action="/user/join.do" method="post">
            <img src="../images/(small)ReviewUs.png" id="review_us_logo">
            <h3>리뷰어스 계정 만들기</h3>
            <div>
                <input type="text" autocomplete="off" spellcheck="false" aria-label="아이디" placeholder="아이디" id="userId" name="userId" required>
                <button type="button" id="btnIdCheck">중복확인</button>
            </div><br>
            <div>
	            <input type="password" autocomplete="off" spellcheck="false" aria-label="비밀번호" placeholder="비밀번호" id="userPwd" name="userPwd" required>            
	            <input type="password" autocomplete="off" spellcheck="false" aria-label="비밀번호 확인" placeholder="비밀번호 확인" id="userPwdCheck" name="userPwdCheck" required>
	            <p id="pwdValidation" style="color: crimson; font-size: 0.7em;">비밀번호는 영문자, 숫자, 특수문자 조합의 10자리 이상으로 설정해주세요.</p>
	            <p id="pwdCheckResult" style="font-size: 0.7em;"></p>
            </div>
            <br>
            <div>
                <input type="text" autocomplete="off" spellcheck="false" aria-label="닉네임" placeholder="닉네임" id="userNm" name="userNm" required>
                <button type="button" id="btnNmCheck">중복확인</button>
            </div>
            <br>
            <input type="text" autocomplete="off" spellcheck="false" aria-label="이메일" placeholder="이메일" id="userEmail1" name="userEmail1" required><span style="font-size: 15px;">@</span>
            <input type="text" autocomplete="off" spellcheck="false" aria-label="도메인주소" id="userEmail2" name="userEmail2" style="width:100px; margin-left: 4px;" value="naver.com" required>
            <select id="selectEmail" name="selectEmail">
                <option value="1">직접입력</option>
                <option value="naver.com">naver.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="kakao.com">kakao.com</option>
                <option value="daum.net">daum.net</option>
                <option value="hanmail.com">hanmail.com</option>
                <option value="nate.com">nate.com</option>
                <option value="dreamwiz.com">dreamwiz.com</option>
            </select>
            <br><br>
            <div>
                <button type="submit">만들기</button>
            </div>
        </form>
    </div>
    <script>
    	$(function() {
    		//회원가입 실패 시 메세지 출력
    		if($("#joinMsg").val() != "" && $("#joinMsg").val() != null) {
    			alert($("#joinMsg").val());
    		}
  			
    		//id 중복확인 여부 확인 플래그
    		let checkId = false;
    		//nm 중복확인 여부 확인 플래그
    		let checkNm = false;
    		//password 형식 확인()
    		let pwdValidation = false;
    		//password 확인 일치
    		let pwdCheck = false;
    		
			$("#pwdValidation").hide();
			$("#pwdCheckResult").hide();
    		
    		//id 중복체크
				$("#btnIdCheck").on("click", function() {
	    		$.ajax({
						url: "/user/idCheck.do",
						type: "post",
						data: $("#joinForm").serialize(),
						success: function(obj) {
							console.log(obj);
							
							if(obj == 'duplicatedId') {
								alert("중복된 아이디입니다.");
								$("#userId").focus();
							} else {
								if(confirm("사용 가능한 아이디입니다. " + $("#userId").val() + "를(을) 사용하시겠습니까?")) {
									checkId = true;
									$("#btnIdcheck").attr("disabled", true);
								}
							}
						},
						error: function(e) {
							console.log(e);
						}
    			})				
				});

    		
    		//id 중복체크 후 다시 id를 변경했을 때
    		$("#userId").on("change", function() {
    			checkId = false;
    			$("#btnIdCheck").attr("disabled", false);
    		});
    		
    		//비밀번호 유효성 검사 => 비밀번호는 영문자, 숫자, 특수문자 조합의 10자리 이상
			function validatePassword(character) {
				return /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{10,}$/.test(character);
			}

			//비밀번호 입력될때마다 유효성 검사
			$("#userPwd").on("change", function() {
				//비밀번호 유효성 처리
				if(!validatePassword($("#userPwd").val())) {
					pwdValidation = false;
					$("#pwdValidation").show();
					$("#userPwd").focus();
				} else {
					pwdValidation = true;
					$("#pwdValidation").hide();
				}
				
				//비밀번호 확인까지 입력한 후 다시 비밀번호 재설정
				if($("#userPwd").val() == $("#userPwdCheck").val()) {
					pwdCheck = true;
					$("#pwdCheckResult").css("color", "DodgerBlue");
					$("#pwdCheckResult").text("비밀번호가 일치합니다.");
				} else {
					pwdCheck = false;
					$("#pwdCheckResult").css("color", "crimson");
					$("#pwdCheckResult").text("비밀번호가 일치하지 않습니다.");
				}
			});
			
			//비밀번호 확인란 입력할 때 일치여부 체크
			$("#userPwdCheck").on("change", function() {
				$("#pwdCheckResult").show();
				
				if($("#userPwd").val() == $("#userPwdCheck").val()) {
					pwdCheck = true;
					$("#pwdCheckResult").css("color", "DodgerBlue");
					$("#pwdCheckResult").text("비밀번호가 일치합니다.");
				} else {
					pwdCheck = false;
					$("#pwdCheckResult").css("color", "crimson");
					$("#pwdCheckResult").text("비밀번호가 일치하지 않습니다.");
				}
			});
			
    		//nm 중복체크
			$("#btnNmCheck").on("click", function() {
				$.ajax({
					url: "/user/nmCheck.do",
					type: "post",
					data: $("#joinForm").serialize(),
					success: function(obj) {
						console.log(obj)
						
						if(obj == 'duplicatedNm') {
							alert("중복된 닉네임입니다.");
							$("#userNm").focus();
						} else {
							if(confirm("사용 가능한 닉네임입니다. " + $("#userNm").val() + "를(을) 사용하시겠습니까?")) {
								checkNm = true;
								$("#btnNmCheck").attr("disabled", true);
							}
						}
					},
					error: function(e) {
						console.log(e);
					}
				})
			});

    		//nm 중복체크 후 다시 nm을 변경했을 때
    		$("#userNm").on("change", function() {
    			checkNm = false;
    			$("#btnNmCheck").attr("disabled", false);
    		})
			
	 	    //이메일 입력방식 선택
	        $('#selectEmail').change(function(){
	            $("#selectEmail option:selected").each(function () {
	            	//직접입력
	                if($(this).val()== '1'){
	                    $("#userEmail2").val('');                        
	                    $("#userEmail2").attr("readonly", false); 
	                //선택입력
	                } else {
	                    $("#userEmail2").val($(this).text());      
	                    $("#userEmail2").attr("readonly", true);
	                }
	         	 });
	    	});
			
			//회원가입 진행
			$("#joinForm").on("submit", function(e) {
				//서브밋이 실행될 때 구현할 동작
				//아이디 중복체크가 안됐거나 중복된 아이디를 사용했을 때
				if(!checkId) {
					alert("아이디 중복확인을 해주세요.");
					$("#userId").focus();
					e.preventDefault();
					return;
				}

				//닉네임 중복체크가 안됐거나 중복된 닉네임을 사용했을 때
				if(!checkNm) {
					alert("닉네임 중복체크를 진행하세요.");
					$("#userNm").focus();
					e.preventDefault();
					return;
				}
				
				//비밀번호 유효성 검사가 틀렸을 때
				if(!pwdValidation) {
					alert("비밀번호는 영문자, 숫자, 특수문자 조합의 10자리 이상으로 설정하세요.");
					$("#userPwd").focus();
					e.preventDefault();
					return;
				}
				
				//비밀번호와 비밀번호 확인이 일치하지 않을 때
				if(!pwdCheck) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#userPwdCheck").focus();
					e.preventDefault();
					return;
				}
			});
    	});
    </script>
</body>
</html>