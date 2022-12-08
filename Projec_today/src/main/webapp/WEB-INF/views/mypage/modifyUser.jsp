<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/mypage/mypage.png); margin: 0 auto;  position: relative;}      
.contents{width: 1050px; /*height: 800px;*/ margin: 100px auto;}
#tabMenu{width: 1000px; /*height: 100%;*/ margin: 0 auto; min-height:300px}
#tabMenu input[type="radio"]{display: none;}
#tabMenu label{width: 44.5%; display: inline-block; margin: 0; color: #aaa; padding: 15px 25px; text-align: center; border: none;}
#tabMenu label:hover{color: #222; cursor: pointer;}
#tabMenu input:checked + label{color: #b00; border: 1px solid #ddd; background: #eee; /*background:rgba(122, 183, 48, 0.5)*/}
.tabContent{display: none; padding: 20px 0 0; border-top: 1px solid #ddd;}
.tabContent h2{display: none;}
#tab1:checked ~ #userInfo,
#tab2:checked ~ #mdpassword{display: block;}
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
	            <li class="checked"><a href="<c:url value='/mypage/modifyUser'/>">개인정보 수정</a></li>
	            <li><a href="<c:url value='/mypage/modifyPet'/>">반려견 정보 수정</a></li>
	        </ul>
	    </div>
	    
	    
	    <div class="contents">
            <div id="tabMenu">
                <input type="radio" id="tab1" name="tabs" checked>
                <label for="tab1">개인정보 수정</label>
                <input type="radio" id="tab2" name="tabs">
                <label for="tab2">비밀번호 변경</label>
                
                <div id="userInfo" class="tabContent">
  
				    
                </div>
                
                <div id="mdpassword" class="tabContent">
                							
							            
                </div>
                
            </div>
        </div>
	    
	</main>
</div>    


				<div class="email_auth">
					<input type="text" placeholder="이메일" name="email" id="email" class="email">
					<button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
				</div>
				<input type="text" placeholder="인증번호 입력" id="email_auth_key">
			


<jsp:include page="../common/footer.jsp" />
</body>

<script type="text/javascript">
$(".email_auth_btn").click(function(){	     	 
	 let email = $('#email').val();
	 
	 if(email == ''){
	 	alert("이메일을 입력해주세요.");
	 	return false;
	 }
	 
	 $.ajax({
		type : "POST",
		url : "/today/user/emailAuth",
		data : {email : email},
		success: function(data){
			alert("인증번호가 발송되었습니다.");
			email_auth_cd = data;
			console.log(email_auth_cd);
		},
		error: function(data){
			alert("메일 발송에 실패했습니다.");
		}
	}); 
});
</script>

</html>