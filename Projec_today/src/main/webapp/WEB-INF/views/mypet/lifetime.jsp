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
        .mainContent{width: 1000px; margin: 0 auto; min-height: 250px;}
        .mainContent .conTitle{width: 1000px; margin: 0 auto; background:#BBD996;}
        .mainContent .conTitle .contWrap{width: 350px; display: flex; margin: 0 auto;}
        .mainContent .conTitle span{line-height: 70px; font-size: 45px; font-family: 'Nanum Pen Script'; padding-left: 25px;}
        .mainContent .conTitle .contImg{width: 65px; height: 65px; text-indent: -9999px;  background-image: url(/today/img/common/infoPhoto.png); background-size: contain; background-repeat: no-repeat;}
    
        .uploadCard{display: none; width: 650px; height: 320px; margin: 50px auto; border: 3.5px solid #7AB730; border-radius: 15px; padding: 20px; position: relative; /*display: flex; justify-content: space-evenly;*/}
        .openUCard{width: 125px; height: 50px; margin-top: 35px; border: none; border-radius: 7px; font-size: 32px; font-family: 'Nanum Pen Script'; background: #7AB730; float: right; cursor: pointer;}
        .closeUCard{width: 70px; height: 33px; border: none; border-radius: 7px; background: #fff; border: 3px solid #7AB730; color: #7AB730;font-weight: bolder; position:absolute; bottom: 15px; right: 15px; cursor: pointer;}
        .uploadCard input[type=submit]{width: 70px; height: 33px; border: none; border-radius: 7px; background: #7AB730; position:absolute; bottom: 15px; right: 100px; cursor: pointer;}
        #uploadCardBtn{width: 70px; height: 33px; border: none; border-radius: 7px; background: #7AB730; position:absolute; bottom: 15px; right: 100px; cursor: pointer;}
        .lifeCardInfo{width: 350px; padding-top: 20px;}
        .lifeCardInfo input[type=date]{width: 230px; font-size: 18px; font-family: "NanumSquare","맑은 고딕", sans-serif; text-align: center; margin-left: 65px;}        
        .InfoList{width: 350px; height: 165px; background: #fff; border-radius: 10px; margin-top: 25px;  box-sizing: border-box;}
        /*.InfoList ul{padding-left: 10px;}
        .InfoList ul li{margin: 30px 0;}
        .lifeCardInfo input[type=text]{width: 100%; border: 2px solid #eee; font-size: 21px; font-family: 'Nanum Pen Script'}*/
        .InfoList textarea{resize: none; width: 100%; height: 100%; background: none; border: none; box-shadow: 0 0 11px 0 #e8e8e8; font-size: 21px; font-family: 'Nanum Pen Script'; box-sizing: border-box; padding: 25px 30px;}
    
    	.lifetimeBox{width:900px; margin: 50px auto;}
    	.lifetimeCard{width:650px; height: 280px; position: relative; display: flex; justify-content: space-evenly;}
    	.lifecardbullet{width:80px; height: 80px; position: absolute; top: 100px; left:0; background-image: url(/today/img/community/cbullet.png); background-size: contain; background-repeat: no-repeat; text-indent: -9999px;}
    	.modifyCardBtn{position: absolute; top: 20px; right:30px;}
    	.deleteCardBtn{position: absolute; top: 20px; right:10px;}
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
			 
	
	        <!--
	        <div class="lifetimeCard">
	            <button class="modifyCardBtn">수정</button>
	            <button class="deleteCardBtn">삭제</button>   
	            <div class="petImage">
	                <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width="220px" height="220px" />
	            </div>
	            <div class="lifeCardInfo">
	                <p>2020.01.01</p>
	                <div class="InfoList">
	                    <ul>
	                        <li>처음 만난 날</li>
	                        <li>가족이 된 꼬물이</li>
	                    </ul>
	                </div>  
	            </div>
	        </div>
	        -->

	    </div>
	    
	    
	    <div class="lifetimeBox">
		    <!-- 생애기록 카드가 들어갈 공간 -->
		    <c:if test="${cards.size() > 0}">
					<c:forEach var="card" items="${cards}">
					    <div class="lifetimeCard">
					    	<div class="lifecardbullet">1</div>
				            <button class="modifyCardBtn">수정</button>
				            <button class="deleteCardBtn">삭제</button>   
				            <div class="petImage">
				                <img alt="pet_image" src="<c:url value='${card.imagePath}'/>" width="220px" height="220px" />
				            </div>
				            <div class="lifeCardInfo">
				                <p><fmt:formatDate value="${card.date}" pattern="yyyy. MM. dd" /></p>
				                <div class="InfoList">
				                    ${card.content}
				                </div>  
				            </div>
				        </div>
			        </c:forEach>
			</c:if>
		</div>	        
	    
	    
	    <!--  
		<table>
			<c:if test="${cards.size() > 0}">
				<c:forEach var="card" items="${cards}">
					<tr style="color: #ff52a0;">
											
						<td>
							<img alt="pet_image" src="<c:url value='${card.imagePath}'/>" width="40px" height="40px">
						</td>
																																	  
						<td>${card.content}</td>
				
						<td>
							<fmt:formatDate value="${card.date}" pattern="yyyy. MM. dd" />							
						</td>
			
					</tr>
				</c:forEach>
			</c:if>
			
		</table>
		-->
	
	</main>    

	
	
	<!-- 

	<form action="<c:url value='/mypet/uploadCard'/>" method="post" enctype="multipart/form-data">

	     <div id="uploadcard">       
	        <div class="photo">
	            <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
	            <label for="file" class="upload-btn">
	                <input id="file" name="file" type="file" accept="image/*" />
	                <span>Upload Image</span>
	            </label>
	        </div>
	        <div>
	            <input type="submit" value="등록"><br>
	            <input type="date" id="date" name="Ldate" required> <br>
	            <input type="hidden" name="petId" value="${login.pet.petId}">
	            <textarea rows="5" cols="15" id="content" name="content" required></textarea>
	        </div>
	    </div>
	    
	</form>
	 -->
	
	
	
<!-- 생애기록 카드가 들어갈 공간 -->
<!--  
<table>
	<c:if test="${cards.size() > 0}">
		<c:forEach var="card" items="${cards}">
			<tr style="color: #ff52a0;">
									
				<td>
					<img alt="pet_image" src="<c:url value='${card.imagePath}'/>" width="40px" height="40px">
				</td>
																															  
				<td>${card.content}</td>
		
				<td>
					<fmt:formatDate value="${card.date}" pattern="yyyy. MM. dd" />							
				</td>
	
			</tr>
		</c:forEach>
	</c:if>
	
</table>
	-->
	
</div> 	
	

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
     	
	     
	     
	     
	   // 생애기록 카드 이벤트    
        $("#uploadCardBtn").click(function(){
            //formData 객체 생성
            let formData = new FormData();
        	formData.append("petImg", $("input[name=file]")[0].files[0]);
        	
        	// 넘겨줄 반려동물 데이터
        	//enter => <br>
			let text = $("#lifetimeCont").val();
			text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
        	
        	let petData = {
        			"petId": "${login.pet.petId}",
        			"content": text,
        			"date": $("#date").val()
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
	     
	     
	     
		
	     
	    // 파일업로드(중복)
        const fileDOM = document.querySelector('#file');
        const previews = document.querySelectorAll('.image-box');

        fileDOM.addEventListener('change', () => {
        const imageSrc = URL.createObjectURL(fileDOM.files[0]);
        previews[0].src = imageSrc;
        });
        // 이거 가능하면 제이쿼리로 바꿔보자ㅠ
     </script>

<jsp:include page="../common/footer.jsp" />

</body>
</html>