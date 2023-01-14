<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">
<style>     
.container{width: 1200px; height: 880px; background: url(/today/img/common/homebg2.png); margin: 10px auto; position: relative;}
.main_nav{text-align: right; font-size: 1.5em; padding-right: 25px;}
.main_nav ul li{list-style: none; display:inline-block; padding: 20px 35px 0px 0px}
.main_nav ul a{text-decoration: none; color: #000; font-size:0.9em;}
#login{padding-left:30px; background-image:url(/today/img/common/login.png); background-size: contain; background-repeat: no-repeat;}
#join{padding-left:35px; background-image:url(/today/img/common/join.png); background-size: contain; background-repeat: no-repeat;}
#logout{padding-left:35px; background-image:url(/today/img/common/logout.png); background-size: contain; background-repeat: no-repeat;}
.main_nav ul a:hover{font-weight: bold;}    
.title{position: absolute; top: 30px; left: 150px;}
.tfont{font-size: 7.5em; font-family: 'Nanum Pen Script', cursive;}
.title p{font-size: 2.1em; font-family: 'Nanum Pen Script', cursive; margin:0}
/*.menuboard{width: 1060px; position: absolute; bottom: 30px; display: flex; justify-content: space-between; margin-left: 10px;}*/
.menuboard a{text-decoration: none; color: #000;}
.menuboard a:nth-of-type(1){position: absolute; top:180px; right: 410px;}
.menuboard a:nth-of-type(2){position: absolute; top:180px; right: 60px;}
.menuboard a:nth-of-type(3){position: absolute; top:530px; right: 410px;}
.menuboard a:nth-of-type(4){position: absolute; top:530px; right: 60px;}
.menu{width: 290px; height: 300px; background: rgba(255, 255, 255, 0.75); text-align: center; padding-top:15px; box-sizing: border-box;}
.menu img{padding-top: 20px; width:60px; height: 60px;}
.menu p:nth-of-type(1){font-size: 2.5em; font-family: 'Jua', sans-serif; margin: 10px 0;}
.menu p:nth-of-type(2){margin-top: 30px}
.menu p:nth-of-type(2), .menu p:nth-of-type(3){font-size: 1.1em; color:#000}

.fcontainer{width: 1200px; margin: 0 auto; position: relative;}
.fcontainer span{position: absolute; left: 20px; bottom: 15px; color: #fff;}




#login_modal{display: none; width: 400px; height: 500px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8; background: #fff; border-radius: 10px;}
#join_modal{display: none; width: 450px; height: 650px; overflow-y:scroll; position: fixed;top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8; background: #fff; border-radius: 10px;}    
.modal_header{border-bottom: 1px solid #dee2e6; display: flex; position: relative;}
.modal_logo{font-size: 1.25em; font-family: 'Nanum Pen Script', cursive; padding-left: 15px;}
.modal_close{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 25px; right: 25px; background-image: url(/today/img/common/close.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}
.modal_table{border-collapse: collapse; width: 100%;}
.modal_body{padding: 0 20px; display: block;}
.mlabel{padding-top: 10px;}
.modal_input{border: 1px solid #d9d9de; box-sizing: border-box; width: 100%; height: 40px;}
#auto_login{margin-top: 20px; margin-bottom: 20px;}
.m_button{margin-top: 20px; width: 100%; height: 40px; padding: 0 20px; border: none; border-radius: 5px; cursor:pointer}
#signup-btn{margin: 30px 0; height: 45px;}
.emailAuth{display:flex}
.emailAuth button{height: 40px; padding:5px 0; margin-left: 5px; border:none; /*font-size:20px; line-height:20px;*/ box-sizing: border-box; cursor: pointer;}
.emailAuth:nth-of-type(1) button{width:35%;}


@media all and (max-width:500px) {
	#login_modal, #join_modal{width: 85%;}
}



	


</style>

</head>
<body>
   
    <div>
        <div class="container">
        
            <c:if test="${login == null}" >  <!-- 로그인 안되어있을 경우 -->
	            <nav class="main_nav">
	                <ul>
	                    <li><a href="#" id="login">로그인</a></li>
	                    <li><a href="#" id="join">회원가입</a></li>                
	                </ul>    
	           </nav>     
           </c:if>                
           <c:if test="${login != null}">  <!-- 로그인 되어있을 경우 -->
           		<nav class="main_nav">
           			<ul>
           				<li><a href="<c:url value='/user/logout'/>" id="logout" onclick="return confirm('로그아웃 하시겠습니까?')">로그아웃</a></li>
           			</ul>
           		</nav>
           </c:if>
           
            <div class="title">
                <span class="tfont">오늘의 너</span>
                <p>사랑스러운 너와의 오늘을 기억해</p>
            </div>

            <div class="menuboard">
                <!-- <a href="javascript:select_pet();"> -->
                <a href="<c:url value='/mypet/lifetime'/>">
                    <div class="menu">
                        <img src="/today/img/common/dog2.png">
                        <p>나의 반려견</p>
                        <p>반려견 생애 기록</p>
                        <p>갤러리</p>
                    </div>
                </a>
                <a href="<c:url value='/diary/calendar'/>">
                    <div class="menu">
                        <img src="/today/img/common/cal.png">
                        <p>반려견 다이어리</p>
                        <p>반려견 전용 캘린더</p>
                        <p>견주 일기</p>
                    </div>
                </a>
                <a href="<c:url value='/community/intro'/>">
                    <div class="menu">
                        <img src="/today/img/common/community.png">
                        <p>커뮤니티</p>
                        <p>내 반려견 자랑하기</p>
                        <p>커뮤니티 게시판</p>
                        <!-- <p>견주 커뮤니티(꿀팁 공유, 묻고 답하기)</p> -->
                    </div>
                </a>
                <a href="<c:url value='/mypage/profile'/>">
                    <div class="menu">
                        <img src="/today/img/common/boarduser.png">
                        <p>마이페이지</p>
                        <p>개인정보 수정</p>
                        <p>반려견 정보 수정</p>
                    </div>
                </a>
            </div>
           


        </div>
    </div>

    <footer>
        <div class="fcontainer">
            <span>Copyright ⓒ By Ali 2022 </span>
        </div>
    </footer>



    <!---------------------------- 로그인 모달 ------------------------------ -->
    <div id="login_modal">
        <div class="modal_header">
            <h2 class="modal-title">
                <span class="modal_logo">오늘의 너</span> 로그인
            </h2>
            <div class="modal_close">close</div> <!--닫기 버튼-->
        </div>
        <div class="modal_body">
            <form method="post" id="signInForm">
                <table class="modal_table">
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>아이디</strong>
                                <span id="idCheck"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" class="modal_input" id="signInId" placeholder="ID"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>비밀번호</strong>
                                <span id="pwCheck"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="password" class="modal_input" id="signInPw" placeholder="PW"></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" id="auto_login" name="autoLogin"> 자동 로그인
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="m_button" id="signIn-btn">로그인</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="m_button">회원가입</button>
                        </td>
                    </tr>
                </table>
            </form >
        </div>
    </div>






    <!------------------------------ 회원가입 모달 --------------------------------->
    <div id="join_modal">
        <div class="modal_header">
            <h2 class="modal-title">
                <span class="modal_logo">오늘의 너</span> 회원가입
            </h2>
            <div class="modal_close">close</div> <!--닫기 버튼-->
        </div>
        <div class="modal_body" >
            <form method="post" id="joinForm">
                <table class="modal_table">
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>아이디</strong>
                                <span id="idChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="user_id" class="modal_input" placeholder="영문자, 숫자 6-14자"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>비밀번호</strong>
                                <span id="pwChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="password" id="password" class="modal_input" placeholder="특수문자 포함 8자이상"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>비밀번호 확인</strong>
                                <span id="pwChk2"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="password" id="password_check" class="modal_input"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>이름</strong>
                                <span id="nameChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="user_name" class="modal_input" maxlength="6" placeholder="한글 최대 6자"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>닉네임</strong>
                                <span id="nickNameChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="user_nick" class="modal_input" maxlength="10" placeholder="한글 최대 10자"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>이메일</strong>
                                <span id="emailChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td class="emailAuth">
                       		<input type="email" id="user_email" class="modal_input" placeholder="ex) abc123@abcd.com">
                       		<button type="button" class="email_auth_btn">인증번호 전송</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>인증번호</strong>
                                <span id="authChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td class="emailAuth">
                       		<input type="text" id="authNum" class="modal_input" placeholder="인증번호 6자리 입력">
                       		<button type="button" class="authChkBtn">확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" id="signup-btn" class="m_button">회원가입</button>
                        </td>
                    </tr>
                </table>
            </form >
        </div>
    </div>
    

	
	
	

	

    <script>

        
    	// 펫리스트창 열기
    	function select_pet(){
    		$(".petList").css("display","block");
    		$('#petCards').empty();
    		
    		const id = "${login.userId}";
    		console.log(id);
    		const user = {
                        userId: id
                    };
    		$.ajax({
                type: 'post',
                dataType : "json",
                contentType: 'application/json',
                url: '/today/user/petList',
                data: JSON.stringify(user),
                success: function (response) {
                	console.log(response); // 리스트 
                    //let rows = response  
                    //console.log(row.length);
                    for(let i = 0; i < response.length; i++){
                    	let pet_id = response[i]['petId']
                        let src = response[i]['imagePath']
                        let pet_name = response[i]['petName']
                        let age = response[i]['age']
                        let gender = response[i]['gender']

                        let temp_html = "<a href='javascript:;'><div class='pet'><div class='pet_in'><div class='pet_id'>" + pet_id + "</div><img src='/today" + src + "'><div><h3>" + pet_name + "</h3><p>" + age + "살 / <span>" + gender + "</span></p></div></div></div></a>" 

                        $('#petCards').append(temp_html)
                    }
                }, 
                error: function() {
                    console.log("통신 실패!");
                } 
            });
    		 
    		
    	}
    	
           
        // 펫등록 모달 열기 
        // 반려동물 추가
        $("#petRgform_open").click(function(){
            $("#petRg_modal").css("display","block");
        })
      
        
        
        
        
        // 새로운 펫 추가 이벤트    
        $("#petRg-btn").click(function(){
            //formData 객체 생성
            let formData = new FormData();
        	formData.append("petImg", $("input[name=file]")[0].files[0]);
        	// 넘겨줄 반려동물 데이터
        	let petData = {
        			"userId": "${login.userId}",
        			"petName": $("#pet_name").val(),
        			"age": $("#age").val(),
        			"gender": $("input[name='gender']:checked").val(),
        			"feature": $("#feature").val(),
        			"instagram": $("#instagram").val(),
        			"youtube": $("#youtube").val(),
        			"open": $("input[name='open']:checked").val()
        	}
        	
        	// formData에 json타입으로 petData 추가
        	formData.append("petData", new Blob([ JSON.stringify(petData) ], {type : "application/json"}));
        	
        	// ajax 처리
        	$.ajax({
        		  type: "POST",
        	      url: "/today/user/registerPet",
        	      data: formData,
        	      dataType: "text",
        	      contentType: false,               // * 중요 *
        	      processData: false,               // * 중요 *
        	      enctype : 'multipart/form-data',  // * 중요 *
        	      success: function(result) { 
                      console.log("통신 성공!: ");
                      if(result === "success") {
                          alert("반려동물 등록이 완료되었습니다.");
                          //location.href="/today/mypet/lifetime"; session petId등록 문제
                      } else {
                          alert("반려동물 등록에 실패했습니다.");
                      }
                  }, 
                  error: function() {
                      console.log("통신 실패!");
                  } 
        	});
        })    

        
        
        
        
        
        // 반려동물 선택 이벤트(나의 펫 리다이렉트)
        $(document).on("click", ".pet", function () {
            const user_id = "${login.userId}";
            const pet_id = $(this).find( ".pet_id" ).text();
    		console.log(user_id);
            console.log(pet_id);
    		const pet = {
                        userId: user_id,
                        petId: pet_id
                    };

            $.ajax({
                type: "POST", 
                url: "/today/user/selectPet", 
                headers: {
                    "Content-Type": "application/json"
                }, 
                dataType: "text", 
                data: JSON.stringify(pet), 
                success: function(result) { 
                    console.log("통신 성공!: ");
                    if(result === "success") {
                        location.href="/today/mypet/lifetime";
                    } else {
                        alert("반려동물 선택에 실패했습니다.");
                    }
                }, 
                error: function() {
                    console.log("통신 실패!");
                } 
            });        
            
        })
        
        
        
    	
    	
    	// 이거 그냥 밑으로 넣어도 되지 않나
        $("#login").click(function(){
            $("#login_modal").css("display", "block")
        })
        $("#join").click(function(){
            $("#join_modal").css("display", "block")
        })
        $(".modal_close").on("click", function(){
            $(this).parent().parent().css("display", "none")
        })



        $(function() {
       
            const getIdCheck= RegExp(/^[a-zA-Z0-9]{6,14}$/);
            const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
            const getName= RegExp(/^[가-힣]+$/);
            const getNick= RegExp(/^[가-힣]+$/);
            const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
            let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false, chk6 = false, chk7 = false; 
           
            //회원가입 검증~~
            //ID 입력값 검증.
            $('#user_id').on('keyup', function() {
                if($("#user_id").val() === ""){
                    $('#user_id').css("background-color", "pink");
                    $('#idChk').html('<b style="font-size:14px;color:red;">[아이디를 입력하세요.]</b>');
                    chk1 = false;
                }
               
                //아이디 유효성검사
                else if(!getIdCheck.test($("#user_id").val())){
                    $('#user_id').css("background-color", "pink");
                    $('#idChk').html('<b style="font-size:14px;color:red;">[영문자, 숫자 6-14자]</b>');      
                    chk1 = false;
                }
                //ID 중복확인 비동기 처리
                else {
                    //ID 중복확인 비동기 통신
                    const userId = $(this).val();
                    console.log(userId);
                   
                    $.ajax({
                        type: "POST",
                        url: "/today/user/checkId",  
                        headers: {
                            "Content-Type": "application/json"
                        },
                        dataType: "text",
                        data: userId,
                        success: function(result) {
                            if(result === "OK") {
                                $("#user_id").css("background", "#e8f0fe");
                                $("#idChk").html("<b style='font-size:14px; color:blue;'>[사용 가능한 아이디입니다.]</b>");
                                chk1 = true;
                            } else {
                                $("#user_id").css("background-color", "pink");
                                $("#idChk").html("<b style='font-size:14px; color:red;'>[중복된 아이디입니다.]</b>");                        
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
                    $('#pwChk').html('<b style="font-size:14px;color:red;">[비밀번호를 입력하세요.]</b>');
                    chk2 = false;
                }                
                //비밀번호 유효성검사
                else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
                    $('#password').css("background-color", "pink");
                    $('#pwChk').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
                    chk2 = false;
                } else {
                    $('#password').css("background-color", "#e8f0fe");
                    $('#pwChk').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk2 = true;
                }
               
            });
           
            //패스워드 확인란 입력값 검증.
            $('#password_check').on('keyup', function() {
                //비밀번호 확인란 공백 확인
                if($("#password_check").val() === ""){
                    $('#password_check').css("background-color", "pink");
                    $('#pwChk2').html('<b style="font-size:14px;color:red;">[비밀번호를 입력하세요.]</b>');
                    chk3 = false;
                }                
                //비밀번호 확인란 유효성검사
                else if($("#password").val() != $("#password_check").val()){
                    $('#password_check').css("background-color", "pink");
                    $('#pwChk2').html('<b style="font-size:14px;color:red;">[비밀번호가 일치하지 않습니다.]</b>');
                    chk3 = false;
                } else {
                    $('#password_check').css("background-color", "#e8f0fe");
                    $('#pwChk2').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk3 = true;
                }
               
            });
           
            //이름 입력값 검증.
            $('#user_name').on('keyup', function() {
                //이름값 공백 확인
                if($("#user_name").val() === ""){
                    $('#user_name').css("background-color", "pink");
                    $('#nameChk').html('<b style="font-size:14px;color:red;">[이름을 입력하세요.]</b>');
                    chk4 = false;
                }                
                //이름값 유효성검사
                else if(!getName.test($("#user_name").val())){
                    $('#user_name').css("background-color", "pink");
                    $('#nameChk').html('<b style="font-size:14px;color:red;">[한글로 최대 6자]</b>');
                    chk4 = false;
                } else {
                    $('#user_name').css("background-color", "#e8f0fe");
                    $('#nameChk').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk4 = true;
                }
               
            });
            
            //닉네임 입력값 검증. 
            $('#user_nick').on('keyup', function() {
                //닉네임 공백 확인
                if($("#user_nick").val() === ""){
                    $('#user_nick').css("background-color", "pink");
                    $('#nickNameChk').html('<b style="font-size:14px;color:red;">[닉네임을 입력하세요.]</b>');
                    chk5 = false;
                }                
                //닉네임 유효성검사
                else if(!getNick.test($("#user_nick").val())){
                    $('#user_nick').css("background-color", "pink");
                    $('#nickNameChk').html('<b style="font-size:14px;color:red;">[한글로 최대 10자]</b>');
                    chk5 = false;
                } else {
                    $('#user_nick').css("background-color", "#e8f0fe");
                    $('#nickNameChk').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk5 = true;
                }
               
            });
            
            //이메일 입력값 검증. 
            $('#user_email').on('keyup', function() {
                //이메일 공백 확인
                if($("#user_email").val() === ""){
                    $('#user_email').css("background-color", "pink");
                    $('#emailChk').html('<b style="font-size:14px;color:red;">[이메일을 입력하세요.]</b>');
                    chk6 = false;
                }                
                //이메일 유효성검사
                else if(!getMail.test($("#user_email").val())){
                    $('#user_email').css("background-color", "pink");  
                    $('#emailChk').html('<b style="font-size:14px;color:red;">[이메일 입력값을 확인해주세요.]</b>');
                    chk6 = false;
                } else {
                    $('#user_email').css("background-color", "#e8f0fe");
                    $('#emailChk').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
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
							url : "/today/user/emailAuth",
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
						 $('#authChk').html('<b style="font-size:14px;color:red;">인증번호가 일치하지 않습니다.</b>');
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
                        url: "/today/user/", //서버 요청 URI
                        headers: {
                            "Content-Type": "application/json"
                        }, //요청 헤더 정보
                        dataType: "text", //응답받을 데이터의 형태
                        data: JSON.stringify(user), //서버로 전송할 데이터
                        success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
                            console.log("통신 성공!: " + result);
                            if(result === "joinSuccess") {
                                alert("회원가입이 완료되었습니다.");
                                location.href="/today";
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
           

            //로그인 검증~~
            //ID 입력값 검증.
            $('#signInId').on('keyup', function() {
                if($("#signInId").val() == ""){
                    //$('#signInId').css("background-color", "pink");
                    $('#idCheck').html('<b style="font-size:14px;color:red;">[아이디를 입력하세요.]</b>');
                    chk1 = false;
                }      
               
                //아이디 유효성검사
                else if(!getIdCheck.test($("#signInId").val())){
                    //$('#signInId').css("background-color", "pink");
                    $('#idCheck').html('<b style="font-size:14px;color:red;">[영문자,숫자 4-14자~]</b>');  
                    chk1 = false;
                } else {
                    $('#signInId').css("background-color", "#e8f0fe");
                    //$('#idCheck').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
                    $('#idCheck').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk1 = true;
                }
            });
           
            //패스워드 입력값 검증.
            $('#signInPw').on('keyup', function() {
                //비밀번호 공백 확인
                if($("#signInPw").val() === ""){
                    //$('#signInPw').css("background-color", "pink");
                    $('#pwCheck').html('<b style="font-size:14px;color:red;">[비밀번호를 입력하세요.]</b>');
                    chk2 = false;
                }                
                //비밀번호 유효성검사
                else if(!getPwCheck.test($("#signInPw").val()) || $("#signInPw").val().length < 8){
                    //$('#signInPw').css("background-color", "pink");
                    $('#pwCheck').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
                    chk2 = false;
                } else {
                    $('#signInPw').css("background-color", "#e8f0fe");
                    //$('#pwCheck').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
                    $('#pwCheck').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
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
                        url: "/today/user/loginCheck",
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
                                self.location="/today";
                            }
                        }
                    });
                   
                } else {
                    alert("입력정보를 다시 확인하세요!");
                }
            });
           
        });//end JQuery


    </script>

</body>
</html>