<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div>
	
		<form role="form" action="<c:url value='/diary/modify' />" method="post">
        
            <input type="hidden" name="diaryNo" value="${diary.diaryNo}" >
        
          <div class="form-group">
            <label>작성자</label>
            <input type="text" class="form-control" name='writer' value="${diary.writer}" readonly>
          </div>
          
          <div>
	        <label>날짜</label>
	        <fmt:formatDate value="${diary.regDate}" pattern="yyyy년 MM월 dd일" />
        </div>
          
          
          <div class="form-group">
            <label>제목</label>
            <input type="text" class="form-control" name='title' value="${diary.title}">
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="5" name='content' id="ckeditor1">${diary.content}</textarea>
          </div>
			
		  <script type="text/javascript">
			  CKEDITOR.replace( 'ckeditor1', {
			         width:'100%',
			         height:'400px',
			         filebrowserUploadUrl:  "/today/diary/fileupload"
			     });
		  </script> 	
			
			
          
          <input class="btn" type="submit" value="수정"/>
          <a class="btn" href="<c:url value='/diary/list?page=${p.page}&countPerPage=${p.countPerPage}' />"
		   onclick="return confirm('변경사항을 저장하지 않고 목록으로 돌아가시겠습니까?')">취소</a>&nbsp;&nbsp;
          
        </form>
	
	</div>



</body>
</html>