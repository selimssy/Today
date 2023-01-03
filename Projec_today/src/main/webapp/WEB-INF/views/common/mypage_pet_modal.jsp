<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">    
<style type="text/css">
.image-box{margin: 35px auto 20px;}
.upload-btn{/*font-size: 15px; padding: 7px 10px;*/ margin-bottom: 15px;}
.modal_header{border-bottom: 1px solid #dee2e6; display: flex; position: relative;}
.modal_header h2{line-height: 2.8em; font-size:22px;}
.modal_logo{font-size: 1.25em; font-family: 'Nanum Pen Script', cursive; padding-left: 15px;}
.modal_close{width: 25px; height: 25px; float: right; position: absolute; top: 20px; right: 15px;}

.modal_table{border-collapse: collapse; width: 100%;}
.modal_body{padding: 0 30px 25px; display: block;}
.mlabel{padding-top: 10px;}
.mlabel p{margin: 15px 0 10px 0}
.modal_input{border: 1px solid #d9d9de; box-sizing: border-box; width: 100%; height: 40px; padding-left:10px;}
#auto_login{margin-top: 20px; margin-bottom: 20px;}
.m_button{margin-top: 20px; width: 100%; height: 40px; padding: 0 20px; border: none; border-radius: 5px; cursor:pointer}
.modalcontainer{position: relative;}
.close{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 25px; right: 25px; background-image: url(/today/img/common/close.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}

/* 펫 등록 모달 */
#petRg_modal{display: none; width:420px; height:80vh; overflow-y:auto; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background:#fff;
			  box-shadow: 0 0 20px 0 #e8e8e8; border-radius: 10px; z-index: 100}
/* 펫 수정 모달 */
#petMf_modal {display: none; width:420px; height:80vh; overflow-y:auto;  position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background:#fff;
			  box-shadow: 0 0 20px 0 #e8e8e8; border-radius: 10px; z-index: 999}
      
/* 펫 리스트 창 */     
#petList{width: 800px; height: 350px; background: #fff; padding-bottom: 5px; position: relative;}
#petList > img{width: 70px; height: 70px; position: absolute; top: 30px; left: 200px;}
#petList > p{font-size: 72px; /*background: rgba(122, 183, 48, 0.7);*/ margin: 20px 0 0; padding-left: 40px; font-family: 'Nanum Pen Script', cursive; text-align: center;}
.bdiv{position: absolute;top: -90px; right: 0;}
#petRgform_open{font-size: 25px; font-family: 'Nanum Pen Script';border: transparent; border-radius: 10px; background: #7AB730; padding: 10px 5px; margin-right: 20px; cursor: pointer;}
#petCards{margin-top: 20px; padding-top:20px;}
#petCards a{text-decoration: none; color: #000;}
/*.pet{float:left; margin-left:35px; width: 220px; height: 210px; border: transparent; border-radius: 20px; background: #F3F3F3; text-align: center; padding: 15px 0;}*/       
.petBox{float:left; margin-left:35px; width: 220px; height: 210px; border: transparent; border-radius: 20px; background: #F3F3F3; text-align: center; padding: 15px 0; position: relative;}
.pet_in img{width: 140px; height: 140px; border-radius: 50%; object-fit: cover;}    		
.pet_in h3{margin: 10px 0; padding: 0 30px; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
.pet_in p{margin: 0;}
/* petId 안보이게 */
.pet_id{display:none} 
.select{width: 20px; height: 10px; background-image: url(/today/img/community/more3.png); background-size: contain; background-repeat: no-repeat; position: absolute; top: 7px; right:12px; cursor: pointer;}
.select:hover{background-color: #ccc;}
.select .list{display:none; width:60px; list-style: none; position: absolute; bottom: -65px; right:-10px; background:#ddd; z-index:100;}
.select .list button{background-color: transparent; border:none; padding:8px 12px; cursor: pointer; font-size:12px}
.select .list.on{display:block}

.changePet{width: 60px; height: 60px; background-image:url(/today/img/community/changePet.png); background-size: cover; border:none;
                background-repeat: no-repeat; position: absolute; left: -100px; top: 70px; background-color: transparent; cursor: pointer;}  
.changePet2{width: 60px; height: 60px; background-image:url(/today/img/community/changePet.png); background-size: cover; border:none;
                background-repeat: no-repeat; position: absolute; left: -20px; top: 100px; background-color: transparent; cursor: pointer;}
.flex-container {display: flex;}
.wrapper {text-align: center;flex-grow: 1;}        
#image-box-modal1, #image-box-modal2{width: 200px;height: 200px;object-fit: cover;display: block;margin: 20px auto;}
.upload-btn {border: 1px solid #ddd; padding: 6px 12px;display: inline-block; cursor: pointer;}
input[type=file] {display: none;}
</style>


    

    
    <!-------------------------------------- 펫등록 모달 ----------------------------------------->
    <div id="petRg_modal">
        <div class="modal_header">
            <h2 class="modal-title">
                <span class="modal_logo">오늘의 너</span> 펫 등록
            </h2>
            <button type="button" class="modal_close">X</button> <!--닫기 버튼-->
        </div>
        <div class="modal_body" >
            <form method="post" id="petRgForm">
                <table class="modal_table">
                    <tr>
                        <div class="flex-container">       
                            <div class="wrapper">
                                <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" id="image-box-modal1" />
                                <label for="imgfile1" class="upload-btn">
                                    <input id="imgfile1" type="file" name="file" accept="image/*" />
                                    <span>Upload Image</span>
                                </label>
                            </div>
                        </div>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>반려견 이름</strong>
                                <span id="pNameChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="pet_name" class="modal_input" placeholder="최대 10자" maxlength="10"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>견종</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="pet_species" class="modal_input" placeholder="ex) 말티즈, 포메라니안, 믹스견" maxlength="30"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>나이</strong>
                                <span id="pAgeChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="age" class="modal_input" placeholder="ex) 5"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>성별</strong>
                                <span id="pGenderChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><input type="radio" name="gender" id='gender' value="남"> 남</label>
                            <label><input type="radio" name="gender" id='gender' value="여"> 여</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>성격</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="feature" class="modal_input" placeholder="ex) 애교쟁이, 순둥이" maxlength="30"></td>
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
							<input type="url" id="instagram" placeholder="url" class="modal_input" maxlength="80">
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
							<input type="url" id="youtube" placeholder="url" class="modal_input" maxlength="80">
                    	</td>
                    </tr>  
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>반려동물 공개 여부</strong>
                                <span id="openChk"></span>
                            </p>
                        </td>
                    </tr>            
                  	<tr>
                        <td>
                            <label><input type="radio" name="open" id='open' value="1"> 공개</label>
                            <label><input type="radio" name="open" id='open' value="0"> 비공개</label>
                        </td>
                    </tr>                
                    <tr>
                        <td>
                            <button type="button" id="petRg-btn" class="m_button">등록</button>
                        </td>
                    </tr>
                </table>
            </form >
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
                                <img src="" id="image-box-modal2" />
                                <label for="imgfile2" class="upload-btn">
                                    <input id="imgfile2" type="file" name="file" accept="image/*" />
                                    <span>Upload Image</span>
                                </label>
                            </div>
                        </div>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>반려견 이름</strong>
                                <span id="MpNameChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="Mpet_name" class="modal_input" value="" maxlength="10"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>견종</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="Mpet_species" class="modal_input" value="" maxlength="30"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>나이</strong>
                                <span id="MpAgeChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="Mage" class="modal_input" value=""></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>성별</strong>
                                <span id="MpGenderChk"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                 			<label><input type="radio" name="gender" id='Mgender' value="남"> 남</label>&nbsp;&nbsp;
                          	<label><input type="radio" name="gender" id='Mgender' value="여"> 여</label>
                        </td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>성격</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="Mfeature" class="modal_input" value="" maxlength="30"></td>
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
							<input type="url" id="Minstagram" class="modal_input" value="" maxlength="80">
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
							<input type="url" id="Myoutube" class="modal_input" value="" maxlength="80">
                    	</td>
                    </tr>  
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>반려동물 공개 여부</strong>
                                <span id="MopenChk"></span>
                            </p>
                        </td>
                    </tr>            
                  	<tr>
                        <td>                         
                 			<label>공개</label> <input type="radio" name="open" id='Mopen' value="1">&nbsp;&nbsp;
                            <label>비공개</label> <input type="radio" name="open" id='Mopen' value="0">
                        </td>
                    </tr>                
                    <tr>
                        <td>
                            <button type="button" id="petMf-btn" href="" class="m_button">저장</button>
                        </td>
                    </tr>
                </table>
            </form >
        </div>
    </div>
    
    
    
    <script type="text/javascript">
    
    // 펫등록 모달 열기 
    $("#petRgform_open").click(function(){    	 
    	if($(this).attr("href") > 2){  // 3마리까지만 등록 가능
    		alert("3마리까지 등록 가능합니다.");
    		return false;
    	}
    	$("#petRg_modal").css("display","block"); 
    	$("#imgfile1").val(""); // 이미지 업로드 초기화
        $("#image-box-modal1").attr("src", "https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg");
        $("#petRg_modal input[type='text']").add($("input[type='url']")).val("");
        $("#petRg_modal input[type='radio']").prop("checked", false);
    })
  
    
    // 반려견 수정,삭제 메뉴 여닫기
     $(document).on("click", ".select", function (e) {
    	$(".select").removeClass("on");
           //toggle 방식
           if($(this).hasClass("on")){
               $(this).add($(this).children(".list")).removeClass("on");
           }else{ // !$(this).hasClass("on") 없으면
               $(this).add($(this).children(".list")).addClass("on");
           }         
       });
     
    $(document).mouseup(function (e){
    	let LayerPopup = $(".select .list");
    	if(LayerPopup.has(e.target).length === 0){
    	  LayerPopup.removeClass("on");
    	  $(".select").removeClass("on");
    	}
    }); 
    
    
    // 새로운 펫 추가 이벤트    
    $("#petRg-btn").click(function(){
    	
    	let checkAge = /^[0-9]+$/;  // 나이 체크 정규식
    	//반려견 이름
    	if(!$("#pet_name").val() || $("#pet_name").val().replace(/\s| /gi, "").length == 0){ // 공백만 입력한 경우
    		$('#pNameChk').html('<b style="font-size:12px;color:red;">[반려견 이름을 입력하세요.]</b>');
    		return false;
    	}else {
        	$('#pNameChk').html('');
        }
    	// 반려견 나이
    	if(!$("#age").val() || $("#age").val().replace(/\s| /gi, "").length == 0){ // 공백만 입력한 경우
    		$('#pAgeChk').html('<b style="font-size:12px;color:red;">[반려견 나이를 입력하세요.]</b>');
    		return false;
    	}else if(!checkAge.test($("#age").val()) || $("#age").val() <= 0 || $("#age").val() > 100){  // 1~100 범위의 숫자가 아닌 경우
    		$('#pAgeChk').html('<b style="font-size:12px;color:red;">[1 ~ 100범위 내 숫자만 입력 가능합니다.]</b>');
    		return false;
    	}else {
        	$('#pAgeChk').html('');
        }
    	// 반려견 성별
    	if($(':radio[id="gender"]:checked').length < 1){
    		$('#pGenderChk').html('<b style="font-size:12px;color:red;">[반려견 성별을 입력하세요.]</b>');          
    		return false;
    	    //event.preventDefault();
    	}else {
        	$('#pGenderChk').html('');
        }
    	// 공개 여부
    	if($(':radio[id="open"]:checked').length < 1){
    		$('#openChk').html('<b style="font-size:12px;color:red;">[반려견 공개 여부를 선택하세요.]</b>');     
    		return false;
    	}else {
        	$('#openChk').html('');
        }
    	
    	
    	// 이미지 리사이징
  	    let img = new Image;
  	    img.src = previews_modal1.src; 
  	
  	    var canvas = document.createElement("canvas");
	    canvas.getContext("2d").drawImage(img, 0, 0);
	      	  
	    // 최대 크기 지정과 리사이징
	    let maxWidth = 400; //가로 최대 400px
	    let maxHeight = 300; //세로 최대 300px
	    let width = img.width; 
	    let height = img.height; 
	    if (width > height) { 
	       if (width > maxWidth) {
	           height *= maxWidth / width;
	           width = maxWidth;
	       }
	    } else {
	       if (height > maxHeight) {
	           width *= maxHeight / height;
	           height = maxHeight;
	       }
	    }
	    canvas.width = width;
	    canvas.height = height;
	    canvas.getContext('2d').drawImage(img, 0, 0, width, height);

	    //canvas의 dataurl를 blob(file)화 하는 과정
	    var dataURI = canvas.toDataURL("image/png"); //png => jpg 등으로 변환 가능
	    var byteString = atob(dataURI.split(',')[1]);
	    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
	    var ab = new ArrayBuffer(byteString.length);
	    var ia = new Uint8Array(ab);
	    for (var i = 0; i < byteString.length; i++) {
	        ia[i] = byteString.charCodeAt(i);
	    }
	    //리사이징된 file 객체
	    var tmpThumbFile = new Blob([ab], {type: mimeString});

        //formData 객체 생성
        let formData = new FormData();
 		formData.append("petImg", tmpThumbFile);
 		
    	// 넘겨줄 반려동물 데이터
    	let petData = {
    			"userId": "${login.userId}",
    			"petName": $("#pet_name").val(),
    			"petSpecies": $("#pet_species").val(),
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
    	      url: "/today/user/registerPet",
    	      data: formData,
    	      dataType: "text",
    	      contentType: false,               // * 중요 *
    	      processData: false,               // * 중요 *
    	      enctype : 'multipart/form-data',  // * 중요 *
    	      success: function(result) { 
                  //console.log("통신 성공!: ");                 
                  alert("반려동물 등록이 완료되었습니다.");                      
                  window.location.reload();                       
              }, 
              error: function() {
                  console.log("통신 실패!");
              } 
    	});
    })    

    



        
    	// 반려동물 수정 불러오기
        $(document).on("click", ".modifyPetBtn", function (e){
	        $("#petMf_modal").css("display","block");		
	        
	        let petId = $(this).attr("href");
			let pet = {
					petId: petId
	                };
			$.ajax({
	            type: 'post',
	            dataType : "json",
	            contentType: 'application/json',
	            url: '/today/user/modifyGet',
	            data: JSON.stringify(pet),
	            success: function (response) {
	            	console.log(response); // petVO 
	
	                	let petId = response['petId']
	                    let imagePath = "/today" + response['imagePath']
	                    let petName = response['petName']
	                	let petSpecies = response['petSpecies']
	                    let age = response['age']
	                    let gender = response['gender']
	            		let feature = response['feature']
	                	let instagram = response['instagram']
	                	let youtube = response['youtube']
	                	let open = response['open']
						
	                	$(".select").add($(".select").children(".list")).removeClass("on");
	                	$("#petMf-btn").attr("href", petId);
	                	$("#image-box-modal2").attr("src", imagePath);
	                	$("#Mpet_name").val(petName);
	                	$("#Mpet_species").val(petSpecies);
	                	$("#Mage").val(age);
	                    if(gender === "남"){
	                    	$("input[id='Mgender']:eq(0)").prop('checked', true);
	                    }else if(gender === "여"){
	                    	$("input[id='Mgender']:eq(1)").prop('checked', true);
	                    }
	                    $("#Mfeature").val(feature);
	                    $("#Minstagram").val(instagram);
	                    $("#Myoutube").val(youtube);
	                    if(open == 1){
	                    	$("input[id='Mopen']:eq(0)").prop('checked', true);
	                    }else{
	                    	$("input[id='Mopen']:eq(1)").prop('checked', true);
	                    }
	            }, 
	            error: function() {
	                console.log("통신 실패!");
	            } 
	        });
        });        
        
        
       
    	
	    // 반려동물 수정 모달 닫기
	    $(".modal_close").on("click", function(){
            $(this).parent().parent().css("display", "none")
        })
	    
        
      
	    
	    // 반려동물 수정 버튼 이벤트
        $("#petMf-btn").click(function(){
        	
        	let checkAge = /^[0-9]+$/;  // 나이 체크 정규식
	    	//반려견 이름
	    	if(!$("#Mpet_name").val() || $("#Mpet_name").val().replace(/\s| /gi, "").length == 0){ // 공백만 입력한 경우
	    		$('#MpNameChk').html('<b style="font-size:12px;color:red;">[반려견 이름을 입력하세요.]</b>');
	    		return false;
	    	}else {
            	$('#MpNameChk').html('');
            }
	    	// 반려견 나이
	    	if(!$("#Mage").val() || $("#Mage").val().replace(/\s| /gi, "").length == 0){ // 공백만 입력한 경우
	    		$('#MpAgeChk').html('<b style="font-size:12px;color:red;">[반려견 나이를 입력하세요.]</b>');
	    		return false;
	    	}else if(!checkAge.test($("#Mage").val()) || $("#Mage").val() <= 0 || $("#Mage").val() > 100){  // 1~100 범위의 숫자가 아닌 경우
	    		$('#MpAgeChk').html('<b style="font-size:12px;color:red;">[1 ~ 100범위 내 숫자만 입력 가능합니다.]</b>');
	    		return false;
	    	}else {
            	$('#MpAgeChk').html('');
            }
	    	// 반려견 성별
	    	if($(':radio[id="Mgender"]:checked').length < 1){
	    		$('#MpGenderChk').html('<b style="font-size:12px;color:red;">[반려견 성별을 입력하세요.]</b>');          
	    		return false;
	    	    //event.preventDefault();
	    	}else {
            	$('#MpGenderChk').html('');
            }
	    	// 공개 여부
	    	if($(':radio[id="Mopen"]:checked').length < 1){
	    		$('#MopenChk').html('<b style="font-size:12px;color:red;">[반려견 공개 여부를 선택하세요.]</b>');     
	    		return false;
	    	}else {
            	$('#MopenChk').html('');
            }
        	
	    	//formData 객체 생성
            let formData = new FormData(); 	
         	
            // 이미지 리사이징	
       	    if($("input[id='imgfile2']").val()){ // 사진 첨부한 경우에만 리사이징 진행				
       		  let img = new Image;
      	      img.src = MdPreviews_modal2.src; 
      	
      	      var canvas = document.createElement("canvas");
 	    	  canvas.getContext("2d").drawImage(img, 0, 0);
 	    	      	  
 	    	  // 최대 크기 지정과 리사이징
 	    	  let maxWidth = 650; //가로 최대 650px
 	    	  let maxHeight = 860; //세로 최대 860px
 	    	  let width = img.width; 
 	    	  let height = img.height; 
 	    	  if (width > height) { 
 	    	     if (width > maxWidth) {
 	    	         height *= maxWidth / width;
 	    	         width = maxWidth;
 	    	     }
 	    	  } else {
 	    	     if (height > maxHeight) {
 	    	         width *= maxHeight / height;
 	    	         height = maxHeight;
 	    	     }
 	    	  }
 	    	  canvas.width = width;
 	    	  canvas.height = height;
 	    	  canvas.getContext('2d').drawImage(img, 0, 0, width, height);

 	    	  //canvas의 dataurl를 blob(file)화 하는 과정
 	    	  var dataURI = canvas.toDataURL("image/png"); //png => jpg 등으로 변환 가능
 	    	  var byteString = atob(dataURI.split(',')[1]);
 	    	  var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
 	    	  var ab = new ArrayBuffer(byteString.length);
 	    	  var ia = new Uint8Array(ab);
 	    	  for (var i = 0; i < byteString.length; i++) {
 	    	      ia[i] = byteString.charCodeAt(i);
 	    	  }
 	    	    //리사이징된 file 객체
 	    	    var tmpThumbFile = new Blob([ab], {type: mimeString});
 	               
      	        formData.append("petImg", tmpThumbFile);
       	    }
        	
        	// 넘겨줄 반려동물 데이터
        	let petId = $(this).attr("href");
        	let petData = {
        			"petId": petId,
        			"petName": $("#Mpet_name").val(),
        			"petSpecies": $("#Mpet_species").val(),
        			"age": $("#Mage").val(),
        			"gender": $("input[id='Mgender']:checked").val(),
        			"feature": $("#Mfeature").val(),
        			"instagram": $("#Minstagram").val(),
        			"youtube": $("#Myoutube").val(),
        			"open": $("input[id='Mopen']:checked").val()
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
                          //location.href="/today/community/intro";
                          location.reload();
                      } else {
                          alert("반려동물 정보 수정에 실패했습니다.");
                      }
                  }, 
                  error: function() {
                      console.log("통신 실패!");
                  } 
        	});
        })   
        
        
        
        // 반려동물 삭제
        $(document).on("click", ".deletePetBtn", function () {
			if(confirm("반려견을 삭제하시겠습니까?")){
				
				let petId = $(this).attr("href");	            
	    		let petVO = {petId: petId};
	    		
	    		$.ajax({
	                type: 'post',
	                dataType : "text",
	                contentType: 'application/json',
	                url: '/today/user/deletePet',
	                data: JSON.stringify(petVO),
	                success: function (response) {
	         			if(response === 'success'){
	         				alert("반려견이 삭제되었습니다.");
	         				location.reload();
	         			}else{
	         				alert("반려견 삭제에 실패했습니다.");
	         			}
	                }, 
	                error: function() {
	                    console.log("통신 실패"); 
	                } 
	            });
			}
        })
        
        
        // 파일 업로드(중복)	    
        // 파일업로드(추가)
	    const fileDOM_modal1 = document.querySelector('#imgfile1');
	    const previews_modal1 = document.querySelector('#image-box-modal1');

	    fileDOM_modal1.addEventListener('change', () => {
	    	// 이미지 확장자 체크
			let ext = $("#imgfile1").val().split(".").pop().toLowerCase();		    
			if($.inArray(ext, ["jpg", "jpeg", "png", "gif", "bmp", "pdf", "webp"]) == -1) {
				alert("이미지 파일(jpg, jpeg, png, gif, bmp, pdf, webp)만 업로드 가능합니다.");
				fileDOM_modal1.value = ""; // 이미지 업로드 초기화
				previews_modal1.src = "<c:url value='/img/common/no_image.webp'/>";
				return false;
			}	    	
			// 이미지 용량 체크
				if(fileDOM_modal1.files[0].size > 10485760){ // 10MB 초과
		        alert("최대 10MB까지 업로드 가능합니다.");
		        fileDOM_modal1.value = ""; // 이미지 업로드 초기화
		        previews_modal1.src = "<c:url value='/img/common/no_image.webp'/>";  // 수정할 때는 그냥 기존 이미지로 하고싶다
		        return false; 
		   }	    	
	    	
	       const reader = new FileReader();
	       reader.onload = ({ target }) => {
	    	   previews_modal1.src = target.result;
	       };
	       reader.readAsDataURL(fileDOM_modal1.files[0]);
	    });
		
	    
	    // 파일업로드(수정)
	    const fileDOM2_modal2 = document.querySelector('#imgfile2');
	    const MdPreviews_modal2 = document.querySelector('#image-box-modal2');

	    fileDOM2_modal2.addEventListener('change', () => {
	    	// 이미지 확장자 체크
			let ext = $("#imgfile2").val().split(".").pop().toLowerCase();		    
			if($.inArray(ext, ["jpg", "jpeg", "png", "gif", "bmp", "pdf", "webp"]) == -1) {
				alert("이미지 파일(jpg, jpeg, png, gif, bmp, pdf, webp)만 업로드 가능합니다.");
				fileDOM2_modal2.value = ""; // 이미지 업로드 초기화
				MdPreviews_modal2.src = "<c:url value='/img/common/no_image.webp'/>";
				return false;
			}	    	
			// 이미지 용량 체크
				if(fileDOM2_modal2.files[0].size > 10485760){ // 10MB 초과
		        alert("최대 10MB까지 업로드 가능합니다.");
		        fileDOM2_modal2.value = ""; // 이미지 업로드 초기화
		        MdPreviews_modal2.src = "<c:url value='/img/common/no_image.webp'/>";  // 수정할 때는 그냥 기존 이미지로 하고싶다
		        return false; 
		   }	    
	    	
    	   const imageSrc = URL.createObjectURL(fileDOM2_modal2.files[0]);
    	   MdPreviews_modal2.src = imageSrc;
    	});

    
    </script>
    
