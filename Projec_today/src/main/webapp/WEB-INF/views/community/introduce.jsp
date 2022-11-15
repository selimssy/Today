<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	.container{width: 1200px; margin: 0 auto;}
    .Myintro{width: 700px; height: 380px; border: 1px solid #7AB730; margin: 0 auto;}
    .Myintro h2{background: rgba(122, 183, 48, 0.5); margin: 0; padding: 10px; text-align: center;}
    .Myintro .modify{float: right;}
    .Myintro .modify img{width:25px; height:25px;}
    .Myintro .MyPetPhoto img{border-radius: 50%; padding:20px}
    .Mycontent{display: flex; justify-content:space-between; padding:20px;}
    .Mycontent .MyPetinfo{padding-right: 10px;}
    .Mycontent .MyPetinfo li{font-size: 1.3em; line-height: 40px;}
    .MyPetinfo li:last-of-type{padding-top: 15px;}
    .Mycontent .MyPetinfo li a{text-decoration: none; color: transparent;}
    .Mycontent .MyPetinfo li:first-of-type{font-size: 1.6em; line-height: 80px;}
    .Mycontent .MyPetinfo li a{padding: 15px; background-origin:content-box}
    .Mycontent .MyPetinfo li a:nth-of-type(1){background-image:url(/today/img/community/instagram.png); background-size: cover; background-repeat: no-repeat;}
    .Mycontent .MyPetinfo li a:nth-of-type(2){background-image:url(/today/img/community/youtube.png); background-size: cover; background-repeat: no-repeat;}
	#petMf_modal{display:none}
	
	.flex-container {display: flex;}
    .wrapper {text-align: center;flex-grow: 1;}        
    .image-box {width: 200px;height: 200px;object-fit: cover;display: block;margin: 20px auto;}
    .upload-btn {border: 1px solid #ddd; padding: 6px 12px;display: inline-block; cursor: pointer;}
    input[type=file] {display: none;}
    
    .otherP{width: 100%; border-left: 5px solid #7AB730; margin: 0 auto; margin-left: 50px; padding-left: 30px;}
    .PCards{padding: 20px;  /*display: flex; justify-content: space-between;*/  box-sizing: border-box;}
    .PCards .cardWrap{width: 24.999%; float: left; padding: 20px; box-sizing: border-box;}
     .PCards .cardWrap .OPcard{width: 100%;  box-sizing: border-box; border: 5px solid #BCDB97; border-radius: 20px; }
    .PCards .cardWrap .OPcard .cardTop{background: rgba(188, 219, 151, 0.5); display: flex; justify-content: space-between; box-sizing: border-box;}
    .PCards .cardTop h3{margin: 0; line-height: 55px; width: 45%; text-align: center; font-size: 1.5em; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
     .PCards .cardTop .cBullet{width: 20%; height: 40px; background-image: url(/today/img/community/cbullet.png); background-size: contain; background-repeat: no-repeat; margin-left: 10px; margin-top: 5px;}
    .cLink{list-style: none; padding-left: 0;}
    .cLink li{display: inline-block; margin: 0 5px;}
    .cLink li a{text-decoration: none; color: transparent;}
     .cLink li:nth-of-type(1){padding: 0 5px; background-image:url(/today/img/community/instagram.png); background-size: contain; background-repeat: no-repeat;}
    .cLink li:nth-of-type(2){padding: 0 5px; background-image:url(/today/img/community/youtube.png); background-size: contain; background-repeat: no-repeat;}
    .PCards .cardBody img{width: 100%; height: 160px; object-fit: cover;  box-sizing: border-box;}
    .PCards .cardBody ul{padding-left: 0; margin:5px 0 10px 30px; list-style: none;}
    .PCards .cardBody ul li{font-size: 20px; padding: 3px;}
    .PCards .cardBody ul li::before{content: "• "; font-size: 25px;}
    .PCards .cardBody ul li:last-of-type{overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
</style>
</head>
<body>
	
	<div class="container">
	
		<div class="Myintro">

	        <h2>내 반려견 소개란</h2>
	        <div class="Mycontent">
	            <div class="MyPetPhoto">
		            <img src="<c:url value='${pet.imagePath}'/>" width="250px" height="250px">
		        </div>
	            <div class="MyPetinfo">
	                <ul>
	                    <li>이름: ${pet.petName}</li>
	                    <li>나이: ${pet.age}살</li>
	                    <li>특징: ${pet.feature}</li>
	                    <li>공개 여부: <c:if test="${pet.open == 1}">
	                    				<label>공개</label><input type="radio" checked onclick="return(false);">
                                		<label>비공개</label><input type="radio" onclick="return(false);">
									</c:if>
									<c:if test="${pet.open == 0}">
	                    				<label>공개</label><input type="radio" onclick="return(false);">
                                		<label>비공개</label><input type="radio" checked onclick="return(false);">
									</c:if>
	                    </li>
	                    <li>
	                    	<c:if test="${empty pet.instagram}">
							</c:if>
							<c:if test="${not empty pet.instagram}">
								<a href="${pet.instagram}" target="_blank"><span>1</span></a>
							</c:if>
							<c:if test="${empty pet.youtube}">
							</c:if>
							<c:if test="${not empty pet.youtube}">
								<a href="${pet.youtube}" target="_blank"><span>1</span></a>
							</c:if>                    	
	                    </li>
	                </ul>
	            </div>
	            <div class="modify"><a id="modifyPet" href="javascript:;"><img src="<c:url value='/img/community/modify.png'/>"></a></div>
	        </div>       
	    </div>
		
		
		
		<div class="otherP">
            <P>우리 아이 보러 놀러오세요~</P>
            <h1>다른 반려동물 보러 놀러가기</h1>
        </div>

	
	
		<!-- 반려동물 카드가 들어갈 공간 -->	
		<c:if test="${petList.size() <= 0}">		
			<strong>검색 결과가 없습니다.</strong>			
		</c:if>
		
		
		<div class="PCards">
			<c:if test="${petList.size() > 0}">
				<c:forEach var="petVO" items="${petList}">			
		            <div class="cardWrap">
		                <div class="OPcard">
		                    <div class="cardTop">
		                        <div class="cBullet"></div>
		                        <h3>${petVO.petName}</h3>
		                        <ul class="cLink">
		                        	<c:if test="${empty petVO.instagram}">
									</c:if>
									<c:if test="${not empty petVO.instagram}">
										<li><a href="${petVO.instagram}" target="_blank">1</a></li>
									</c:if>
		                        	<c:if test="${empty petVO.youtube}">
									</c:if>
									<c:if test="${not empty petVO.youtube}">
										<li><a href="${petVO.youtube}" target="_blank">1</a></li>
									</c:if>   	                            
		                        </ul>  
		                    </div>
		                    <div class="cardBody">
		                        <img src="<c:url value='${petVO.imagePath}'/>">
		                        <ul>
		                            <li>성별: ${petVO.gender}</li>
		                            <li>나이: ${petVO.age}살</li>
		                            <li>특징: ${petVO.feature}</li>                        
		                        </ul>
		                    </div>  	                    
		                </div>
		            </div>
				</c:forEach>
			</c:if>	
		</div>		
			
		
		
	   
		
		
   </div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	 <!-------------------------------------- 빈려동물 정보 수정 모달 ----------------------------------------->
    <div id="petMf_modal">
        <div class="modal_header">
            <h2 class="modal-title">
                <span class="modal_logo">오늘의 너</span> 반려동물 정보 수정
            </h2>
            <button type="button" class="modal_close">X</button> <!--닫기 버튼-->
        </div>
        <div class="modal_body" >
            <form method="post" id="petRgForm">
                <table class="modal_table">
                    <tr>
                        <div class="flex-container">       
                            <div class="wrapper">
                                <img src="<c:url value='${pet.imagePath}'/>" class="image-box" />
                                <label for="file" class="upload-btn">
                                    <input id="file" type="file" name="file" accept="image/*" />
                                    <span>Upload Image</span>
                                </label>
                            </div>
                        </div>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>반려동물 이름</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="pet_name" class="modal_input" value="${pet.petName}"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>나이</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="age" class="modal_input" value="${pet.age}"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>성별</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <c:if test="${pet.gender == '남'}">
                   				<label><input type="radio" name="gender" value="남" checked> 남</label>
                            	<label><input type="radio" name="gender" value="여"> 여</label>
							</c:if>
							<c:if test="${pet.gender == '여'}">
                   				<label><input type="radio" name="gender" value="남"> 남</label>
                            	<label><input type="radio" name="gender" value="여" checked> 여</label>
							</c:if>
                        </td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>특징</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="feature" class="modal_input" value="${pet.feature}"></td>
                    </tr>
                  
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>인스타그램</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                    	<td>
							<input type="url" id="instagram" value="${pet.instagram}">
                    	</td>
                    </tr>
                    
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>유튜브</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                    	<td>
							<input type="url" id="youtube" value="${pet.youtube}">
                    	</td>
                    </tr>  
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>반려동물 공개 여부</strong>
                            </p>
                        </td>
                    </tr>            
                  	<tr>
                        <td>
                            <c:if test="${pet.open == 1}">
                   				<label>공개</label><input type="radio" name="open" value="1" checked>
                              	<label>비공개</label><input type="radio" name="open" value="0">
							</c:if>
							<c:if test="${pet.open == 0}">
                   				<label>공개</label><input type="radio" name="open" value="1">
                              	<label>비공개</label><input type="radio" name="open" value="0" checked>
							</c:if>
                        </td>
                    </tr>                
                    <tr>
                        <td>
                            <button type="button" id="petMf-btn" class="m_button">저장</button>
                        </td>
                    </tr>
                </table>
            </form >
        </div>
    </div>
	
	
	
	
	<script type="text/javascript">
		
		// 반려동물 정보 수정 모달 열기 
	    $("#modifyPet").click(function(){
	        $("#petMf_modal").css("display","block");
	    })
	    
	    
	    // 반려동물 수정 버튼 이벤트
        $("#petMf-btn").click(function(){
            //formData 객체 생성
            let formData = new FormData();
        	formData.append("petImg", $("input[name=file]")[0].files[0]);
        	// 넘겨줄 반려동물 데이터
        	let petData = {
        			"petId": "${login.pet.petId}",
        			"petName": $("#pet_name").val(),
        			"age": $("#age").val(),
        			"gender": $("input[name='gender']:checked").val(),
        			"feature": $("#feature").val(),
        			"instagram": $("#instagram").val(),
        			"youtube": $("#youtube").val(),
        			"open": $("input[name='open']:checked").val()
        	}
        	
        	// formData에 json타입으로 petData 추가
        	formData.append("petData", new Blob([ JSON.stringify(petData) ], {type : "application/json"}));
        	
        	// ajax 처리
        	$.ajax({
        		  type: "POST",
        	      url: "/today/user/modifyPet",
        	      data: formData,
        	      dataType: "text",
        	      contentType: false,               
        	      processData: false,              
        	      enctype : 'multipart/form-data',  
        	      success: function(result) { 
                      console.log("통신 성공!: ");
                      if(result === "success") {
                          alert("반려동물 정보 수정이 완료되었습니다.");
                          location.href="/today/community/intro";
                      } else {
                          alert("반려동물 정보 수정에 실패했습니다.");
                      }
                  }, 
                  error: function() {
                      console.log("통신 실패!");
                  } 
        	});
        })   
	
	</script>
	
	
	
	
</body>
</html>