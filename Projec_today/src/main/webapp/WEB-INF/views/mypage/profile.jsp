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
.content{width: 100%;}
.myProfile{width: 100%; margin: 0 auto;}
.profileBox{width: 800px; /*height:600px;*/ margin: 90px auto 200px;  background: #fff;}   
.modal_logo{font-size: 1.25em; font-family: 'Nanum Pen Script', cursive; padding-left: 15px;}
.profile_tb, .pet_tb{border-collapse: collapse; width: 100%;}
.profile_tb th, .pet_tb th{border-bottom:2px solid #000; text-align: left; padding:20px 30px;}
.profile_tb tr{height:80px; border-bottom: 1.5px solid #eee;}
.profile_tb td:nth-of-type(1){width:25%; background: #f5f5f5; text-align: center;}
.profile_tb tr:last-of-type{border-bottom: none;}   
.profile_tb tr:last-of-type td{background: #fff;}
.prof_input{border: none; box-sizing: border-box; width: 100%; height: 40px; padding-left:20px;}
.prof_input:focus{outline: none;}
.prof_input.password{background:#f5f5f5;}
.prof_button{margin-top: 35px; width: 35%; height: 45px; font-size:16px; padding: 0 20px; border: none; border-radius: 5px; cursor:pointer}
.prof_button:nth-of-type(1){margin-right: 25px;}
.petListBox{width: 800px; margin: 0px auto;}
.profile_img td{height:200px; position:relative;}
.profile_img img{width:150px; height:150px; border-radius: 50%; object-fit:cover;}
.profile_img button{width: 30px; height: 30px; position: absolute; top: 20px; right: 20px; background-color: transparent; border: none; background-image: url(/img/community/modify.png); background-size: contain; background-repeat: no-repeat; text-indent: -9999px; cursor: pointer;}
 
 /*반응형*/
@media all and (max-width:1065px) {			
	.siteInfo{width:100%; height:auto; position: relative;}
	.siteInfo:before {content: ""; display: block; padding-top: 35.7143%; /* 일정 비율 유지*/}
	.ratio_content {position: absolute; top: 0; right: 0; bottom: 0; left: 0;}		
	
}

@media all and (max-width:1000px) {
	.petListBox, .profileBox{width:80%;} 
	
}

@media all and (max-width:800px) {
	.profileBox{height:75vw; margin:11.25vw auto;}
	.profile_tb th, .pet_tb th{padding:2.5vw 3.75vw;}
	.profile_tb td:nth-of-type(1){width:35%;}
	/*.prof_input{height:5vw;}*/
	.profile_tb tr{height:10vw;}
	.prof_button{margin-top:4.375vw; padding:0;}
}

@media all and (max-width:500px) {
	.container{padding-bottom:14vw;}
	.profileBox{height:100vw;}
	.profile_tb td:nth-of-type(1){width:35%; font-size:3.2vw;}
	.prof_button:nth-of-type(1){margin-right:0; margin-top:7vw;}
	.prof_button{width:75%; height: 8.5vw; font-size:3vw;}
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
		            <td class="checked"><a href="<c:url value='/mypage/profile'/>">프로필</a></td>
		            <td><a href="<c:url value='/mypage/modifyUser'/>">개인정보 수정</a></td>
		        </tr>
		    </table>
	    </div>	    
	    <div class="content">
		    <div class="myProfile">
	    	    <div class="profileBox">			        			        
		                <table class="profile_tb">
		                	<tr>
		                		<th colspan="2">
		                			<h1>
						                <span class="modal_logo">오늘의 너</span> My 프로필
						            </h1>
		                		</th>
		                	</tr>
		                	
		                	<tr class="profile_img">		                       
		                        <td colspan="2" style="background:#fff;">
		                        	<img src="${user.imagePath}" alt="profileImg">
		                        	<button type="button" onClick="location.href='/mypage/modifyUser'">변경</button>
		                        </td>
		                    </tr>
		                	
		                    <tr>
		                        <td>
		                            <p>
		                                <strong>아이디</strong>
		                            </p>
		                        </td>
		                        <td><input type="text" class="prof_input" readonly="readonly" value="${user.userId}"></td>
		                    </tr>	
		                                   	                    		                    
		                    <tr>
		                        <td>
		                            <p>
		                                <strong>이름</strong>
		                            </p>
		                        </td>
		                        <td><input type="text" class="prof_input" readonly="readonly" value="${user.name}"></td>
		                    </tr>

		                    <tr>
		                        <td>
		                            <p>
		                                <strong>닉네임</strong>
		                            </p>
		                        </td>
		                        <td><input type="text" class="prof_input" readonly="readonly" value="${user.nickname}"></td>
		                    </tr>

		                    <tr>
		                        <td>
		                            <p>
		                                <strong>이메일</strong>
		                            </p>
		                        </td>
		                        <td><input type="email" class="prof_input" readonly="readonly" value="${user.email}"></td>
		                    </tr>	
		                    
		                    <tr>
		                		<td colspan="2">
		                			<button type="button" id="modifyUser" class="prof_button"><b>개인정보 수정</b></button>
		                			<button type="button" id="deleteUser" class="prof_button"><b>회원 탈퇴</b></button>
		                		</td>
		                	</tr>	                    		                   
		                </table>			
			    </div>


	    	    <div class="petListBox">			        			        
		                <table class="pet_tb">
		                	<tr>
		                		<th colspan="2">
		                			<h1>
						                <span class="modal_logo">오늘의 너</span> My 반려견
						            </h1>
		                		</th>
		                	</tr>		         		                    	                    		                   
		                </table>	
		                
		                <div id="petList">       
				            <div class="bdiv">
				                <button id="petRgform_open">+ 반려동물 추가</button>
				            </div>      
				            <div id="petCards">
				
				             
				            </div>
				       </div>
				       	
			    </div>			    
		    </div>
	    </div>
	    
	</main>
</div>    


				
			

<jsp:include page="../common/mypage_pet_modal.jsp" /> 
<jsp:include page="../common/footer.jsp" />
</body>

<script type="text/javascript">

	$(function(){
		
		$(".mainMenu.mainMenu4").addClass("checked");
		 
		 	 
    	// 반려견 리스트  	
        //$('#petCards').empty();	        
        const id = "${login.userId}";
		console.log(id);
		const user = {userId: id};
		$.ajax({
            type: 'post',
            dataType : "json",
            contentType: 'application/json',
            url: '/user/petList',
            data: JSON.stringify(user),
            success: function (response) {
            	console.log(response);
                for(let i = 0; i < response.length; i++){
                	let pet_id = response[i]['petId']
                    let src = response[i]['imagePath']
                    let pet_name = response[i]['petName']
                    let age = response[i]['age']
                    let gender = response[i]['gender']
					
                	let temp_html = "<div class='petBox'><div class='select'><ul class='list'><li><button class='modifyPetBtn' title='수정' href='" + pet_id + "'>수정</button></li><li><button class='deletePetBtn' title='삭제' href='" + pet_id + "'>삭제</button></li></ul></div><div class='pet'><div class='pet_in'><div class='pet_id'>" + pet_id + "</div><img src='" + src + "'><div><h3>" + pet_name + "</h3><p>" + age + "살 / <span>" + gender + "</span></p></div></div></div></div>";                    

                    $('#petCards').append(temp_html);
                    $('#petRgform_open').attr("href", response.length);
                }
            }, 
            error: function() {
                console.log("통신 실패!");
            } 
        });      	 
	})
	
	
	
	// 회원정보 수정 페이지 이동
	$("#modifyUser").click(function(){
		location.href="/mypage/modifyUser";
	})
	
	// 회원탈퇴 요청
	$("#deleteUser").click(function(){			
		if(confirm("회원 탈퇴시 모든 반려견 정보와 기록이 삭제됩니다. 그래도 탈퇴하시겠습니까?")){
			
			let userId = "${login.userId}";	 
			if(userId === ""){  // 로그아웃(세션 종료) 체크
				alert("로그인 후 사용 가능합니다.");
				window.location.reload();
				return false;
			}
    		let user = {userId: userId};
    		
    		$.ajax({
                type: 'post',
                dataType : "text",
                contentType: 'application/json',
                url: '/user/deleteUser',
                data: JSON.stringify(user),
                success: function (response) {
         			if(response === 'success'){
         				alert("회원탈퇴가 완료되었습니다.");
         				location.href="/";
         			}else{
         				alert("회원탈퇴에 실패했습니다.");
         			}
                }, 
                error: function() {
                    console.log("통신 실패"); 
                } 
            });
		}
	})

</script>

</html>