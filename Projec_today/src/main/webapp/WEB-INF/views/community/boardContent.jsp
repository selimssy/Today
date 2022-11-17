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

.container{width:1000px; margin: 0 auto}
.contentBox{width:950px; margin: 0 auto; border: 1.5px solid #d1d1d1; padding: 25px 35px; box-sizing: border-box;}
.contentTop{width:100%; border-bottom: 1.5px solid #d1d1d1; position: relative; padding-bottom: 10px;}
.contentTop h1{line-height: 70px; margin:0}
.contentTop p{background: url(/today/img/community/boarduser.png); background-size: contain; background-repeat: no-repeat; padding-left: 25px;}
.contentTop span{padding-left: 30px;}
.countBox{position: absolute; bottom: 25px; right: 0;}
.countBox span:nth-of-type(1){background: url(/today/img/community/view.png); background-size: contain; background-repeat: no-repeat; padding-left: 25px;}
.countBox span:nth-of-type(2){background: url(/today/img/community/reply.png); background-size: contain; background-repeat: no-repeat; padding-left: 25px; margin-left: 20px;}
.contentBody{padding-top: 20px}
.contentBody img{display: block; margin : auto;}
.hashList{width:950px; margin: 0 auto; border: 1.5px solid #d1d1d1; border-top:none; padding:15px 35px; box-sizing: border-box;}
.hashList span{background: #F3F3F3; border-radius: 20px; padding: 5px 10px; margin-right: 15px;}
</style>
</head>
<body>
	
	
	
	<div class="container"> 
		<div class="contentBox">
			<div class="contentTop">
				<h1>${article.title}</h1>
				<p>${article.writer}<span><fmt:formatDate value="${article.regDate}" pattern="yyyy.MM.dd"/></span></p>
				
				<div class="countBox">
					<span>조회수 <b>${article.viewCnt}</b></span>
					<span>댓글 <b>${article.replyCnt}</b></span>
				</div>			
			</div>
			
			<div class="contentBody">
			${article.content}
			</div>
		</div>
		<div class="hashList">
			<c:if test="${hashtagList.size() > 0}">
				<c:forEach var="hashtag" items="${hashtagList}">
					<span>#${hashtag}</span>
				</c:forEach>
			</c:if>
		</div>
		
		
		
		
		<!-- 댓글영역 -->
		<div class="comment">
			<h4>댓글</h4>
			<ol class="replyList">
				<c:if test="${replyList.size() > 0}">
					<c:forEach var="reply" items="${replyList}">
						<li>
							<p> 작성자: ${reply.replyer} &nbsp; &nbsp;
							    (작성일: <fmt:formatDate value="${reply.replyDate}" pattern="yyyy년 MM월 dd일 HH:mm" />)						
							</p>
							<p>${reply.content}</p>
						</li>
					</c:forEach>
				</c:if>	
			</ol>
		</div>
		
		
		
		<!-- 댓글 등록 폼 -->
		<form action="<c:url value='/board/reply'/>" method="post" id="replyForm">
			<input type="hidden" name="boardNo" value="${article.boardNo}">
			
			<ul>
				<li>
					<label>작성자</label>
					<input type="text" name="replyer" id="replyer" value="${login.name}" readonly>
				</li>
				<li>
					<textarea rows="5" cols="60" name="content" id="replyContent"></textarea>
					<button type="button" id="replyBtn">댓글 등록</button>
				</li>
			</ul>
		</form>
		
		
		
	</div>
	
</body>
</html>