<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
	.container{width: 1000px; margin: 0 auto; position: relative;}
    .Myintro{width: 700px; height: 380px; border: 1px solid #7AB730; margin: 0 auto;}
    .Myintro h2{background: rgba(122, 183, 48, 0.5); margin: 0; padding: 10px; text-align: center;}
    .Myintro .modify{float: right;}
    .Myintro .modify img{width:25px; height:25px;}
    .Myintro .MyPetPhoto img{border-radius: 50%; padding:20px}
    .Mycontent{display: flex; justify-content:space-between; padding:20px;}
    .Mycontent .MyPetinfo{padding-right: 10px;}
    .Mycontent .MyPetinfo li{font-size: 1.3em; line-height: 40px;}
    .MyPetinfo li:last-of-type{padding-top: 15px; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
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
    
    .otherP{width: 100%; height: 130px; border-left: 5px solid #7AB730; margin: 100px 20px 50px; margin-left: 50px; padding-left:30px}
    .otherP p{font-size: 24px; color:#5CAC3D; font-family: 'Nanum Pen Script', cursive;}
    .otherP h1{font-size: 60px; font-family: 'Nanum Pen Script', cursive; margin:20px 0}
    .PCards{padding: 20px;  /*display: flex; justify-content: space-between;*/  box-sizing: border-box;}
    .PCards .cardWrap{width: 33%; float: left; padding: 20px; box-sizing: border-box;}
     .PCards .cardWrap .OPcard{width: 100%;  box-sizing: border-box; border: 5px solid #BCDB97; border-radius: 20px; }
    .PCards .cardWrap .OPcard .cardTop{height:55px; background: rgba(188, 219, 151, 0.5); display: flex; justify-content: space-between; box-sizing: border-box; position: relative;}
    .PCards .cardTop h3{margin: 0; line-height: 55px; width: 45%; text-align: center; font-size: 1.5em; overflow: hidden; text-overflow : ellipsis; white-space: nowrap; position: absolute; left: 70px;}
     .PCards .cardTop .cBullet{width: 20%; height: 40px; background-image: url(/today/img/community/cbullet.png); background-size: contain; background-repeat: no-repeat; margin-left: 10px; margin-top: 5px;}
    .cLink{list-style: none; padding-left: 0;}
    .cLink li{display: inline-block; margin: 0 5px;}
    .cLink li a{text-decoration: none; color: transparent;}
     .cLink li:nth-of-type(1){padding: 0 5px; background-image:url(/today/img/community/instagram.png); background-size: contain; background-repeat: no-repeat;}
    .cLink li:nth-of-type(2){padding: 0 5px; background-image:url(/today/img/community/youtube.png); background-size: contain; background-repeat: no-repeat;}
    .PCards .cardBody a{text-decoration: none; color: #000;}
    .PCards .cardBody img{width: 100%; height: 160px; object-fit: cover;  box-sizing: border-box;}
    .PCards .cardBody ul{padding-left: 0; margin:5px 0 10px 30px; list-style: none;}
    .PCards .cardBody ul li{font-size: 20px; padding: 3px;}
    .PCards .cardBody ul li::before{content: "• "; font-size: 25px;}
    .PCards .cardBody ul li:last-of-type{overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
    .changePet{width: 60px; height: 60px; background-image:url(/today/img/community/changePet.png); background-size: cover; 
                background-repeat: no-repeat; position: absolute; left: 50px; top: 70px;}
    .pchang{text-decoration: none;  color: transparent;}    
    
    
    /* 임시!!!(펫 관련) */
		#petList{width: 800px; height: 450px; border: 5px solid #7AB730; display: none;}
        #petList h2{background: #7AB730;}
        #petList #petCards{display: flex; overflow-x: auto}
        #petList #petCards a{text-decoration: none; color: #000;}

        #petRg_modal{display: none;}
		
		/* petId 안보이게 */
		.pet_id{display:none}    
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
		                    	<a href="<c:url value='/community/otherPet/${petVO.petId}'/>">
			                        <img src="<c:url value='${petVO.imagePath}'/>">
			                        <ul>
			                            <li>성별: ${petVO.gender}</li>
			                            <li>나이: ${petVO.age}살</li>
			                            <li>특징: ${petVO.feature}</li>                        
			                        </ul>
		                        </a>
		                    </div>  	                    
		                </div>
		            </div>
				</c:forEach>
			</c:if>	
		</div>		
			
		
		
	    <a href="javascript:select_pet();" title="반려동물 변경" class="pchang"><div class="changePet">1</div></a>
		
		
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
    
    
    
    
    <!----------------------------- 펫 리스트 창 --------------------------------->	
	<div>       
        <div id="petList">    
            <h2>반려동물 선택</h2>
            <button id="petRgform_open">반려동물 추가</button>

            <div id="petCards">
				
            </div>
        </div>
    </div>
	
	
	
	
	<script type="text/javascript">
	
		$(".cardBody").hover(function(){
	        $(this).parent().css("border", "5px solid #7AB730");
	    }, function(){
	        $(this).parent().css("border", "5px solid #BCDB97");
	    })
	
		
		// 반려동물 정보 수정 모달 열기 
	    $("#modifyPet").click(function(){
	        $("#petMf_modal").css("display","block");
	    })
	    
	    // 닫기
	    $(".modal_close").on("click", function(){
            $(this).parent().parent().css("display", "none")
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
        
        
        
        
                
    	// 펫리스트창 열기
    	function select_pet(){
    		$("#petList").css("display","block");
    		
    		const id = "${login.userId}";
    		console.log(id);
    		const user = {
                        userId: id
                    };
    		$.ajax({
                type: 'post',
                dataType : "json",
                contentType: 'application/json',
                url: '/today/user/petList',
                data: JSON.stringify(user),
                success: function (response) {
                	console.log(response); // 리스트 
                    //let rows = response  
                    //console.log(row.length);
                    for(let i = 0; i < response.length; i++){
                    	let pet_id = response[i]['petId']
                        let src = response[i]['imagePath']
                        let pet_name = response[i]['petName']
                        let age = response[i]['age']
                        let gender = response[i]['gender']

                        let temp_html = "<a href='javascript:;'><div class='pet'><div class='pet_in'><div class='pet_id'>" + pet_id + "</div><img src='/today" + src + "'><div><h3>" + pet_name + "</h3><p>" + age + "살 / <span>" + gender + "</span></p></div></div></div></a>" 

                        $('#petCards').append(temp_html)
                    }
                }, 
                error: function() {
                    console.log("통신 실패!");
                } 
            });
    		 
    		
    	}
        
	
	</script>
	
	
	
	
</body>
</html>