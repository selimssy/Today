<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<style>
.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/common/mainbg3.png); background-size: contain; margin: 0 auto;  position: relative;}       
.mainContent{width: 1050px; margin: 0 auto; min-height: 160px; position: relative;}
.mainContent .conTitle{width: 950px; margin: 0 auto; background:#BBD996; text-align: center;}
.mainContent .conTitle span{line-height: 70px; font-size: 45px; font-family: 'Nanum Pen Script'; padding-left: 70px; background-image: url(/today/img/mypet/dogicon.png); background-size: contain; background-repeat: no-repeat;}
.buttonNav{float:right; position: relative;}
.openUGCard{width: 95px; height: 40px;  position: absolute; top:45px; right:40px; /*margin: 45px 15px 0 0;*/ border: none; border-radius: 7px; font-size: 26px; font-family: 'Nanum Pen Script'; background: #7AB730; /*float: right;*/ cursor: pointer;}
.photoPoster{width: 215px; height: 40px;  position: absolute; top:45px; right:165px; border: none; border-radius: 7px; font-size: 26px; font-family: 'Nanum Pen Script'; background: #7AB730; cursor: pointer; background-image: url(/today/img/mypet/poster2.png); background-size: contain; background-repeat: no-repeat; padding-left:35px;}

.galleryBox{width:100%; width:1050px; min-height:500px; height:1030px; padding: 40px; margin-top: 70px; background:#f5f6fa; /* display: flex; justify-content: space-between;*/  box-sizing: border-box;}
.gcardWrap{/*width: 33.333%;*/ width:300px; height:280px; background:#fff; float: left; padding:10px; margin:0 30px 50px 0; border:none; box-sizing: border-box; position: relative; }
.gcardWrap:nth-of-type(3n){margin-right:0}
.imgBox img{/*width:300px; */ width: 100%; height:210px; object-fit: cover; cursor: pointer;}
.imgInfo{padding:10px 20px 10px}
.imgInfo h3{font-size: 28px; font-family: 'Nanum Pen Script'; text-align: center; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
.imgInfo p{display:none ;word-wrap: break-word;width: 100%; line-height: 1.3em; font-size: 20px; font-family: 'Nanum Pen Script'; margin-top:10px; ; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;/*height:45px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;white-space: nowrap;*/}
.gselect{width: 10px; height: 21px; background-image: url(/today/img/mypet/more.png); background-size: contain; background-repeat: no-repeat; position: absolute; bottom: 17px; right:6px; cursor: pointer;}
.gselect .list{display:none; width:100px; list-style: none; position: absolute; bottom: -65px; right:-95px; background:#f1f1f1; z-index:100;}
.gselect .list button{background:#none; border:none; padding:8px 12px; cursor: pointer; font-size:12px}
.gselect .list.on{display:block}
.gselect:hover{background-color: #ccc;}

.register_wrap{display: none;}
.modifyCard_wrap{display: none;}
.register_form, .modifyCard{/*display: none;*/ width: 550px; height: 320px; margin: 50px auto; border: 3.5px solid #7AB730; border-radius: 15px; padding: 20px; position: relative; display: flex; justify-content: space-evenly; z-index:9999;}
.closeUGCard, .mdGcancle{width: 70px; height: 33px; border: none; border-radius: 7px; background: #fff; border: 3px solid #7AB730; color: #7AB730;font-weight: bolder; position:absolute; bottom: 15px; right: 15px; cursor: pointer;}
#uploadGBtn, .mdGBtn{width: 70px; height: 33px; border: none; border-radius: 7px; background: #7AB730; position:absolute; bottom: 15px; right: 100px; cursor: pointer;}
.galInfo{width: 250px; padding-top: 20px;}
#gtitle, #mdGtitle{width:100%; height:40px; border:1px solid #d1d1d1; box-shadow: 0 0 11px 0 #e8e8e8; font-size: 21px; font-family: 'Nanum Pen Script'; padding-left:15px; box-sizing: border-box;}
#gcontent, #mdGCont{resize: none; width: 100%; height: 150px; margin-top:25px; background: none; border: none; box-shadow: 0 0 11px 0 #e8e8e8; font-size: 21px; line-height: 1.5em; font-family: 'Nanum Pen Script'; box-sizing: border-box; padding: 25px 30px;}
.modifyCard{background:#fff; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999; margin:0}

.paging{padding: 60px 0 0; text-align: center;}
.paging ul li{list-style: none; display: inline-block;}
.paging ul li a{text-decoration: none; color: #000; padding: 3px 8px;}
.paging ul li a.page-active{color: #fff; background: #384d75; border-radius: 10px}

/* 갤러리 상세 조회 */
#showGallery{display:none; width:700px; height: 610px; overflow-y: auto; background:#fff; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8; z-index:7;}
.pop_list li {padding:20px 35px 0px; box-sizing: border-box;}
.pop_list li h2.pop_title{padding:10px 0 24px; text-align:center; font-weight:bold; font-size:32px; font-family: 'Jua', sans-serif; letter-spacing:2px;}
.pop_list li img.pop_img{width:100%;}
.pop_list li .pop_content{width:100%; overflow: visible; padding:15px 10px; line-height:1.8; font-size:18.5px; font-family: 'Jua', sans-serif; box-sizing: border-box;}
.closeShowGal{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 15px; right: 15px; background-image: url(/today/img/common/close.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}

.noneMsg{font-family: 'Nanum Pen Script'; text-align: center; font-size: 36px; margin: 50px 0 30px;}
.noneMsg+img{width:60%; display: block; margin: auto; opacity: 0.85; box-shadow: 0 0 25px 0 #e8e8e8; border-radius: 15px;}

/*반응형*/
@media all and (max-width:1065px) {			
	.siteInfo{width:100%; height:auto; position: relative;}
	.siteInfo:before {content: ""; display: block; padding-top: 35.7143%; /* 일정 비율 유지*/}
	.ratio_content {position: absolute; top: 0; right: 0; bottom: 0; left: 0;}		
	.mainContent{width:100%;}
	.mainContent .conTitle{width:80%; margin: 0 auto;}
	
	.galleryBox{width:100%; height:96.7vw; min-height:47vw; position: relative; padding:3%; margin-top:8.75%; /*margin-top: 70px; box-sizing: content-box;*/}
	.openUGCard, .photoPoster{z-index:3;}
	.paging{padding: 75px 0 0;}
	
	.gcardWrap{width:31%; height:auto; padding-bottom:0; margin:0 3% 3% 0;}
	.imgBox{width:100%; position: relative; box-sizing: border-box;}
	.imgBox::after {display: block; content: ""; padding-bottom: 75%;}
	.imgBox img{width:100%; height: 100%; position: absolute; top: 0; left: 0; object-fit: cover;  box-sizing: border-box; display: block;}
	.imgInfo h3{font-size:2.5vw;}
	
}

/* 모바일 기준 : 800px 미만 */
@media all and (max-width:800px) {
	.noneMsg{font-size: 4.5vw;}
	.mainContent .conTitle span{line-height:100%; font-size:5.625vw; padding-left:10%;}	
	.register_form, .modifyCard{width:50%; height:auto; display:block; margin:0 auto; padding-bottom:65px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background:#fff; overflow-y: auto;}	
	.galInfo{width:80%; padding-top:2.5vw; margin:0 auto;}
	#gcontent, #mdGCont{margin-top:2.5vw; padding:2.5vw 3.125vw; font-size:2.5vw;}
	#gtitle, #mdGtitle{font-size:2.5vw;}
	.gcardWrap{padding:1.25%; padding-bottom:0;}
	.buttonNav{width:100%;}
	.openUGCard{width:12%; height:auto; font-size:3.5vw; padding:0.2vw; top:5.6vw; right: 5vw;}
	.photoPoster{width:27%; height:auto; font-size:3.5vw; padding:0.2vw; padding-left:4.375vw; top:5.6vw; right: 20vw;}
	.gselect{width:1.25vw; height: 2.5vw; right: 0.75vw; bottom:1.875vw;}
	.paging{padding: 20px 0 0;}
	.paging ul li a{font-size:2vw;}
	 
	
	
}


@media all and (max-width:700px) {
	#gtitle, #mdGtitle{height:5.72vw; padding-left:2.14vw;}
	#gcontent, #mdGCont{height:21.43vw;}
	.galleryBox{height: 685vw;}
	.gcardWrap{width:80%; float:none; margin:30px auto; margin-bottom:8.333vw; padding:2.43vw; padding-bottom:0;}
	.gcardWrap:nth-of-type(3n) {margin-right: auto;}
	.imgInfo{padding: 2.43vw 4.86vw 2.43vw;}
	.imgInfo h3{font-size: 5vw;}
	.gselect{width: 10px; height: 21px; bottom: 2.833vw; right: 6px;}
	#showGallery{width:90%; height:88.5vw;}
	.pop_list li{padding: 1.87vw 3.286vw 0px;}
	.pop_list li h2.pop_title{font-size:22px; padding:0.94vw 0 2.25vw;}
	.pop_list li .pop_content{padding: 1.4vw 0.94vw; font-size:14.5px; /*font-size:1.73vw;*/}
}


</style>
</head>
<body>


<div class="container">   
	<jsp:include page="../common/header.jsp" />
	<main>
	
		<div class="siteInfo">
			<div class="ratio_content"></div>
	        <div class="infoText">
	            <p>반려견 갤러리</p>
	            <p>담아두고 싶은 너의 모든 순간</p>
	        </div>
	    </div>
	    
	    <div class="siteNav">   
	        <table>
		        <tr>
		            <td><a href="<c:url value='/'/>"><div class="homeLogo">home</div></a></td>
		            <td><a href="<c:url value='/mypet/lifetime'/>">반려견 생애기록</a></td>
		            <td class="checked"><a href="<c:url value='/mypet/gallery'/>">갤러리</a></td>
		        </tr>
		    </table>
	    </div>
	
	    <div class="otherWrap">
	        <div class="otherP">
	            <P>세상에서 가장 사랑스러운</P>
	            <!--<h1>다른 반려동물 보러 놀러가기</h1> -->
	            <p>우리 아이 특별한 사진전</p>
	    	</div>
	    </div>
	
		
		<div class="mainContent">
	        <div class="conTitle">
	            <span>${pet.petName} 갤러리</span>
	        </div>
			
			<button type="button" id="petList-open" title="반려동물 변경" class="changePet2"></button>
	        <div class="buttonNav">
		        <button type="button" class="openUGCard">+ 사진추가</button>
		        <button type="button" class="photoPoster">반려견 포스터 만들기</button>
	        </div>
	        
	        <!-- 갤러리 등록 폼 -->
	        <div class="register_wrap">
		        <div class="register_form">
		            <button id="uploadGBtn">등록</button>
		        	<button class="closeUGCard">접기</button>
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
		                  <input type="text" id="gtitle" placeholder="title (최대 30자)" maxlength="30" required>
		                  <textarea id="gcontent" placeholder="사진 설명이 있다면 적어주세요.(최대 300자)" maxlength="300"></textarea>
		                  <input type="hidden" name="petId" value="${pet.petId}">
		        	</div>
		       </div>
	       </div>
	        	        
	        
	        <!-- 갤러리 들어갈 공간 -->
	                       	   		     
	        <div class="galleryBox">
	        	<c:if test="${msg eq 'notLogin'}"> <!-- 로그인 안 한 경우 -->
		        	<p class="noneMsg">로그인 후 우리 아이의 소중한 일상을 남겨 보세요.</p>
		        	<img alt="noticeImg" src="<c:url value='/img/mypet/noticeImg2.PNG'/>">
		        </c:if>
	        
	        	<c:if test="${msg eq 'petNone'}"> <!-- 반려견 등록 안 한 경우 -->
		        	<p class="noneMsg">반려견을 등록하고 우리 아이의 소중한 일상을 남겨 보세요.</p>
		        	<img alt="noticeImg" src="<c:url value='/img/mypet/noticeImg2.PNG'/>">
		        </c:if>
		        
		        <c:if test="${galleryList.size() <= 0}"> <!-- 반려견 등록 했지만 갤러리 등록이 없는 경우 -->
		        	<p class="noneMsg">우리 아이의 소중한 일상을 남겨 보세요.</p>
		        	<img alt="noticeImg" src="<c:url value='/img/mypet/noticeImg2.PNG'/>">
		        </c:if>
		        
				<c:if test="${galleryList.size() > 0}">
					<c:forEach var="imgCard" items="${galleryList}">			
			            <div class="gcardWrap" id="gcardWrap${imgCard.imgId}">		              
		                    <div class="imgBox">
		                        <img alt="${imgCard.imgId}" src="<c:url value='${imgCard.imagePath}'/>">			                        
		                    </div>
		                    <div class="imgInfo">
								<h3>${imgCard.title}</h3>
								<p>${imgCard.content}</p>			                       		                        
		                    </div>
		                    <div class="gselect" data-html2canvas-ignore="true">
						        <ul class="list">
						            <li><button class="modifyGCardBtn" title="수정" href="${imgCard.imgId}">수정</button></li>
						            <li><button class="deleteGCardBtn" title="삭제" href="${imgCard.imgId}">삭제</button></li>
						            <li><button class="toImage" title="이미지로 저장" href="${imgCard.imgId}">이미지로 저장</button></li>
						        </ul>
						    </div>		                    					         	                    		               
			            </div>
					</c:forEach>
				</c:if>	
	        </div>	 
	        
	        
	        
	   </div>
	
		
		<!-- 페이징 처리 -->
		<div class="paging">
			<ul>
				<!-- 이전 버튼 -->
				<c:if test="${pc.prev}">
			        <li>
						<a href="<c:url value='/mypet/gallery${pc.makeURI(pc.beginPage - 1)}'/>" >이전</a>
					</li>
				</c:if>
				
				<!-- 페이지 버튼 -->
				<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
					<li>                                                                 <!-- 조건부로 클래스 추가하는 코드! 홀따옴표 주의하자ㅠ -->
					   <a href="<c:url value='/mypet/gallery${pc.makeURI(pageNum)}' />" class="${(pc.paging.page == pageNum) ? 'page-active' : ''}" >${pageNum}</a>
					</li>
				</c:forEach>
				  
			   <!-- 다음 버튼 -->
			   <c:if test="${pc.next}">
				   <li>
				       <a href="<c:url value='/mypet/gallery${pc.makeURI(pc.endPage + 1)}'/>" >다음</a>
				   </li>
			   </c:if>
			</ul>
		</div>
		<!-- 페이징 처리 끝 -->
		
	</main>
</div>


    
    

           
	            
	
	<!-- 갤러리 수정 모달 -->
	<div class="mdpop" style="z-index:100; position: fixed; top: 0; left: 0; width:100%; height:100%; background:rgba(0,0,0,0.7); display:none; text-indent:-9999px"></div>
	<div class="modifyCard_wrap">
		<div class="modifyCard">
	        <button href="" class="mdGBtn">저장</button>
	        <button href="" class="mdGcancle">취소</button>
	        <div class="flex-container">
	            <div class="wrapper">
	            	<div class="img_wrapper">
	                	<img src="" id="mdImage-box">
	                </div>
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
	</div>		

			
	<!-- 갤러리 상세조회 모달 -->			
	<div id="showGallery">
		<div class="closeShowGal">닫기</div>
		<ul class="pop_list">
			<li>
				<h2 class="pop_title"></h2>
				<img class="pop_img" src="" alt="showGalImg" />
				<div class="pop_content"></div>
			</li>
		</ul>
	</div>		
				
			
<jsp:include page="../common/pet_modal.jsp" />            
<jsp:include page="../common/footer.jsp" />     
<jsp:include page="./poster2.jsp" />
</body>

    <script type="text/javascript">    
    	
	    $(function(){
			 $(".mainMenu.mainMenu1").addClass("checked");
		})
    	
			 
		
		// 로그인 여부, 등록된 반려견 여부에 따른 메뉴 숨기기
	    if("${msg}" === 'notLogin'){ // 로그인 안한 경우
	    	$(".openUGCard").add($(".photoPoster")).add($("#petList-open")).add($(".paging")).css("display", "none");
	    	$(".galleryBox").css("height", "800px").css("width", "950px").css("margin", "70px auto");
	    }
	     
        if("${msg}" === 'petNone'){ // 등록된 반려견 없는 경우
        	$(".openUGCard").add($(".photoPoster")).add($(".paging")).css("display", "none");
	    	$(".galleryBox").css("height", "800px");
	    }
			 
			 
        
     	// 등록카드 여닫기(갤러리)
	     $(".openUGCard").click(function(){           
	         $(".register_wrap").css("display","block");
	         $(".photoPoster").css("display","none");
	         $(this).css("display","none");
	     })
	
	     $(".closeUGCard").click(function(){
	         $(".register_wrap").css("display","none");
	         $(".openUGCard").css("display","inline-block");
	         $(".photoPoster").css("display","inline-block");
	     })
        
        

	     
	     // 갤러리 수정,삭제 메뉴 여닫기
	     $(document).on("click", ".gselect", function (e) {
	    	$(".gselect").removeClass("on");
            //toggle 방식
            if($(this).hasClass("on")){
                $(this).add($(this).children(".list")).removeClass("on");
            }else{ // !$(this).hasClass("on") 없으면
                $(this).add($(this).children(".list")).addClass("on");
            }         
        });
	     
	    $(document).mouseup(function (e){
	    	let LayerPopup = $(".gselect .list");
	    	if(LayerPopup.has(e.target).length === 0){
	    	  LayerPopup.removeClass("on");
	    	  $(".gselect").removeClass("on");
	    	}
	    }); 
	     
	     
/*	     
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
*/


		// 파일업로드(추가)
		const fileDOM = document.querySelector('#file');
		const previews = document.querySelectorAll('.image-box');
		
		fileDOM.addEventListener('change', () => {
			// 이미지 확장자 체크
			let ext = $("#file").val().split(".").pop().toLowerCase();		    
			if($.inArray(ext, ["jpg", "jpeg", "png", "gif", "bmp", "pdf", "webp"]) == -1) {
				alert("이미지 파일(jpg, jpeg, png, gif, bmp, pdf, webp)만 업로드 가능합니다.");
				fileDOM.value = ""; // 이미지 업로드 초기화
				previews[0].src = "<c:url value='/img/common/no_image.webp'/>";
				return false;
			}	    	
			// 이미지 용량 체크
				if(fileDOM.files[0].size > 10485760){ // 10MB 초과
		        alert("최대 10MB까지 업로드 가능합니다.");
		        fileDOM.value = ""; // 이미지 업로드 초기화
		        previews[0].src = "<c:url value='/img/common/no_image.webp'/>";
		        return false; 
		   }
			
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
			// 이미지 확장자 체크
			let ext = $("#modifyFile").val().split(".").pop().toLowerCase();		    
			if($.inArray(ext, ["jpg", "jpeg", "png", "gif", "bmp", "pdf", "webp"]) == -1) {
				alert("이미지 파일(jpg, jpeg, png, gif, bmp, pdf, webp)만 업로드 가능합니다.");
				fileDOM2.value = ""; // 이미지 업로드 초기화
				MdPreviews.src = "<c:url value='/img/common/no_image.webp'/>";
				return false;
			}	    	
			// 이미지 용량 체크
				if(fileDOM2.files[0].size > 10485760){ // 10MB 초과
		        alert("최대 10MB까지 업로드 가능합니다.");
		        fileDOM2.value = ""; // 이미지 업로드 초기화
		        MdPreviews.src = "<c:url value='/img/common/no_image.webp'/>";  // 수정할 때는 그냥 기존 이미지로 하고싶다
		        return false; 
		   }	    	
			
		    const imageSrc = URL.createObjectURL(fileDOM2.files[0]);
		    MdPreviews.src = imageSrc;
		});


		
	    
	        
	 	// 갤러리 추가     
        $("#uploadGBtn").click(function(){
        	
        	if(!$("input[name=file]").val()){ // 사진 null인 경우
				alert("사진을 첨부해주세요.");
			    return false;
			}
        	       	
            // 이미지 리사이징
      	    let img = new Image;
      	    img.src = previews[0].src; 
      	
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
 
            //formData 객체 생성
            let formData = new FormData();
     		formData.append("petImg", tmpThumbFile);
        	    	
        	// 넘겨줄 반려동물 데이터
        	//enter => <br>
			let title = $("#gtitle").val();
			if(!title || title.replace(/\s| /gi, "").length==0){ // null값이거나 공백만 입력한 경우
				alert("제목을 입력해주세요.");
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
		$(document).on("click", ".modifyGCardBtn", function () {
			
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
 						
                		$(".gselect").add($(".gselect").children(".list")).removeClass("on");
                        $(".mdpop").css("display","block");                        
                        $(".modifyCard_wrap").css("display","block");
                        $(".mdGBtn").attr("href", imgId);
                        $(".mdGcancle").attr("href", imgId);
                        $("#mdImage-box").attr("src", imagePath);
                        $("#mdGtitle").val(title);
                        $("#mdGCont").val(content);                                          
                }, 
                error: function() {
                    console.log("통신 실패"); 
                } 
            });
        })
	    
        
        
        //갤러리 수정 취소  
        $(document).on("click", ".mdGcancle", function () {
        	let imgId = $(this).attr("href");
        	$(".modifyCard_wrap").css("display","none");
        	$(".mdpop").css("display","none");
        })
        
	    	      
        
        // 갤러리 수정 
        $(document).on("click", ".mdGBtn", function () {
  	
        	//formData 객체 생성
            let formData = new FormData(); 	
         	
            // 이미지 리사이징	
       	    if($("input[id='modifyFile']").val()){ // 사진 첨부한 경우에만 리사이징 진행
 				
       		  let img = new Image;
      	      img.src = MdPreviews.src; 
      	
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
        	
        	// 넘겨줄 갤러리 데이터
        	let title = $("#mdGtitle").val();
			if(!title){ // 날짜 null값
				alert("제목을 입력해주세요.");
			    return false;
			}        	
			let text = $("#mdGCont").val();			
			text = text.replace(/(?:\r\n|\r|\n)/g, '<br>'); // 엔터 -> <br/>로 치환        	
			let imgId = $(this).attr("href");
			console.log(imgId)
        	let petData = {
        			"imgId": imgId,
        			"title": title,
        			"content": text
        	}
        	
        	// formData에 json타입으로 petData 추가
        	formData.append("petData", new Blob([ JSON.stringify(petData) ], {type : "application/json"}));
        	
        	// ajax 처리
        	$.ajax({
        		  type: "POST",
        	      url: "/today/mypet/modifyGallery",
        	      data: formData,
        	      dataType: "text",
        	      contentType: false,               // * 중요 *
        	      processData: false,               // * 중요 *
        	      enctype : 'multipart/form-data',  // * 중요 *
        	      success: function(result) { 
                      console.log("통신 성공!: ");
                      if(result === "success") {
                          alert("갤러리 수정이 완료되었습니다.");
                          window.location.reload();
                      } else {
                          alert("갤러리 수정에 실패했습니다.");
                      }
                  }, 
                  error: function() {
                	  console.log("통신 실패"); 
                  } 
        	});
			
        })
        
        
        
        
        // 갤러리 삭제 요청		
		$(document).on("click", ".deleteGCardBtn", function () {
			
			if(confirm("사진을 삭제하시겠습니까?")){
				
				let imgId = $(this).attr("href");	            
	    		let gallery = {imgId: imgId};
	    		
	    		$.ajax({
	                type: 'post',
	                dataType : "text",
	                contentType: 'application/json',
	                url: '/today/mypet/deleteGallery',
	                data: JSON.stringify(gallery),
	                success: function (response) {
	         			if(response === 'success'){
	         				alert("사진이 삭제되었습니다.");
	         				window.location.reload();
	         			}else{
	         				alert("사진 삭제에 실패했습니다.");
	         			}
	                }, 
	                error: function() {
	                    console.log("통신 실패"); 
	                } 
	            });
			}
		    
        })
        
        
        
        // 이미지 hover 이벤트  
	    $(document).on({
                mouseenter: function () {
                	$(this).parent().css("background", "#ddd");
                },
                mouseleave: function () {
                	$(this).parent().css("background", "#fff");
                }
        }, '.imgBox');
        
	 	
	 	
        /*// 이미지 클릭시 상세 조회
        $(document).on("click", ".imgBox img", function () {
        	$("#showGallery").css("display", "block");
        	
        	//초기화
			$(".pop_content").html("");			
			
			let imgId = $(this).attr("alt");            
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
                        $(".pop_img").attr("src", imagePath);
                        $(".pop_title").html(title);
                        $(".pop_content").html(content);                                          
                }, 
                error: function() {
                    console.log("통신 실패"); 
                } 
            });
        })*/
        
        
        // 이미지 클릭시 상세 조회
        $(document).on("click", ".imgBox img", function () {
        	$("#showGallery").css("display", "block");
        	
        	//초기화
			$(".pop_content").html("");			
			
			let src = $(this).attr("src");            
    		let title = $(this).parent().next().children("h3").html();
    		let content = $(this).parent().next().children("p").html();
		
            $(".mdpop").css("display","block");                        
            $(".pop_img").attr("src", src);
            $(".pop_title").html(title);
            $(".pop_content").html(content);                                          
                
        })
        
        
        
        // 상세조회 모달 닫기
        $(".closeShowGal").click(function(){
        	$("#showGallery").css("display", "none");
        	$(".mdpop").css("display","none");
        })
        
        
        
        // 각 사진 이미지로 저장
        $(".toImage").on("click",function(){   
        	
        	let imgId = $(this).attr("href");
        	
            html2canvas($('#gcardWrap' + imgId)[0]).then(function(canvas){   
                let img = document.createElement("a");    
                img.download = "gallery.png";   
                img.href=canvas.toDataURL();  
                document.body.appendChild(img);   
                img.click();   
            });   
            
        });    
        
        
     
    </script>   
</html>