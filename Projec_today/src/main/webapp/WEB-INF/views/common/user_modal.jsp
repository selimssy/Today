<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
#login_modal, #findId_modal1, #findId_modal2, #findPw_modal1, #findPw_modal2, #findPw_modal3{display: none; width: 400px; height: 500px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8; background: #fff; border-radius: 10px; z-index:100;}
#findPw_modal1{height: 310px;}
#findId_modal2{height: 280px;}
#findPw_modal3{height: 340px;}
#findId_modal1, #findPw_modal2{height: 470px;}
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
.login_nav{font-size:15px;}
.login_nav p{display:inline-block; font-size:13px; cursor:pointer;}
.login_nav p:nth-of-type(1){margin-left:50px;}
.login_nav p:nth-of-type(1):after {content:"|"; display:inline-block; padding:0 10px;}

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
                    <td class="login_nav">
                        <input type="checkbox" id="auto_login" name="autoLogin"> 자동 로그인
                        <p id="findId">아이디 찾기</p>
                        <p id="findPw">비밀번호 찾기</p>
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
    
    
    
    
    
<!------------------------------ 아이디 찾기 모달1 --------------------------------->
<div id="findId_modal1">
    <div class="Umodal_header">
        <h2 class="Umodal-title">
            <span class="Umodal_logo">오늘의 너</span> 아이디 찾기
        </h2>
        <div class="modal_close">close</div> 
    </div>
    <div class="Umodal_body">
        <table class="Umodal_table">
        	<tr>
                <td class="Ulabel">
                    <p style="font-size: 12px; margin:5px"><span style="color:red">*</span> 회원가입시 입력한 이름과 이메일을 기입해주세요.</p>
                </td>
            </tr>
            <tr>
                <td class="Ulabel">
                    <p>
                        <strong>이름</strong>
                        <span id="if_nameChk"></span>
                    </p>
                </td>
            </tr>
            <tr>
                <td><input type="text" class="modal_input" id="findId_name"></td>
            </tr>
            <tr>
                <td class="Ulabel">
                    <p>
                        <strong>이메일</strong>
                        <span id="if_pwChk"></span>
                    </p>
                </td>
            </tr>
            <tr>
                <td class="emailAuth">
                 <input type="email" class="modal_input" id="findId_email">
                 <button type="button" class="if_authSend">인증번호 전송</button>
                </td>
            </tr>               
            <tr>
                <td class="Ulabel">
                    <p>
                        <strong>인증번호</strong>
                        <span id="if_authChk"></span>
                    </p>
                </td>
            </tr>
            <tr>
                <td class="emailAuth">
               		<input type="text" id="findId_authNum" class="modal_input" placeholder="인증번호 6자리 입력">
               		<button type="button" class="if_authChkBtn">확인</button>
                </td>
            </tr>                
        </table>
    </div>
</div>	




<!------------------------------ 아이디 찾기 모달2 --------------------------------->
<div id="findId_modal2">
    <div class="Umodal_header">
        <h2 class="Umodal-title" style="margin:15px 0;font-size: 24px;line-height:34px;">
            <span class="Umodal_logo" style="font-size: 30px;">오늘의 너</span> 아이디 찾기
        </h2>
        <div class="modal_close">close</div> 
    </div>
    <div class="Umodal_body">
        <table class="Umodal_table">
        	<tr>
                <td class="Ulabel">
                    <p style="font-size: 14px;"><span style="color:red">*</span> <span id="if_nameRst" style="font-size:20px"></span>님의 아이디</p>
                </td>
            </tr>               
            <tr>               	
                <td>
                <div id="if_idRst" style="height:50px; font-size:32px; text-align:center;"></div>
                <!-- <input type="text" class="modal_input" id="if_idRst" disabled="disabled"> -->
                </td>
            </tr>                           
            <tr>
                <td>
                    <button type="button" id="findId_pw" class="m_button" style="margin-top:30px;">비밀번호 찾기</button>
                </td>
            </tr>
        </table>
    </div>
</div>		






