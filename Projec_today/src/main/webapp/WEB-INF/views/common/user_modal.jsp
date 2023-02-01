<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
#login_modal{display: none; width: 400px; height: 500px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8; background: #fff; border-radius: 10px; z-index:100;}
#join_modal{display: none; width: 450px; height: 650px; overflow-y:scroll; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8; background: #fff; border-radius: 10px; z-index:100;}    
#login_modal .Umodal_table span, #join_modal .Umodal_table span{font-family: 'Noto Sans KR', sans-serif; padding-left:10px;}
.Umodal_header{border-bottom: 1px solid #dee2e6; display: flex; position: relative;}
.Umodal_header h2{line-height: 3.1em; font-size:1.5em;}
.Umodal_logo{font-size: 1.25em; font-family: 'Nanum Pen Script', cursive; padding-left: 15px;}
.Umodal_close{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 25px; right: 25px; background-image: url(/img/common/close.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}
.Umodal_table{border-collapse: collapse; width: 100%;}
/*.Umodal_table td{padding:1px;}*/
.Umodal_body{padding: 0 20px; display: block;}
.Ulabel{padding-top: 10px;}
.Ulabel p{margin:16px 0;}
.Umodal_input{border: 1px solid #d9d9de; box-sizing: border-box; width: 100%; height: 40px; padding-left:10px;}
#auto_login{margin-top: 20px; margin-bottom: 20px;}
.U_button{margin-top: 20px; width: 100%; height: 40px; padding: 0 20px; border: none; border-radius: 5px; cursor:pointer}
#signup-btn{margin: 30px 0; height: 45px;}
.emailAuth{display:flex}
.emailAuth button{height: 40px; padding:5px 0; margin-left: 5px; border:none; /*font-size:20px; line-height:20px;*/ box-sizing: border-box; cursor: pointer; word-break: keep-all;}
.emailAuth:nth-of-type(1) button{width:35%;}

@media all and (max-width:500px) {
	#login_modal, #join_modal{width: 85%;}
	.emailAuth button{font-size:2.667vw;}
}


</style>



<!---------------------------- 로그인 모달 ------------------------------ -->
<div id="login_modal">
    <div class="Umodal_header">
        <h2 class="Umodal-title">
            <span class="Umodal_logo">오늘의 너</span> 로그인
        </h2>
        <div class="Umodal_close">close</div> <!--닫기 버튼-->
    </div>
    <div class="Umodal_body">
        <form method="post" id="signInForm">
            <table class="Umodal_table">
                <tr>
                    <td class="Ulabel">
                        <p>
                            <strong>아이디</strong>
                            <span id="idCheck"></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td><input type="text" class="Umodal_input" id="signInId" placeholder="ID"></td>
                </tr>
                <tr>
                    <td class="Ulabel">
                        <p>
                            <strong>비밀번호</strong>
                            <span id="pwCheck"></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td><input type="password" class="Umodal_input" id="signInPw" placeholder="PW"></td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="auto_login" name="autoLogin"> 자동 로그인
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="button" class="U_button" id="signIn-btn">로그인</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="button" class="U_button" id="login_join">회원가입</button>
                    </td>
                </tr>
            </table>
        </form >
    </div>
</div>






<!------------------------------ 회원가입 모달 --------------------------------->
<div id="join_modal">
    <div class="Umodal_header">
        <h2 class="Umodal-title">
            <span class="Umodal_logo">오늘의 너</span> 회원가입
        </h2>
        <div class="Umodal_close">close</div> <!--닫기 버튼-->
    </div>
    <div class="Umodal_body" >
        <form method="post" id="joinForm">
            <table class="Umodal_table">
                <tr>
                    <td class="Ulabel">
                        <p>
                            <strong>아이디</strong>
                            <span id="idChk"></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td><input type="text" id="user_id" class="Umodal_input" placeholder="영문자, 숫자 6-14자"></td>
                </tr>
                <tr>
                    <td class="Ulabel">
                        <p>
                            <strong>비밀번호</strong>
                            <span id="pwChk"></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td><input type="password" id="password" class="Umodal_input" placeholder="특수문자 포함 8자이상"></td>
                </tr>
                <tr>
                    <td class="Ulabel">
                        <p>
                            <strong>비밀번호 확인</strong>
                            <span id="pwChk2"></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td><input type="password" id="password_check" class="Umodal_input"></td>
                </tr>
                <tr>
                    <td class="Ulabel">
                        <p>
                            <strong>이름</strong>
                            <span id="nameChk"></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td><input type="text" id="user_name" class="Umodal_input" maxlength="6" placeholder="한글 최대 6자"></td>
                </tr>
                <tr>
                    <td class="Ulabel">
                        <p>
                            <strong>닉네임</strong>
                            <span id="nickNameChk"></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td><input type="text" id="user_nick" class="Umodal_input" maxlength="10" placeholder="한글 최대 10자"></td>
                </tr>
                <tr>
                    <td class="Ulabel">
                        <p>
                            <strong>이메일</strong>
                            <span id="emailChk"></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="emailAuth">
                   		<input type="email" id="user_email" class="Umodal_input" placeholder="ex) abc123@abcd.com">
                   		<button type="button" class="email_auth_btn">인증번호 전송</button>
                    </td>
                </tr>
                <tr>
                    <td class="Ulabel">
                        <p>
                            <strong>인증번호</strong>
                            <span id="authChk"></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="emailAuth">
                   		<input type="text" id="authNum" class="Umodal_input" placeholder="인증번호 6자리 입력">
                   		<button type="button" class="authChkBtn">확인</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="button" id="signup-btn" class="U_button">회원가입</button>
                    </td>
                </tr>
            </table>
        </form >
    </div>
</div>
    
    
    
    

<script type="text/javascript">

	//이거 그냥 밑으로 넣어도 되지 않나
	$("#login").click(function(){	    
	    if(parseInt($("header").css("width")) <= 1065){   // 태블릿, 모바일버전에서 메뉴 사라지도록
	    	$(".header_cont").css("display", "none");
        }
	    $("#login_modal").css("display", "block");
	    $("#login_modal input").val("").css("background", "#fff"); //초기화
        $("#login_modal .Umodal_table span").text("");
        $('input:checkbox[name="autoLogin"]').prop("checked", false); // 자동로그인 해제
	})
	$("#join").add("#login_join").click(function(){	    
	    if(parseInt($("header").css("width")) <= 1065){   
	    	$(".header_cont").css("display", "none");
        }
	    $("#join_modal").css("display", "block");
	    $("#join_modal input").val("").css("background", "#fff"); //초기화
        $("#join_modal .Umodal_table span").text("");
        $("#login_modal").css("display", "none");
	})
	$(".Umodal_close").on("click", function(){
	    $(this).parent().parent().css("display", "none");
	})


	$(function() {
	    
	    const getIdCheck= RegExp(/^[a-zA-Z0-9]{6,14}$/);
	    const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	    const getName= RegExp(/^[가-힣]+$/);
	    const getNick= RegExp(/^[가-힣]+$/);
	    const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	    let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false, chk6 = false, chk7 = false; 
	   
	    //회원가입 검증
	    //ID 입력값 검증.
	    $('#user_id').on('keyup', function() {
	        if($("#user_id").val() === ""){
	            $('#user_id').css("background-color", "pink");
	            $('#idChk').html('<b style="font-size:13px;color:#F05650;">아이디를 입력하세요.</b>');
	            chk1 = false;
	        }
	       
	        //아이디 유효성검사
	        else if(!getIdCheck.test($("#user_id").val())){
	            $('#user_id').css("background-color", "pink");
	            $('#idChk').html('<b style="font-size:13px;color:#F05650;">영문자/숫자 6-14자로 입력해주세요.</b>');      
	            chk1 = false;
	        }
	        //ID 중복확인 비동기 처리
	        else {
	            //ID 중복확인 비동기 통신
	            const userId = $(this).val();	           
	            $.ajax({
	                type: "POST",
	                url: "/user/checkId",  
	                headers: {
	                    "Content-Type": "application/json"
	                },
	                dataType: "text",
	                data: userId,
	                success: function(result) {
	                    if(result === "OK") {
	                        $("#user_id").css("background", "#e8f0fe");
	                        $("#idChk").html("<b style='font-size:13px; color:blue;'>사용 가능한 아이디입니다.</b>");
	                        chk1 = true;
	                    } else {
	                        $("#user_id").css("background-color", "pink");
	                        $("#idChk").html("<b style='font-size:13px;color:#F05650;'>중복된 아이디입니다.</b>");                        
	                        chk1 = false;
	                    }
	                },
	                error: function() {
	                    console.log("id 중복확인 통신 실패!");
	                }
	            });
	        }
	    });
	   
	    //패스워드 입력값 검증.
	    $('#password').on('keyup', function() {
	        //비밀번호 공백 확인
	        if($("#password").val() === ""){
	            $('#password').css("background-color", "pink");
	            $('#pwChk').html('<b style="font-size:13px;color:#F05650;">비밀번호를 입력하세요.</b>');
	            chk2 = false;
	        }                
	        //비밀번호 유효성검사
	        else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
	            $('#password').css("background-color", "pink");
	            $('#pwChk').html('<b style="font-size:13px;color:#F05650;">특수문자 포함 8자 이상 입력해주세요.</b>');
	            chk2 = false;
	        } else {
	            $('#password').css("background-color", "#e8f0fe");
	            $('#pwChk').html('<img src="/img/common/check.png" width="15px" height="15px">');
	            chk2 = true;
	        }
	       
	    });
	   
	    //패스워드 확인란 입력값 검증.
	    $('#password_check').on('keyup', function() {
	        //비밀번호 확인란 공백 확인
	        if($("#password_check").val() === ""){
	            $('#password_check').css("background-color", "pink");
	            $('#pwChk2').html('<b style="font-size:13px;color:#F05650;">비밀번호를 입력하세요.</b>');
	            chk3 = false;
	        }                
	        //비밀번호 확인란 유효성검사
	        else if($("#password").val() != $("#password_check").val()){
	            $('#password_check').css("background-color", "pink");
	            $('#pwChk2').html('<b style="font-size:13px;color:#F05650;">비밀번호가 일치하지 않습니다.</b>');
	            chk3 = false;
	        } else {
	            $('#password_check').css("background-color", "#e8f0fe");
	            $('#pwChk2').html('<img src="/img/common/check.png" width="15px" height="15px">');
	            chk3 = true;
	        }
	       
	    });
	   
	    //이름 입력값 검증.
	    $('#user_name').on('keyup', function() {
	        //이름값 공백 확인
	        if($("#user_name").val() === ""){
	            $('#user_name').css("background-color", "pink");
	            $('#nameChk').html('<b style="font-size:13px;color:#F05650;">이름을 입력하세요.</b>');
	            chk4 = false;
	        }                
	        //이름값 유효성검사
	        else if(!getName.test($("#user_name").val())){
	            $('#user_name').css("background-color", "pink");
	            $('#nameChk').html('<b style="font-size:13px;color:#F05650;">한글 1-6자로 입력해주세요.</b>');
	            chk4 = false;
	        } else {
	            $('#user_name').css("background-color", "#e8f0fe");
	            $('#nameChk').html('<img src="/img/common/check.png" width="15px" height="15px">');
	            chk4 = true;
	        }
	       
	    });
	    
	    //닉네임 입력값 검증. 
	    $('#user_nick').on('keyup', function() {
	        //닉네임 공백 확인
	        if($("#user_nick").val() === ""){
	            $('#user_nick').css("background-color", "pink");
	            $('#nickNameChk').html('<b style="font-size:13px;color:#F05650;">닉네임을 입력하세요.</b>');
	            chk5 = false;
	        }                
	        //닉네임 유효성검사
	        else if(!getNick.test($("#user_nick").val())){
	            $('#user_nick').css("background-color", "pink");
	            $('#nickNameChk').html('<b style="font-size:13px;color:#F05650;">한글 1-10자로 입력해주세요.</b>');
	            chk5 = false;
	        } else {
	            $('#user_nick').css("background-color", "#e8f0fe");
	            $('#nickNameChk').html('<img src="/img/common/check.png" width="15px" height="15px">');
	            chk5 = true;
	        }
	       
	    });
	    
	    //이메일 입력값 검증. 
	    $('#user_email').on('keyup', function() {
	        //이메일 공백 확인
	        if($("#user_email").val() === ""){
	            $('#user_email').css("background-color", "pink");
	            $('#emailChk').html('<b style="font-size:13px;color:#F05650;">이메일을 입력하세요.</b>');
	            chk6 = false;
	        }                
	        //이메일 유효성검사
	        else if(!getMail.test($("#user_email").val())){
	            $('#user_email').css("background-color", "pink");  
	            $('#emailChk').html('<b style="font-size:13px;color:#F05650;">이메일 입력값을 확인해주세요.</b>');
	            chk6 = false;
	        } else {
	            $('#user_email').css("background-color", "#e8f0fe");
	            $('#emailChk').html('<img src="/img/common/check.png" width="15px" height="15px">');
	            chk6 = true;
	        }
	       
	    });
	    
	    
	    //이메일 인증번호 전송
	    $(".email_auth_btn").click(function(){	
	    	 let emailAuthNum = "";
			 let email = $('#user_email').val();
			 
			 if(!chk6){
			 	alert("이메일 입력값을 확인해주세요.");
			 	return false;
			 }else{
				 $.ajax({
						type : "POST",
						url : "/user/emailAuth",
						data : {email : email},
						success: function(data){
							$('#emailChk').html('<b style="font-size:14px;color:blue;">인증번호가 발송되었습니다.</b>');
							emailAuthNum = data;
							//console.log(email_auth_cd);
						},
						error: function(data){
							alert("메일 발송에 실패했습니다.");
						}
					});
			 }
			 
			 
			 // 인증번호 일치 확인
			 $(".authChkBtn").click(function(){
				 if($("#authNum").val() === emailAuthNum){
					 $('#authChk').html('<b style="font-size:14px;color:blue;">인증되었습니다.</b>');
					 chk7 = true;
				 }else{
					 $('#authChk').html('<b style="font-size:13px;color:#F05650;">인증번호가 일치하지 않습니다.</b>');
					 chk7 = false;
				 }
			 })
			  
		});
	    
	    
	    
	    
	   
	   
	
	
	
	   // 회원가입 이벤트
	    $('#signup-btn').click(function(e) {
	        if(chk1 && chk2 && chk3 && chk4 && chk5 && chk6 && chk7) {
	
	            let id = $("#user_id").val();
	            let pw = $("#password").val();
	            let name = $("#user_name").val();
					let nickname = $("#user_nick").val();
					let email = $("#user_email").val();
	           
	            let user = {
	                userId: id,
	                password: pw,
	                name: name,
	                nickname: nickname,
	                email: email
	            };
	           
	            //클라이언트에서 서버와 통신하는 ajax함수(비동기 통신)
	            $.ajax({
	                type: "POST", //서버에 전송하는 HTTP요청 방식
	                url: "/user/", //서버 요청 URI
	                headers: {
	                    "Content-Type": "application/json"
	                }, //요청 헤더 정보
	                dataType: "text", //응답받을 데이터의 형태
	                data: JSON.stringify(user), //서버로 전송할 데이터
	                success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
	                    console.log("통신 성공!: " + result);
	                    if(result === "joinSuccess") {
	                        alert("회원가입이 완료되었습니다.");
	                        //location.href="";
	                        window.location.reload();
	                    } else {
	                        alert("회원가입에 실패했습니다.");
	                    }
	                }, //통신 성공시 처리할 내용들을 함수 내부에 작성.
	                error: function() {
	                    console.log("통신 실패!");
	                } //통신 실패 시 처리할 내용들을 함수 내부에 작성.
	            });
	       
	        } else {
	            alert('입력정보를 다시 확인하세요.');          
	        }
	    });
	   
	    ///////////////////////////////////////////////////////////////////////////////////////////
	   
	
	    //로그인 검증
	    //ID 입력값 검증.
	    $('#signInId').on('keyup', function() {
	        if($("#signInId").val() == ""){
	            //$('#signInId').css("background-color", "pink");
	            $('#idCheck').html('<b style="font-size:13px;color:#F05650;">아이디를 입력하세요.</b>');
	            chk1 = false;
	        }      
	       
	        //아이디 유효성검사
	        else if(!getIdCheck.test($("#signInId").val())){
	            //$('#signInId').css("background-color", "pink");
	            $('#idCheck').html('<b style="font-size:13px;color:#F05650;">영문자/숫자 4-14자로 입력해주세요.</b>');  
	            chk1 = false;
	        } else {
	            $('#signInId').css("background-color", "#e8f0fe");
	            //$('#idCheck').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
	            $('#idCheck').html('<img src="/img/common/check.png" width="15px" height="15px">');
	            chk1 = true;
	        }
	    });
	   
	    //패스워드 입력값 검증.
	    $('#signInPw').on('keyup', function() {
	        //비밀번호 공백 확인
	        if($("#signInPw").val() === ""){
	            //$('#signInPw').css("background-color", "pink");
	            $('#pwCheck').html('<b style="font-size:13px;color:#F05650;">비밀번호를 입력하세요.</b>');
	            chk2 = false;
	        }                
	        //비밀번호 유효성검사
	        else if(!getPwCheck.test($("#signInPw").val()) || $("#signInPw").val().length < 8){
	            //$('#signInPw').css("background-color", "pink");
	            $('#pwCheck').html('<b style="font-size:13px;color:#F05650;">특수문자 포함 8자 이상 입력해주세요.</b>');
	            chk2 = false;
	        } else {
	            $('#signInPw').css("background-color", "#e8f0fe");
	            //$('#pwCheck').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
	            $('#pwCheck').html('<img src="/img/common/check.png" width="15px" height="15px">');
	            chk2 = true;
	        }
	       
	    }); 
	   
	    //로그인 버튼 클릭이벤트
	    $("#signIn-btn").click(function() {
	        if(chk1 && chk2) {
	            //ajax통신으로 서버에서 값 받아오기
	            const id = $('#signInId').val();
	            const pw = $('#signInPw').val();
	            // is()함수는 괄호 안 상태여부를 판단하여 논리값을 반환
	            const autoLogin = $("input[name=autoLogin]").is(":checked");  // name속성이 autoLogin인 input 태그
	
	            const userInfo = {
	                    userId : id,
	                    password : pw,
	                    autoLogin : autoLogin
	            };
	           
	            $.ajax({
	                type: "POST",
	                url: "/user/loginCheck",
	                headers: {
	                    "Content-Type": "application/json"
	                },
	                data: JSON.stringify(userInfo),
	                dataType : "text",
	                success: function(data) {
	                    console.log("result: " + data);
	                    if(data === "idFail") {
	                        $('#signInId').css("background-color", "pink");
	                        $('#idCheck').html('<b style="font-size:14px;color:red;">[등록되지 않은 ID입니다.]</b>');
	                        $('#signInPw').val("");
	                        $('#signInId').focus();
	                        chk2 = false;
	                    } else if(data === "pwFail") {
	                        $('#signInPw').css("background-color", "pink");
	                        $('#signInPw').val("");
	                        $('#signInPw').focus();
	                        $('#pwCheck').html('<b style="font-size:14px;color:red;">[비밀번호가 일치하지 않습니다.]</b>');
	                        chk2 = false;
	                    } else if(data === "loginSuccess") {
	                        //self.location="/";
	                    	window.location.reload();
	                    }
	                }
	            });
	           
	        } else {
	            alert("입력정보를 다시 확인하세요!");
	        }
	    });
	   
	});//end JQuery
</script>

