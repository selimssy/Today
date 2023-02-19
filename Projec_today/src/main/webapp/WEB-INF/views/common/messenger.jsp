<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet"> 
<style type="text/css">
	#msgSendModal{/*display:none;*/ width:400px; height: 470px; border: 3.5px solid #777; border-radius: 15px; position: relative; box-shadow: 0 0 15px 0 #e8e8e8;
			background: #fff; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index:10;}	
	.closeMsg{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 25px; right: 25px; background-image: url(/img/common/close.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}	
	#msgSendModal input:focus{outline: none;}, #msgSendModal textarea:focus{outline: none;}
	.modal_header{border-bottom: 1px solid #dee2e6; padding: 15px 0; display: flex; position: relative;}
	.modal-title{font-family: 'Jua', sans-serif; font-size:1.4em; margin:0;}
	.modal_logo{font-size: 1.4em; font-family: 'Nanum Pen Script', cursive; padding-left: 15px;}
	.modal_body{padding: 0 20px; display: block; width:100%; box-sizing: border-box;}
	.modal_body ul{list-style: none; padding-left: 0; margin:0;}
	.mlabel{margin-top:15px;}
	.mlabel p{margin:10px 0;}
	.modal_input{border: 1px solid #d9d9de; box-sizing: border-box; width: 100%; height: 40px; padding-left: 10px;}
	.m_button{margin-top: 20px; width: 45%; height: 35px; padding: 0 20px; border: none; border-radius: 5px; cursor:pointer}
	.m_button:nth-of-type(1){margin-right: 20px;}
	.modal_textarea{resize: none; width: 100%; background: none; border: 1px solid #d9d9de; line-height: 22px; font-family: "NanumSquare","맑은 고딕", sans-serif; box-sizing: border-box; padding: 10px;}
	.modal_input, .modal_textarea{margin-top:5px;}
	.buttonBox{display:flex; justify-content: space-evenly;}
</style>
</head>
<body>

	<!-- 족지 보내기 모달 -->
	<div id="msgSendModal">
		<div class="modal_header">			
			<p class="modal-title">
                <span class="modal_logo">오늘의 너</span> 쪽지 보내기
            </p>
            <div class="closeMsg">close</div>
		</div>
				
		<div class="modal_body">
	        <ul>	    
	        	<li class="mlabel">
                    <p>
                        <strong>받는 사람</strong>
                    </p>
	            </li>
	            <li>
	            	<input type="text" id="toMsg" class="modal_input"/>
	            	<!-- 
	                <input type="text" id="toMsg" class="modal_input" disabled/>
	                 -->
	            </li>	        
	                      
	            <li class="mlabel">
                    <p>
                        <strong>내용</strong>
                    </p>
	            </li>
	            <li>
	                <textarea id="msgContent" class="modal_textarea" rows="7" spellcheck="false"></textarea>
	            </li>
	            
	            <li>
                   	<div class="buttonBox">
                        <button type="button" id="msgSend" class="m_button">보내기</button>
                        <button type="button" id="msgCancle" class="m_button">취소</button>
                    </div>
                </li>
	        </ul>
    	</div>
	</div>


</body>



<script type="text/javascript">

	$(function(){
		
		// 쪽지 보내기
		$("#msgSend").click(function(){			
				
			let senderId = "${login.userId}";     
			let recvId = $("#toMsg").val();	 
			let content = $("#msgContent").val().replace(/(?:\r\n|\r|\n)/g, '<br>');	
			
			if(!content || content.replace(/\s| /gi, "").length==0){ // 내용 입력값 체크
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
	
	})
</script>


</html>