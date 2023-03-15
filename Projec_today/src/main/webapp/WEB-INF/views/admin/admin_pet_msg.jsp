<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
#msgSendAdmin, #msgSendPet{display:none; width:310px; height: 470px; border: 3.5px solid #777; border-radius: 15px; position: relative; box-shadow: 0 0 15px 0 #e8e8e8;
			background: #fff; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); box-sizing: border-box;}	
#msgSendPet{/*transform: translate(-50%, -50%);*/ z-index:999;}
.Mmodal_header{border-bottom: 1px solid #dee2e6; padding: 15px 0; display: flex; position: relative;}
.Mmodal-title{font-family: 'Jua', sans-serif; font-size:1.4em; margin:0;}
.Mmodal_logo{font-size: 28px; font-family: 'Nanum Pen Script', cursive; padding-left: 15px;}
.Mmodal_body{padding: 0 20px; display: block; width:100%; box-sizing: border-box;}
.Mmodal_body ul{list-style: none; padding-left: 0; margin:0;}
.Mmlabel{margin-top:15px;}
.Mmlabel p{margin:10px 0;}
.Mmodal_input{border: 1px solid #d9d9de; box-sizing: border-box; width: 100%; height: 40px; padding-left: 10px;}
.Mm_button{margin-top: 20px; width: 45%; height: 35px; border: none; border-radius: 5px; cursor:pointer;  font-family: 'Nanum Pen Script'; font-size: 19px;}
.Mm_button:nth-of-type(1){/*margin-right: 20px;*/ margin-left:5px;}
.Mmodal_textarea{outline: none;resize: none; width: 100%; background: none; border: 1px solid #d9d9de; line-height: 22px; font-family: "NanumSquare","맑은 고딕", sans-serif; box-sizing: border-box; padding: 10px 10px 20px;}
.Mmodal_input, .Mmodal_textarea{margin-top:5px;}
.Mmodal_footer{padding: 0 20px; box-sizing: border-box; border-top: 1px solid #dee2e6;}
.Mmodal_footer button{width:37%; height:35px; margin-top: 15px;}
.MbuttonBox{display:flex; justify-content: space-evenly;}
.McloseMsg{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 20px; right: 20px; background-image: url(/img/common/close.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}

.fromLabel{font-family: 'Nanum Pen Script'; font-size:20px;}
#fromPet, #toUser{width:80%; height:35px; border:none; padding-left:40px; /*font-weight: bold;*/}
#fromPet{margin-top:15px; padding-left:22px;}
</style>


 <!-- 관리자 알림 -->
<div id="msgSendAdmin">
	<div class="Mmodal_header">			
		<p class="Mmodal-title">
            <span class="Mmodal_logo">오늘의 너</span> 관리자 알림
        </p>
        <div class="McloseMsg">close</div>
	</div>
			
	<div class="Mmodal_body">
        <ul>	    
        	<li class="Mmlabel">
                   <p>
                       <strong>받는 사람</strong>
                   </p>
            </li>
            <li>
            	<input type="text" id="toMsg" class="Mmodal_input" spellcheck="false"/>	            	
            </li>	        
                      
            <li class="Mmlabel">
                 <p>
                     <strong>내용</strong>
                 </p>
            </li>
            <li>
                <textarea id="msgContent1" class="Mmodal_textarea" rows="7" spellcheck="false"></textarea>
            </li>
            
            <li>
               	<div class="MbuttonBox">
                    <button type="button" id="msgSend1" class="Mm_button">보내기</button>
                    <button type="button" class="Mm_button Mclose">닫기</button>
                </div>
            </li>
        </ul>
   	</div>
</div>


<!-- 펫편지 -->
<div id="msgSendPet">
	<div class="Mmodal_header">			
		<p class="Mmodal-title">
            <span class="Mmodal_logo">오늘의 너</span> 펫편지
        </p>
        <div class="McloseMsg">close</div>
	</div>
			
	<div class="Mmodal_body">
        <ul>	           	
             <li>
             	<span class="fromLabel">From.</span>
            	<input type="text" id="fromPet" class="Mmodal_input" spellcheck="false"/>	            	
            </li>
            <li>
            	<span class="fromLabel">To.</span>
            	<input type="text" id="toUser" class="Mmodal_input" spellcheck="false"/>	            	
            </li>	        
            <!--           
            <li class="Mmlabel">
                 <p>
                     <strong>내용</strong>
                 </p>
            </li> -->
            <li>
                <textarea id="msgContent2" class="Mmodal_textarea" rows="8" spellcheck="false" style="margin-top:20px;"></textarea>
            </li>
            
            <li>
               	<div class="MbuttonBox">
                    <button type="button" id="msgSend2" class="Mm_button">보내기</button>
                    <button type="button" class="Mm_button Mclose">닫기</button>
                </div>
            </li>
        </ul>
   	</div>
</div>
                
  

<script type="text/javascript">

	//관리지 알림 보내기
	$(document).on("click", "#msgSend1", function () {					
			
		let senderId = "${login.userId}";  
		if(senderId === ""){  // 로그아웃(세션 종료) 체크
			alert("로그인 후 사용 가능합니다.");
			window.location.reload();
			return false;
		}
		/*
		let recvId = $("#toMsg").val();	
		if(!recvId || recvId.replace(/\s| /gi, "").length==0){ //수신인 입력값 체크
			alert("수신인을 입력해주세요.");
		    return false;
		}
		if(userIdChk(recvId) == 0){  //수신인 존재 체크
			alert("존재하지 않는 사용자입니다.");
			return false;
		}*/
		
		let recvId = $("#msgSendAdmin #toMsg").val();
		
		let content = $("#msgContent1").val().replace(/(?:\r\n|\r|\n)/g, '<br>');				
		if(!content || content.replace(/\s| /gi, "").length==0){  // 내용 입력값 체크
			alert("내용을 입력해주세요.");
		    return false;
		}
		let message = {"senderId": senderId, "recvId": recvId, "content": content, "classify": "admin"};
		
		$.ajax({
	        type: 'post',
	        dataType : "text",
	        contentType: 'application/json',
	        url: '/msg/sendMsg',
	        data: JSON.stringify(message),
	        success: function (response) {
	 			if(response === 'success'){
	 				alert("알림 전송이 완료되었습니다.");
	 				window.location.reload();
	 			}else{
	 				alert("알림 전송에 실패했습니다.");
	 			}
	        }, 
	        error: function() {
	            console.log("통신 실패"); 
	        } 
	    });
		
	})
	
	
	/*
	// 수신인 체크 함수
	function userIdChk(recvId){
		let userRst = 0;
           
           $.ajax({
               type: "POST",
               url: "/user/checkId",  
               headers: {
                   "Content-Type": "application/json"
               },
               dataType: "text",
               async: false,
               data: recvId,
               success: function(result) {
                   if(result === "OK") { // 유저 존재X
                   	userRst = 0;
                   } else { // 유저 존재O
                   	userRst = 1;
                   }
               },
               error: function() {
                   console.log("통신 실패");
               }
           });
           return userRst;
	}*/
	
	
	
	
	//펫편지 보내기
	$(document).on("click", "#msgSend2", function () {					
			
		let userId = "${login.userId}";  
		if(userId === ""){  // 로그아웃(세션 종료) 체크
			alert("로그인 후 사용 가능합니다.");
			window.location.reload();
			return false;
		}		
		
		let senderId = $("#msgSendPet #fromPet").attr("data-petId"); // 반려견 번호 
		let recvId = $("#msgSendPet #toUser").val(); // 수신인(견주)
		
		let content = $("#msgContent2").val().replace(/(?:\r\n|\r|\n)/g, '<br>');				
		if(!content || content.replace(/\s| /gi, "").length==0){  // 내용 입력값 체크
			alert("내용을 입력해주세요.");
		    return false;
		}
		let message = {"senderId": senderId, "recvId": recvId, "content": content, "classify": "pet"};
		
		$.ajax({
	        type: 'post',
	        dataType : "text",
	        contentType: 'application/json',
	        url: '/msg/sendMsg',
	        data: JSON.stringify(message),
	        success: function (response) {
	 			if(response === 'success'){
	 				alert("펫편지 발송이 완료되었습니다.");
	 				window.location.reload();
	 			}else{
	 				alert("펫편지 발송에 실패했습니다.");
	 			}
	        }, 
	        error: function() {
	            console.log("통신 실패"); 
	        } 
	    });
		
	})
	
	
	
	
	
	// 모달 닫기
	$("#msgSendAdmin .McloseMsg").add("#msgSendAdmin .Mclose").click(function(){		
		$("#msgSendAdmin").css("display", "none");
	})
	$("#msgSendPet .McloseMsg").add("#msgSendPet .Mclose").click(function(){		
		$("#msgSendPet").css("display", "none");
	})
	
	
	// 모달값 초기화 메서드
	function reset(){
		$("#msgSendAdmin input").add("#msgSendAdmin textarea").add("#msgSendPet input").add("#msgSendPet textarea").val("").attr("value", "");
		//$("#msgSendAdmin textarea").add("#msgSendPet textarea").val("");
	}
	

</script>




</html>