<!------------------------------ 비밀번호 찾기 모달1 --------------------------------->
<div id="findPw_modal1">
    <div class="Umodal_header">
        <h2 class="Umodal-title" style="margin:15px 0;line-height:34px;">
            <span class="Umodal_logo">오늘의 너</span> 비밀번호 찾기
        </h2>
        <div class="Umodal_close">close</div> 
    </div>
    <div class="Umodal_body">
        <table class="Umodal_table">
        	<tr>
                <td class="Ulabel">
                    <p style="font-size: 12px; margin:5px"><span style="color:red">*</span> 비밀번호를 재설정할 아이디를 입력해주세요.</p>
                </td>
            </tr>
            <tr>
                <td class="Ulabel" style="padding-top:5px;">
                    <p>
                        <strong>아이디</strong>
                    </p>
                </td>
            </tr>
            <tr>
                <td><input type="text" class="modal_input" id="findPw_userId"></td>
            </tr>
            
        
            <tr>
                <td>
                    <button type="button" id="findPwNext" class="m_button" style="margin-top:35px;">확인</button>
                </td>
            </tr>
        </table>
    </div>
</div>			




<!------------------------------ 비밀번호 찾기 모달2 --------------------------------->
<div id="findPw_modal2">
    <div class="Umodal_header">
        <h2 class="Umodal-title" style="margin:15px 0;line-height:34px;">
            <span class="Umodal_logo">오늘의 너</span> 비밀번호 찾기
        </h2>
        <div class="modal_close">close</div> 
    </div>
    <div class="Umodal_body">
        <table class="Umodal_table">
        	<tr>
                <td class="Ulabel">
                    <p style="font-size: 12px; margin:5px"><span style="color:red">*</span> 회원가입시 입력한 아이디, 이름, 이메일을 기입해주세요. 정보가 일치하면 인증번호가 발송됩니다.</p>
                </td>
            </tr>
            <tr>
                <td class="Ulabel">
                    <p>
                        <strong>이름</strong>
                    </p>
                </td>
            </tr>
            <tr>
                <td><input type="text" class="modal_input" id="findPw_name"></td>
            </tr>
            <tr>
                <td class="Ulabel">
                    <p>
                        <strong>이메일</strong>
                        <span id="pf_emailChk"></span>
                    </p>
                </td>
            </tr>
            <tr>
                <td class="emailAuth">
                 <input type="email" class="modal_input" id="findPw_email">
                 <button type="button" class="pf_authSend">인증번호 전송</button>
                </td>
            </tr>               
            <tr>
                <td class="Ulabel">
                    <p>
                        <strong>인증번호</strong>
                        <span id="pf_authChk"></span>
                    </p>
                </td>
            </tr>
            <tr>
                <td class="emailAuth">
               		<input type="text" id="findPw_authNum" class="modal_input" placeholder="인증번호 6자리 입력">
               		<button type="button" class="pf_authChkBtn">확인</button>
                </td>
        </table>
    </div>
</div>		



