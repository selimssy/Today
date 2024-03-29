<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
.container{width:1000px; margin: 0 auto}
.titleBox{width:100%; height:40px; border:1px solid #d1d1d1; margin-bottom: 10px}
.titleBox input{border:none; width:100%; height:40px; background: transparent; padding-left: 15px}
.titleBox input:focus{outline: none;}
.boardBox{width: 700px; margin: 0 auto;}
.boardBox .boardwt{font-size: 1.25em; font-family: 'Nanum Pen Script', cursive; padding-right: 15px}
/*.boardBox p{font-size: 16px}안멱힌다ㅠ*/
.boardBox h2{padding-bottom: 20px; font-size: 28px}
#tagbox{padding-left: 20px; display: inline-block;}
.tagbox{padding-left: 20px; display: inline-block;}
.tagbox button{border: none; background: none; color: #ccc; font-size: 19px; cursor: pointer;}
#tag_container{width:100%; min-height:30px; padding:10px 0; border:1px solid #d1d1d1; border-top: none; overflow-y:auto;}
#tag_input{min-width:60px; border: none; /*height: 50px;*/ background: transparent;}
#tag_input:focus{outline: none;}
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
        <h2 style="border-bottom: 1px solid #000"><span class="boardwt">오늘의 너</span>게시글 등록</h2>
        <form action="<c:url value='/community/write'/>" method="post" name="writeForm" id="form">
            <input type="hidden" name='writer' value="${login.userId}" >
            <div class="titleBox">
            	<input type="text" name='title' placeholder="제목을 입력하세요." required="required">
			</div>
			<div>	     
	            <textarea name='content' id="ckeditor1"></textarea>
	        </div>
				
		    <script type="text/javascript">
			    CKEDITOR.replace( 'ckeditor1', {
			         width:'100%',
			         height:'400px',
			         filebrowserUploadUrl:  "/community/fileupload"
			       });
		    </script>
		    
		    
	     
	        <div id="tag_container">
	            <div id="tagbox">
	                <span>#</span>
	                <input type="text" id="tag_input" placeholder="태그입력">
	            </div>           
	        </div>
		
		    
		    
			<div class="writenav">
				<button type="button" id="regBtn">등록</button>
				<button type="button" onclick="location.href='<c:url value='/community/list' />'">취소</button>
			</div>
			
        </form>
    </div>

</div>





<script type="text/javascript">

$(function(){
 	 
  

      // 태그 입력란에 글자 치면 placeholder 사라지게
      if($("#tag_input").val().trim() != ""){
          $("#tag_input").attr("placeholder", "")
      }


      //let hashCnt = 0;
      
      //엔터키 입력 이벤트
      $("#tag_input").keydown(function(key){      
    	  let hashCnt = $('.tagbox').length; // 현재 해시태그 개수
    	  if(key.keyCode == 13 || key.keyCode == 32){  // 누른 key가 13(=엔터키)라면   
        	  temp_html = "<div class='tagbox'><span>#</span>" + $("#tag_input").val() + "<span><button class='del_tag'>x</button></span><input type='hidden' name='hashList' value='" + $("#tag_input").val() + "'></div>"; 
              $('#tagbox').before(temp_html);
              $("#tag_input").val("");  // 입력창 비워져있도록
              $("#tag_input").css("width", "50px");
              hashCnt++;
              if(hashCnt == 10){ // 해시태그 최대 10개 제한
            	  $("#tagbox").css("display", "none");
              }
          }                    
     })

      
      
     // 태그삭제
     $(document).on("click", ".del_tag", function () {
    	 let hashCnt = $('.tagbox').length; // 현재 해시태그 개수
         $(this).parent().parent().remove();
         hashCnt--;
         $("#tagbox").css("display", "inline-block");
     })
		

        
     // 엔터키 submit 방지
     document.writeForm.addEventListener("keydown", evt => {
   	   if (evt.code === "Enter") 
   	   evt.preventDefault();
   	 });
        

    
     // 태그란 입력시 너비 자동조절
     $('#tag_input').keyup(function(){
    	 let width = $(this).val().length * 15;
    	 $(this).css("width", width);
     }); 
    
    
    
     // 게시판 제목 글자수 초과 알림
	 $('input[name="title"]').keyup(function(){
	 	 let content = $(this).val();      
         if (content.length > 80){
            alert("최대 80자까지 입력 가능합니다.");
            $(this).val(content.substring(0, 80));
         }
     });
    
    
     // 게시글 등록 버튼 이벤트
     $("#regBtn").click(function(){
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
    	 $("#form").submit();
     })
    
})
    

</script>




</body>
</html>