<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	
	
        <form role="form" action="<c:url value='/diary/write' />" method="post">
        
          <div>
            <label>작성자</label>
            <input type="hidden" name='writer' value="${login.userId}">
          </div>
          
          <div>
            <label>제목</label>
            <input type="text"  name='title'>
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea  rows="5" name='content' id="ckeditor1"></textarea>
          </div>
			
		  <script type="text/javascript">
			  CKEDITOR.replace( 'ckeditor1', {//해당 이름으로 된 textarea에 에디터를 적용
			         width:'100%',
			         height:'400px',
			         filebrowserUploadUrl:  "/today/diary/fileupload"
			     });
		  </script>
		  
		  
		  
			
         <input type="submit" value="등록"
			style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
          &nbsp;&nbsp;
          <a href="#">취소</a>
          
          
        </form>	
	
	
	
</body>
</html>