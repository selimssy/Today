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
.main_nav ul li{list-style: none; display:inline-block; padding: 20px 35px 0px 40px}
.main_nav ul a{text-decoration: none; color: #000; font-size:0.9em}
.main_nav ul a:nth-child(1){background-image:url(/today/img/common/login.png); background-size: contain; background-repeat: no-repeat; background-origin:content-box ;}
.main_nav ul a:nth-child(2){background-image:url(/today/img/common/join.png); background-size: contain; background-repeat: no-repeat; background-origin:content-box; }
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




#login_modal{display: none; width: 400px; height: 500px; position: fixed;
    top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8;
    background: #fff; border-radius: 10px;
}
#join_modal{display: none; width: 450px; height: 585px; position: fixed;
    top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8;
    background: #fff; border-radius: 10px;
}    
.modal_header{border-bottom: 1px solid #dee2e6; display: flex; position: relative;}
.modal_logo{font-size: 1.25em; font-family: 'Nanum Pen Script', cursive; padding-left: 15px;}
.modal_close{height: 25px; float: right; position: absolute; top: 25px; right: 15px;}

.modal_table{border-collapse: collapse; width: 100%;}
.modal_body{padding: 0 20px; display: block;}
.mlabel{padding-top: 10px;}
.modal_input{border: 1px solid #d9d9de; box-sizing: border-box; width: 100%; height: 40px;}
#auto_login{margin-top: 20px; margin-bottom: 20px;}
.m_button{margin-top: 20px; width: 100%; height: 40px; padding: 0 20px; border: none; border-radius: 5px; cursor:pointer}





/* 임시!!!(펫 관련) 
#petList{width: 800px; height: 450px; border: 5px solid #7AB730; display: none;}
#petList h2{background: #7AB730;}
#petList #petCards{display: flex; overflow-x: auto}
#petList #petCards a{text-decoration: none; color: #000;}*/


#petRg_modal{display: none;}
/*펫리스트
.pet{width: 240px; border: 1px solid #000;}

.pet_in img{width: 100%;}*/

	
/*팝업 모달*/
.layer-popup {display: none;  position: fixed;
    top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8;
     border-radius: 10px; z-index: 100}
.layer-popup.show {display: block;}
      
/* 펫 리스트 창 */     
.petList{width: 800px; height: 430px; border: 5px solid #7AB730; border-radius: 50px; background: #fff; padding-bottom: 5px;}
#layer-popup > img{width: 70px; height: 70px; position: absolute; top: 30px; left: 200px;}
#layer-popup > p{font-size: 72px; /*background: rgba(122, 183, 48, 0.7);*/ margin: 20px 0 0; padding-left: 40px; font-family: 'Nanum Pen Script', cursive; text-align: center;}
.bdiv{text-align: right;}
#petRgform_open{font-size: 25px; font-family: 'Nanum Pen Script';border: transparent; border-radius: 10px; background: #7AB730; padding: 10px 5px; margin-right: 20px;}
.petList #petCards{display: flex; justify-content: space-evenly; margin-top: 20px;}
.petList #petCards a{text-decoration: none; color: #000;}
.pet{width: 220px; height: 210px; border: transparent; border-radius: 20px; background: #F3F3F3; text-align: center; padding: 15px 0;}       
.pet_in img{width: 140px; height: 140px; border-radius: 50%; object-fit: cover;}    		
.pet_in h3{margin: 10px 0; padding: 0 30px; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
.pet_in p{margin: 0;}
/* petId 안보이게 */
.pet_id{display:none}   




.flex-container {
    display: flex;
}

/*
.wrapper {
text-align: center;
flex-grow: 1;
}
*/

.image-box {
    width: 200px;
    height: 200px;
    object-fit: cover;
    display: block;
    margin: 20px auto;
}

.upload-btn {
    border: 1px solid #ddd;
    padding: 6px 12px;
    display: inline-block;
    cursor: pointer;           
}

input[type=file] {
    display: none;
}





</style>

</head>
<body>
   
    <div>
        <div class="container">
            <nav class="main_nav">
                <ul>
                    <a href="#" id="login"><li>로그인</li></a>
                    <a href="#" id="join"><li>회원가입</li></a>
                </ul>
            </nav>
            <div class="title">
                <span class="tfont">오늘의 너</span>
                <p>사랑스러운 너와의 오늘을 기억해</p>
            </div>

            <div class="menuboard">
                <a href="javascript:select_pet();">
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
                <a href="#">
                    <div class="menu">
                        <img src="/today/img/common/boarduser.png">
                        <p>마이페이지</p>
                        <p>개인정보 수정</p>
                        <p>비밀번호 변경</p>
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
            <button type="button" class="modal_close">X</button> <!--닫기 버튼-->
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
                        <td><input type="text" class="modal_input" id="signInId" placeholder="최대 10자"></td>
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
                        <td><input type="password" class="modal_input" id="signInPw" placeholder="최소 8자"></td>
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
            <button type="button" class="modal_close">X</button> <!--닫기 버튼-->
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
                        <td><input type="text" id="user_id" class="modal_input" placeholder="최대 10자"></td>
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
                        <td><input type="password" id="password" class="modal_input" placeholder="최소 8자"></td>
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
                        <td><input type="password" id="password_check" class="modal_input" placeholder="최소 8자"></td>
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
                        <td><input type="text" id="user_name" class="modal_input" placeholder="한글로 최대 6자"></td>
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
    

	
	
	
	<!----------------------------- 펫 리스트 창 -------------------------------
	<div>
        


        <div id="petList">    
            <h2>반려동물 선택</h2>
            <button id="petRgform_open">반려동물 추가</button>

            <div id="petCards">
				
            </div>
        </div>
    </div>-->
    
    <!----------------------------- 펫 리스트 창 --------------------------------->	
	<div class="modalcontainer">
        <div class="petList layer-popup" id="layer-popup">       
            <img src="<c:url value='/img/community/infoPhoto.png'/>"> 
            <p>반려동물 선택</p>
            <div class="bdiv">
                <button id="petRgform_open">+ 반려동물 추가</button>
            </div>      
            <div id="petCards">

             
            </div>
        </div>
    </div>
    
    
    
    
    <!-------------------------------------- 펫등록 모달 ----------------------------------------->
    <div id="petRg_modal">
        <div class="modal_header">
            <h2 class="modal-title">
                <span class="modal_logo">오늘의 너</span> 펫 등록
            </h2>
            <button type="button" class="modal_close">X</button> <!--닫기 버튼-->
        </div>
        <div class="modal_body" >
            <form method="post" id="petRgForm">
                <table class="modal_table">
                    <tr>
                        <div class="flex-container">       
                            <div class="wrapper">
                                <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
                                <label for="file" class="upload-btn">
                                    <input id="file" type="file" name="file" accept="image/*" />
                                    <span>Upload Image</span>
                                </label>
                            </div>
                        </div>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>반려동물 이름</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="pet_name" class="modal_input" placeholder="최대 10자"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>나이</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="age" class="modal_input" placeholder="ex) 5"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>성별</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><input type="radio" name="gender" value="남"> 남</label>
                            <label><input type="radio" name="gender" value="여"> 여</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>특징</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="feature" class="modal_input" placeholder="ex) 애교쟁이, 노즈워크 달인"></td>
                    </tr>
                  
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>인스타그램</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                    	<td>
							<input type="url" id="instagram" placeholder="url">
                    	</td>
                    </tr>
                    
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>유튜브</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                    	<td>
							<input type="url" id="youtube" placeholder="url">
                    	</td>
                    </tr>  
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>반려동물 공개 여부</strong>
                            </p>
                        </td>
                    </tr>            
                  	<tr>
                        <td>
                            <label><input type="radio" name="open" value="1"> 공개</label>
                            <label><input type="radio" name="open" value="0"> 비공개</label>
                        </td>
                    </tr>                
                    <tr>
                        <td>
                            <button type="button" id="petRg-btn" class="m_button">등록</button>
                        </td>
                    </tr>
                </table>
            </form >
        </div>
    </div>
	
	

    <script>
    	// 펫등록 사진업로드
    	const fileDOM = document.querySelector('#file');
        const previews = document.querySelectorAll('.image-box');

        fileDOM.addEventListener('change', () => {
        const imageSrc = URL.createObjectURL(fileDOM.files[0]);
        previews[0].src = imageSrc;
        });
        // 이거 가능하면 제이쿼리로 바꿔보자ㅠ
        
        
        
        
        

        // 외부영역 클릭 시 팝업 닫기
        $(document).mouseup(function (e){
        var LayerPopup = $(".layer-popup");
        if(LayerPopup.has(e.target).length === 0){
            LayerPopup.removeClass("show");
        }
        //$('#petCards').empty();
        });
        
        
        
    	// 펫리스트창 열기
    	function select_pet(){
    		$(".petList").css("display","block");
    		
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
       
            const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
            const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
            const getName= RegExp(/^[가-힣]+$/);
            const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
            let chk1 = false, chk2 = false, chk3 = false, chk4 = false;
           
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
                    $('#idChk').html('<b style="font-size:14px;color:red;">[영문자,숫자 4-14자]</b>');      
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
                                $("#user_id").css("background", "rgba(187, 217, 150, 0.8)");
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
                    $('#password').css("background-color", "rgba(187, 217, 150, 0.8)");
                    //$('#pwChk').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
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
                    $('#password_check').css("background-color", "rgba(187, 217, 150, 0.8)");
                    //$('#pwChk2').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
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
                    $('#user_name').css("background-color", "rgba(187, 217, 150, 0.8)");
                    //$('#nameChk').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
                    $('#nameChk').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk4 = true;
                }
               
            });
           
           



           // 회원가입 이벤트
            $('#signup-btn').click(function(e) {
                if(chk1 && chk2 && chk3 && chk4) {
                    //아이디 정보
                    const id = $("#user_id").val();
                    console.log("id: " + id);
                    //패스워드 정보
                    const pw = $("#password").val();
                    console.log("pw: " + pw);
                    //이름 정보
                    const name = $("#user_name").val();
                    console.log("name: " + name);
                   
                    const user = {
                        userId: id,
                        password: pw,
                        name: name
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
                                alert("회원가입에 성공했습니다!");
                                location.href="/today";
                            } else {
                                alert("회원가입에 실패했습니다!");
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
                    $('#signInId').css("background-color", "pink");
                    $('#idCheck').html('<b style="font-size:14px;color:red;">[아이디를 입력하세요.]</b>');
                    chk1 = false;
                }      
               
                //아이디 유효성검사
                else if(!getIdCheck.test($("#signInId").val())){
                    $('#signInId').css("background-color", "pink");
                    $('#idCheck').html('<b style="font-size:14px;color:red;">[영문자,숫자 4-14자~]</b>');  
                    chk1 = false;
                } else {
                    $('#signInId').css("background-color", "rgba(187, 217, 150, 0.9)");
                    //$('#idCheck').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
                    $('#idCheck').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk1 = true;
                }
            });
           
            //패스워드 입력값 검증.
            $('#signInPw').on('keyup', function() {
                //비밀번호 공백 확인
                if($("#signInPw").val() === ""){
                    $('#signInPw').css("background-color", "pink");
                    $('#pwCheck').html('<b style="font-size:14px;color:red;">[비밀번호를 입력하세요.]</b>');
                    chk2 = false;
                }                
                //비밀번호 유효성검사
                else if(!getPwCheck.test($("#signInPw").val()) || $("#signInPw").val().length < 8){
                    $('#signInPw').css("background-color", "pink");
                    $('#pwCheck').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
                    chk2 = false;
                } else {
                    $('#signInPw').css("background-color", "rgba(187, 217, 150, 0.9)");
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
                   
                    console.log("id: " + id);
                    console.log("pw: " + pw);
                    console.log("auto: " + autoLogin);
                   
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