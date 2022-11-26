<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/community/mainbg9.png); margin: 0 auto;  position: relative;}       

.contentBox{width:850px; margin: 100px auto; border: 1.5px solid #d1d1d1; padding: 25px 30px; box-sizing: border-box; }
.contentTop{width:100%; border-bottom: 1.5px solid #d1d1d1; padding-bottom: 10px; position: relative;}
.contentTop h1{line-height: 55px; margin:0;}
.contentTop p{background: url(/today/img/community/boarduser.png); background-size: contain; background-repeat: no-repeat; padding-left: 25px;}
.contentTop span{padding-left: 30px;}
.countBox{position: absolute; bottom: 25px; right: 0;}
.countBox span:nth-of-type(1){background: url(/today/img/community/view.png); background-size: contain; background-repeat: no-repeat; padding-left: 25px;}
.countBox span:nth-of-type(2){background: url(/today/img/community/reply.png); background-size: contain; background-repeat: no-repeat; padding-left: 25px; margin-left: 20px;}
.navBox{position: absolute; top: -70px; right: -35px;}
.navBox input{width:75px; height: 30px; border:none; cursor: pointer;}
.contentBody{padding-top: 20px}
/*.contentBody img{display: block; margin : auto;}*/
.boardcontent{min-height:300px}
.hashList{width:100%; margin: 0 auto;  border-top:1.5px solid #d1d1d1; padding:18px 25px; box-sizing: border-box; }
.hashList span{background: #F3F3F3; border-radius: 20px; padding: 5px 10px; margin-right: 15px;}
.hashnull{display:none}
.comment{border-top:1.5px solid #d1d1d1;}
.comment ul{list-style:none; padding-right:40px}
.comment ul li{margin-top:25px}
.comment p{font-size:0.9em}
.comment .rpyW{background: url(/today/img/community/cbullet.png); background-size: contain; background-repeat: no-repeat; padding-left: 25px;}
.comment span{font-size:0.9em; color:#aaa}
.comment button{width:35px; height: 20px; font-size:0.6em; padding: 2px; border-radius: 5px; border: none; cursor: pointer;}
.replyRgBox{width:750px; height: 125px; position: relative; display:block; margin-bottom: 40px}
.replyRgBox textarea{width:700px; height: 100px; position: absolute; top: 10px; right:0; resize: none; overflow-y:auto; font-family: "NanumSquare","맑은 고딕", sans-serif;}
.replyRgBox button{position: absolute; bottom: -30px; right:0; width:85px; height: 30px; border:none; background: #F0F0F0; cursor: pointer;}
.comment textarea{width:700px; height: 100px; resize: none; overflow-y:auto; font-family: 'NanumSquare','맑은 고딕', sans-serif;}
.modifyBox{position: relative;width:700px; height:120px}
.modifyBox .mdButton{width:78px; position: absolute; top:-30px; right:0; display:block}
</style>
</head>
<body>

<div class="container">   
	<jsp:include page="../common/header.jsp" />
	<main>
		<div class="siteInfo">
	        <div class="infoText" style="top: 110px;">
	            <p>커뮤니티 게시판</p>
	            <p>너와 나, 우리 모두 함께</p>
	        </div>
	    </div>
	    <div class="siteNav">
	        <a href="#"><div class="homeLogo">1</div></a>
	        <ul>
	            <li><a href="#">내 반려견 소개</a></li>
	            <li class="checked"><a href="#">커뮤니티 게시판</a></li>
	        </ul>
	    </div>
		<div class="otherWrap" style="width: 1150px; padding-left:310px">
	        <div class="otherP">
	            <P>너와의 오늘, 우리의 시간</P>
	            <!--<h1>다른 반려동물 보러 놀러가기</h1> -->
	            <p>'너'이기에 행복한 견주의 일기</p>
	    	</div>
	    </div>	
	
	
	
		<div class="contentBox">
			<div class="contentTop">
				<h1>${article.title}</h1>
				<p>${article.writer}<span><fmt:formatDate value="${article.regDate}" pattern="yyyy.MM.dd"/></span></p>
				
				<div class="countBox">
					<span>조회수 <b>${article.viewCnt}</b></span>
					<span>댓글 <b>${article.replyCnt}</b></span>
				</div>
				
				<!-- 게시물 수정, 삭제, 목록 -->
				<div class="navBox">
					<form id="formObj"  role="form" action="<c:url value='/community/delete'/>" method="post">  
					
						<input type="hidden" name="boardNo" value="${article.boardNo}">
						<input type="hidden" name="page" value="${p.page}">
						<input type="hidden" name="countPerPage" value="${p.countPerPage}">
						        										
						<c:if test="${login.userId == article.writer}">				   
							<input id="modBtn" type="button" value="수정">&nbsp;&nbsp;				
							<input type="submit" value="삭제" onclick="return confirm('정말로 삭제하시겠습니까?')">&nbsp;&nbsp;					
						</c:if>
						<input type="button" value="목록" class="btn"  id="list-btn">&nbsp;&nbsp;
					</form>	
				</div>				
			</div>
			
			<div class="contentBody">
				<div class="boardcontent">
					${article.content}
				</div>
			
				
				<c:if test="${hashtagList.size() <= 0}">
					<div class="hashnull">1</div>
				</c:if>
				<c:if test="${hashtagList.size() > 0}">
					<div class="hashList">
						<c:forEach var="hashtag" items="${hashtagList}">						
								<span>#${hashtag}</span>					
						</c:forEach>
					</div>
				</c:if>						
			</div>
			
			
			
			<!-- 댓글영역 -->
			<div class="comment">
				<h3>댓글[${article.replyCnt}]</h3>
				<ul id="replyList">
					<c:if test="${replyList.size() > 0}">
						<c:forEach var="reply" items="${replyList}">
							<li>							
								<p class="rpyW"><b>${reply.replyer}</b> &nbsp; &nbsp; &nbsp; &nbsp;
								    <span><fmt:formatDate value="${reply.replyDate}" pattern="yyyy.MM.dd. HH:mm" /></span>
								    <c:if test="${login.userId == reply.replyer}">
								    	&nbsp;<button href="${reply.replyNo}" type="button" class="replyModify">수정</button>&nbsp;<button href="${reply.replyNo}" type="button" class="replyDelete">삭제</button>
									</c:if>
								</p>
								<div id="reply${reply.replyNo}" class="rpyContentBox">
									<p>${reply.content}</p>
								</div>
							</li>
						</c:forEach>
					</c:if>	
				</ul>
			</div>
			
			
			
			<!-- 댓글 등록 폼 -->
			<div class="replyRgBox">
				<form action="<c:url value='/board/reply'/>" method="post" id="replyForm">
					<input type="hidden" name="boardNo" value="${article.boardNo}">		
					
						<textarea name="content" id="replyContent" placeholder="댓글을 입력해주세요."></textarea>
						<button type="button" id="replyBtn">댓글 등록</button>		
						
				</form>
			</div>		
				
		</div>
		
	
	</main>
</div>		
		
	
		
		

		
		
		
	
	
	<script type="text/javascript">
	
		let msg = "${msg}"
		if(msg === "modSuccess"){
			alert("게시물이 수정되었습니다.")
		}
		
		// 수정 버튼 클릭
		let forElement = $("#formObj");; 

		$("#modBtn").click(function(){
			console.log("수정버튼이 클릭됨!");
			forElement.attr("action", "/today/community/modify");
			forElement.attr("method", "get");
			forElement.submit();
		})
	
		
	
	
		// Ajax방식 댓글등록 
		$("#replyBtn").click(function(){
					
			let boardNo = ${article.boardNo};
			console.log("글번호: " + boardNo);
			
			let replyContent = $("#replyContent").val();
			console.log("댓글내용: " + replyContent);
		
			let replyer = "${login.userId}";
			console.log("댓글작성자: " + replyer);
			
			let replyVO = {
				boardNo: boardNo,
				content: replyContent,
				replyer: replyer
			};
			
				
			$.ajax({
				type: "POST", 
				url: "/today/community/reply", 
				headers: {
					"Content-Type": "application/json"
				}, 
				dataType: "text", 
				data: JSON.stringify(replyVO), 
				success: function(result){
					if(result === "replySuccess"){
						console.log("통신 성공!")				
						window.location.reload();
					}else{
						console.log("통신 실패");
					}													
				}, 
				error: function() {
					console.log("통신 실패!");
				} 
			});
			
			$("#replyContent").val("");
		})
		
		
		
		
		// 댓글 수정 불러오기 요청		
		$(document).on("click", ".replyModify", function () {
			
			//초기화
            $(".rpyContentBox p").css("display","block");
            $(".rpyW button").css( 'display', 'inline-block' );
            $(".modifyBox").remove();
			
            $(this).css("display","none");
            $(this).next().css("display","none");
            
            let replyNo = $(this).attr("href");
            console.log(replyNo);
            
    		let reply = {
    				replyNo: replyNo
                    };
    		
    		$.ajax({
                type: 'post',
                dataType : "json",
                contentType: 'application/json',
                url: '/today/community/modifReplyGet',
                data: JSON.stringify(reply),
                success: function (response) {
                	console.log(response); // replyVO 
                   		
                    	let replyContent = response['content'];
                		let replyNo = response['replyNo'];
                    	console.log(replyContent);
                        let temp_html = "<div class='modifyBox'><div class='mdButton'><button href='" + replyNo + "' type='button' class='rpyMBtn'>저장</button>&nbsp;<button href='" + replyNo + "' type='button' class='rpyMCancel'>취소</button></div><textarea id='mdcont'>" + replyContent + "</textarea></div>";
						
                        $('#reply' + replyNo + ' p').css("display", "none");
                        $('#reply' + replyNo).append(temp_html);
                    
                }, 
                error: function() {
                    console.log("통신 실패!");
                } 
            });
        })
		
		
		
        
        //댓글 수정 취소  
        $(document).on("click", ".rpyMCancel", function () {
        	$(this).parent().parent().prev().css( 'display', 'block' );
        	$(this).parent().parent().prev().parent().prev().children('button').css( 'display', 'inline-block' );
        	$(this).parent().parent().remove();
        })
        
        
        
        
        // 댓글 수정 
        $(document).on("click", ".rpyMBtn", function () {
			
			let replyContent = $("#mdcont").val();
			console.log("댓글내용: " + replyContent);

			let replyNo = $(this).attr("href");
			console.log("댓글내용: " + replyNo);
			
			let replyVO = {
				content: replyContent,
				replyNo: replyNo
			};  
						
			$.ajax({
				type: "POST", 
				url: "/today/community/modifyReply", 
				headers: {
					"Content-Type": "application/json"
				}, 
				dataType: "text", 
				data: JSON.stringify(replyVO), 
				success: function(result){
					if(result === "modifySuccess"){
						console.log("통신 성공!")				
						window.location.reload();
					}else{
						console.log("통신 실패");
					}													
				}, 
				error: function() {
					console.log("통신 실패!");
				} 
			});
			
        })
        
       
        
        
				
		// 댓글 삭제
		$(document).on("click", ".replyDelete", function () {
			if(confirm("댓글을 삭제하시겠습니까?")){
				let boardNo = ${article.boardNo};
				let replyNo = $(this).attr("href");
				let replyVO = {
						boardNo: boardNo,
						replyNo: replyNo
					};
				
				$.ajax({
					type: "POST", 
					url: "/today/community/deleteReply", 
					headers: {
						"Content-Type": "application/json"
					}, 
					dataType: "text", 
					data: JSON.stringify(replyVO), 
					success: function(result){
						if(result === "deleteSuccess"){
							console.log("통신 성공!")				
							//alert("댓글이 삭제되었습니다.");
							window.location.reload();
						}else{
							console.log("통신 실패");
						}													
					}, 
					error: function() {
						console.log("통신 실패!");
					} 
				});
			}		
			
        })
		
		
		
		
	
	</script>
		
		
	
	
</body>
</html>