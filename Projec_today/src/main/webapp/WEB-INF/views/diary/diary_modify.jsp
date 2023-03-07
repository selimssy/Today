<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
.container{width:1000px; margin: 0 auto}
.titleBox{width:100%; height:40px; border:1px solid #d1d1d1; margin-bottom: 10px}
.titleBox input{border:none; width:100%; height:40px; background: transparent; padding-left: 15px}
.titleBox input:focus{outline: none;}
.boardBox{width: 700px; margin: 0 auto}
.boardBox .boardwt{font-size: 1.25em; font-family: 'Nanum Pen Script', cursive; padding-right: 15px}
.boardBox h2{padding-bottom: 20px; font-size: 28px}
input[type=submit]{width:120px; height: 35px; border:none; background: #F3F3F3; cursor: pointer; margin-right: 15px}
.writenav{margin-top: 20px; text-align:right}
.writenav button{width:120px; height: 35px; border:none; background: #F3F3F3; cursor: pointer; }

#cke_1_bottom{display:none}

/*반응형*/
@media all and (max-width:1065px) {			
	.container{width:100%;}
}

@media all and (max-width:800px) {			
	.boardBox{width:95%;}
}
</style>
</head>
<body>

<div class="container">

    <div class="boardBox">    	
        <h2 style="border-bottom: 1px solid #000"><span class="boardwt">오늘의 너</span>다이어리 수정</h2>
        <form role="form" action="<c:url value='/diary/modify' />" method="post" id="Mform">
        	<!-- <input type="hidden" name="diaryNo" value="${diary.diaryNo}" >  -->
        	<input type="hidden" name="diaryCode" value="${diary.diaryCode}" >
            <div class="titleBox">
            	<input type="text" name='title' required="required" value="${diary.title}">
			</div>
			<div>	     
	            <textarea name='content' id="ckeditor1">${diary.content}</textarea>
	        </div>
				
		    <script type="text/javascript">
			    CKEDITOR.replace( 'ckeditor1', {
			         width:'100%',
			         height:'400px',
			         filebrowserUploadUrl:  "/diary/fileupload"
			       });
		    </script>
		    		       
		    
			<div class="writenav">
				<button type="button" id="MregBtn">저장</button>
				<button type="button" id="diaryMC">취소</button>
			</div>
			
        </form>
    </div>

</div>



	<!-- 
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
	 -->


</body>
<script type="text/javascript">
	
	$("#diaryMC").click(function(){
		if(confirm('다이어리 수정을 취소하시겠습니까?')){
			location.href='/diary/content/'+ ${diary.diaryCode};
			//window.history.back();
		}
	})
	
	
	//제목 글자수 초과 알림
	$('input[name="title"]').keyup(function(){
		let content = $(this).val();      
	    if (content.length > 80){
	      alert("최대 80자까지 입력 가능합니다.");
	      $(this).val(content.substring(0, 80));
	    }
	});
	
	
	//등록 버튼 이벤트
	$("#MregBtn").click(function(){
		let title = $("input[name='title']").val();
		 if(!title || title.replace(/\s| /gi, "").length==0){ // 제목 null값이거나 공백만 입력한 경우
			alert("제목을 입력해주세요.");
			$("input[name='title']").focus();
		    return false;
		 }
		
		if(CKEDITOR.instances.ckeditor1.getData().length > 10000){ // content 10000바이트 초과
			alert("본문 최대 용량(10,000byte)를 초과하였습니다.");
			return false;
		} 
		$("#Mform").submit();
	})
</script>
</html>