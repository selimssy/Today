<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
    
<style type="text/css">
	#msgSendModal, #msgListModal{display:none; width:320px; height: 470px; border: 3.5px solid #777; border-radius: 15px; position: relative; box-shadow: 0 0 15px 0 #e8e8e8;
			background: #fff; position: fixed; top: 50%; left: 50%; transform: translate(40px, -50%); z-index:10;}	
	#msgListModal{transform: translate(-380px, -50%);}
	#msgListModal ul li{padding:5px 0; position: relative;}
	#msgListModal ul li .msg_inner{display: flex; align-content: space-between; align-items: center;}
	#msgListModal ul li .msg_inner .msg_info{width: calc(100% - 70px); padding-left: 15px; box-sizing: border-box;} 
	#msgListModal ul li .msg_inner .msg_info p:nth-of-type(1){margin:10px 0; font-size:14.5px;}  
	#msgListModal ul li .msg_inner .msg_info p:nth-of-type(2){margin:10px 0; overflow: hidden; text-overflow : ellipsis; white-space: nowrap; font-size: 13px;}
	#msgListModal ul li .msg_inner .msg_info span{position:absolute; top: 12px; right: 0; font-size: 12px; color: #545456;}
	#msgListModal ul li .msg_inner .msg_info .readChk{position: absolute; bottom: 20px; right: 0px; background-color: #ffa500; height: 6px; width: 6px; display: inline-block; text-align: center; border-radius: 50%;}
	#msgListModal img{width: 48px; height: 48px; border-radius: 50%; object-fit: cover; display: inline-block;}
	#msgListModal .msg_content{height:340px; overflow-y: auto;  -ms-overflow-style: none; /* IE and Edge */scrollbar-width: none; /* Firefox */}
	#msgListModal .msg_content::-webkit-scrollbar{display: none; /* Chrome, Safari, Opera*/}
	#msgListModal .Msearch{position: absolute; top:20px; right: 20px; border-bottom:0.5px solid #eee; background:#eee; padding-right: 5px;}
	#msgListModal .Msearch input{width: 90px; height:25px; border: none; font-size:18px; background:#eee; padding-left: 10px; font-family: 'Nanum Pen Script';}
	#msgListModal .Msearch button{width: 20px; height:20px; border: none; background-color: transparent; text-indent: -9999px; background-image: url(/img/common/search.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}
	.McloseMsg{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 25px; right: 25px; background-image: url(/img/common/close.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}	
	#msgSendModal input:focus{outline: none;}, #msgSendModal textarea:focus{outline: none;}
	.Mmodal_header{border-bottom: 1px solid #dee2e6; padding: 15px 0; display: flex; position: relative;}
	.Mmodal-title{font-family: 'Jua', sans-serif; font-size:1.4em; margin:0;}
	.Mmodal_logo{font-size: 28px; font-family: 'Nanum Pen Script', cursive; padding-left: 15px;}
	.Mmodal_body{padding: 0 20px; display: block; width:100%; box-sizing: border-box;}
	.Mmodal_body ul{list-style: none; padding-left: 0; margin:0;}
	.Mmlabel{margin-top:15px;}
	.Mmlabel p{margin:10px 0;}
	.Mmodal_input{border: 1px solid #d9d9de; box-sizing: border-box; width: 100%; height: 40px; padding-left: 10px;}
	.Mm_button{margin-top: 20px; width: 45%; height: 35px; border: none; border-radius: 5px; cursor:pointer}
	.Mm_button:nth-of-type(1){margin-right: 20px;}
	.Mmodal_textarea{resize: none; width: 100%; background: none; border: 1px solid #d9d9de; line-height: 22px; font-family: "NanumSquare","맑은 고딕", sans-serif; box-sizing: border-box; padding: 10px;}
	.Mmodal_input, .Mmodal_textarea{margin-top:5px;}
	.Mmodal_footer{padding: 0 20px; box-sizing: border-box; border-top: 1px solid #dee2e6;}
	.Mmodal_footer button{width:40%; height:35px; margin-top: 13px; font-size: 13px;}
	.MbuttonBox{display:flex; justify-content: space-evenly;}
	#msgSendOpen{position: relative; padding-left: 20px; background: rgba(122, 183, 48, 0.45); font-size: 19px;  font-family: 'Nanum Pen Script';}
	#msgSendOpen div{width:20px; height:20px; position: absolute; left: 10px; background-image: url(/img/common/letter.png); background-repeat: no-repeat; background-size: contain; background-origin: content-box; text-indent: -9999px; box-sizing: border-box;}
 
	
	.Mpaging{padding: 15px 0 10px; text-align: center;}
	.MpageInfo{font-family: 'Jua', sans-serif;}
	.Mpaging ul li{list-style: none; display: inline-block;}
	.Mpaging ul li button{display: inline-block; width: 20px; height:20px; border: none; background-color: transparent; background-size: contain; background-repeat: no-repeat; text-indent: -9999px; cursor:pointer;}
	.pre_msg{background-image: url(/img/common/Mprev.png); margin-right: 10px;}
	.next_msg{background-image: url(/img/common/Mnext.png); margin-left: 10px;}
</style>

	
	<!-- 쪽지 리스트 모달 -->
	<div id="msgListModal">
		<div class="Mmodal_header">			
			<p class="Mmodal-title">
                <span class="Mmodal_logo">오늘의 너</span> 쪽지함
            </p>
            <!--  <div class="McloseMsg">close</div>-->
            <div class="Msearch">
            	<input type="text" id="Msearch" placeholder="발신인, 내용 검색" spellcheck="false"/>
            	<button type="button" id="MsearchBtn">검색</button>
            </div>
		</div>
				
		<div class="Mmodal_body">
			<div class="msg_content">
		        <ul id="msg_list">	    		        			
					<li>
						<div class="msg_inner">
							<img src="/img/common/mainbg1.png">
							<div  class="msg_info">
								<p><b>해피바라기</b></p>
								<p>안녕하세요 저번에 감사했습니다. 덕분에 우리 해피 많이 좋아졌어요ㅠㅠ 너무 감사합니다!!ㅠ</p>
								<span>2023.02.15</span>
								<div class="readChk"></div>
							</div>
						</div>
					</li>
					
					<li style="position: relative;">
						<div style="display: flex; align-content: space-between; align-items: center;">
							<img src="/img/common/homebg1.png">
							<div style="width: calc(100% - 70px); padding-left: 15px; box-sizing: border-box;">
								<p style="margin:10px 0; font-size:14.5px;"><b>해피바라기</b></p>
								<p style="margin:10px 0; overflow: hidden; text-overflow : ellipsis; white-space: nowrap; font-size: 13px;">사랑스러운 너와의 첫 만남부터 이별까지. 처음으로 반려견을</p>
								<span style="position:absolute; top: 12px; right: 0; font-size: 12px; color: #545456;">2023.02.15</span>
							</div>
						</div>
					</li>
					
					<li style="position: relative;">
						<div style="display: flex; align-content: space-between; align-items: center;">
							<img src="/img/diary/mainbg4.png">
							<div style="width: calc(100% - 70px); padding-left: 15px; box-sizing: border-box;">
								<p style="margin:10px 0; font-size:14.5px;"><b>해피바라기</b></p>
								<p style="overflow: hidden; text-overflow : ellipsis; white-space: nowrap; font-size: 13px;">너와의 첫 만남부터 이별까지. 처음으로 반려견을</p>
								<span style="position:absolute; top: 12px; right: 0; font-size: 12px; color: #545456;">2023.02.15</span>
							</div>
						</div>
					</li>
					
					<li style="position: relative;">
						<div style="display: flex; align-content: space-between; align-items: center;">
							<img src="/img/mypage/mypage.png">
							<div style="width: calc(100% - 70px); padding-left: 15px; box-sizing: border-box;">
								<p style="margin:10px 0; font-size:14.5px;"><b>해피바라기</b></p>
								<p style="margin:10px 0; overflow: hidden; text-overflow : ellipsis; white-space: nowrap; font-size: 13.5px;">명동이가 만나 함께 살아가는 이야기</p>
								<span style="position:absolute; top: 12px; right: 0; font-size: 12px; color: #545456;">2023.02.15</span>
							</div>
						</div>
					</li>
					
					<li style="position: relative;">
						<div style="display: flex; align-content: space-between; align-items: center;">
							<img src="/img/community/bg11.png">
							<div style="width: calc(100% - 70px); padding-left: 15px; box-sizing: border-box;">
								<p style="margin:10px 0; font-size:14.5px;"><b>해피바라기</b></p>
								<p style="margin:10px 0; overflow: hidden; text-overflow : ellipsis; white-space: nowrap; font-size: 13px;">댕댕이 안녕</p>
								<span style="position:absolute; top: 12px; right: 0; font-size: 12px; color: #545456;">2023.02.15</span>
							</div>
						</div>
					</li>
					
					<li style="position: relative;">
						<div style="display: flex; align-content: space-between; align-items: center;">
							<img src="/img/community/mainbg9.png">
							<div style="width: calc(100% - 70px); padding-left: 15px; box-sizing: border-box;">
								<p style="margin:10px 0; font-size:14.5px;"><b>해피바라기</b></p>
								<p style="margin:10px 0; overflow: hidden; text-overflow : ellipsis; white-space: nowrap; font-size: 13px;">강아지 수명 20년. 너와 내가 함께하는 20년 동안 우린 어떤 일을 겪게 될까?</p>
								<span style="position:absolute; top: 12px; right: 0; font-size: 12px; color: #545456;">2023.02.15</span>
							</div>
						</div>
					</li>
					
					<li style="position: relative;">
						<div style="display: flex; align-content: space-between; align-items: center;">
							<img src="/img/community/ring2.png">
							<div style="width: calc(100% - 70px); padding-left: 15px; box-sizing: border-box;">
								<p style="margin:10px 0; font-size:14.5px;"><b>해피바라기</b></p>
								<p style="margin:10px 0; overflow: hidden; text-overflow : ellipsis; white-space: nowrap; font-size: 13px;">나영의 행복을 위해서라면, 무엇이든 할 수 있는 사랑스러운 반려견 우비</p>
								<span style="position:absolute; top: 12px; right: 0; font-size: 12px; color: #545456;">2023.02.15</span>
							</div>
						</div>
					</li>
					
					<li style="position: relative;">
						<div style="display: flex; align-content: space-between; align-items: center;">
							<img src="/img/mypet/noticeImg1.PNG">
							<div style="width: calc(100% - 70px); padding-left: 15px; box-sizing: border-box;">
								<p style="margin:10px 0; font-size:14.5px;"><b>해피바라기</b></p>
								<p style="margin:10px 0; overflow: hidden; text-overflow : ellipsis; white-space: nowrap; font-size: 13px;">그런 우비와 나영의 시간에 불현듯 개를 무서워하는</p>
								<span style="position:absolute; top: 12px; right: 0; font-size: 12px; color: #545456;">2023.02.15</span>
							</div>
						</div>
					</li>
					
					<li style="position: relative;">
						<div style="display: flex; align-content: space-between; align-items: center;">
							<img src="/img/mypet/p1.jpg">
							<div style="width: calc(100% - 70px); padding-left: 15px; box-sizing: border-box;">
								<p style="margin:10px 0; font-size:14.5px;"><b>해피바라기</b></p>
								<p style="margin:10px 0; overflow: hidden; text-overflow : ellipsis; white-space: nowrap; font-size: 13px;">낯선 남자 영민이 들어오고, 나영과 영민의 관계가 가까워질수록 </p>
								<span style="position:absolute; top: 12px; right: 0; font-size: 12px; color: #545456;">2023.02.15</span>
							</div>
						</div>
					</li>
					
					<li style="position: relative;">
						<div style="display: flex; align-content: space-between; align-items: center;">
							<img src="/img/mypet/poster2.png">
							<div style="width: calc(100% - 70px); padding-left: 15px; box-sizing: border-box;">
								<p style="margin:10px 0; font-size:14.5px;"><b>해피바라기</b></p>
								<p style="margin:10px 0; overflow: hidden; text-overflow : ellipsis; white-space: nowrap; font-size: 13px;">우비와 그녀의 사이는 멀어져 간다. 나영의 사랑을 독차지할 수 없게 된</p>
								<span style="position:absolute; top: 12px; right: 0; font-size: 12px; color: #545456;">2023.02.15</span>
							</div>
						</div>
					</li>
		        </ul>
		        
		        
		        <!-- 페이징 처리 -->
				<div class="Mpaging">
					<ul>
						<!-- 이전 버튼 -->
				        <li>
							<button type="button" class="pre_msg">이전</button>
						</li>						
						
						<!-- 페이지 정보 -->
						<li class="MpageInfo">
						<span class="nowPage"></span> / <span class="totalPage"></span>
						</li>				
						  
					   <!-- 다음 버튼 -->
					   <li>
					       <button type="button" class="next_msg">다음</button>
					   </li>
					</ul>
				</div>
				<!-- 페이징 처리 끝 -->
		    </div>                
    	</div>
    	<div class="Mmodal_footer">
    		<div class="MbuttonBox">
                <button type="button" id="msgSendOpen" class="Mm_button"><div>1</div>쪽지 보내기</button>
                <button type="button" id="closeMsgList" class="Mm_button">닫기</button>
            </div>
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
	            	<input type="text" id="toMsg" class="Mmodal_input" spellcheck="false"/>
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
		}
		
		
		
		
		
		// 받은 쪽지 다음 페이지               
        $(document).on("click", ".next_msg", function () {
						   				
			let keyword = $("#Msearch").attr("value");
	   		let page = parseInt($(".nowPage").text()); //현재 페이지
	   		page +=1; // 타겟 페이지	   			   		
	   		if(page > parseInt($(".totalPage").text())){
	   			alert("마지막 페이지입니다.");
	   			return false;
	   		}   			   		
	   		let data = {page: page, keyword: keyword};
	   		
	   		//초기화
			$('#msg_list').empty();
	   		   		
	   		$.ajax({
	               type: 'post',
	               dataType : "json",
	               contentType: 'application/json',
	               url: '/msg/recvMsg',
	               data: JSON.stringify(data),
	               success: function (response) {
	            	   //console.log(response); // Map
	                    let list = response['list'];
	                    let lastPage = response['lastPage'];
	                    
	                    for(let i = 0; i < list.length; i++){
	                    	
	                    	//let imagePath = list['imagePath']; 사용자 프로필 이미지 만든 후에
	                    	let imagePath = "/img/mypage/mypage.png"; // 임시
	                    	let msgNo = list[i]["msgNo"];
	                    	let nick = list[i]["nick"];
	                    	let content = list[i]["content"];
	                    	let sendTime = list[i]["sendTime"];
	                    	let readChk = list[i]["readChk"];
	                    	let senderId = list[i]["senderId"]; // 사용자에게 쪽지 보내는 경우
	                    		                    	
	                    	let html='<li>';
	                        html += '<div class="msg_inner"><img src="' + imagePath + '">';
	                        html += '<div class="msg_info">';
	                        html += '<p><b>' + nick + '</b></p>';
	                        html += '<p>' + content + '</p>';
	                        html += '<span>' + sendTime + '</span>';
	                        if(readChk == 0){ // 안 읽은 쪽지 표시
	                            html += '<div class="readChk"></div>';    
	                        }
	                        html += '</div></div></li>';
	                    		                   		
	                        $('#msg_list').append(html);
	                        $(".nowPage").html(page); // 현재 페이지
	                        $(".totalPage").html(lastPage); // 총 페이지
	                        
	                    } 
	               	   	   	                 
	               }, 
	               error: function() {
	                   console.log("통신 실패!");
	               } 
	        });
    		 	
        })
        
        
        
        
        // 받은 쪽지 이전 페이지               
        $(document).on("click", ".pre_msg", function () {
						   				
			let keyword = $("#Msearch").attr("value");
	   		let page = parseInt($(".nowPage").text()); //현재 페이지
	   		page -=1; // 타겟 페이지	   			   		
	   		if(page <= 0){
	   			alert("마지막 페이지입니다.");
	   			return false;
	   		}   			   
	   		
	   		let data = {page: page, keyword: keyword};
	   		
	   		//초기화
			$('#msg_list').empty();
	   		
	   		$.ajax({
	               type: 'post',
	               dataType : "json",
	               contentType: 'application/json',
	               url: '/msg/recvMsg',
	               data: JSON.stringify(data),
	               success: function (response) {
	            	   //console.log(response); // Map
	                    let list = response['list'];
	                    let lastPage = response['lastPage'];
	                    
	                    for(let i = 0; i < list.length; i++){
	                    	
	                    	//let imagePath = list['imagePath']; 사용자 프로필 이미지 만든 후에
	                    	let imagePath = "/img/mypage/mypage.png"; // 임시
	                    	let msgNo = list[i]["msgNo"];
	                    	let nick = list[i]["nick"];
	                    	let content = list[i]["content"];
	                    	let sendTime = list[i]["sendTime"];
	                    	let readChk = list[i]["readChk"];
	                    	let senderId = list[i]["senderId"]; // 사용자에게 쪽지 보내는 경우
	                    		                    	
	                    	let html='<li>';
	                        html += '<div class="msg_inner"><img src="' + imagePath + '">';
	                        html += '<div class="msg_info">';
	                        html += '<p><b>' + nick + '</b></p>';
	                        html += '<p>' + content + '</p>';
	                        html += '<span>' + sendTime + '</span>';
	                        if(readChk == 0){ // 안 읽은 쪽지 표시
	                            html += '<div class="readChk"></div>';    
	                        }
	                        html += '</div></div></li>';
	                    		                   		
	                        $('#msg_list').append(html);
	                        $(".nowPage").html(page); // 현재 페이지
	                        $(".totalPage").html(lastPage); // 총 페이지
	                        
	                    } 
	               	   	   	                 
	               }, 
	               error: function() {
	                   console.log("통신 실패!");
	               } 
	        });
    		 	
        })
		
		
        
		
        
        // 받은 쪽지 검색               
        $(document).on("click", "#MsearchBtn", function () {
						   				
			let keyword = $("#Msearch").val();
			$("#Msearch").attr("value", keyword);
			let page = 1;			   
	   		let data = {"page": page, "keyword": keyword};
	   		
	   		//초기화
			$('#msg_list').empty();
	   		
	   		$.ajax({
	               type: 'post',
	               dataType : "json",
	               contentType: 'application/json',
	               url: '/msg/recvMsg',
	               data: JSON.stringify(data),
	               success: function (response) {
	            	   //console.log(response); // Map
	                    let list = response['list'];
	                    let lastPage = response['lastPage'];
	                    
	                    for(let i = 0; i < list.length; i++){
	                    	
	                    	//let imagePath = list['imagePath']; 사용자 프로필 이미지 만든 후에
	                    	let imagePath = "/img/mypage/mypage.png"; // 임시
	                    	let msgNo = list[i]["msgNo"];
	                    	let nick = list[i]["nick"];
	                    	let content = list[i]["content"];
	                    	let sendTime = list[i]["sendTime"];
	                    	let readChk = list[i]["readChk"];
	                    	let senderId = list[i]["senderId"]; // 사용자에게 쪽지 보내는 경우
	                    		                    	
	                    	let html='<li>';
	                        html += '<div class="msg_inner"><img src="' + imagePath + '">';
	                        html += '<div class="msg_info">';
	                        html += '<p><b>' + nick + '</b></p>';
	                        html += '<p>' + content + '</p>';
	                        html += '<span>' + sendTime + '</span>';
	                        if(readChk == 0){ // 안 읽은 쪽지 표시
	                            html += '<div class="readChk"></div>';    
	                        }
	                        html += '</div></div></li>';
	                    		                   		
	                        $('#msg_list').append(html);
	                        $(".nowPage").html(page); // 현재 페이지
	                        $(".totalPage").html(lastPage); // 총 페이지
	                        
	                    } 
	               	   	   	                 
	               }, 
	               error: function() {
	                   console.log("통신 실패!");
	               } 
	        });
    		 	
        })
        
		
		
	
	})
</script>


</html>