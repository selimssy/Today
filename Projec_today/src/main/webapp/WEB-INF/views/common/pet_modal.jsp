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
#petRg_modal{display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); 
			  box-shadow: 0 0 20px 0 #e8e8e8; border-radius: 10px; z-index: 100}


/* 펫 수정 모달 */
#petMf_modal {display: none; width:420px; height:600px; overflow-y:auto;  position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background:#fff;
			  box-shadow: 0 0 20px 0 #e8e8e8; border-radius: 10px; z-index: 999}

</style>


    
    
    <!----------------------------- 펫 리스트 창 --------------------------------->	
	<div class="modalcontainer">
        <div class="petList layer-popup" id="layer-popup">       
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
							<input type="url" id="instagram" placeholder="url">
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
							<input type="url" id="youtube" placeholder="url">
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
    
    
    
    
    
