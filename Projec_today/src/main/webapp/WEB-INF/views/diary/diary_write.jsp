<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<style type="text/css">
.container{width:1000px; margin: 0 auto}
.titleBox{width:100%; height:40px; border:1px solid #d1d1d1; margin-bottom: 10px}
.titleBox input{border:none; width:100%; height:40px; background: transparent; padding-left: 15px}
.titleBox input:focus{outline: none;}
.boardBox{width: 700px; margin: 0 auto}
.boardBox .boardwt{font-size: 1.25em; font-family: 'Nanum Pen Script', cursive; padding-right: 15px}
/*.boardBox p{font-size: 16px}안멱힌다ㅠ*/
.boardBox h2{padding-bottom: 20px; font-size: 28px}
input[type=submit]{width:120px; height: 35px; border:none; background: #F3F3F3; cursor: pointer; margin-right: 15px; display:inline-block;}
.writenav{margin-top: 20px; text-align:right}
.writenav button{width:120px; height: 35px; border:none; background: #F3F3F3; cursor: pointer; }


#cke_1_bottom{display:none}
</style>
</head>
<body>
<div class="container">

    <div class="boardBox">    	
        <h2 style="border-bottom: 1px solid #000"><span class="boardwt">오늘의 너</span>다이어리 등록</h2>	
	
        <form role="form" action="<c:url value='/diary/write' />" method="post">
	          <input type="hidden" name='writer' value="${login.userId}">        
	          <div class="titleBox">
	              <input type="text" name='title' placeholder="제목을 입력하세요." required="required">
	          </div>
	
	          <div>
	              <textarea  rows="5" name='content' id="ckeditor1"></textarea>
	          </div>
				
			  <script type="text/javascript">
				  CKEDITOR.replace( 'ckeditor1', {
				         width:'100%',
				         height:'400px',
				         filebrowserUploadUrl:  "/today/diary/fileupload"
				     });
			  </script>
			  
		  
				
	        <div class="writenav">
				<input type="submit" value="등록">
				<button type="button" id="writeCancle" onclick="location.href='<c:url value='/diary/list' />'">취소</button>

			</div>
	          
          
        </form>	
	</div>
</div>	
	
</body>


</html>