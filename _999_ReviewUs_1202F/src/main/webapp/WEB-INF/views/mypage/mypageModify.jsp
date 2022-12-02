<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
  <style>
    /* 메인 */
    /* #main_content {display: inline-block; width: 100%;}  
    #d_list { float: left; width: 20%; text-align: center;} */
    
    /* 리스트 */
	#list_menu li {margin: 10px; list-style: none;}
    #list_menu a { text-decoration: none;}
    

    #main_div { float:right; text-align: center; width: 80%; }
 
    
    #pwValidation { margin-top:-5px;}
    
    #updatebtn { text-align: center; }
    
     #main_content {display: inline-block; width: 100%;}  
    
    #d_list { float: left; width: 20%; text-align: center;}
    #list_menu { margin-top: 50px;}
    #list_menu li {margin: 10px;  height:50px; list-style: none;}
    #list_menu a { text-decoration: none;}
    
    h2 { margin-left:-200px;}
    #m_content { text-align:initial;  display: inline-block; margin-left:-160px;}
    #main_div { float:right; width: 75%; }
    
    
    .content { font-size:1.1em; display:inline-block; width:130px; }
    .r_content { width:100px; font-size:1.1em; margin-bottom:10px;}
    
    #updatebtn { text-align: center;}
 </style>
 <script src="${pageContext.request.contextPath }/js/jquery-3.6.1.min.js"></script>
 <script>
 $(function() {
     // password가 형식에 맞게 작성됐는지(특수문자 + 영문자 + 숫자 8자리)
     var pwValidation = false;
     // password가 확인란과 일치하는지
     var pwCheck = false;
     var nmCheck = false;
     nmCheck = false;
     if(($("#userNm").val()) === ("${getUser.userNm}")) {
        nmCheck = true;
     }
     else {
        nmCheck = false;
     }   
     console.log('전 : ' + nmCheck);
     
     //비밀번호 유효성 검사
     function validatePassword(character) {
        return /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{10,}$/.test(character);
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
        
        // 비밀번호 확인까지 입력하나 후 다시 비밀번호 재설정
        if($("#userPw").val() == $("#userPwCheck").val()) {
           pwCheck = true;
           $("#pwCheckResult").css("color", "green");
           $("#pwCheckResult").text("비밀번호가 일치합니다.");
        }
        else {
           pwCheck = false;
           $("#pwCheckResult").css("color", "red");
           $("#pwCheckResult").text("비밀번호가 일치하지 않습니다.");
        }
        
        // 비밀번호 확인란 입력할 때 일치여부 체크
        $("#userPwCheck").on("change", function() {
           $("#pwCheckResult").show();
           
           if($("#userPw").val() == $("#userPwCheck").val()) {
              pwCheck = true;
              $("#pwCheckResult").css("color", "green");
              $("#pwCheckResult").text("비밀번호가 일치합니다.");
           }
           else {
              pwCheck = false;
              $("#pwCheckResult").css("color", "red");
              $("#pwCheckResult").text("비밀번호가 일치하지 않습니다.");
           }   
        });
    });
     
     // 닉네임 확인
     $("#btnNmCheck").on("click", function() {
        $.ajax({
           url: "/user/nmCheck.do",
           type: "post",
           data: $("#m_content").serialize(),
           success: function(obj) {
              console.log(obj)
              
              if(($("#userNm").val()) === ("${getUser.userNm}")) {
                 nmCheck = true;
              }
              else {
                 nmCheck = false;
              }
              console.log('중2 : ' + nmCheck);

              if(nmCheck && obj == 'duplicatedNm') {
                 $("#nmCheckResult").css("color", "green");
                 $("#nmCheckResult").text("현재 사용중");
                 nmcheck = true;
              }
              else if(!nmCheck && obj == 'duplicatedNm') {
                 nmcheck = false;
                 alert("중복된 닉네임입니다.");
                 $("#userNm").focus();
              } else if(!nmCheck && obj != 'duplicatedNm') {
                 if(confirm("사용 가능한 닉네임입니다. " + $("#userNm").val() + "를(을) 사용하시겠습니까?")) {
                    nmcheck = true;
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
     
     console.log('후 : ' + nmCheck)
     $("#m_content").on("submit", function(e) {
        // 닉네임 중복체크가 안됐거나 중복된 닉네임을 사용했을 때
        if(!nmcheck) {
           alert("닉네임 중복체크를 진행하세요.");
           $("#userNm").focus();
           e.preventDefault();
           return;
        }
        
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
      <h2>회원정보 수정</h2>
      
      <br>
      <div>
        <form id="m_content" action="/mypage/updateUser.do?userId=${loginUser.userId}" method="post">
          <div>
            <label for="userPw" class="content">비밀번호 : </label>  
            <input type="password" class="r_content" id="userPw" name="userPw" value="${getUser.userPwd}" required>
          </div>
          <p id="pwValidation" style="color:red; font-size:0.5rem;">영문자, 숫자, 특수문자 조합의 10자리 이상으로 설정해주세요.</p><br>
          <div id="div_pwd">
            <label for="userPwCheck" class="content">비밀번호 확인 : </label>
            <input type="password" class="r_content" id="userPwCheck" name="userPwCheck" value="${getUser.userPwd}" required>
         </div>
          <p id="pwCheckResult" style="font-size:0.5rem;"></p><br>
          <div>
            <label for="userNm" class="content">닉네임 : </label>       
            <input type="text" class="r_content" id="userNm" name="userNm" value="${getUser.userNm}" required>
            <button type="button" id="btnNmCheck">중복확인</button>
            <p id="nmCheckResult" style="font-size: 0.7em;"></p><br>	
          </div>
          <div>
          	<label for="userNm" class="content">이메일 : </label> 
            <input type="text" class="r_content" autocomplete="off" spellcheck="false" aria-label="이메일" id="userEmail1" name="userEmail1" value="${getUser.userEmail1}" required><span style="font-size: 15px;">@</span>
            <input type="text" class="r_content" autocomplete="off" spellcheck="false" aria-label="도메인주소" id="userEmail2" name="userEmail2" style="width:100px; margin-left: 4px;" value="${getUser.userEmail2}" required><br>
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
            <br>
          </div>    
        <button id="updatebtn" type="submit">회원정보 수정</button>
        </form>
       </div>      
    </div>
  </main>
  <footer>
  </footer>
</body>
</html>