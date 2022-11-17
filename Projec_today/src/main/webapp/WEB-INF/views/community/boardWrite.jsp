<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
</head>
<body>


<div class="container">

<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header text-white" style="background-color: #ff52a0;"> 게시글 등록</div>
      <div class="card-body">

        <form role="form" action="<c:url value='/community/write' />" method="post">
        
          <div class="form-group" hidden="hidden">
            <label>작성자</label>
            <input type="hidden" class="form-control" name='writer' value="${login.userId}">
          </div>
          
          <div class="form-group">
            <label>제목</label>
            <input type="text" class="form-control" name='title'>
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="5" name='content' id="ckeditor1"></textarea>
          </div>
			
		  <script type="text/javascript">
			  CKEDITOR.replace( 'ckeditor1', {//해당 이름으로 된 textarea에 에디터를 적용
			         width:'100%',
			         height:'400px',
			         filebrowserUploadUrl:  "/board/fileupload"
			     });
		  </script>
		  
		  
		  
		  
		  <!-- 이걸...해시태그 어떻게받지  -->
		  <!-- input readonly로 해보쟈 input길이를 auto로 할수는없나ㅠ  -->
		  <input type="hidden" name="hashList" value="테스트11">
		  <input type="hidden" name="hashList" value="테스트22">
		  <input type="hidden" name="hashList" value="테스트33">
		  
		  
			
         <input type="submit" value="등록" class="btn form-control"
			style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
          &nbsp;&nbsp;
          <a class="btn form-control"	href="#"
		style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: orange; border: 0px solid #388E3C; opacity: 0.8">취소</a>
        </form>



      </div>
    </div>
  </div>
</div>
</div>



</body>
</html>