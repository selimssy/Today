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




#login_modal{display: none; width: 400px; height: 500px; position: fixed;
    top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8;
    background: #fff; border-radius: 10px;
}
#join_modal{display: none; width: 450px; height: 650px; overflow-y:scroll; position: fixed;
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
#signup-btn{margin: 30px 0; height: 45px;}
.emailAuth{display:flex}
.emailAuth button{height: 40px; padding:5px 0; margin-left: 5px; border:none; /*font-size:20px; line-height:20px;*/ box-sizing: border-box; cursor: pointer;}
.emailAuth:nth-of-type(1) button{width:35%;}




/* ??????!!!(??? ??????) 
#petList{width: 800px; height: 450px; border: 5px solid #7AB730; display: none;}
#petList h2{background: #7AB730;}
#petList #petCards{display: flex; overflow-x: auto}
#petList #petCards a{text-decoration: none; color: #000;}*/


#petRg_modal{display: none;}
/*????????????
.pet{width: 240px; border: 1px solid #000;}

.pet_in img{width: 100%;}*/

	
/*?????? ??????*/
.layer-popup {display: none; position: fixed;
    top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8;
     border-radius: 10px; z-index: 100}
.layer-popup.show {display: block;}
      
/* ??? ????????? ??? */     
.petList{width: 800px; height: 430px; border: 5px solid #7AB730; border-radius: 50px; background: #fff; padding-bottom: 5px;}
#layer-popup > img{width: 60px; height: 60px; position: absolute; top: 35px; left: 200px;}
#layer-popup > p{font-size: 72px; /*background: rgba(122, 183, 48, 0.7);*/ margin: 20px 0 0; padding-left: 40px; font-family: 'Nanum Pen Script', cursive; text-align: center;}
.bdiv{text-align: right;}
#petRgform_open{font-size: 25px; font-family: 'Nanum Pen Script';border: transparent; border-radius: 10px; background: #7AB730; padding: 10px 5px; margin-right: 20px;}
.petList #petCards{/*display: flex; justify-content: space-evenly;*/ margin-top: 20px;}
.petList #petCards a{text-decoration: none; color: #000;}
.pet{float: left; margin-left:35px; width: 220px; height: 210px; border: transparent; border-radius: 20px; background: #F3F3F3; text-align: center; padding: 15px 0;}       
.pet:nth-of-type{margin-right: 35px}
.pet_in img{width: 140px; height: 140px; border-radius: 50%; object-fit: cover;}    		
.pet_in h3{margin: 10px 0; padding: 0 30px; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
.pet_in p{margin: 0;}
/* petId ???????????? */
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
        
            <c:if test="${login == null}" >  <!-- ????????? ??????????????? ?????? -->
	            <nav class="main_nav">
	                <ul>
	                    <li><a href="#" id="login">?????????</a></li>
	                    <li><a href="#" id="join">????????????</a></li>                
	                </ul>    
	           </nav>     
           </c:if>                
           <c:if test="${login != null}">  <!-- ????????? ???????????? ?????? -->
           		<nav class="main_nav">
           			<ul>
           				<li><a href="<c:url value='/user/logout'/>" id="logout" onclick="return confirm('???????????? ???????????????????')">????????????</a></li>
           			</ul>
           		</nav>
           </c:if>
           
            <div class="title">
                <span class="tfont">????????? ???</span>
                <p>??????????????? ????????? ????????? ?????????</p>
            </div>

            <div class="menuboard">
                <!-- <a href="javascript:select_pet();"> -->
                <a href="<c:url value='/mypet/lifetime'/>">
                    <div class="menu">
                        <img src="/today/img/common/dog2.png">
                        <p>?????? ?????????</p>
                        <p>????????? ?????? ??????</p>
                        <p>?????????</p>
                    </div>
                </a>
                <a href="<c:url value='/diary/calendar'/>">
                    <div class="menu">
                        <img src="/today/img/common/cal.png">
                        <p>????????? ????????????</p>
                        <p>????????? ?????? ?????????</p>
                        <p>?????? ??????</p>
                    </div>
                </a>
                <a href="<c:url value='/community/intro'/>">
                    <div class="menu">
                        <img src="/today/img/common/community.png">
                        <p>????????????</p>
                        <p>??? ????????? ????????????</p>
                        <p>???????????? ?????????</p>
                        <!-- <p>?????? ????????????(?????? ??????, ?????? ?????????)</p> -->
                    </div>
                </a>
                <a href="<c:url value='/mypage/profile'/>">
                    <div class="menu">
                        <img src="/today/img/common/boarduser.png">
                        <p>???????????????</p>
                        <p>???????????? ??????</p>
                        <p>????????? ?????? ??????</p>
                    </div>
                </a>
            </div>
           


        </div>
    </div>

    <footer>
        <div class="fcontainer">
            <span>Copyright ??? By Ali 2022 </span>
        </div>
    </footer>



    <!---------------------------- ????????? ?????? ------------------------------ -->
    <div id="login_modal">
        <div class="modal_header">
            <h2 class="modal-title">
                <span class="modal_logo">????????? ???</span> ?????????
            </h2>
            <button type="button" class="modal_close">X</button> <!--?????? ??????-->
        </div>
        <div class="modal_body">
            <form method="post" id="signInForm">
                <table class="modal_table">
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>?????????</strong>
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
                                <strong>????????????</strong>
                                <span id="pwCheck"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="password" class="modal_input" id="signInPw" placeholder="PW"></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" id="auto_login" name="autoLogin"> ?????? ?????????
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="m_button" id="signIn-btn">?????????</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="m_button">????????????</button>
                        </td>
                    </tr>
                </table>
            </form >
        </div>
    </div>






    <!------------------------------ ???????????? ?????? --------------------------------->
    <div id="join_modal">
        <div class="modal_header">
            <h2 class="modal-title">
                <span class="modal_logo">????????? ???</span> ????????????
            </h2>
            <button type="button" class="modal_close">X</button> <!--?????? ??????-->
        </div>
        <div class="modal_body" >
            <form method="post" id="joinForm">
                <table class="modal_table">
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>?????????</strong>
                                <span id="idChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="user_id" class="modal_input" placeholder="?????????, ?????? 6-14???"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>????????????</strong>
                                <span id="pwChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="password" id="password" class="modal_input" placeholder="???????????? ?????? 8?????????"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>???????????? ??????</strong>
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
                                <strong>??????</strong>
                                <span id="nameChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="user_name" class="modal_input" maxlength="6" placeholder="?????? ?????? 6???"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>?????????</strong>
                                <span id="nickNameChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="user_nick" class="modal_input" maxlength="10" placeholder="?????? ?????? 10???"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>?????????</strong>
                                <span id="emailChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td class="emailAuth">
                       		<input type="email" id="user_email" class="modal_input" placeholder="ex) abc123@abcd.com">
                       		<button type="button" class="email_auth_btn">???????????? ??????</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>????????????</strong>
                                <span id="authChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td class="emailAuth">
                       		<input type="text" id="authNum" class="modal_input" placeholder="???????????? 6?????? ??????">
                       		<button type="button" class="authChkBtn">??????</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" id="signup-btn" class="m_button">????????????</button>
                        </td>
                    </tr>
                </table>
            </form >
        </div>
    </div>
    

	
	
	

	

    <script>

        
    	// ??????????????? ??????
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
                	console.log(response); // ????????? 
                    //let rows = response  
                    //console.log(row.length);
                    for(let i = 0; i < response.length; i++){
                    	let pet_id = response[i]['petId']
                        let src = response[i]['imagePath']
                        let pet_name = response[i]['petName']
                        let age = response[i]['age']
                        let gender = response[i]['gender']

                        let temp_html = "<a href='javascript:;'><div class='pet'><div class='pet_in'><div class='pet_id'>" + pet_id + "</div><img src='/today" + src + "'><div><h3>" + pet_name + "</h3><p>" + age + "??? / <span>" + gender + "</span></p></div></div></div></a>" 

                        $('#petCards').append(temp_html)
                    }
                }, 
                error: function() {
                    console.log("?????? ??????!");
                } 
            });
    		 
    		
    	}
    	
           
        // ????????? ?????? ?????? 
        // ???????????? ??????
        $("#petRgform_open").click(function(){
            $("#petRg_modal").css("display","block");
        })
      
        
        
        
        
        // ????????? ??? ?????? ?????????    
        $("#petRg-btn").click(function(){
            //formData ?????? ??????
            let formData = new FormData();
        	formData.append("petImg", $("input[name=file]")[0].files[0]);
        	// ????????? ???????????? ?????????
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
        	
        	// formData??? json???????????? petData ??????
        	formData.append("petData", new Blob([ JSON.stringify(petData) ], {type : "application/json"}));
        	
        	// ajax ??????
        	$.ajax({
        		  type: "POST",
        	      url: "/today/user/registerPet",
        	      data: formData,
        	      dataType: "text",
        	      contentType: false,               // * ?????? *
        	      processData: false,               // * ?????? *
        	      enctype : 'multipart/form-data',  // * ?????? *
        	      success: function(result) { 
                      console.log("?????? ??????!: ");
                      if(result === "success") {
                          alert("???????????? ????????? ?????????????????????.");
                          //location.href="/today/mypet/lifetime"; session petId?????? ??????
                      } else {
                          alert("???????????? ????????? ??????????????????.");
                      }
                  }, 
                  error: function() {
                      console.log("?????? ??????!");
                  } 
        	});
        })    

        
        
        
        
        
        // ???????????? ?????? ?????????(?????? ??? ???????????????)
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
                    console.log("?????? ??????!: ");
                    if(result === "success") {
                        location.href="/today/mypet/lifetime";
                    } else {
                        alert("???????????? ????????? ??????????????????.");
                    }
                }, 
                error: function() {
                    console.log("?????? ??????!");
                } 
            });        
            
        })
        
        
        
    	
    	
    	// ?????? ?????? ????????? ????????? ?????? ??????
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
            const getName= RegExp(/^[???-???]+$/);
            const getNick= RegExp(/^[???-???]+$/);
            const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
            let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false, chk6 = false, chk7 = false; 
           
            //???????????? ??????~~
            //ID ????????? ??????.
            $('#user_id').on('keyup', function() {
                if($("#user_id").val() === ""){
                    $('#user_id').css("background-color", "pink");
                    $('#idChk').html('<b style="font-size:14px;color:red;">[???????????? ???????????????.]</b>');
                    chk1 = false;
                }
               
                //????????? ???????????????
                else if(!getIdCheck.test($("#user_id").val())){
                    $('#user_id').css("background-color", "pink");
                    $('#idChk').html('<b style="font-size:14px;color:red;">[?????????, ?????? 6-14???]</b>');      
                    chk1 = false;
                }
                //ID ???????????? ????????? ??????
                else {
                    //ID ???????????? ????????? ??????
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
                                $("#idChk").html("<b style='font-size:14px; color:blue;'>[?????? ????????? ??????????????????.]</b>");
                                chk1 = true;
                            } else {
                                $("#user_id").css("background-color", "pink");
                                $("#idChk").html("<b style='font-size:14px; color:red;'>[????????? ??????????????????.]</b>");                        
                                chk1 = false;
                            }
                        },
                        error: function() {
                            console.log("id ???????????? ?????? ??????!");
                        }
                    });
                }
            });
           
            //???????????? ????????? ??????.
            $('#password').on('keyup', function() {
                //???????????? ?????? ??????
                if($("#password").val() === ""){
                    $('#password').css("background-color", "pink");
                    $('#pwChk').html('<b style="font-size:14px;color:red;">[??????????????? ???????????????.]</b>');
                    chk2 = false;
                }                
                //???????????? ???????????????
                else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
                    $('#password').css("background-color", "pink");
                    $('#pwChk').html('<b style="font-size:14px;color:red;">[???????????? ?????? 8?????????]</b>');
                    chk2 = false;
                } else {
                    $('#password').css("background-color", "#e8f0fe");
                    $('#pwChk').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk2 = true;
                }
               
            });
           
            //???????????? ????????? ????????? ??????.
            $('#password_check').on('keyup', function() {
                //???????????? ????????? ?????? ??????
                if($("#password_check").val() === ""){
                    $('#password_check').css("background-color", "pink");
                    $('#pwChk2').html('<b style="font-size:14px;color:red;">[??????????????? ???????????????.]</b>');
                    chk3 = false;
                }                
                //???????????? ????????? ???????????????
                else if($("#password").val() != $("#password_check").val()){
                    $('#password_check').css("background-color", "pink");
                    $('#pwChk2').html('<b style="font-size:14px;color:red;">[??????????????? ???????????? ????????????.]</b>');
                    chk3 = false;
                } else {
                    $('#password_check').css("background-color", "#e8f0fe");
                    $('#pwChk2').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk3 = true;
                }
               
            });
           
            //?????? ????????? ??????.
            $('#user_name').on('keyup', function() {
                //????????? ?????? ??????
                if($("#user_name").val() === ""){
                    $('#user_name').css("background-color", "pink");
                    $('#nameChk').html('<b style="font-size:14px;color:red;">[????????? ???????????????.]</b>');
                    chk4 = false;
                }                
                //????????? ???????????????
                else if(!getName.test($("#user_name").val())){
                    $('#user_name').css("background-color", "pink");
                    $('#nameChk').html('<b style="font-size:14px;color:red;">[????????? ?????? 6???]</b>');
                    chk4 = false;
                } else {
                    $('#user_name').css("background-color", "#e8f0fe");
                    $('#nameChk').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk4 = true;
                }
               
            });
            
            //????????? ????????? ??????. 
            $('#user_nick').on('keyup', function() {
                //????????? ?????? ??????
                if($("#user_nick").val() === ""){
                    $('#user_nick').css("background-color", "pink");
                    $('#nickNameChk').html('<b style="font-size:14px;color:red;">[???????????? ???????????????.]</b>');
                    chk5 = false;
                }                
                //????????? ???????????????
                else if(!getNick.test($("#user_nick").val())){
                    $('#user_nick').css("background-color", "pink");
                    $('#nickNameChk').html('<b style="font-size:14px;color:red;">[????????? ?????? 10???]</b>');
                    chk5 = false;
                } else {
                    $('#user_nick').css("background-color", "#e8f0fe");
                    $('#nickNameChk').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk5 = true;
                }
               
            });
            
            //????????? ????????? ??????. 
            $('#user_email').on('keyup', function() {
                //????????? ?????? ??????
                if($("#user_email").val() === ""){
                    $('#user_email').css("background-color", "pink");
                    $('#emailChk').html('<b style="font-size:14px;color:red;">[???????????? ???????????????.]</b>');
                    chk6 = false;
                }                
                //????????? ???????????????
                else if(!getMail.test($("#user_email").val())){
                    $('#user_email').css("background-color", "pink");  
                    $('#emailChk').html('<b style="font-size:14px;color:red;">[????????? ???????????? ??????????????????.]</b>');
                    chk6 = false;
                } else {
                    $('#user_email').css("background-color", "#e8f0fe");
                    $('#emailChk').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk6 = true;
                }
               
            });
            
            
            //????????? ???????????? ??????
            $(".email_auth_btn").click(function(){	
            	 let emailAuthNum = "";
				 let email = $('#user_email').val();
				 
				 if(!chk6){
				 	alert("????????? ???????????? ??????????????????.");
				 	return false;
				 }else{
					 $.ajax({
							type : "POST",
							url : "/today/user/emailAuth",
							data : {email : email},
							success: function(data){
								$('#emailChk').html('<b style="font-size:14px;color:blue;">??????????????? ?????????????????????.</b>');
								emailAuthNum = data;
								//console.log(email_auth_cd);
							},
							error: function(data){
								alert("?????? ????????? ??????????????????.");
							}
						});
				 }
				 
				 
				 // ???????????? ?????? ??????
				 $(".authChkBtn").click(function(){
					 if($("#authNum").val() === emailAuthNum){
						 $('#authChk').html('<b style="font-size:14px;color:blue;">?????????????????????.</b>');
						 chk7 = true;
					 }else{
						 $('#authChk').html('<b style="font-size:14px;color:red;">??????????????? ???????????? ????????????.</b>');
						 chk7 = false;
					 }
				 })
				  
			});
            
            
            
            
           
           



           // ???????????? ?????????
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
                   
                    //????????????????????? ????????? ???????????? ajax??????(????????? ??????)
                    $.ajax({
                        type: "POST", //????????? ???????????? HTTP?????? ??????
                        url: "/today/user/", //?????? ?????? URI
                        headers: {
                            "Content-Type": "application/json"
                        }, //?????? ?????? ??????
                        dataType: "text", //???????????? ???????????? ??????
                        data: JSON.stringify(user), //????????? ????????? ?????????
                        success: function(result) { //????????? ??????????????? ?????????????????? ???????????? ????????? ???.
                            console.log("?????? ??????!: " + result);
                            if(result === "joinSuccess") {
                                alert("??????????????? ?????????????????????.");
                                location.href="/today";
                            } else {
                                alert("??????????????? ??????????????????.");
                            }
                        }, //?????? ????????? ????????? ???????????? ?????? ????????? ??????.
                        error: function() {
                            console.log("?????? ??????!");
                        } //?????? ?????? ??? ????????? ???????????? ?????? ????????? ??????.
                    });
               
                } else {
                    alert('??????????????? ?????? ???????????????.');          
                }
            });
           
            ///////////////////////////////////////////////////////////////////////////////////////////
           

            //????????? ??????~~
            //ID ????????? ??????.
            $('#signInId').on('keyup', function() {
                if($("#signInId").val() == ""){
                    //$('#signInId').css("background-color", "pink");
                    $('#idCheck').html('<b style="font-size:14px;color:red;">[???????????? ???????????????.]</b>');
                    chk1 = false;
                }      
               
                //????????? ???????????????
                else if(!getIdCheck.test($("#signInId").val())){
                    //$('#signInId').css("background-color", "pink");
                    $('#idCheck').html('<b style="font-size:14px;color:red;">[?????????,?????? 4-14???~]</b>');  
                    chk1 = false;
                } else {
                    $('#signInId').css("background-color", "#e8f0fe");
                    //$('#idCheck').html('<b style="font-size:14px;color:green;">[??? ????????????]</b>');
                    $('#idCheck').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk1 = true;
                }
            });
           
            //???????????? ????????? ??????.
            $('#signInPw').on('keyup', function() {
                //???????????? ?????? ??????
                if($("#signInPw").val() === ""){
                    //$('#signInPw').css("background-color", "pink");
                    $('#pwCheck').html('<b style="font-size:14px;color:red;">[??????????????? ???????????????.]</b>');
                    chk2 = false;
                }                
                //???????????? ???????????????
                else if(!getPwCheck.test($("#signInPw").val()) || $("#signInPw").val().length < 8){
                    //$('#signInPw').css("background-color", "pink");
                    $('#pwCheck').html('<b style="font-size:14px;color:red;">[???????????? ?????? 8?????????]</b>');
                    chk2 = false;
                } else {
                    $('#signInPw').css("background-color", "#e8f0fe");
                    //$('#pwCheck').html('<b style="font-size:14px;color:green;">[??? ????????????]</b>');
                    $('#pwCheck').html('<img src="/today/img/common/check.png" width="15px" height="15px">');
                    chk2 = true;
                }
               
            }); 
           
            //????????? ?????? ???????????????
            $("#signIn-btn").click(function() {
                if(chk1 && chk2) {
                    //ajax???????????? ???????????? ??? ????????????
                    const id = $('#signInId').val();
                    const pw = $('#signInPw').val();
                    // is()????????? ?????? ??? ??????????????? ???????????? ???????????? ??????
                    const autoLogin = $("input[name=autoLogin]").is(":checked");  // name????????? autoLogin??? input ??????

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
                                $('#idCheck').html('<b style="font-size:14px;color:red;">[???????????? ?????? ID?????????.]</b>');
                                $('#signInPw').val("");
                                $('#signInId').focus();
                                chk2 = false;
                            } else if(data === "pwFail") {
                                $('#signInPw').css("background-color", "pink");
                                $('#signInPw').val("");
                                $('#signInPw').focus();
                                $('#pwCheck').html('<b style="font-size:14px;color:red;">[??????????????? ???????????? ????????????.]</b>');
                                chk2 = false;
                            } else if(data === "loginSuccess") {
                                self.location="/today";
                            }
                        }
                    });
                   
                } else {
                    alert("??????????????? ?????? ???????????????!");
                }
            });
           
        });//end JQuery


    </script>

</body>
</html>