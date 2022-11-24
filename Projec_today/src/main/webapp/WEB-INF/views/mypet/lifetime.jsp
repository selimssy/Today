<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <style>
		
		*{margin: 0; padding: 0;}
        .container{width: 100%; margin: 0 auto;}
        /*배경 변경*/
		.siteInfo{width: 1200px; height: 450px; background-image: url(/today/img/common/mainbg1.png); margin: 0 auto;  position: relative;}      
        .mainContent{width: 1000px; margin: 0 auto; min-height: 160px;}
        .mainContent .conTitle{width: 1000px; margin: 0 auto; background:#BBD996;}
        .mainContent .conTitle .contWrap{width: 350px; display: flex; margin: 0 auto;}
        .mainContent .conTitle span{line-height: 70px; font-size: 45px; font-family: 'Nanum Pen Script'; padding-left: 25px;}
        .mainContent .conTitle .contImg{width: 65px; height: 65px; text-indent: -9999px;  background-image: url(/today/img/common/infoPhoto.png); background-size: contain; background-repeat: no-repeat;}
    
        .uploadCard, .modifyCard{display: none; width: 650px; height: 320px; margin: 50px auto; border: 3.5px solid #7AB730; border-radius: 15px; padding: 20px; position: relative; /*display: flex; justify-content: space-evenly;*/}
        .openUCard{width: 125px; height: 50px; margin-top: 35px; border: none; border-radius: 7px; font-size: 32px; font-family: 'Nanum Pen Script'; background: #7AB730; float: right; cursor: pointer;}
        .closeUCard, .mdcancle{width: 70px; height: 33px; border: none; border-radius: 7px; background: #fff; border: 3px solid #7AB730; color: #7AB730;font-weight: bolder; position:absolute; bottom: 15px; right: 15px; cursor: pointer;}
        .uploadCard input[type=submit]{width: 70px; height: 33px; border: none; border-radius: 7px; background: #7AB730; position:absolute; bottom: 15px; right: 100px; cursor: pointer;}
        #uploadCardBtn, .mdBtn{width: 70px; height: 33px; border: none; border-radius: 7px; background: #7AB730; position:absolute; bottom: 15px; right: 100px; cursor: pointer;}
        .lifeCardInfo{width: 350px; padding-top: 20px;}
        .lifeCardInfo input[type=date]{width: 230px; font-size: 18px; font-family: "NanumSquare","맑은 고딕", sans-serif; text-align: center; margin-left: 65px;}        
        .InfoList{width: 350px; height: 165px; background: #fff; border-radius: 10px; margin-top: 25px;  box-sizing: border-box;}
        /*.InfoList ul{padding-left: 10px;}
        .InfoList ul li{margin: 30px 0;}
        .lifeCardInfo input[type=text]{width: 100%; border: 2px solid #eee; font-size: 21px; font-family: 'Nanum Pen Script'}*/
        .InfoList textarea{resize: none; width: 100%; height: 100%; background: none; border: none; box-shadow: 0 0 11px 0 #e8e8e8; font-size: 21px; line-height: 1.5em; font-family: 'Nanum Pen Script'; box-sizing: border-box; padding: 25px 30px;}
    
    	.lifetimeBox{width:550px; margin: 50px auto;}
    	.lifetimeCard{width:550px; height: 200px; position: relative; display: flex; justify-content: space-evenly; margin-bottom:80px}
    	.lifecardbullet{width:45px; height: 45px; position: absolute; top: 75px; left:-85px; background-image: url(/today/img/community/cbullet.png); background-size: contain; background-repeat: no-repeat; text-indent: -9999px;}
    	.modifyCardBtn{display:none; width:16px; position: absolute; top: 15px; right:30px; border:none; background-color: transparent; background-image: url(/today/img/mypet/modify.png); background-size: contain; background-repeat: no-repeat; color: transparent; cursor: pointer;}
    	.deleteCardBtn{display:none; width:16px; position: absolute; top: 15px; right:7px; border:none; background-color: transparent; background-image: url(/today/img/mypet/delete.png); background-size: contain; background-repeat: no-repeat; color: transparent; cursor: pointer;}
    	.lifetimeCard img{width:200px; height:200px;  object-fit: cover; border-radius: 7px;}
    	.cardInfo{width:350px; height: 200px; box-shadow: 0 0 15px 0 #e8e8e8; background: #F7F7F7; padding: 20px; margin-left: 25px; box-sizing: border-box;}
    	.cardInfo p{background-image: url(/today/img/mypet/cal.png); background-size: contain; background-repeat: no-repeat; padding-left: 27px;}
    	.InfoText{background:none; font-family: 'Nanum Pen Script'; font-size: 24px;  line-height: 1.7em; padding: 20px 15px 0; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
    	.modifyCard{display:none; /*width: 550px; height: 320px;*/ background:#fff; border: 3.5px solid #777; /*border-radius: 15px; padding: 15px; */
    	/*position: relative; display: flex; justify-content: space-evenly; margin: 50px auto; box-sizing: border-box;*/ 
    	position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;}
    	/*.modifyCard img{width: 200px; height: 200px; object-fit: cover; display: block; margin: 20px auto;}
    	.modifyCard textarea{width: 280px; height: 145px}
    	.modifyCard .lifeCardInfo, .modifyCard .InfoList{width: 280px;}
    	.modifyCard input[type=date]{width:200px; margin-left: 35px}
    	.modifyCard button{width:55px; height:28px}
    	.modifyCard button:nth-of-type(1){position: absolute; right: 80px}*/
    </style>
</head>

<body>

<div class="container">   
	<jsp:include page="../common/header.jsp" />
	<main>
	    <div class="siteInfo">
	        <div class="infoText">
	            <p>반려견 생애 기록</p>
	            <p>잊을 수 없는 너의 특별했던 순간</p>
	        </div>
	    </div>
	    <div class="siteNav">
	        <a href="#"><div class="homeLogo">1</div></a>
	        <ul>
	            <li class="checked"><a href="#">반려견 생애 기록</a></li>
	            <li><a href="#">갤러리</a></li>
	        </ul>
	    </div>
	
	    <div class="otherWrap">
	        <div class="otherP">
	            <P>기억하고 싶은 너의 시간</P>
	            <!--<h1>다른 반려동물 보러 놀러가기</h1> -->
	            <p>우리 아이의 특별했던 순간들</p>
	    </div>
	    </div>
	
	
	    <div class="mainContent">
	        <div class="conTitle">
	            <div class="contWrap">
	                <div class="contImg">img</div>
	                <span>${login.pet.petName} 생애 기록</span>
	            </div>
	        </div>
	
	        <div><button class="openUCard">+ 기록추가</button></div>
	
			
	        	<div class="uploadCard">        			            
		            <button id="uploadCardBtn">등록</button>
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
		            <div class="lifeCardInfo">
		            	
		                <input type="date" id="date" name="Ldate" required>
		                <div class="InfoList">
		                    <textarea name="content" id="lifetimeCont" required placeholder="특별한 순간의 설명을 적어주세요."></textarea>
		                </div>  
		            </div>		    	       
	        	</div>
	    </div>
	    
	    
	    
	    <!-- 생애기록 카드가 들어갈 공간 -->
	    <div class="lifetimeBox">
		    <c:if test="${cards.size() > 0}">
					<c:forEach var="card" items="${cards}">
						<div id="cardWrap${card.cardId}">
						    <div class="lifetimeCard" id="card${card.cardId}">
						    	<div class="lifecardbullet">1</div>				    	
					            <button class="modifyCardBtn" title="수정" href="${card.cardId}">수정</button>
					            <button class="deleteCardBtn" title="삭제" href="${card.cardId}">삭제</button>   
					            <div class="petImage">
					            	<c:if test="${not empty card.imagePath}">
					                	<img alt="pet_image" src="<c:url value='${card.imagePath}'/>" />
					            	</c:if>
					            	<c:if test="${empty card.imagePath}">
					                	<img alt="pet_image" src="<c:url value='/img/common/no_image.webp'/>" />
					            	</c:if>
					            </div>
					            <div class="cardInfo">
					                <p><fmt:formatDate value="${card.date}" pattern="yyyy. MM. dd" /></p>
					                <div class="InfoText">
					                    ${card.content}
					                </div>  
					            </div>			            
					        </div>					        
				        </div>
			        </c:forEach>
			</c:if>
		</div>	          
	
	</main>  
	 
	 
	 
	
	  
</div> 	
	
	<!-- 생애기록 수정 모달 -->
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
        <div class="lifeCardInfo">
            <input type="date" id="modifydate" name="Ldate" value="" required>
            <div class="InfoList">
                <textarea name="content" id="modifyCont" required></textarea>
            </div>
        </div>
    </div> 
    


<jsp:include page="../common/footer.jsp" />

</body>


     <script type="text/javascript">
   
    	  
    	 // 등록카드 여닫기
	     $(".openUCard").click(function(){           
	         $(".uploadCard").css("display","flex");
	         $(".uploadCard").css("justify-content","space-evenly");
	         $(this).css("display","none");
	     })
	
	     $(".closeUCard").click(function(){
	         $(".uploadCard").css("display","none");
	         $(".openUCard").css("display","inline-block");
	     })
     	
	     
	    /*
	    // 파일업로드(추가)
        const fileDOM = document.querySelector('#file');
        const previews = document.querySelectorAll('.image-box');

        $(document).on("change", fileDOM, function () {
            let imageSrc = URL.createObjectURL(fileDOM.files[0]);
            previews[0].src = imageSrc;
        })
        
        
        // 파일업로드(수정)
        const MdFileDOM = document.querySelector('#modifyFile');
        const MdPreviews = document.querySelector('#mdImage-box');
		
        
        $(document).on("change", MdFileDOM, function () {
            let imageSrc = URL.createObjectURL(MdFileDOM.files[0]);
            MdPreviews.src = imageSrc;
        })
	    */
	    
	    
	    
	    const fileDOM = document.querySelector('#file');
	    const previews = document.querySelectorAll('.image-box');

	    fileDOM.addEventListener('change', () => {
	      const reader = new FileReader();
	      reader.onload = ({ target }) => {
	        previews[0].src = target.result;
	      };
	      reader.readAsDataURL(fileDOM.files[0]);
	    });

	    const fileDOM2 = document.querySelector('#modifyFile');
	    const MdPreviews = document.querySelector('#mdImage-box');

	    fileDOM2.addEventListener('change', () => {
    	  const imageSrc = URL.createObjectURL(fileDOM2.files[0]);
    	  MdPreviews.src = imageSrc;
    	});
	    
	    
	    
        
        
     	// 수정, 삭제 버튼 display
        $(".lifetimeCard").hover(function () {
        	$(this).find(".modifyCardBtn").fadeIn("slow")
        	$(this).find(".deleteCardBtn").fadeIn("slow")
        },function(){
        	$(this).find(".modifyCardBtn").fadeOut("fast")
        	$(this).find(".deleteCardBtn").fadeOut("fast")
        }) 
	     
	     
        
	    // 생애기록 카드 추가     
        $("#uploadCardBtn").click(function(){
            //formData 객체 생성
            let formData = new FormData();
        	formData.append("petImg", $("input[name=file]")[0].files[0]);
        	
        	// 넘겨줄 반려동물 데이터
        	//enter => <br>
			let text = $("#lifetimeCont").val();
			if(!text || text.replace(/\s| /gi, "").length==0){ // null값이거나 공백만 입력한 경우
				alert("내용을 입력해주세요.");
				$("#lifetimeCont").focus();
			    return false;
			}
			text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
        	
			let date = $("#date").val();
			if(!date){ // 날짜 null값
				alert("날짜를 입력해주세요.");
			    return false;
			}
			
        	let petData = {
        			"petId": "${login.pet.petId}",
        			"content": text,
        			"date": date
        	}
        	
        	// formData에 json타입으로 petData 추가
        	formData.append("petData", new Blob([ JSON.stringify(petData) ], {type : "application/json"}));
        	
        	// ajax 처리
        	$.ajax({
        		  type: "POST",
        	      url: "/today/mypet/uploadCard",
        	      data: formData,
        	      dataType: "text",
        	      contentType: false,               // * 중요 *
        	      processData: false,               // * 중요 *
        	      enctype : 'multipart/form-data',  // * 중요 *
        	      success: function(result) { 
                      console.log("통신 성공!: ");
                      if(result === "success") {
                          alert("생애 기록이 추가되었습니다.");
                          window.location.reload();
                      } else {
                          alert("생애 기록 등록에 실패했습니다.");
                      }
                  }, 
                  error: function() {
                	  alert("생애 기록 등록에 실패했습니다.");
                  } 
        	});
        })   
	     
	    
        
        
        // 생애기록 수정 불러오기 요청		
		$(document).on("click", ".modifyCardBtn", function () {
			
			//$("#modifyFile")[0].reset();
			$("#modifyFile").value = null;
			$("#modifyCont").val("");
			$("#modifydate").value = null;
			
			//초기화
            //$(".modifyCard").remove();
			//$(".lifetimeCard").css("display","flex").css("justify-content","space-evenly");
			
		    let cardId = $(this).attr("href");
            console.log(cardId);
            
    		let lifetimeCard = {
    				cardId: cardId
                    };
    		
    		$.ajax({
                type: 'post',
                dataType : "json",
                contentType: 'application/json',
                url: '/today/mypet/modifyGet',
                data: JSON.stringify(lifetimeCard),
                success: function (response) {
                	console.log(response); // lifetimeVO 
                   		
                		let cardId = response['cardId'];
                    	let imagePath = "/today" + response['imagePath'];
                		let date = response['date'];
                		let content = response['content'];
                		content = content.replaceAll("<br>", "\r\n");
 
                        //let temp_html = "<div class='modifyCard'><button href='" + cardId + "' class='mdBtn'>저장</button><button href='" + cardId + "' class='mdcancle'>취소</button><div class='flex-container'><div class='wrapper'><img src='" + imagePath + "' id='mdImage-box' /><label for='modifyFile' class='upload-btn'><input class='modifyFile' id='modifyFile' name='file' type='file' accept='image/*' /><span>Upload Image</span></label></div></div><div class='lifeCardInfo'><input type='date' id='modifydate' name='Ldate' value='" + date + "' required><div class='InfoList'><textarea name='content' id='modifyCont' required >" + content + "</textarea></div></div></div>";
						
                        //$("#card" + cardId).css("display","none");
                        //$('#cardWrap' + cardId).append(temp_html);
                        $(".mdpop").css("display","block");
                        $(".modifyCard").css("display","flex").css("justify-content","space-evenly");
                        $(".mdBtn").attr("href", cardId);
                        $(".mdcancle").attr("href", cardId);
                        $("#mdImage-box").attr("src", imagePath);
                        $("#modifydate").attr("value", date);
                        $("#modifyCont").val(content);
                        
                    
                }, 
                error: function() {
                    console.log("통신 실패!"); 
                } 
            });
        })
        
        
        
        
        //생애기록 수정 취소  
        $(document).on("click", ".mdcancle", function () {
        	let cardId = $(this).attr("href");
        	$("#card" + cardId).css("display","flex").css("justify-content","space-evenly");
        	$(".modifyCard").css("display","none");
        	$(".mdpop").css("display","none");
        	//$("#cardWrap" + cardId + " .modifyCard").remove();
        })
        
        
        
        
        // 생애기록 수정 
        $(document).on("click", ".mdBtn", function () {
  	
        	//formData 객체 생성
            let formData = new FormData();
        	formData.append("petImg", $("#modifyFile")[0].files[0]);
        	
        	// 넘겨줄 반려동물 데이터
        	//enter => <br>
			let text = $("#modifyCont").val();
			if(!text || text.replace(/\s| /gi, "").length==0){ // null값이거나 공백만 입력한 경우
				alert("내용을 입력해주세요.");
				$("#modifyCont").focus();
			    return false;
			}
			text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
        	
			let date = $("#modifydate").val();
			if(!date){ // 날짜 null값
				alert("날짜를 입력해주세요.");
			    return false;
			}
			let cardId = $(this).attr("href");
			
        	let petData = {
        			"cardId": cardId,
        			"content": text,
        			"date": date
        	}
        	
        	// formData에 json타입으로 petData 추가
        	formData.append("petData", new Blob([ JSON.stringify(petData) ], {type : "application/json"}));
        	
        	// ajax 처리
        	$.ajax({
        		  type: "POST",
        	      url: "/today/mypet/modifyCard",
        	      data: formData,
        	      dataType: "text",
        	      contentType: false,               // * 중요 *
        	      processData: false,               // * 중요 *
        	      enctype : 'multipart/form-data',  // * 중요 *
        	      success: function(result) { 
                      console.log("통신 성공!: ");
                      if(result === "success") {
                          alert("생애 기록 수정이 완료되었습니다.");
                          window.location.reload();
                      } else {
                          alert("생애 기록 수정에 실패했습니다.");
                      }
                  }, 
                  error: function() {
                	  alert("생애 기록 수정에 실패했습니다.");
                  } 
        	});
			
        })
    	  
    	  
      
      
	  	 
        
     </script>

</html>