<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.siteInfo{width: 1000px; height: 375px; background-image: url(/today/img/common/mainbg2.png); margin: 0 auto;  position: relative;}       
.mainContent{width: 1000px; margin: 0 auto; min-height: 160px;}
.mainContent .conTitle{width: 1000px; margin: 0 auto; background:#BBD996;}
.mainContent .conTitle .contWrap{width: 350px; display: flex; margin: 0 auto;}
.mainContent .conTitle span{line-height: 70px; font-size: 45px; font-family: 'Nanum Pen Script'; padding-left: 25px;}
.mainContent .conTitle .contImg{width: 65px; height: 65px; text-indent: -9999px;  background-image: url(/today/img/common/infoPhoto.png); background-size: contain; background-repeat: no-repeat;}
.openUCard{width: 95px; height: 40px; margin: 45px 15px 0 0; border: none; border-radius: 7px; font-size: 26px; font-family: 'Nanum Pen Script'; background: #7AB730; float: right; cursor: pointer;}

.galleryBox{width:100%; min-height:435px; height:1500px; padding: 40px 25px; margin-top: 70px; background:#f5f6fa; /* display: flex; justify-content: space-between;*/  box-sizing: border-box;}
.gcardWrap{/*width: 33%;*/width:300px; height:340px; background:#fff; float: left; padding:10px; margin:0 25px 50px 0; border:none; box-sizing: border-box;}
.gcardWrap:nth-of-type(3n){margin-right:0}
.imgBox img{/*width:300px; */ width: 100%; height:225px; object-fit: cover;}
.imgInfo{padding:20px 20px 10px}
.imgInfo h3{font-size: 28px; font-family: 'Nanum Pen Script'; text-align: center; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
.imgInfo p{word-wrap: break-word;width: 100%; line-height: 1.3em; font-size: 20px; font-family: 'Nanum Pen Script'; margin-top:10px; ; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;/*height:45px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;white-space: nowrap;*/}

.register_form{display: none; width: 550px; height: 320px; margin: 50px auto; border: 3.5px solid #7AB730; border-radius: 15px; padding: 20px; position: relative; /*display: flex; justify-content: space-evenly;*/}
.closeUCard, .mdcancle{width: 70px; height: 33px; border: none; border-radius: 7px; background: #fff; border: 3px solid #7AB730; color: #7AB730;font-weight: bolder; position:absolute; bottom: 15px; right: 15px; cursor: pointer;}
#uploadGBtn, .mdBtn{width: 70px; height: 33px; border: none; border-radius: 7px; background: #7AB730; position:absolute; bottom: 15px; right: 100px; cursor: pointer;}
.galInfo{width: 250px; padding-top: 20px;}
.InfoList{width: 100%; height: 200px; background: #fff; border-radius: 10px; margin-top: 25px;  box-sizing: border-box;}
#gtitle{width:100%; height:40px; border:1px solid #d1d1d1; box-shadow: 0 0 11px 0 #e8e8e8; font-size: 21px; font-family: 'Nanum Pen Script'; padding-left:15px; box-sizing: border-box;}
#gcontent{resize: none; width: 100%; height: 150px; margin-top:25px; background: none; border: none; box-shadow: 0 0 11px 0 #e8e8e8; font-size: 21px; line-height: 1.5em; font-family: 'Nanum Pen Script'; box-sizing: border-box; padding: 25px 30px;}



</style>
</head>
<body>


<div class="container">   
	<jsp:include page="../common/header.jsp" />
	<main>
	
		<div class="siteInfo">
	        <div class="infoText">
	            <p>반려견 갤러리</p>
	            <p>담아두고 싶은 너의 모든 순간</p>
	        </div>
	    </div>
	    <div class="siteNav">
	        <a href="#"><div class="homeLogo">1</div></a>
	        <ul>
	            <li><a href="#">반려견 생애기록</a></li>
	            <li class="checked"><a href="#">갤러리</a></li>
	        </ul>
	    </div>
	
	    <div class="otherWrap" style="width: 1150px;">
	        <div class="otherP">
	            <P>세상에서 가장 사랑스러운</P>
	            <!--<h1>다른 반려동물 보러 놀러가기</h1> -->
	            <p>우리 아이 특별한 사진전</p>
	    	</div>
	    </div>
	
		
		<div class="mainContent">
	        <div class="conTitle">
	            <div class="contWrap">
	                <div class="contImg">img</div>
	                <span>${login.pet.petName} 갤러리</span>
	            </div>
	        </div>
	
	        <div><button class="openUCard">+ 사진추가</button></div>
	        
	        <div class="register_form">
	            <button id="uploadGBtn">등록</button>
	        	<button class="closeUCard">접기</button>
				<div class="flex-container">       
	               <div class="wrapper">
	                   <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
	                   <label for="file" class="upload-btn">
	                       <input id="file" name="file" type="file" accept="image/*" />
	                       <span>Upload Image</span>
	                   </label>
	               </div>
	            </div>
	            <div class="galInfo">
	                  <input type="text" id="gtitle" placeholder="title" required>
	                  <textarea id="gcontent" placeholder="사진 설명이 있다면 적어주세요."></textarea>
	                  <input type="hidden" name="petId" value="${login.pet.petId}">
	        	</div>
	       </div>
	        	        
	        
	        <!-- 갤러리 들어갈 공간 -->	                	   		     
	        <div class="galleryBox">
				<c:if test="${galleryList.size() > 0}">
					<c:forEach var="imgCard" items="${galleryList}">			
			            <div class="gcardWrap">		              
		                    <div class="imgBox">
		                        <img alt="gallery_image" src="<c:url value='${imgCard.imagePath}'/>">			                        
		                    </div>
		                    <div class="imgInfo">
								<h3>${imgCard.title}</h3>
								<p>${imgCard.content}</p>			                       		                        
		                    </div>
		                    <button class="modifyCardBtn" title="수정" href="${card.cardId}">수정</button>
					        <button class="deleteCardBtn" title="삭제" href="${card.cardId}">삭제</button>  	                    		               
			            </div>
					</c:forEach>
				</c:if>	
			</div>
	        
	        
	        
	        
	   </div>
	
	
	</main>
</div>


    
    

           
	            
	
	<!-- 갤러리 수정 모달 -->
	<div class="mdpop" style="position: fixed; top: 0; left: 0; width:100%; height:100%; background:rgba(0,0,0,0.7); display:none; text-indent:-9999px"></div>
	<div class="modifyCard">
        <button href="" class="mdBtn">저장</button>
        <button href="" class="mdcancle">취소</button>
        <div class="flex-container">
            <div class="wrapper">
                <img src="" id="mdImage-box">
                <label for="modifyFile" class="upload-btn">
                    <input id="modifyFile" type="file" accept="image/*">
                    <span>Upload Image</span>
                </label>
            </div>
        </div>
        <div class="galInfo">
             <input type="text" id="mdGtitle" required>
             <textarea id="mdGCont"></textarea>
       	</div>        
    </div> 
			

			
				
			
				
			
            
<jsp:include page="../common/footer.jsp" />     
</body>

    <script type="text/javascript">      
    
        
     	// 등록카드 여닫기(갤러리)
	     $(".openUCard").click(function(){           
	         $(".register_form").css("display","flex");
	         $(".register_form").css("justify-content","space-evenly");
	         $(this).css("display","none");
	     })
	
	     $(".closeUCard").click(function(){
	         $(".register_form").css("display","none");
	         $(".openUCard").css("display","inline-block");
	     })
        
        
	     
	     // 파일업로드(추가(중복))
	    const fileDOM = document.querySelector('#file');
	    const previews = document.querySelectorAll('.image-box');

	    fileDOM.addEventListener('change', () => {
	      const reader = new FileReader();
	      reader.onload = ({ target }) => {
	        previews[0].src = target.result;
	      };
	      reader.readAsDataURL(fileDOM.files[0]);
	    });
		
	    
	    
	    // 파일업로드(수정(중복))
	    const fileDOM2 = document.querySelector('#modifyFile');
	    const MdPreviews = document.querySelector('#mdImage-box');

	    fileDOM2.addEventListener('change', () => {
    	  const imageSrc = URL.createObjectURL(fileDOM2.files[0]);
    	  MdPreviews.src = imageSrc;
    	});
	    
		
	    
	    
	    
	 	// 갤러리 추가     
        $("#uploadGBtn").click(function(){
            //formData 객체 생성
            let formData = new FormData();
        	formData.append("petImg", $("input[name=file]")[0].files[0]);
        	
        	// 넘겨줄 반려동물 데이터
        	//enter => <br>
			let title = $("#gtitle").val();
			if(!title || title.replace(/\s| /gi, "").length==0){ // null값이거나 공백만 입력한 경우
				alert("내용을 입력해주세요.");
				$("#gtitle").focus();
			    return false;
			}
        	
			let content = $("#gcontent").val();		
			content = content.replace(/(?:\r\n|\r|\n)/g, '<br>');			
			
        	let petData = {
        			"petId": "${login.pet.petId}",
        			"title": title,
        			"content": content
        	}
        	
        	// formData에 json타입으로 petData 추가
        	formData.append("petData", new Blob([ JSON.stringify(petData) ], {type : "application/json"}));
        	
        	// ajax 처리
        	$.ajax({
        		  type: "POST",
        	      url: "/today/mypet/regGallery",
        	      data: formData,
        	      dataType: "text",
        	      contentType: false,               // * 중요 *
        	      processData: false,               // * 중요 *
        	      enctype : 'multipart/form-data',  // * 중요 *
        	      success: function(result) { 
                      console.log("통신 성공!: ");
                      if(result === "success") {
                          alert("갤러리가 추가되었습니다.");
                          window.location.reload();
                      } else {
                          alert("갤러리 추가에 실패했습니다.");
                      }
                  }, 
                  error: function() {
                	  alert("갤러리 추가에 실패했습니다.");
                  } 
        	});
        }) 
	    
	    
	    
	    
	    // 갤러리 수정 불러오기 요청		
		$(document).on("click", ".수정버튼", function () {
			
			//초기화
			$("#modifyFile").value = null;
			$("#mdGtitle").val("");
			$("#mdGCont").val("");
			
		    let imgId = $(this).attr("href");
            
    		let gallery = {imgId: imgId};
    		
    		$.ajax({
                type: 'post',
                dataType : "json",
                contentType: 'application/json',
                url: '/today/mypet/modifyGalleryGet',
                data: JSON.stringify(gallery),
                success: function (response) {
                	console.log(response); // GalleryVO 
                   		
                		let imgId = response['imgId'];
                    	let imagePath = "/today" + response['imagePath'];
                		let title = response['title'];
                		let content = response['content'];
                		content = content.replaceAll("<br>", "\r\n");
 
                        $(".mdpop").css("display","block");
                        $(".modifyCard").css("display","flex").css("justify-content","space-evenly");
                        $(".mdBtn").attr("href", cardId);
                        $(".mdcancle").attr("href", cardId);
                        $("#mdImage-box").attr("src", imagePath);
                        $("#mdGtitle").val(title);
                        $("#mdGCont").val(content);                                          
                }, 
                error: function() {
                    console.log("통신 실패"); 
                } 
            });
        })
	    
	    
	    
        $(function(){
			
        	/*
            $("#uploadBtn").click(function(){
                $("#register_form").css("display", "flex");
            })

            $("#closeForm").click(function(){
                $("#register_form").css("display", "none");
                $("#gform")[0].reset();
                $(".image-box").attr("src","https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg")
            })
            */

        })



        


    </script>   
</html>