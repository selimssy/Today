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
.register_form, .modifyCard{/*display: none;*/ width: 550px; height: 320px; margin: 50px auto; border: 3.5px solid #7AB730; border-radius: 15px; padding: 20px; position: relative; display: flex; justify-content: space-evenly;}
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

/* ????????? ?????? ?????? */
#showGallery{display:none; width:700px; height: 610px; overflow-y: auto; background:#fff; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8; z-index:7;}
.pop_list li {padding:20px 35px 0px; box-sizing: border-box;}
.pop_list li h2.pop_title{padding:10px 0 24px; text-align:center; font-weight:bold; font-size:32px; font-family: 'Jua', sans-serif; letter-spacing:2px;}
.pop_list li img.pop_img{width:100%;}
.pop_list li .pop_content{width:100%; overflow: visible; padding:15px 10px; line-height:1.8; font-size:18.5px; font-family: 'Jua', sans-serif; box-sizing: border-box;}
.closeShowGal{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 15px; right: 15px; background-image: url(/today/img/common/close.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}

.noneMsg{font-family: 'Nanum Pen Script'; text-align: center; font-size: 36px; margin: 50px 0 30px;}
.noneMsg+img{width:60%; display: block; margin: auto; opacity: 0.85; box-shadow: 0 0 25px 0 #e8e8e8; border-radius: 15px;}

/*?????????*/
@media all and (max-width:1065px) {			
	.siteInfo{width:100%; height:auto; position: relative;}
	.siteInfo:before {content: ""; display: block; padding-top: 35.7143%; /* ?????? ?????? ??????*/}
	.ratio_content {position: absolute; top: 0; right: 0; bottom: 0; left: 0;}		
	.mainContent{width:100%;}
	.mainContent .conTitle{width:80%; margin: 0 auto;}
	
	.galleryBox{width:100%; height:auto; position: relative; padding:3%; margin-top:8.75%; /*margin-top: 70px; box-sizing: content-box;*/}
	.galleryBox:before {content: "";display: block;padding-top: 100%; /* 1:1 ?????? */}
	.galleryBox_wrap{width:100%; padding:3%; box-sizing: border-box; position: absolute; top: 0; right: 0; bottom: 0; left: 0;}
	.openUGCard, .photoPoster{z-index:3;}
	.paging{padding: 75px 0 0;}
	
	.gcardWrap{width:31%; height:auto; padding-bottom:0; margin:0 3% 3% 0;}
	.imgBox{width:100%; position: relative; box-sizing: border-box;}
	.imgBox::after {display: block; content: ""; padding-bottom: 75%;}
	.imgBox img{width:100%; height: 100%; position: absolute; top: 0; left: 0; object-fit: cover;  box-sizing: border-box; display: block;}
	.imgInfo h3{font-size:2.5vw;}
}

/* ????????? ?????? : 800px ?????? */
@media all and (max-width:800px) {
	.noneMsg{font-size: 4.5vw;}
	.mainContent .conTitle span{line-height:100%; font-size:5.625vw; padding-left:10%;}
	
	.register_form, .modifyCard{width:57%; height:auto; display:block; margin:0 auto; padding-bottom:65px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background:#fff; z-index:10; overflow-y: auto;}	

	.galInfo{width:80%; padding-top:20px; margin:0 auto;}
	#gcontent, #mdGCont{margin-top:20px;}
	.gcardWrap{padding:1.25%; padding-bottom:0;}
	.buttonNav{width:100%;}
	.openUGCard{width:12%; height:auto; font-size:3.5vw; padding:0.2vw; top:5.6vw; right: 5vw;}
	.photoPoster{width:27%; height:auto; font-size:3.5vw; padding:0.2vw; padding-left:4.375vw; top:5.6vw; right: 20vw;}
	.gselect{width:1.25vw; height: 2.5vw; right: 0.75vw; bottom:1.875vw;}
	.paging{padding: 20px 0 0;}
	.paging ul li a{font-size:2vw;}
	 
	.lifetimeBox{width:80%;}
	.lifetimeCard{width:100%;}
	.petImage{width: 36%; position: relative; box-sizing: border-box;}
	.petImage::after {display: block; content: ""; padding-bottom: 100%;}
	.lifetimeCard img{width:100%; height:100%; position: absolute; top: 0; left: 0; object-fit: cover;  box-sizing: border-box; display: block;}
	
	.cardInfo{width: 60%; height:auto; position: relative; margin-left:15px;}
	.cardInfo p {font-size: 2.3vw;}
	/*.cardInfo::after {content: ""; display: block; padding-top: 61.5%;}
	.content { position: absolute; top: 0; right: 0; bottom: 0; left: 0;}*/
	.InfoText{width:100%; height:auto; font-size: 3vw;}
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
	            <p>????????? ?????????</p>
	            <p>???????????? ?????? ?????? ?????? ??????</p>
	        </div>
	    </div>
	    
	    <div class="siteNav">   
	        <table>
		        <tr>
		            <td><a href="<c:url value='/'/>"><div class="homeLogo">home</div></a></td>
		            <td><a href="<c:url value='/mypet/lifetime'/>">????????? ????????????</a></td>
		            <td class="checked"><a href="<c:url value='/mypet/gallery'/>">?????????</a></td>
		        </tr>
		    </table>
	    </div>
	
	    <div class="otherWrap">
	        <div class="otherP">
	            <P>???????????? ?????? ???????????????</P>
	            <!--<h1>?????? ???????????? ?????? ????????????</h1> -->
	            <p>?????? ?????? ????????? ?????????</p>
	    	</div>
	    </div>
	
		
		<div class="mainContent">
	        <div class="conTitle">
	            <span>${pet.petName} ?????????</span>
	        </div>
			
			<button type="button" id="petList-open" title="???????????? ??????" class="changePet2"></button>
	        <div class="buttonNav">
		        <button type="button" class="openUGCard">+ ????????????</button>
		        <button type="button" class="photoPoster">????????? ????????? ?????????</button>
	        </div>
	        
	        <!-- ????????? ?????? ??? -->
	        <div class="register_wrap">
		        <div class="register_form">
		            <button id="uploadGBtn">??????</button>
		        	<button class="closeUGCard">??????</button>
					<div class="flex-container">       
		               <div class="wrapper">
		                   <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" style="margin: 20px auto;"/>
		                   <label for="file" class="upload-btn">
		                       <input id="file" name="file" type="file" accept="image/*" />
		                       <span>Upload Image</span>
		                   </label>
		               </div>
		            </div>
		            <div class="galInfo">
		                  <input type="text" id="gtitle" placeholder="title (?????? 30???)" maxlength="30" required>
		                  <textarea id="gcontent" placeholder="?????? ????????? ????????? ???????????????.(?????? 300???)" maxlength="300"></textarea>
		                  <input type="hidden" name="petId" value="${pet.petId}">
		        	</div>
		       </div>
	       </div>
	        	        
	        
	        <!-- ????????? ????????? ?????? -->
	                       	   		     
	        <div class="galleryBox">
	        <div class="galleryBox_wrap">
	        	<c:if test="${msg eq 'notLogin'}"> <!-- ????????? ??? ??? ?????? -->
		        	<p class="noneMsg">????????? ??? ?????? ????????? ????????? ????????? ?????? ?????????.</p>
		        	<img alt="noticeImg" src="<c:url value='/img/mypet/noticeImg2.PNG'/>">
		        </c:if>
	        
	        	<c:if test="${msg eq 'petNone'}"> <!-- ????????? ?????? ??? ??? ?????? -->
		        	<p class="noneMsg">???????????? ???????????? ?????? ????????? ????????? ????????? ?????? ?????????.</p>
		        	<img alt="noticeImg" src="<c:url value='/img/mypet/noticeImg2.PNG'/>">
		        </c:if>
		        
		        <c:if test="${galleryList.size() <= 0}"> <!-- ????????? ?????? ????????? ????????? ????????? ?????? ?????? -->
		        	<p class="noneMsg">?????? ????????? ????????? ????????? ?????? ?????????.</p>
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
						            <li><button class="modifyGCardBtn" title="??????" href="${imgCard.imgId}">??????</button></li>
						            <li><button class="deleteGCardBtn" title="??????" href="${imgCard.imgId}">??????</button></li>
						            <li><button class="toImage" title="???????????? ??????" href="${imgCard.imgId}">???????????? ??????</button></li>
						        </ul>
						    </div>		                    					         	                    		               
			            </div>
					</c:forEach>
				</c:if>	
			</div>
	        </div>	 
	        
	        
	        
	   </div>
	
		
		<!-- ????????? ?????? -->
		<div class="paging">
			<ul>
				<!-- ?????? ?????? -->
				<c:if test="${pc.prev}">
			        <li>
						<a href="<c:url value='/mypet/gallery${pc.makeURI(pc.beginPage - 1)}'/>" >??????</a>
					</li>
				</c:if>
				
				<!-- ????????? ?????? -->
				<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
					<li>                                                                 <!-- ???????????? ????????? ???????????? ??????! ???????????? ??????????????? -->
					   <a href="<c:url value='/mypet/gallery${pc.makeURI(pageNum)}' />" class="${(pc.paging.page == pageNum) ? 'page-active' : ''}" >${pageNum}</a>
					</li>
				</c:forEach>
				  
			   <!-- ?????? ?????? -->
			   <c:if test="${pc.next}">
				   <li>
				       <a href="<c:url value='/mypet/gallery${pc.makeURI(pc.endPage + 1)}'/>" >??????</a>
				   </li>
			   </c:if>
			</ul>
		</div>
		<!-- ????????? ?????? ??? -->
		
	</main>
</div>


    
    

           
	            
	
	<!-- ????????? ?????? ?????? -->
	<div class="mdpop" style="position: fixed; top: 0; left: 0; width:100%; height:100%; background:rgba(0,0,0,0.7); display:none; text-indent:-9999px"></div>
	<div class="modifyCard_wrap">
		<div class="modifyCard">
	        <button href="" class="mdGBtn">??????</button>
	        <button href="" class="mdGcancle">??????</button>
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

			
	<!-- ????????? ???????????? ?????? -->			
	<div id="showGallery">
		<div class="closeShowGal">??????</div>
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
    	
			 
		
		// ????????? ??????, ????????? ????????? ????????? ?????? ?????? ?????????
	    if("${msg}" === 'notLogin'){ // ????????? ?????? ??????
	    	$(".openUGCard").add($(".photoPoster")).add($("#petList-open")).add($(".paging")).css("display", "none");
	    	$(".galleryBox").css("height", "800px").css("width", "950px").css("margin", "70px auto");
	    }
	     
        if("${msg}" === 'petNone'){ // ????????? ????????? ?????? ??????
        	$(".openUGCard").add($(".photoPoster")).add($(".paging")).css("display", "none");
	    	$(".galleryBox").css("height", "800px");
	    }
			 
			 
        
     	// ???????????? ?????????(?????????)
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
        
        

	     
	     // ????????? ??????,?????? ?????? ?????????
	     $(document).on("click", ".gselect", function (e) {
	    	$(".gselect").removeClass("on");
            //toggle ??????
            if($(this).hasClass("on")){
                $(this).add($(this).children(".list")).removeClass("on");
            }else{ // !$(this).hasClass("on") ?????????
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
	     // ???????????????(??????(??????))
	    const fileDOM = document.querySelector('#file');
	    const previews = document.querySelectorAll('.image-box');

	    fileDOM.addEventListener('change', () => {
	      const reader = new FileReader();
	      reader.onload = ({ target }) => {
	        previews[0].src = target.result;
	      };
	      reader.readAsDataURL(fileDOM.files[0]);
	    });
			    	    
	    // ???????????????(??????(??????))
	    const fileDOM2 = document.querySelector('#modifyFile');
	    const MdPreviews = document.querySelector('#mdImage-box');

	    fileDOM2.addEventListener('change', () => {
    	  const imageSrc = URL.createObjectURL(fileDOM2.files[0]);
    	  MdPreviews.src = imageSrc;
    	});
*/


		// ???????????????(??????)
		const fileDOM = document.querySelector('#file');
		const previews = document.querySelectorAll('.image-box');
		
		fileDOM.addEventListener('change', () => {
			// ????????? ????????? ??????
			let ext = $("#file").val().split(".").pop().toLowerCase();		    
			if($.inArray(ext, ["jpg", "jpeg", "png", "gif", "bmp", "pdf", "webp"]) == -1) {
				alert("????????? ??????(jpg, jpeg, png, gif, bmp, pdf, webp)??? ????????? ???????????????.");
				fileDOM.value = ""; // ????????? ????????? ?????????
				previews[0].src = "<c:url value='/img/common/no_image.webp'/>";
				return false;
			}	    	
			// ????????? ?????? ??????
				if(fileDOM.files[0].size > 10485760){ // 10MB ??????
		        alert("?????? 10MB?????? ????????? ???????????????.");
		        fileDOM.value = ""; // ????????? ????????? ?????????
		        previews[0].src = "<c:url value='/img/common/no_image.webp'/>";
		        return false; 
		   }
			
		   const reader = new FileReader();
		   reader.onload = ({ target }) => {
		      previews[0].src = target.result;
		   };
		   reader.readAsDataURL(fileDOM.files[0]);
		});
		
		
		// ???????????????(??????)
		const fileDOM2 = document.querySelector('#modifyFile');
		const MdPreviews = document.querySelector('#mdImage-box');
		
		fileDOM2.addEventListener('change', () => {
			// ????????? ????????? ??????
			let ext = $("#modifyFile").val().split(".").pop().toLowerCase();		    
			if($.inArray(ext, ["jpg", "jpeg", "png", "gif", "bmp", "pdf", "webp"]) == -1) {
				alert("????????? ??????(jpg, jpeg, png, gif, bmp, pdf, webp)??? ????????? ???????????????.");
				fileDOM2.value = ""; // ????????? ????????? ?????????
				MdPreviews.src = "<c:url value='/img/common/no_image.webp'/>";
				return false;
			}	    	
			// ????????? ?????? ??????
				if(fileDOM2.files[0].size > 10485760){ // 10MB ??????
		        alert("?????? 10MB?????? ????????? ???????????????.");
		        fileDOM2.value = ""; // ????????? ????????? ?????????
		        MdPreviews.src = "<c:url value='/img/common/no_image.webp'/>";  // ????????? ?????? ?????? ?????? ???????????? ????????????
		        return false; 
		   }	    	
			
		    const imageSrc = URL.createObjectURL(fileDOM2.files[0]);
		    MdPreviews.src = imageSrc;
		});


		
	    
	        
	 	// ????????? ??????     
        $("#uploadGBtn").click(function(){
        	
        	if(!$("input[name=file]").val()){ // ?????? null??? ??????
				alert("????????? ??????????????????.");
			    return false;
			}
        	       	
            // ????????? ????????????
      	    let img = new Image;
      	    img.src = previews[0].src; 
      	
      	    var canvas = document.createElement("canvas");
    	    canvas.getContext("2d").drawImage(img, 0, 0);
    	      	  
    	    // ?????? ?????? ????????? ????????????
    	    let maxWidth = 650; //?????? ?????? 650px
    	    let maxHeight = 860; //?????? ?????? 860px
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

    	    //canvas??? dataurl??? blob(file)??? ?????? ??????
    	    var dataURI = canvas.toDataURL("image/png"); //png => jpg ????????? ?????? ??????
    	    var byteString = atob(dataURI.split(',')[1]);
    	    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
    	    var ab = new ArrayBuffer(byteString.length);
    	    var ia = new Uint8Array(ab);
    	    for (var i = 0; i < byteString.length; i++) {
    	        ia[i] = byteString.charCodeAt(i);
    	    }
    	    //??????????????? file ??????
    	    var tmpThumbFile = new Blob([ab], {type: mimeString});
 
            //formData ?????? ??????
            let formData = new FormData();
     		formData.append("petImg", tmpThumbFile);
        	    	
        	// ????????? ???????????? ?????????
        	//enter => <br>
			let title = $("#gtitle").val();
			if(!title || title.replace(/\s| /gi, "").length==0){ // null???????????? ????????? ????????? ??????
				alert("????????? ??????????????????.");
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
        	
        	// formData??? json???????????? petData ??????
        	formData.append("petData", new Blob([ JSON.stringify(petData) ], {type : "application/json"}));
        	
        	// ajax ??????
        	$.ajax({
        		  type: "POST",
        	      url: "/today/mypet/regGallery",
        	      data: formData,
        	      dataType: "text",
        	      contentType: false,               // * ?????? *
        	      processData: false,               // * ?????? *
        	      enctype : 'multipart/form-data',  // * ?????? *
        	      success: function(result) { 
                      console.log("?????? ??????!: ");
                      if(result === "success") {
                          alert("???????????? ?????????????????????.");
                          window.location.reload();
                      } else {
                          alert("????????? ????????? ??????????????????.");
                      }
                  }, 
                  error: function() {
                	  alert("????????? ????????? ??????????????????.");
                  } 
        	});
        }) 
	    
	    
	    
	    
	    // ????????? ?????? ???????????? ??????		
		$(document).on("click", ".modifyGCardBtn", function () {
			
			//?????????
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
                    console.log("?????? ??????"); 
                } 
            });
        })
	    
        
        
        //????????? ?????? ??????  
        $(document).on("click", ".mdGcancle", function () {
        	let imgId = $(this).attr("href");
        	$(".modifyCard_wrap").css("display","none");
        	$(".mdpop").css("display","none");
        })
        
	    	      
        
        // ????????? ?????? 
        $(document).on("click", ".mdGBtn", function () {
  	
        	//formData ?????? ??????
            let formData = new FormData(); 	
         	
            // ????????? ????????????	
       	    if($("input[id='modifyFile']").val()){ // ?????? ????????? ???????????? ???????????? ??????
 				
       		  let img = new Image;
      	      img.src = MdPreviews.src; 
      	
      	      var canvas = document.createElement("canvas");
 	    	  canvas.getContext("2d").drawImage(img, 0, 0);
 	    	      	  
 	    	// ?????? ?????? ????????? ????????????
 	    	  let maxWidth = 650; //?????? ?????? 650px
 	    	  let maxHeight = 860; //?????? ?????? 860px
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

 	    	  //canvas??? dataurl??? blob(file)??? ?????? ??????
 	    	  var dataURI = canvas.toDataURL("image/png"); //png => jpg ????????? ?????? ??????
 	    	  var byteString = atob(dataURI.split(',')[1]);
 	    	  var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
 	    	  var ab = new ArrayBuffer(byteString.length);
 	    	  var ia = new Uint8Array(ab);
 	    	  for (var i = 0; i < byteString.length; i++) {
 	    	      ia[i] = byteString.charCodeAt(i);
 	    	  }
 	    	  //??????????????? file ??????
 	    	  var tmpThumbFile = new Blob([ab], {type: mimeString}); 	               
      	      formData.append("petImg", tmpThumbFile);
       		   
 			}
        	
        	// ????????? ????????? ?????????
        	let title = $("#mdGtitle").val();
			if(!title){ // ?????? null???
				alert("????????? ??????????????????.");
			    return false;
			}        	
			let text = $("#mdGCont").val();			
			text = text.replace(/(?:\r\n|\r|\n)/g, '<br>'); // ?????? -> <br/>??? ??????        	
			let imgId = $(this).attr("href");
			console.log(imgId)
        	let petData = {
        			"imgId": imgId,
        			"title": title,
        			"content": text
        	}
        	
        	// formData??? json???????????? petData ??????
        	formData.append("petData", new Blob([ JSON.stringify(petData) ], {type : "application/json"}));
        	
        	// ajax ??????
        	$.ajax({
        		  type: "POST",
        	      url: "/today/mypet/modifyGallery",
        	      data: formData,
        	      dataType: "text",
        	      contentType: false,               // * ?????? *
        	      processData: false,               // * ?????? *
        	      enctype : 'multipart/form-data',  // * ?????? *
        	      success: function(result) { 
                      console.log("?????? ??????!: ");
                      if(result === "success") {
                          alert("????????? ????????? ?????????????????????.");
                          window.location.reload();
                      } else {
                          alert("????????? ????????? ??????????????????.");
                      }
                  }, 
                  error: function() {
                	  console.log("?????? ??????"); 
                  } 
        	});
			
        })
        
        
        
        
        // ????????? ?????? ??????		
		$(document).on("click", ".deleteGCardBtn", function () {
			
			if(confirm("????????? ?????????????????????????")){
				
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
	         				alert("????????? ?????????????????????.");
	         				window.location.reload();
	         			}else{
	         				alert("?????? ????????? ??????????????????.");
	         			}
	                }, 
	                error: function() {
	                    console.log("?????? ??????"); 
	                } 
	            });
			}
		    
        })
        
        
        
        // ????????? hover ?????????  
	    $(document).on({
                mouseenter: function () {
                	$(this).parent().css("background", "#ddd");
                },
                mouseleave: function () {
                	$(this).parent().css("background", "#fff");
                }
        }, '.imgBox');
        
	 	
	 	
        /*// ????????? ????????? ?????? ??????
        $(document).on("click", ".imgBox img", function () {
        	$("#showGallery").css("display", "block");
        	
        	//?????????
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
                    console.log("?????? ??????"); 
                } 
            });
        })*/
        
        
        // ????????? ????????? ?????? ??????
        $(document).on("click", ".imgBox img", function () {
        	$("#showGallery").css("display", "block");
        	
        	//?????????
			$(".pop_content").html("");			
			
			let src = $(this).attr("src");            
    		let title = $(this).parent().next().children("h3").html();
    		let content = $(this).parent().next().children("p").html();
		
            $(".mdpop").css("display","block");                        
            $(".pop_img").attr("src", src);
            $(".pop_title").html(title);
            $(".pop_content").html(content);                                          
                
        })
        
        
        
        // ???????????? ?????? ??????
        $(".closeShowGal").click(function(){
        	$("#showGallery").css("display", "none");
        	$(".mdpop").css("display","none");
        })
        
        
        
        // ??? ?????? ???????????? ??????
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