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


/* 펫 등록 모달 */
#petRg_modal{display: none; width:420px; height:600px; overflow-y:auto; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background:#fff;
			  box-shadow: 0 0 20px 0 #e8e8e8; border-radius: 10px; z-index: 100}
/* 펫 수정 모달 */
#petMf_modal {display: none; width:420px; height:600px; overflow-y:auto;  position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background:#fff;
			  box-shadow: 0 0 20px 0 #e8e8e8; border-radius: 10px; z-index: 999}
      
/* 펫 리스트 창 */     
#petList{width: 800px; height: 430px; border: 5px solid #7AB730; border-radius: 50px; background: #fff; padding-bottom: 5px; display: none;  position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8; z-index: 100}
#petList > img{width: 70px; height: 70px; position: absolute; top: 30px; left: 200px;}
#petList > p{font-size: 72px; /*background: rgba(122, 183, 48, 0.7);*/ margin: 20px 0 0; padding-left: 40px; font-family: 'Nanum Pen Script', cursive; text-align: center;}
.bdiv{text-align: right;}
#petRgform_open{font-size: 25px; font-family: 'Nanum Pen Script';border: transparent; border-radius: 10px; background: #7AB730; padding: 10px 5px; margin-right: 20px; cursor: pointer;}
#petCards{/*display: flex; justify-content: space-evenly;*/ margin-top: 20px;}
#petCards a{text-decoration: none; color: #000;}
/*.pet{float:left; margin-left:35px; width: 220px; height: 210px; border: transparent; border-radius: 20px; background: #F3F3F3; text-align: center; padding: 15px 0;}*/       
.petBox{float:left; margin-left:35px; width: 220px; height: 210px; border: transparent; border-radius: 20px; background: #F3F3F3; text-align: center; padding: 15px 0; position: relative;}
.pet{cursor: pointer;}
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

.flex-container {display: flex;}
.wrapper {text-align: center;flex-grow: 1;}        
.image-box {width: 200px;height: 200px;object-fit: cover;display: block;margin: 20px auto;}
.upload-btn {border: 1px solid #ddd; padding: 6px 12px;display: inline-block; cursor: pointer;}
input[type=file] {display: none;}
</style>


    
    
    <!----------------------------- 펫 리스트 창 --------------------------------->	
	<div class="modalcontainer">
        <div id="petList">       
            <img src="<c:url value='/img/community/infoPhoto.png'/>"> 
            <p>반려동물 선택</p>
            <div class="bdiv">
                <button id="petRgform_open">+ 반려동물 추가</button>
            </div>      
            <div id="petCards">

             
            </div>
        </div>
    </div>
    
    
    
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
                                <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
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
                        <td><input type="text" id="pet_name" class="modal_input" placeholder="최대 10자"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>나이</strong>
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
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><input type="radio" name="gender" value="남"> 남</label>
                            <label><input type="radio" name="gender" value="여"> 여</label>
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
                        <td><input type="text" id="feature" class="modal_input" placeholder="ex) 애교쟁이, 노즈워크 달인"></td>
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
							<input type="url" id="instagram" placeholder="url" class="modal_input">
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
							<input type="url" id="youtube" placeholder="url" class="modal_input">
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
                            <label><input type="radio" name="open" value="1"> 공개</label>
                            <label><input type="radio" name="open" value="0"> 비공개</label>
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
                                <img src="<c:url value='${pet.imagePath}'/>" id="mdImage-box" />
                                <label for="modifyFile" class="upload-btn">
                                    <input id="modifyFile" type="file" name="file" accept="image/*" />
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
                        <td><input type="text" id="Mpet_name" class="modal_input" value="${pet.petName}"></td>
                    </tr>
                    <tr>
                        <td class="mlabel">
                            <p>
                                <strong>나이</strong>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" id="Mage" class="modal_input" value="${pet.age}"></td>
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
                   				<label><input type="radio" name="gender" id='Mgender' value="남" checked> 남</label>&nbsp;&nbsp;
                            	<label><input type="radio" name="gender" id='Mgender' value="여"> 여</label>
							</c:if>
							<c:if test="${pet.gender == '여'}">
                   				<label><input type="radio" name="gender" id='Mgender' value="남"> 남</label>&nbsp;&nbsp;
                            	<label><input type="radio" name="gender" id='Mgender' value="여" checked> 여</label>
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
                        <td><input type="text" id="Mfeature" class="modal_input" value="${pet.feature}"></td>
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
							<input type="url" id="Minstagram" class="modal_input" value="${pet.instagram}">
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
							<input type="url" id="Myoutube" class="modal_input" value="${pet.youtube}">
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
                   				<label>공개</label> <input type="radio" name="open" id='Mopen' value="1" checked>&nbsp;&nbsp;
                              	<label>비공개</label> <input type="radio" name="open" id='Mopen' value="0">
							</c:if>
							<c:if test="${pet.open == 0}">
                   				<label>공개</label> <input type="radio" name="open" id='Mopen' value="1">&nbsp;&nbsp;
                              	<label>비공개</label> <input type="radio" name="open" id='Mopen' value="0" checked>
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
    
    // 펫등록 모달 열기 
    $("#petRgform_open").click(function(){    	
        $("#petRg_modal").css("display","block");      
        $(".image-box").attr("src", "https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg");
        $("input[type='text']").add($("input[type='url']")).val("");
        $("input[type='radio']").prop("checked", false);
        /*
        $("#pet_name").val("");
        $("#age").val("");
        $("input[name='gender']").prop("checked", false);
        $("#feature").val("");
        $("#instagram").val("");
        $("#youtube").val("");
        $("input[name='open']").prop("checked", false);*/
        //$("#petList").css("display","none");
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
        //formData 객체 생성
        let formData = new FormData();
    	formData.append("petImg", $("input[name=file]")[0].files[0]);
    	// 넘겨줄 반려동물 데이터
    	let petData = {
    			"userId": "${login.userId}",
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
    	      url: "/today/user/registerPet",
    	      data: formData,
    	      dataType: "text",
    	      contentType: false,               // * 중요 *
    	      processData: false,               // * 중요 *
    	      enctype : 'multipart/form-data',  // * 중요 *
    	      success: function(result) { 
                  console.log("통신 성공!: ");
                  if(result === "success") {
                      alert("반려동물 등록이 완료되었습니다.");                      
                      $("#petList-open").click();
                      $("#petRg_modal").css("display","none");
                      //window.location.reload();      
                      //$("#petList").css("display","block");
                      //location.href="/today/mypet/lifetime"; session petId등록 문제
                  } else {
                      alert("반려동물 등록에 실패했습니다.");
                  }
              }, 
              error: function() {
                  console.log("통신 실패!");
              } 
    	});
    })    

    
    
    	// 펫리스트 팝업 열기
        $(document).on("click", "#petList-open", function (e){
        $("#petList").css("display","block");	
        $('#petCards').empty();	
        
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
					
                	let temp_html = "<div class='petBox'><div class='select'><ul class='list'><li><button class='modifyPetBtn' title='수정' href='" + pet_id + "'>수정</button></li><li><button class='deletePetBtn' title='삭제' href='" + pet_id + "'>삭제</button></li></ul></div><div class='pet'><div class='pet_in'><div class='pet_id'>" + pet_id + "</div><img src='/today" + src + "'><div><h3>" + pet_name + "</h3><p>" + age + "살 / <span>" + gender + "</span></p></div></div></div></div>"; 
                    //let temp_html = "<a href='javascript:;'><div class='pet'><div class='pet_in'><div class='pet_id'>" + pet_id + "</div><img src='/today" + src + "'><div><h3>" + pet_name + "</h3><p>" + age + "살 / <span>" + gender + "</span></p></div></div></div></a>"; 

                    $('#petCards').append(temp_html)
                }
            }, 
            error: function() {
                console.log("통신 실패!");
            } 
        });
        });

    	/*
        // 외부영역 클릭 시 팝업 닫기
        $(document).mouseup(function (e){
	        let LayerPopup = $("#petList");
	        if(LayerPopup.has(e.target).length === 0){
	            LayerPopup.css("display","none");
	        }
        });
	    */
        
        
        
        /*
    	// 펫리스트창 열기(중복)
    	function select_pet(){
    		//$("#petList").css("display","block");
    		
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
    		 
    		
    	}*/
    	
    	
    	
    	
    	
    	// 반려동물 선택 이벤트(커뮤니티 리다이렉트)
        $(document).on("click", ".pet", function () {
            const user_id = "${login.userId}";
            const pet_id = $(this).find( ".pet_id" ).text();
    		console.log(user_id);
            console.log(pet_id);
    		const pet = {
                        userId: user_id,
                        petId: pet_id
                    };

            $.ajax({
                type: "POST", 
                url: "/today/user/selectPet", 
                headers: {
                    "Content-Type": "application/json"
                }, 
                dataType: "text", 
                data: JSON.stringify(pet), 
                success: function(result) { 
                    console.log("통신 성공!: ");
                    if(result === "success") {
                        location.href="/today/community/intro";
                    } else {
                        alert("반려동물 선택에 실패했습니다.");
                    }
                }, 
                error: function() {
                    console.log("통신 실패!");
                } 
            });        
            
        })
    	
	    

       
	    
     	// 반려동물 정보 수정 모달 열기 
	    $("#modifyPet").click(function(){
	        $("#petMf_modal").css("display","block");
	    })
	    
    	
	    // 닫기
	    $(".modal_close").on("click", function(){
            $(this).parent().parent().css("display", "none")
        })
	    
        
        /*
        // 외부영역 클릭 시 팝업 닫기
        $(document).mouseup(function (e){
	        var LayerPopup = $("#petMf_modal");
	        if(LayerPopup.has(e.target).length === 0){
	            LayerPopup.css("display","none");
	        }
        });
	    */
        
	    
	    // 반려동물 수정 버튼 이벤트
        $("#petMf-btn").click(function(){
            //formData 객체 생성
            let formData = new FormData();
        	formData.append("petImg", $("input[id='modifyFile']")[0].files[0]);
        	// 넘겨줄 반려동물 데이터
        	let petData = {
        			"petId": "${login.pet.petId}",
        			"petName": $("#Mpet_name").val(),
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
	         				$("#petList-open").click();
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
	    const fileDOM = document.querySelector('#file');
	    const previews = document.querySelectorAll('.image-box');

	    fileDOM.addEventListener('change', () => {
	      const reader = new FileReader();
	      reader.onload = ({ target }) => {
	        previews[0].src = target.result;
	      };
	      reader.readAsDataURL(fileDOM.files[0]);
	    });
		
	    
	    // 파일업로드(수정)
	    const fileDOM2 = document.querySelector('#modifyFile');
	    const MdPreviews = document.querySelector('#mdImage-box');

	    fileDOM2.addEventListener('change', () => {
    	  const imageSrc = URL.createObjectURL(fileDOM2.files[0]);
    	  MdPreviews.src = imageSrc;
    	});

    
    </script>
    
