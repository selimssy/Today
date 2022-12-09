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
.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/mypage/mypage.png); margin: 0 auto;  position: relative;}      
.contents{width: 800px; /*height: 800px;*/ margin: 140px auto;}
#tabMenu{width: 800px; /*height: 100%;*/ margin: 0 auto; min-height:300px}
#tabMenu input[type="radio"]{display: none;}
#tabMenu label{width: 49%; display: inline-block; margin: 0; color: #aaa; padding: 15px 25px; text-align: center; border: none; box-sizing: border-box;}
#tabMenu label:hover{color: #222; cursor: pointer;}
#tabMenu input:checked + label{color: #000; border: 1px solid #ddd; background: #eee; /*background:rgba(122, 183, 48, 0.5)*/}
.tabContent{display: none; padding: 20px 0 0; border-top: 2px solid #000;}
.tabContent h2{display: none;}
#tab1:checked ~ #userInfo,
#tab2:checked ~ #mdpassword{display: block;}

.profile_tb{margin: 50px auto; border-collapse: collapse; width: 100%;}
.profile_tb tr{height:80px; border-bottom: 1.5px solid #eee;}
.profile_tb td:nth-of-type(1){width:25%; background: #f5f5f5; text-align: center;}
.profile_tb tr:last-of-type{border-bottom: none;}   
.profile_tb tr:last-of-type td{background: #fff;}
.prof_input{border: none; box-sizing: border-box; width: 100%; height: 40px; padding-left:20px;}
.prof_input.none:focus{outline: none;}
.prof_button{margin-top: 35px; width: 75%; height: 50px; font-size:16px; padding: 0 20px; border: none; border-radius: 5px; cursor:pointer}

</style>
</head>
<body>

<div class="container">   
	<jsp:include page="../common/header.jsp" />
	<main>
	    <div class="siteInfo">
	        <div class="infoText">
	            <p>마이페이지</p>
	            <p>개인정보 / 반려견 정보 수정</p>
	        </div>
	    </div>
	    <div class="siteNav">
	        <a href="<c:url value='/'/>"><div class="homeLogo">1</div></a>
	        <ul>
	        	<li><a href="<c:url value='/mypage/profile'/>">프로필</a></li>
	            <li class="checked"><a href="<c:url value='/mypage/modifyUser'/>">개인정보 수정</a></li>
	        </ul>
	    </div>
	    
	    
	    <div class="contents">
            <div id="tabMenu">
                <input type="radio" id="tab1" name="tabs" checked>
                <label for="tab1">개인정보 수정</label>
                <input type="radio" id="tab2" name="tabs">
                <label for="tab2">비밀번호 변경</label>
                
                <div id="userInfo" class="tabContent">
	                <table class="profile_tb">              	
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
	                        <td><input type="text" class="prof_input" id="Muser_name" value="${user.name}"></td>
	                    </tr>

	                    <tr>
	                        <td>
	                            <p>
	                                <strong>닉네임</strong>
	                            </p>
	                        </td>
	                        <td><input type="text" class="prof_input" id="Muser_nick" value="${user.nickname}"></td>
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
                
                
                
                <div id="mdpassword" class="tabContent">
	                <table class="profile_tb">              	
	                    <tr>
	                        <td>
	                            <p>
	                                <strong>현재 비밀번호</strong>
	                            </p>
	                        </td>
	                        <td><input type="password" class="prof_input" id="originPw"></td>
	                    </tr>	
	                               	                    		                    
	                    <tr>
	                        <td>
	                            <p>
	                                <strong>새 비밀번호</strong>
	                            </p>
	                        </td>
	                        <td><input type="password" class="prof_input" id="newPw"></td>
	                    </tr>

	                    <tr>
	                        <td>
	                            <p>
	                                <strong>새 비밀번호 확인</strong>
	                            </p>
	                        </td>
	                        <td><input type="password" class="prof_input" id="newPwChk"></td>
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
	
	
	
	    // 개인정보 수정
	    $("#modifyUser-btn").click(function(){		
        	let userId = "${login.userId}";	
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
                url: '/today/user/modifyUser',
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
			
        })
	
		
        
        // 비밀번호 변경
        $("#modifyPw-btn").click(function(){
        	let chk1 = false, chk2 = false
        	
        	let originPw = $("#originPw").val();
        	let userId = "${login.userId}";	
        	let user = {
        			userId: userId,
        			password: originPw
        			};
        	
        	$.ajax({
                type: 'post',
                dataType : "text",
                contentType: 'application/json',
                url: '/today/user/mdPwChk',
                data: JSON.stringify(user),
                success: function (response) {
         			if(response === 'success'){
         				console.log("기존 비밀번호 확인");
         				chk1 = true;
         				
         				let newPw = $("#newPw").val();
                		let newPwChk = $("#newPwChk").val();
                		if(newPw === newPwChk){
                			chk2 = true;
                			// 비밀번호 변경 요청
                			let userVO = {
                        			userId: userId,
                        			password: newPw
                        			};
                			$.ajax({
                                type: 'post',
                                dataType : "text",
                                contentType: 'application/json',
                                url: '/today/user/modifyPw',
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
                			alert("새 비밀번호가 일치하지 않습니다.");
                			$("#newPwChk").val("");
                			$("#newPwChk").focus();
                			return false;
                		}
                		
                		// 비밀번호 요청 end
         			}else{
         				alert("기존 비밀번호가 일치하지 않습니다.");
         				$("#originPw").val("");
            			$("#originPw").focus();
         				return false;
         			}
                }, 
                error: function() {
                    console.log("통신 실패"); 
                } 
            });
        	
        	
        	
        		
        		
        	
        	
        	
        })
        
        
</script>

</html>