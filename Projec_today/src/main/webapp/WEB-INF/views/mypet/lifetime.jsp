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
.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/common/mainbg3.png); background-size: contain; margin: 0 auto;  position: relative;}      
.mainContent{width: 1050px; margin: 0 auto; min-height: 160px; position: relative;}
.mainContent .conTitle{width: 825px; margin: 0 auto; background:#BBD996; box-sizing: border-box; text-align: center;}
.mainContent .conTitle span{line-height: 70px; font-size: 45px; font-family: 'Nanum Pen Script'; padding-left: 70px; background-image: url(/today/img/mypet/dogicon.png); background-size: contain; background-repeat: no-repeat;}
.uploadCard_wrap, .modifyCard_wrap{display: none;}
.uploadCard, .modifyCard{/*display: none;*/ width: 650px; height: 320px; margin: 50px auto; border: 3.5px solid #7AB730; border-radius: 15px; padding: 20px; position: relative; display: flex; justify-content: space-evenly;}
.openUCard{width: 90px; height: 40px; margin: 35px 60px 0 0; border: none; border-radius: 7px; font-size: 26px; font-family: 'Nanum Pen Script'; background: #7AB730; float: right; cursor: pointer;}
.closeUCard, .mdcancle{width: 70px; height: 33px; border: none; border-radius: 7px; background: #fff; border: 3px solid #7AB730; color: #7AB730;font-weight: bolder; position:absolute; bottom: 15px; right: 15px; cursor: pointer;}
.uploadCard input[type=submit]{width: 70px; height: 33px; border: none; border-radius: 7px; background: #7AB730; position:absolute; bottom: 15px; right: 100px; cursor: pointer;}
#uploadCardBtn, .mdBtn{width: 70px; height: 33px; border: none; border-radius: 7px; background: #7AB730; position:absolute; bottom: 15px; right: 100px; cursor: pointer;}
.lifeCardInfo{width: 350px; padding-top: 20px;}
.lifeCardInfo input[type=date]{width: 230px; font-size: 18px; font-family: "NanumSquare","?????? ??????", sans-serif; text-align: center; margin-left: 65px;}        
.InfoList{width: 350px; height: 165px; background: #fff; border-radius: 10px; margin-top: 25px;  box-sizing: border-box; position: relative;} 
.InfoList textarea{resize: none; width: 100%; height: 100%; background: none; border: none; box-shadow: 0 0 11px 0 #e8e8e8; font-size: 21px; line-height: 1.5em; font-family: 'Nanum Pen Script'; box-sizing: border-box; padding: 25px 30px;}
.InfoList .count {position:absolute; right:20px; bottom:15px; color:#777; font-family:"ht_r"; font-size:13px; }

.lifetimeBox{width:550px; margin: 50px auto;}
.lifetimeCard{width:550px; /*height: 200px;*/ display: flex; justify-content: space-evenly; margin-bottom:80px}
.lifecardbullet{width:45px; height: 45px; position: absolute; top: 75px; left:-85px; background-image: url(/today/img/community/cbullet.png); background-size: contain; background-repeat: no-repeat; text-indent: -9999px;}
.modifyCardBtn{display:none; width:16px; position: absolute; top: 15px; right:30px; border:none; background-color: transparent; background-image: url(/today/img/mypet/modify.png); background-size: contain; background-repeat: no-repeat; color: transparent; cursor: pointer;}
.deleteCardBtn{display:none; width:16px; position: absolute; top: 15px; right:7px; border:none; background-color: transparent; background-image: url(/today/img/mypet/delete.png); background-size: contain; background-repeat: no-repeat; color: transparent; cursor: pointer;}
.lifetimeCard img{width:200px; height:200px;  object-fit: cover; border-radius: 7px;}
.cardInfo{width:350px; height: 200px; position: relative; box-shadow: 0 0 15px 0 #e8e8e8; background: #F7F7F7; padding: 20px; margin-left: 25px; box-sizing: border-box;}
.cardInfo p{background-image: url(/today/img/mypet/cal.png); background-size: contain; background-repeat: no-repeat; padding-left: 27px;}
.InfoText{width:255px; height:122px; background:none; font-family: 'Nanum Pen Script'; font-size: 24px;  line-height: 1.7em; padding: 20px 15px 0; overflow-y:auto; /*overflow: hidden; text-overflow : ellipsis; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;*/}
.InfoText::-webkit-scrollbar {display: none; /* ???????????? ?????????: Chrome, Safari, Opera*/}
.InfoText{-ms-overflow-style: none; /* IE and Edge */scrollbar-width: none; /* Firefox */}
.modifyCard{/*display:none; width: 550px; height: 320px;*/ background:#fff; border: 3.5px solid #777; /*border-radius: 15px; padding: 15px; */
/*position: relative; display: flex; justify-content: space-evenly; margin: 50px auto; box-sizing: border-box;*/ 
position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;}

.noneMsg{font-family: 'Nanum Pen Script'; text-align: center; font-size: 36px; margin: 70px 0 30px;}
.noneMsg+img{width:100%; text-align: center; opacity: 0.85; box-shadow: 0 0 15px 0 #e8e8e8; border-radius: 15px;}

.image-box{margin: 35px auto 20px;}
.upload-btn{margin-bottom: 15px;}

/*?????????*/
@media all and (max-width:1065px) {			/* ipad??????, ipadPro????????????, gallexyTab?????? */	
	.siteInfo{width:100%; height:auto; position: relative;}
	.siteInfo:before {content: ""; display: block; padding-top: 35.7143%; /* ?????? ?????? ??????*/}
	.ratio_content {position: absolute; top: 0; right: 0; bottom: 0; left: 0;}		
	.mainContent{width:100%;}
	.mainContent .conTitle{width:80%; margin: 0 auto;}
	.lifecardbullet{display:none;}
}

/* ????????? ?????? : 800px ?????? */
@media all and (max-width:800px) {
	.noneMsg{font-size: 4.5vw;}
	.mainContent .conTitle span{line-height:100%; font-size:5.625vw; padding-left:10%;}
	
	.uploadCard{width:60%; height:auto; display:block; margin:0 auto; padding-bottom:65px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background:#fff; z-index:10; overflow-y: auto;}	
	.image-box{width:30%; height:auto;}	
	.lifeCardInfo{width:80%; padding-top:10px; margin:0 auto;}
	.lifeCardInfo input[type=date]{margin:0 auto; display:block;}
	.InfoList{width:100%;}	
	.modifyCard{width:60%; height:auto; display:block; margin:0 auto; padding-bottom:65px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background:#fff; z-index:10; overflow-y: auto;}
	
	
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
	            <p>????????? ????????????</p>
	            <p>?????? ??? ?????? ?????? ???????????? ??????</p>
	        </div>
	    </div>
	    <!--  
	    <div class="siteNav">
	    	
	        <a href="<c:url value='/'/>"><div class="homeLogo">1</div></a>
	        <ul>
	            <li class="checked"><a href="<c:url value='/mypet/lifetime'/>">????????? ????????????</a></li>
	            <li><a href="<c:url value='/mypet/gallery'/>">?????????</a></li>
	        </ul>
	    </div>
	    -->
	    <div class="siteNav">   
	        <table>
		        <tr>
		            <td><a href="<c:url value='/'/>"><div class="homeLogo">home</div></a></td>
		            <td class="checked"><a href="<c:url value='/mypet/lifetime'/>">????????? ????????????</a></td>
		            <td><a href="<c:url value='/mypet/gallery'/>">?????????</a></td>
		        </tr>
		    </table>
	    </div>
	
	    <div class="otherWrap">
	        <div class="otherP">
	            <P>???????????? ?????? ?????? ??????</P>
	            <!--<h1>?????? ???????????? ?????? ????????????</h1> -->
	            <p>?????? ????????? ???????????? ?????????</p>
	    	</div>
	    </div>
	
	
	    <div class="mainContent">
	        <div class="conTitle">
	                <span>${pet.petName} ????????????</span>  
	        </div>
	
	        <div><button class="openUCard">+ ????????????</button></div>
	        <button type="button" id="petList-open" title="???????????? ??????" class="changePet2"></button>
				
				<div class="uploadCard_wrap">
	        	<div class="uploadCard">      	        	
   					<!--   <input type="button" value="Resize Image" onclick="ResizeImage()"/>		-->	            
		            <button id="uploadCardBtn">??????</button>
		            <button class="closeUCard">??????</button>
		            <div class="flex-container2">       
		                <div class="wrapper">
		                    <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" style="margin: 20px auto;"/>
		                    <label for="file" class="upload-btn">
		                        <input id="file" name="file" type="file" accept="image/*" />
		                        <span>Upload Image</span>
		                    </label>
		                </div>
		            </div>
		            <div class="lifeCardInfo">
		            	
		                <input type="date" id="date" name="Ldate" required>
		                <div class="InfoList">
		                    <textarea name="content" id="lifetimeCont" required placeholder="????????? ????????? ????????? ???????????????."></textarea>
		                    <div class="count"><span>0</span>/60</div>
		                </div>  
		            </div>		    	       
	        	</div>
	        	</div>
	    </div>
	    
	    
	    
	    <!-- ???????????? ????????? ????????? ?????? -->
	    <div class="lifetimeBox">
	    	<c:if test="${msg eq 'notLogin'}"> <!-- ????????? ??? ??? ?????? -->
	        	<p class="noneMsg">????????? ??? ?????? ????????? ????????? ????????? ?????? ?????????.</p>
	        	<img alt="noticeImg" src="<c:url value='/img/mypet/noticeImg1.PNG'/>">
	        </c:if>
	        
	        <c:if test="${msg eq 'petNone'}"> <!-- ????????? ?????? ??? ??? ?????? -->
	        	<p class="noneMsg">???????????? ???????????? ?????? ????????? ????????? ????????? ?????? ?????????.</p>
	        	<img alt="noticeImg" src="<c:url value='/img/mypet/noticeImg1.PNG'/>">
	        </c:if>
	        
	        <c:if test="${cards.size() <= 0}"> <!-- ????????? ?????? ????????? ???????????? ????????? ?????? ?????? -->
	        	<p class="noneMsg">?????? ????????? ????????? ????????? ?????? ?????????.</p>
	        	<img alt="noticeImg" src="<c:url value='/img/mypet/noticeImg1.PNG'/>">
	        </c:if>
	        
		    <c:if test="${cards.size() > 0}">
					<c:forEach var="card" items="${cards}">
						<div id="cardWrap${card.cardId}">
						    <div class="lifetimeCard" id="card${card.cardId}">
						    	<div class="lifecardbullet">1</div>				    	
					               
					            <div class="petImage">					            	
					            	<c:if test="${not empty card.imagePath}">
					                	<img alt="pet_image" src="<c:url value='${card.imagePath}'/>" />
					            	</c:if>
					            	<c:if test="${empty card.imagePath}">
					                	<img alt="pet_image" src="<c:url value='/img/common/no_image.webp'/>" />
					            	</c:if>
					            </div>
					            <div class="cardInfo">
					            <div class="content"></div>
					            	<button class="modifyCardBtn" title="??????" href="${card.cardId}">??????</button>
					           		<button class="deleteCardBtn" title="??????" href="${card.cardId}">??????</button>
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
	
	<!-- ???????????? ?????? ?????? -->
	<div class="mdpop" style="position: fixed; top: 0; left: 0; width:100%; height:100%; background:rgba(0,0,0,0.7); display:none; text-indent:-9999px"></div>
	<div class="modifyCard_wrap">
		<div class="modifyCard">
	        <button href="" class="mdBtn">??????</button>
	        <button href="" class="mdcancle">??????</button>
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
	        <div class="lifeCardInfo">
	            <input type="date" id="modifydate" name="Ldate" value="" required>
	            <div class="InfoList">
	                <textarea name="content" id="modifyCont" required></textarea>
	                <div class="count"><span>0</span>/60</div>
	            </div>
	        </div>
	    </div> 
    </div>
    

<jsp:include page="../common/pet_modal.jsp" />
<jsp:include page="../common/footer.jsp" />

</body>


     <script type="text/javascript">
     
     	 $(function(){
     		 $(".mainMenu.mainMenu1").addClass("checked");
     		 })
   
    	  
    	 // ???????????? ?????????
	     $(".openUCard").click(function(){           
	         /*$(".uploadCard").css("display","flex");
	         $(".uploadCard").css("justify-content","space-evenly");*/
	         $(".uploadCard_wrap").css("display","block");
	         $(this).css("display","none");
	     })
	
	     $(".closeUCard").click(function(){
	         $(".uploadCard_wrap").css("display","none");
	         $(".openUCard").css("display","inline-block");
	     })
     	
	     
	    
	     
	     // ????????? ??????, ????????? ????????? ????????? ?????? ?????? ?????????
	     if("${msg}" === 'notLogin'){ // ????????? ?????? ??????
	    	 $(".openUCard").css("display", "none");
	    	 $("#petList-open").css("display", "none");
	     }
	     
     	if("${msg}" === 'petNone'){ // ????????? ????????? ?????? ??????
	    	 $(".openUCard").css("display", "none");
	     }
	     
	    
	    
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
    	        MdPreviews.src = "<c:url value='/img/common/no_image.webp'/>";
    	        return false; 
    	   }	    	
	    	
    	    const imageSrc = URL.createObjectURL(fileDOM2.files[0]);
    	    MdPreviews.src = imageSrc;
    	});
	    
	    
	    
        
        
     	// ??????, ?????? ?????? display
        $(".lifetimeCard").hover(function () {
        	$(this).find(".modifyCardBtn").fadeIn("slow")
        	$(this).find(".deleteCardBtn").fadeIn("slow")
        },function(){
        	$(this).find(".modifyCardBtn").fadeOut("fast")
        	$(this).find(".deleteCardBtn").fadeOut("fast")
        }) 
	     
	     
        
        // ???????????? ?????????
		$('.InfoList textarea').keyup(function(){
	        var content = $(this).val();
	        $('.InfoList .count span').html(content.length);
	        if (content.length > 60){
	           alert("?????? 60????????? ?????? ???????????????.");
	           $(this).val(content.substring(0, 60));
	           $('.InfoList .count span').html(60);
	        }
	    });
        
     	        
		
     	
     	
	    // ???????????? ?????? ??????     
        $("#uploadCardBtn").click(function(){
        	  //formData ?????? ??????
              let formData = new FormData();
        	  
        	  if($("input[id='file']").val()){ // ?????? ????????? ???????????? ???????????? ??????
	        	  // ????????? ????????????
	        	  let img = new Image;
	        	  img.src = previews[0].src; 
	        	
	        	  var canvas = document.createElement("canvas");
		    	  canvas.getContext("2d").drawImage(img, 0, 0);
		    	      	  
		    	  // ?????? ?????? ????????? ????????????
		    	  let maxSize = 400; //??????px 400px ??????
		    	  let width = img.width; 
		    	  let height = img.height; 
		    	  if (width > height) { 
		    	      if (width > maxSize) {
		    	          height *= maxSize / width;
		    	          width = maxSize;
		    	      }
		    	  } else {
		    	      if (height > maxSize) {
		    	          width *= maxSize / height;
		    	          height = maxSize;
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
		             
	        	//formData.append("petImg", $("input[name=file]")[0].files[0]);
	        	formData.append("petImg", tmpThumbFile);
        	}
        	
        	// ????????? ???????????? ?????????
        	let date = $("#date").val();
			if(!date){ // ?????? null???
				alert("????????? ??????????????????.");
			    return false;
			}
        	
        	//enter => <br>
			let text = $("#lifetimeCont").val();
			if(!text || text.replace(/\s| /gi, "").length==0){ // null???????????? ????????? ????????? ??????
				alert("????????? ??????????????????.");
				$("#lifetimeCont").focus();
			    return false;
			}
			text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
        				
        	let petData = {
        			"petId": "${login.pet.petId}",
        			"content": text,
        			"date": date
        	}
        	
        	// formData??? json???????????? petData ??????
        	formData.append("petData", new Blob([ JSON.stringify(petData) ], {type : "application/json"}));
        	
        	// ajax ??????
        	$.ajax({
        		  type: "POST",
        	      url: "/today/mypet/uploadCard",
        	      data: formData,
        	      dataType: "text",
        	      contentType: false,               // * ?????? *
        	      processData: false,               // * ?????? *
        	      enctype : 'multipart/form-data',  // * ?????? *
        	      success: function(result) { 
                      console.log("?????? ??????!: ");
                      if(result === "success") {
                          alert("??????????????? ?????????????????????.");
                          window.location.reload();
                      } else {
                          alert("???????????? ????????? ??????????????????.");
                      }
                  }, 
                  error: function() {
                	  alert("???????????? ????????? ??????????????????.");
                  } 
        	});
        })   
	     
	    
        
        
        // ???????????? ?????? ???????????? ??????		
		$(document).on("click", ".modifyCardBtn", function () {
			
			//$("#modifyFile")[0].reset();
			$("#modifyFile").value = null;
			$("#modifyCont").val("");
			$("#modifydate").value = null;
			
			//?????????
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
 
                        //let temp_html = "<div class='modifyCard'><button href='" + cardId + "' class='mdBtn'>??????</button><button href='" + cardId + "' class='mdcancle'>??????</button><div class='flex-container'><div class='wrapper'><img src='" + imagePath + "' id='mdImage-box' /><label for='modifyFile' class='upload-btn'><input class='modifyFile' id='modifyFile' name='file' type='file' accept='image/*' /><span>Upload Image</span></label></div></div><div class='lifeCardInfo'><input type='date' id='modifydate' name='Ldate' value='" + date + "' required><div class='InfoList'><textarea name='content' id='modifyCont' required >" + content + "</textarea></div></div></div>";
						
                        //$("#card" + cardId).css("display","none");
                        //$('#cardWrap' + cardId).append(temp_html);
                        $(".mdpop").css("display","block");
                        $(".modifyCard_wrap").css("display","block");
                        $(".mdBtn").attr("href", cardId);
                        $(".mdcancle").attr("href", cardId);
                        $("#mdImage-box").attr("src", imagePath);
                        $("#modifydate").attr("value", date);
                        $("#modifyCont").val(content);
                        $('.modifyCard .InfoList .count span').html($(".modifyCard textarea").val().length); // ?????????
                    
                }, 
                error: function() {
                    console.log("?????? ??????!"); 
                } 
            });
        })
        
        
        
        
        //???????????? ?????? ??????  
        $(document).on("click", ".mdcancle", function () {
        	let cardId = $(this).attr("href");
        	$(".modifyCard_wrap").css("display","none");
        	$(".mdpop").css("display","none");
        	//$("#cardWrap" + cardId + " .modifyCard").remove();
        })
        
        
        
        
        // ???????????? ?????? 
        $(document).on("click", ".mdBtn", function () {
        	
           //formData ?????? ??????
           let formData = new FormData(); 	
        	
           // ????????? ????????????	
      	   if($("input[id='modifyFile']").val()){ // ?????? ????????? ???????????? ???????????? ??????
				
      		  let img = new Image;
     	      img.src = MdPreviews.src; 
     	
     	      var canvas = document.createElement("canvas");
	    	  canvas.getContext("2d").drawImage(img, 0, 0);
	    	      	  
	    	  // ?????? ?????? ????????? ????????????
	    	  let maxSize = 400; //??????px 400px ??????
	    	  let width = img.width; 
	    	  let height = img.height; 
	    	  if (width > height) { 
	    	      if (width > maxSize) {
	    	          height *= maxSize / width;
	    	          width = maxSize;
	    	      }
	    	  } else {
	    	      if (height > maxSize) {
	    	          width *= maxSize / height;
	    	          height = maxSize;
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
        	
        	// ????????? ???????????? ?????????
        	//enter => <br>
			let text = $("#modifyCont").val();
			if(!text || text.replace(/\s| /gi, "").length==0){ // null???????????? ????????? ????????? ??????
				alert("????????? ??????????????????.");
				$("#modifyCont").focus();
			    return false;
			}
			text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');
        	
			let date = $("#modifydate").val();
			if(!date){ // ?????? null???
				alert("????????? ??????????????????.");
			    return false;
			}
			let cardId = $(this).attr("href");
			
        	let petData = {
        			"cardId": cardId,
        			"content": text,
        			"date": date
        	}
        	
        	// formData??? json???????????? petData ??????
        	formData.append("petData", new Blob([ JSON.stringify(petData) ], {type : "application/json"}));
        	
        	// ajax ??????
        	$.ajax({
        		  type: "POST",
        	      url: "/today/mypet/modifyCard",
        	      data: formData,
        	      dataType: "text",
        	      contentType: false,               // * ?????? *
        	      processData: false,               // * ?????? *
        	      enctype : 'multipart/form-data',  // * ?????? *
        	      success: function(result) { 
                      console.log("?????? ??????!: ");
                      if(result === "success") {
                          alert("???????????? ????????? ?????????????????????.");
                          window.location.reload();
                      } else {
                          alert("???????????? ????????? ??????????????????.");
                      }
                  }, 
                  error: function() {
                	  alert("???????????? ????????? ??????????????????.");
                  } 
        	});
			
        })
    	  
    	
        
        
        // ???????????? ?????? ??????		
		$(document).on("click", ".deleteCardBtn", function () {
			if(confirm("??????????????? ?????????????????????????")){
				
				let cardId = $(this).attr("href");	            
	    		let lifetimeCard = {cardId: cardId};
	    		
	    		$.ajax({
	                type: 'post',
	                dataType : "text",
	                contentType: 'application/json',
	                url: '/today/mypet/deleteCard',
	                data: JSON.stringify(lifetimeCard),
	                success: function (response) {
	         			if(response === 'success'){
	         				alert("??????????????? ?????????????????????.");
	         				window.location.reload();
	         			}else{
	         				alert("???????????? ????????? ??????????????????.");
	         			}
	                }, 
	                error: function() {
	                    console.log("?????? ??????"); 
	                } 
	            });
			}
		    
        })
      
      
	  	 
        
        
        
     </script>

</html>