<!------------------------------ 비밀번호 찾기 모달3 --------------------------------->
<div id="findPw_modal3">
    <div class="Umodal_header">
        <h2 class="Umodal-title" style="margin:15px 0;line-height:34px;">
            <span class="Umodal_logo">오늘의 너</span> 비밀번호 찾기
        </h2>
        <div class="modal_close">close</div> 
    </div>
    <div class="Umodal_body">
        <table class="modal_table">
        	<tr>
                <td class="Ulabel">
                    <p style="font-size: 28px;text-align:center;font-weight: bold;color: #555;margin: 20px 0;">임시 비밀번호 발송</p>
                </td>
            </tr>               
            <tr>               	
                <td>
                	<div style="height:80px;font-size: 16px;word-break: keep-all;line-height: 1.5;padding-left: 10px;">
                		입력하신 이메일(<span id="pf_Rst">email</span>)로 임시 비밀번호가 발송되었습니다. 임시 비밀번호를 통해 로그인 후 비밀번호를 변경해 주시기 바랍니다.
                	</div>
                </td>
            </tr>                           
            <tr>
                <td>
                    <button type="button" class="m_button pClose" style="margin-top:30px;">닫기</button>
                </td>
            </tr>
        </table>
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
	    
	    
	    
	    
	    
	    
	 	// 아이디 찾기, 비밀번호 찾기 모달 열기
        $("#findId").click(function(){ // 아이디 찾기
        	$("#login_modal").css("display", "none");
        	$("#findId_modal1 input").val("");
        	$('#if_pwChk').html("");
        	$("#findId_modal1").css("display", "block");
        });
        
        $("#findPw").click(function(){ // 비밀번호 찾기(로그인 창에서)
        	$("#login_modal").css("display", "none");
        	$("#findPw_modal1 input").val("");
        	$("#findPw_modal1").css("display", "block");
        });
        
        $("#findId_pw").click(function(){ // 비밀번호 찾기(아이디 찾기에서)
        	$("#findId_modal2").css("display", "none");
        	$("#findPw_modal2 input").val(""); $("#pf_authChk").html(""); $("#pf_emailChk").html(""); // 초기화  
        	$("#findPw_userId").val($(this).attr("value")); // userId값 전달
        	console.log($("#findPw_userId").val());
        	$("#findPw_modal2").css("display", "block");     
        });
        $(".pClose").click(function(){           	
        	$("#findPw_modal3").css("display", "none");
        });
        
        
        // 아이디찾기 입력값 정보 체크
        $(".if_authSend").click(function(){	
			 let email = $('#findId_email').val();
			 let name = $('#findId_name').val();
			 let user = {"email": email};
			 
			 if(!name || name.replace(/\s| /gi, "").length==0){ // 이름 입력값 체크
					alert("이름을 입력해주세요.");
					$("#findId_name").focus();
				    return false;
				}
				 
			 if(!getMail.test(email)){  // 이메일 입력값 체크
			 	alert("이메일 입력값을 확인해주세요.");
			 	return false;
			 }else{
				 $.ajax({
						type : "POST",
						url : "/user/emailName",
						contentType: 'application/json; charset=UTF-8',
						dataType: "json",
						data : JSON.stringify(user),
						success: function(response){
							if(response['result'] === 'noEmail'){ // 가입된 메일 아닐 경우
								$('#if_pwChk').html('');
								alert("조회되지 않는 이메일입니다.");									
							}else if(response['result'] === 'success'){
								let dbName = response['name'];
								let userId = response['userId'];
								if(name === dbName){ // 일치하게 입력한 경우 
									findIdMail(email, userId, name); 
								}else{ // 가입된 메일이지만 이름과 메일 일치x
									$('#if_pwChk').html('');
									alert("이름과 이메일이 일치하지 않습니다. 입력값을 확인해주세요.");									
								}
							}		
						},
						error: function(data){
							alert("메일 발송에 실패했습니다.");
						}
					});
			 }
			 				 			  
		});
        
        
        
        // 아이디찾기 인증번호 발송
        function findIdMail(email, userId, name){
        	
        	 let emailAuthNum = "";
			 
        	 $.ajax({
					type : "POST",
					url : "/user/emailAuth",
					data : {email : email},
					success: function(data){
						$('#if_pwChk').html('<b style="font-size:13px;color:blue;">인증번호가 발송되었습니다.</b>');
						emailAuthNum = data;
						//console.log(email_auth_cd);
					},
					error: function(data){
						alert("메일 발송에 실패했습니다.");
					}
				});
			 
			 
			 // 인증번호 일치 확인
			 $(".if_authChkBtn").click(function(){
				 if($("#findId_authNum").val() === emailAuthNum){
					 //$('#if_authChk').html('<b style="font-size:13px;color:blue;">인증되었습니다.</b>');
					 //chk7 = true;
					 alert("인증되었습니다.");
					 $("#findId_modal1").css("display","none");
					 $("#if_nameRst").add($("#if_idRst")).text(""); // 초기화						 
					 $("#if_nameRst").text(name);
					 $("#if_idRst").text(userId);
					 $("#findId_pw").attr("value", userId); // 버튼 value값
					 $("#findId_modal2").css("display","block");
				 }else{
					 $('#if_authChk').html('<b style="font-size:13px;color:#F05650;">인증번호가 일치하지 않습니다.</b>');
					 //chk7 = false;
				 }
			 })
        	
        }
        
        
		// 비밀번호 찾기 아이디 조회
        $("#findPwNext").click(function(){
                	
        	let userId = $("#findPw_userId").val();
        	if(!userId || userId.replace(/\s| /gi, "").length==0){ // 아이디 입력값 체크
				alert("아이디를 입력해주세요.");
				$("#findPw_userId").focus();
			    return false;
			}
            
            $.ajax({
                type: "POST",
                url: "/user/checkId",  
                headers: {
                    "Content-Type": "application/json"
                },
                dataType: "text",
                data: userId,
                success: function(result) {
                    if(result === "OK") { // 가입되지 않은 아이디
                        alert("가입되지 않은 아이디입니다.");
                    } else { // 가입된 아이디
                    	$("#findPw_modal1").css("display", "none");
                    	$("#findPw_modal2 input").val(""); $("#pf_authChk").html(""); $("#pf_emailChk").html(""); // 초기화                        	
                    	$("#findPw_modal2").css("display", "block");                     	
                    }
                },
                error: function() {
                    console.log("통신 실패");
                }
            });
        	
        })
        
        
        
     	// 비밀번호 찾기 입력값 정보 체크
        $(".pf_authSend").click(function(){	
        	 let userId = $("#findPw_userId").val();
			 let email = $('#findPw_email').val();
			 let name = $('#findPw_name').val();
			 let user = {"userId": userId, "email": email, "name": name};
			 
			 if(!name || name.replace(/\s| /gi, "").length==0){ // 이름 입력값 체크
					alert("이름을 입력해주세요.");
					$("#findPw_name").focus();
				    return false;
				}
				 
			 if(!getMail.test(email)){  // 이메일 입력값 체크
			 	alert("이메일 입력값을 확인해주세요.");
			 	return false;
			 }else{
				 $.ajax({
						type : "POST",
						url : "/user/findPwInfo",
						contentType: 'application/json; charset=UTF-8',
						dataType: "text",
						data : JSON.stringify(user),
						success: function(response){
							console.log(response);
							if(response === 'noUser'){ // 일치하는 회원x
								alert("회원 정보가 일치하지 않습니다. 입력값을 확인해주세요.");									
							}else if(response === 'success'){
								findPwMail(email, userId); 
							}		
						},
						error: function(data){
							alert("메일 발송에 실패했습니다.");
						}
					});
			 }
			 				 			  
		});
		
		
		
     	// 비밀번호찾기 인증번호 발송
        function findPwMail(email, userId){
        	
        	 let emailAuthNum = "";
			 
        	 $.ajax({
					type : "POST",
					url : "/user/emailAuth",
					data : {email : email},
					success: function(data){
						$('#pf_emailChk').html('<b style="font-size:13px;color:blue;">인증번호가 발송되었습니다.</b>');
						emailAuthNum = data;
					},
					error: function(data){
						alert("메일 발송에 실패했습니다.");
					}
				});
			 
			 
			 // 인증번호 일치 확인
			 $(".pf_authChkBtn").click(function(){
				 if($("#findPw_authNum").val() === emailAuthNum){
					 alert("인증되었습니다.");
					 $("#findPw_modal2").css("display", "none");	
					 $("#pf_Rst").text(""); //초기화
					 $("#pf_Rst").text(email);
					 $("#findPw_modal3").css("display", "block"); // 사용자 편의상 미리 모달창 띄우기(오류시 메일발송 실패 알림창)	
					 modifyPw(email, userId); // 임시 비밀번호 설정 및 알림메일 발송
				 }else{
					 $('#pf_authChk').html('<b style="font-size:13px;color:#F05650;">인증번호가 일치하지 않습니다.</b>');
				 }
			 })
        	
        }
     	
     	
     	// 임시 비밀번호 설정 및 알림메일 발송
        function modifyPw(email, userId){
        	let user = {"userId": userId, "email": email};
        	
        	$.ajax({
				type : "POST",
				url : "/user/findPw",
				contentType: 'application/json; charset=UTF-8',
				dataType: "text",
				data : JSON.stringify(user),
				success: function(response){
					console.log(response);
					if(response === 'success'){ 
						//alert("입력하신 이메일(" + email + ")로 임시 비밀번호가 발송되었습니다. 임시 비밀번호를 통해 로그인 후 비밀번호를 변경해 주시기 바랍니다.");	
						/*$("#findPw_modal2").css("display", "none");	
						$("#pf_Rst").text(""); //초기화
						$("#pf_Rst").text(email);
						$("#findPw_modal3").css("display", "block");*/	
					}else{
						alert("임시 비밀번호 발송에 실패하였습니다.");
					}		
				},
				error: function(data){
					alert("메일 발송에 실패했습니다.");
				}
			});
        	
        }
	    
	    
	    
	    
	    
	    
	    
	   
	});//end JQuery
</script>

