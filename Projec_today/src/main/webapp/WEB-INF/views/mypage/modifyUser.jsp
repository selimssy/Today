<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.siteInfo{width: 1050px; height: 375px; background-image: url(/img/mypage/mypage.png); background-size: contain; margin: 0 auto;  position: relative;}      
.contents{width: 800px; /*height: 800px;*/ margin: 140px auto;}
#tabMenu{width: 100%; /*height: 100%;*/ margin: 0 auto; min-height:300px}
#tabMenu input[type="radio"]{display: none;}
#tabMenu label{width: 49%; display: inline-block; margin: 0; color: #aaa; padding: 15px 25px; text-align: center; border: none; box-sizing: border-box;}
#tabMenu label:hover{color: #222; cursor: pointer;}
#tabMenu input:checked + label{color: #000; border: none; background: #eee; /*background:rgba(122, 183, 48, 0.5)*/}
.tabContent{display: none; padding: 20px 0 0; border-top: 2px solid #000;}
.tabContent h2{display: none;}
#tab1:checked ~ #userInfo,
#tab2:checked ~ #mdpassword{display: block;}

.profile_tb{margin: 50px auto; border-collapse: collapse; width: 100%;}
#userInfo .profile_tb{margin: 0 auto;}
.profile_tb tr{height:80px; border-bottom: 1.5px solid #eee;}
.profile_tb td:nth-of-type(1){width:25%; background: #f5f5f5; text-align: center;}
.profile_tb tr:last-of-type{border-bottom: none;}   
.profile_tb tr:last-of-type td{background: #fff;}
.prof_input{border: none; box-sizing: border-box; width: 100%; height: 40px; padding-left:20px;}
.prof_input.none:focus{outline: none;}
.prof_button{margin-top: 35px; width: 75%; height: 50px; font-size:16px; padding: 0 20px; border: none; border-radius: 5px; cursor:pointer}

.profile_img td{height:200px; position:relative;}
.profile_img img{width:150px; height:150px; border-radius: 50%; object-fit:cover;}
.upload_prf {font-size: 18px; border: 1px solid #ddd; background: #f0f0f0; font-size:12px; position: absolute; top: 20px; right: 20px; cursor: pointer;}
.profile_img input[type=file] {display:none}

 /*반응형*/
@media all and (max-width:1065px) {			
	.siteInfo{width:100%; height:auto; position: relative;}
	.siteInfo:before {content: ""; display: block; padding-top: 35.7143%; /* 일정 비율 유지*/}
	.ratio_content {position: absolute; top: 0; right: 0; bottom: 0; left: 0;}			
}

@media all and (max-width:1000px) {
	.contents{width:80%; margin:23.333vw auto 0;} 	
}

@media all and (max-width:800px) {
	.container{padding-bottom:14vw;}
	.tabContent{padding:2.5vw 0 0;}
	.profile_tb{margin:6.25vw auto;}
	.profile_tb td:nth-of-type(1){width:35%;} 
	/*.prof_input{height:5vw;}*/
	.profile_tb tr{height:10vw;}
	.prof_button{margin-top:4.375vw; padding:0;}
}

@media all and (max-width:600px) {
	#tabMenu label{width:48.5%; padding:2.5vw 0; font-size:2.667vw;}
	.prof_input{font-size:2.667vw;}
	.profile_tb td:nth-of-type(1){font-size:2.667vw;}
	.prof_button{height:8.33vw; font-size:2.667vw;}
}
</style>
</head>
<body>

<div class="container">   
	<jsp:include page="../common/header.jsp" />
	<main>
	    <div class="siteInfo">
	    	<div class="ratio_content"></div>
	        <div class="infoText">
	            <p>마이페이지</p>
	            <p>개인정보 / 반려견 정보 수정</p>
	        </div>
	    </div>
	    <div class="siteNav">   
	        <table>
		        <tr>
		            <td><a href="<c:url value='/'/>"><div class="homeLogo">home</div></a></td>
		            <td><a href="<c:url value='/mypage/profile'/>">프로필</a></td>
		            <td class="checked"><a href="<c:url value='/mypage/modifyUser'/>">개인정보 수정</a></td>
		        </tr>
		    </table>
	    </div>		        
	    <div class="contents">
            <div id="tabMenu">
                <input type="radio" id="tab1" name="tabs" checked>
                <label for="tab1">개인정보 수정</label>
                <input type="radio" id="tab2" name="tabs">
                <label for="tab2">비밀번호 변경</label>
                
                <!-- 개인정보 수정 -->
                <div id="userInfo" class="tabContent">
	                <table class="profile_tb">     
	                	<tr class="profile_img">		                       
	                        <td colspan="2" style="background:#fff;">
	                        	<img src="${user.imagePath}" alt="profileImg" id="profileImg">
	                        	<label for="profImg" class="upload_prf" style="width:auto; padding:5px 10px; color:#000;">
				                    <input id="profImg" type="file" accept="image/*">
				                    <span>사진 변경</span>
				                </label>
	                        </td>
	                    </tr>
	                         	
	                    <tr>
	                        <td>
	                            <p>
	                                <strong>아이디</strong>
	                            </p>
	                        </td>
	                        <td><input type="text" class="prof_input none" readonly="readonly" value="${user.userId}"></td>
	                    </tr>	
	                               	                    		                    
	                    <tr>
	                        <td>
	                            <p>
	                                <strong>이름</strong>
	                            </p>
	                        </td>
	                        <td><input type="text" class="prof_input" id="Muser_name" maxlength="6" value="${user.name}"></td>
	                    </tr>

	                    <tr>
	                        <td>
	                            <p>
	                                <strong>닉네임</strong>
	                            </p>
	                        </td>
	                        <td><input type="text" class="prof_input" id="Muser_nick" maxlength="8" value="${user.nickname}"></td>
	                    </tr>

	                    <tr>
	                        <td>
	                            <p>
	                                <strong>이메일</strong>
	                            </p>
	                        </td>
	                        <td><input type="email" class="prof_input none" readonly="readonly" value="${user.email}"></td>
	                    </tr>	
	                    
	                    <tr>
	                		<td colspan="2">
	                			<button type="button" id="modifyUser-btn" class="prof_button"><b>저장</b></button>	                			
	                		</td>
	                	</tr>	                    		                   
	                </table>		  
				    
                </div>
                
                
                <!-- 비밀번호 변경 -->
                <div id="mdpassword" class="tabContent">
	                <table class="profile_tb">              	
	                    <tr>
	                        <td>
	                            <p>
	                                <strong>현재 비밀번호</strong>
	                                <span id="originpwChk"></span>
	                            </p>
	                        </td>
	                        <td><input type="password" class="prof_input" id="originPw"></td>
	                    </tr>	
	                               	                    		                    
	                    <tr>
	                        <td>
	                            <p>
	                                <strong>새 비밀번호</strong>
	                                <span id="pwChk"></span>
	                            </p>
	                        </td>
	                        <td><input type="password" class="prof_input" id="newPw" placeholder="특수문자 포함 8자이상"></td>
	                    </tr>

	                    <tr>
	                        <td>
	                            <p>
	                                <strong>새 비밀번호 확인</strong>
	                                <span id="pwChk2"></span>
	                            </p>
	                        </td>
	                        <td><input type="password" class="prof_input" id="newPwChk" placeholder="특수문자 포함 8자이상"></td>
	                    </tr>

	                    
	                    
	                    <tr>
	                		<td colspan="2">
	                			<button type="button" id="modifyPw-btn" class="prof_button"><b>확인</b></button>	                			
	                		</td>
	                	</tr>	                    		                   
	                </table>	                							
							            
                </div>
                
            </div>
        </div>
	    
	</main>
</div>    


			


<jsp:include page="../common/footer.jsp" />
</body>

<script type="text/javascript">

	$(function(){
		 $(".mainMenu.mainMenu4").addClass("checked");
	})
	
	
		/*
	    // 개인정보 수정
	    $("#modifyUser-btn").click(function(){		
        	let userId = "${login.userId}";	 
			if(userId === ""){  // 로그아웃(세션 종료) 체크
				alert("로그인 후 사용 가능합니다.");
				window.location.reload();
				return false;
			}
        	let name = $("#Muser_name").val();
        	let nickname = $("#Muser_nick").val();
    		let user = {
    				userId: userId,
    				name: name,
    				nickname: nickname
    				};
    		
    		$.ajax({
                type: 'post',
                dataType : "text",
                contentType: 'application/json',
                url: '/user/modifyUser',
                data: JSON.stringify(user),
                success: function (response) {
         			if(response === 'success'){
         				alert("개인정보 수정이 완료되었습니다.");
         				window.location.reload();
         			}else{
         				alert("개인정보 수정에 실패했습니다.");
         			}
                }, 
                error: function() {
                    console.log("통신 실패"); 
                } 
            });
			
        })*/
	
		
        
        // 개인정보 수정
        $("#modifyUser-btn").click(function(){
        	
        	let userId = "${login.userId}";	 
			if(userId === ""){  // 로그아웃(세션 종료) 체크
				alert("로그인 후 사용 가능합니다.");
				window.location.reload();
				return false;
			}
        	
        	const checkName= RegExp(/^[가-힣]+$/);
            const checkNick= RegExp(/^[가-힣]+$/);
        	
	    	//이름
            if(!$("#Muser_name").val() || $("#Muser_name").val().replace(/\s| /gi, "").length == 0){
                alert("이름을 입력하세요.");
                return false;
            }else if(!checkName.test($("#Muser_name").val())){
            	alert("한글 1-6자로 입력해주세요.");
            	return false;
			}
	    	
            //닉네임
            if(!$("#Muser_nick").val() || $("#Muser_nick").val().replace(/\s| /gi, "").length == 0){
                alert("닉네임을 입력하세요.");
                return false;
            }else if(!checkNick.test($("#Muser_nick").val())){
            	alert("한글 1-8자로 입력해주세요.");
            	return false;
			}
	    	
        	
            //formData 객체 생성
            let formData = new FormData(); 	
         	
            // 이미지 리사이징	
       	    if($("input[id='profImg']").val()){ // 사진 첨부한 경우에만 리사이징 진행				
       		  let img = new Image;
      	      img.src = MdPreviews.src; 
      	
      	      var canvas = document.createElement("canvas");
 	    	  canvas.getContext("2d").drawImage(img, 0, 0);
 	    	      	  
 	    	  // 최대 크기 지정과 리사이징
 	    	  let maxWidth = 300; //가로 최대 300px
 	    	  let maxHeight = 400; //세로 최대 400px
 	    	  let width = img.width; 
 	    	  let height = img.height; 
 	    	  if (width > height) { 
 	    	     if (width > maxWidth) {
 	    	         height *= maxWidth / width;
 	    	         width = maxWidth;
 	    	     }
 	    	  } else {
 	    	     if (height > maxHeight) {
 	    	         width *= maxHeight / height;
 	    	         height = maxHeight;
 	    	     }
 	    	  }
 	    	  canvas.width = width;
 	    	  canvas.height = height;
 	    	  canvas.getContext('2d').drawImage(img, 0, 0, width, height);

 	    	  //canvas의 dataurl를 blob(file)화 하는 과정
 	    	  var dataURI = canvas.toDataURL("image/png"); //png => jpg 등으로 변환 가능
 	    	  var byteString = atob(dataURI.split(',')[1]);
 	    	  var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
 	    	  var ab = new ArrayBuffer(byteString.length);
 	    	  var ia = new Uint8Array(ab);
 	    	  for (var i = 0; i < byteString.length; i++) {
 	    	      ia[i] = byteString.charCodeAt(i);
 	    	  }
 	    	    //리사이징된 file 객체
 	    	    var tmpThumbFile = new Blob([ab], {type: mimeString});
 	               
      	        formData.append("userImg", tmpThumbFile);  // formData에 저장
       	    }
            
        	// 넘겨줄 사용자 데이터
        	let name = $("#Muser_name").val();
        	let nickname = $("#Muser_nick").val();
    		let user = {
    				"userId": userId,
    				"name": name,
    				"nickname": nickname
    				};
        	
        	// formData에 json타입으로 petData 추가
        	formData.append("userData", new Blob([ JSON.stringify(user) ], {type : "application/json"}));
        	
        	// ajax 처리
        	$.ajax({
        		  type: "POST",
        	      url: "/user/modifyUser",
        	      data: formData,
        	      dataType: "text",
        	      contentType: false,               
        	      processData: false,              
        	      enctype : 'multipart/form-data',  
        	      success: function(result) { 
                      if(result === "success") {
                          alert("회원정보 수정이 완료되었습니다.");
                          location.href="/mypage/profile";
                          //location.reload();
                      } else {
                          alert("회원정보 수정에 실패했습니다.");
                      }
                  }, 
                  error: function() {
                      console.log("통신 실패");
                  } 
        	});
        })
        
        
        
        
        // 비밀번호 변경
        $("#modifyPw-btn").click(function(){
        	   	
        	let originPw = $("#originPw").val();
        	let userId = "${login.userId}";	
        	if(userId === ""){  // 로그아웃(세션 종료) 체크
				alert("로그인 후 사용 가능합니다.");
				window.location.reload();
				return false;
			}
        	let user = {
        			userId: userId,
        			password: originPw
        			};
        	
        	$.ajax({
                type: 'post',
                dataType : "text",
                contentType: 'application/json',
                url: '/user/mdPwChk',
                data: JSON.stringify(user),
                success: function (response) {
                	
         			if(response === 'success'){ // 기존 비밀번호 맞다면
         				//$('#originpwChk').empty();
         				$('#originpwChk').html('<img src="/img/common/check.png" width="15px" height="15px">');
         				let getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
         				let chk1 = false, chk2 = false;       			       				
         				let newPw = $("#newPw").val();
                		let newPwChk = $("#newPwChk").val();
                		// 새 비밀번호 검증
                		if(newPw === ""){ // 공백만 입력한 경우
                            //$('#pwChk').html('<br><b style="font-size:12px;color:red;">[비밀번호를 입력하세요.]</b>');
                			alert("비밀번호를 입력하세요.");
                            chk1 = false;                     
                            return false;                          
                        }else if(!getPwCheck.test(newPw) || newPw.length < 8){ // 비밀번호 조건 충족 확인
                            //$('#pwChk').html('<br><b style="font-size:12px;color:red;">[특수문자 포함 8자이상]</b>');
                            alert("특수문자 포함 8자이상 입력하세요.");
                            chk1 = false;                           
                            return false;
                            $("#newPw").focus();
                        }else {
                        	$('#pwChk').html('<img src="/img/common/check.png" width="15px" height="15px">');
                            chk1 = true;
                        }
                		
                		// 비밀번호 확인란 검증
                		if(!newPwChk || newPwChk.replace(/\s| /gi, "").length == 0){ // 공백만 입력한 경우
                            //$('#pwChk2').html('<br><b style="font-size:12px;color:red;">[비밀번호를 입력하세요.]</b>');
                			alert("비밀번호 확인란 입력값을 확인하세요.");
                            chk2 = false;
                            return false;
                            $("#newPwChk").focus();
                        }else if(newPw != newPwChk){  // 비밀번호 확인란 일치하지 않는 경우
                        	//$('#pwChk2').html('<br><b style="font-size:12px;color:red;">[새 비밀번호가 일치하지 않습니다.]</b>');
                        	alert("새 비밀번호가 일치하지 않습니다.");
                        	chk2 = false;
                			return false;
                			$("#newPwChk").focus();
                        }else{
                        	$('#newPwChk').empty();
                        	chk2 = true;
                        }
                		
                		
                		if(chk1 && chk2){              			
                			// 비밀번호 변경 요청
                			let userVO = {
                        			userId: userId,
                        			password: newPw
                        			};
                			$.ajax({
                                type: 'post',
                                dataType : "text",
                                contentType: 'application/json',
                                url: '/user/modifyPw',
                                data: JSON.stringify(userVO),
                                success: function (response) {
                         			if(response === 'success'){
                         				alert("비밀번호가 변경되었습니다.");
                         				window.location.reload();
                         			}else{
                         				alert("비밀번호가 변경에 실패했습니다.");
                         			}
                                }, 
                                error: function() {
                                    console.log("통신 실패"); 
                                } 
                            });
                			
                		}else{
                			alert("입력값을 확인해주세요.");
                		}
                		
                		// 비밀번호 요청 end
         			}else{
         				$('#originpwChk').html('<br><b style="font-size:10px;color:red;">[기존 비밀번호가 일치하지 않습니다.]</b>');
         				return false;
         				$("#originPw").focus();
         			}
                }, 
                error: function() {
                    console.log("통신 실패"); 
                } 
            });
        	 	
        	
        })
        
        
        
        
        
        // 파일업로드(프로필사진 변경)
		const fileDOM = document.querySelector('#profImg');
		const MdPreviews = document.querySelector('#profileImg');
		
		fileDOM.addEventListener('change', () => {
			// 이미지 확장자 체크
			let ext = $("#profImg").val().split(".").pop().toLowerCase();		    
			if($.inArray(ext, ["jpg", "jpeg", "png", "gif", "bmp", "pdf", "webp"]) == -1) {
				alert("이미지 파일(jpg, jpeg, png, gif, bmp, pdf, webp)만 업로드 가능합니다.");
				fileDOM.value = ""; // 이미지 업로드 초기화
				MdPreviews.src = "<c:url value='/img/community/boarduser.png'/>";
				return false;
			}	    	
			// 이미지 용량 체크
				if(fileDOM.files[0].size > 10485760){ // 10MB 초과
		        alert("최대 10MB까지 업로드 가능합니다.");
		        fileDOM.value = ""; // 이미지 업로드 초기화
		        MdPreviews.src = "<c:url value='/img/community/boarduser.png'/>";  // 수정할 때는 그냥 기존 이미지로 하고싶다
		        return false; 
		   }	    	
			
		    const imageSrc = URL.createObjectURL(fileDOM.files[0]);
		    MdPreviews.src = imageSrc;
		});
        
        
        
        
 
</script>

</html>