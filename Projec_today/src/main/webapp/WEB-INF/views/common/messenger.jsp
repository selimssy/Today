<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
    
<style type="text/css">
	#msgSendModal, #msgListModal{/*display:none;*/ width:350px; height: 470px; border: 3.5px solid #777; border-radius: 15px; position: relative; box-shadow: 0 0 15px 0 #e8e8e8;
			background: #fff; position: fixed; top: 50%; left: 50%; transform: translate(40px, -50%); z-index:10;}	
	#msgListModal{transform: translate(-380px, -50%);}
	#msgListModal img{width: 70px; height: 70px; border-radius: 50%; object-fit: cover; display: inline-block;}
	.McloseMsg{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 25px; right: 25px; background-image: url(/img/common/close.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}	
	#msgSendModal input:focus{outline: none;}, #msgSendModal textarea:focus{outline: none;}
	.Mmodal_header{border-bottom: 1px solid #dee2e6; padding: 15px 0; display: flex; position: relative;}
	.Mmodal-title{font-family: 'Jua', sans-serif; font-size:1.4em; margin:0;}
	.Mmodal_logo{font-size: 1.4em; font-family: 'Nanum Pen Script', cursive; padding-left: 15px;}
	.Mmodal_body{padding: 0 20px; display: block; width:100%; box-sizing: border-box;}
	.Mmodal_body ul{list-style: none; padding-left: 0; margin:0;}
	.Mmlabel{margin-top:15px;}
	.Mmlabel p{margin:10px 0;}
	.Mmodal_input{border: 1px solid #d9d9de; box-sizing: border-box; width: 100%; height: 40px; padding-left: 10px;}
	.Mm_button{margin-top: 20px; width: 45%; height: 35px; padding: 0 20px; border: none; border-radius: 5px; cursor:pointer}
	.Mm_button:nth-of-type(1){margin-right: 20px;}
	.Mmodal_textarea{resize: none; width: 100%; background: none; border: 1px solid #d9d9de; line-height: 22px; font-family: "NanumSquare","맑은 고딕", sans-serif; box-sizing: border-box; padding: 10px;}
	.Mmodal_input, .Mmodal_textarea{margin-top:5px;}
	.MbuttonBox{display:flex; justify-content: space-evenly;}
</style>

	
	<!-- 쪽지 리스트 모달 -->
	<div id="msgListModal">
		<div class="Mmodal_header">			
			<p class="Mmodal-title">
                <span class="Mmodal_logo">오늘의 너</span> 쪽지함
            </p>
            <div class="McloseMsg">close</div>
		</div>
				
		<div class="Mmodal_body">
	        <ul id="msg_list">	    
	        		
			
				<li style="position: relative;">
					<img src="/img/common/mainbg1.png">
					<div style="">
						<p><b>해피바라기</b></p>
						<p style="overflow: hidden; text-overflow : ellipsis; white-space: nowrap;">안녕하세요 저번에 감사했습니다. 덕분에 우리 해피 많이 좋아졌어요ㅠㅠ 너무 감사합니다!!ㅠ</p>
						<span style="position:absolute; top: 0; right: 0; font-size: 12px; color: #545456;">2023.02.15</span>
					</div>
				</li>
				
				
				
				
				
	        	
	        	
	        	<!-- 
	            <li>
                   	<div class="MbuttonBox">
                        <button type="button" id="msgSend" class="Mm_button">쪽지 보내기</button>
                    </div>
                </li>
                 -->
	        </ul>
    	</div>
	</div>



	<!-- 족지 보내기 모달 -->
	<div id="msgSendModal">
		<div class="Mmodal_header">			
			<p class="Mmodal-title">
                <span class="Mmodal_logo">오늘의 너</span> 쪽지 보내기
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
	            	<input type="text" id="toMsg" class="Mmodal_input"/>
	            	<!-- 
	                <input type="text" id="toMsg" class="modal_input" disabled/>
	                 -->
	            </li>	        
	                      
	            <li class="Mmlabel">
                    <p>
                        <strong>내용</strong>
                    </p>
	            </li>
	            <li>
	                <textarea id="msgContent" class="Mmodal_textarea" rows="7" spellcheck="false"></textarea>
	            </li>
	            
	            <li>
                   	<div class="MbuttonBox">
                        <button type="button" id="msgSend" class="Mm_button">보내기</button>
                        <button type="button" id="msgCancle" class="Mm_button">취소</button>
                    </div>
                </li>
	        </ul>
    	</div>
	</div>






<script type="text/javascript">

	$(function(){
		
		// 쪽지 보내기
		$("#msgSend").click(function(){			
				
			let senderId = "${login.userId}";  
			if(senderId === ""){  // 로그아웃(세션 종료) 체크
				alert("로그인 후 사용 가능합니다.");
				window.location.reload();
				return false;
			}
			
			let recvId = $("#toMsg").val();	
			if(!recvId || recvId.replace(/\s| /gi, "").length==0){ //수신인 입력값 체크
				alert("수신인을 입력해주세요.");
			    return false;
			}
			if(userIdChk(recvId) == 0){  //수신인 존재 체크
				alert("존재하지 않는 사용자입니다.");
				return false;
			}
			
			let content = $("#msgContent").val().replace(/(?:\r\n|\r|\n)/g, '<br>');				
			if(!content || content.replace(/\s| /gi, "").length==0){  // 내용 입력값 체크
				alert("내용을 입력해주세요.");
			    return false;
			}
    		let message = {"senderId": senderId, "recvId": recvId, "content": content};
    		
    		$.ajax({
                type: 'post',
                dataType : "text",
                contentType: 'application/json',
                url: '/msg/sendMsg',
                data: JSON.stringify(message),
                success: function (response) {
         			if(response === 'success'){
         				alert("쪽지 보내기가 완료되었습니다.");
         				window.location.reload();
         			}else{
         				alert("쪽지 보내기에 실패했습니다.");
         			}
                }, 
                error: function() {
                    console.log("통신 실패"); 
                } 
            });
			
		})
		
		
		
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
		}
		
		
	
	})
</script>


</html>