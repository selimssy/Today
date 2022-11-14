<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>


	<div>
	
		<div>
	        <label>작성자</label>
	        <input type="text" name='writer' value="${diary.writer}" readonly>
        </div>
        
        <div>
	        <label>날짜</label>
	        <fmt:formatDate value="${diary.regDate}" pattern="yyyy년 MM월 dd일" />
        </div>
        
        <div>
	        <label>제목</label>
	        <input type="text" name='title' value="${diary.title}" readonly>
        </div>

        <div>
	        <label>내용</label>
	        <div style="background-color: #ddd">${diary.content}</div>
        </div>




 		<!-- POST 방식으로 삭제 -->	
       <form id="formObj"  role="form" action="<c:url value='/diary/delete'/>" method="post">  
        
	       <input type="hidden" name="diaryNo" value="${diary.diaryNo}">
	       <input type="hidden" name="page" value="${p.page}">
	 	   <input type="hidden" name="countPerPage" value="${p.countPerPage}">
         
           <input type="button" value="목록" class="btn"  id="list-btn"
	style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">&nbsp;&nbsp;
         <!-- 이런식으로 location.href 경로를 통해 가는거는 get방식이다! -->
         <!-- 그래서 목록, 수정은 get방식이 되고 boardNo hidden이랑 삭제는 post 방식이 된다 -->
         
         
	         <c:if test="${login.userId == diary.writer}">
		         <input id="modBtn" type="button" value="수정"  style="color:white;">&nbsp;&nbsp;	         
		         <input type="submit" value="삭제" onclick="return confirm('정말로 삭제하시겠습니까?')">&nbsp;&nbsp;
	      	 </c:if>
      </form>

	</div>
	
	
	
	


</body>
</html>