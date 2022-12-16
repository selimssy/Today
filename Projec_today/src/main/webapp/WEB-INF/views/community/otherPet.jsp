<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">
<style type="text/css">
.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/community/bg12.png); margin: 0 auto;  position: relative;}       
/*.container{width: 1000px; margin: 0 auto;}*/
.Myintro{width: 600px; height: 380px; border: 1px solid #7AB730; margin: 100px auto; position: relative;}
.Myintro h2{background: rgba(122, 183, 48, 0.5); margin: 0; padding: 10px; text-align: center;}  
.Mycontent{width:100%; display: flex; justify-content:space-between; padding:20px; position: relative; box-sizing: border-box;}
.MyPetPhoto{width:260px; box-sizing: border-box; position: relative; margin: 0 20px; background-image:url(/today/img/community/ring2.png); background-size: contain; background-repeat: no-repeat;}
.MyPetPhoto::after {display: block; content: ""; padding-bottom: 100%;}
.Myintro .MyPetPhoto img{width:255px; height: 255px; position: absolute; top: 0; left: 0; object-fit: cover; border-radius: 50%; padding:20px; box-sizing: border-box;} 
.Mycontent .MyPetinfo{width:45%; padding-left: 20px;}
.Mycontent .MyPetinfo li{font-size: 19px; line-height: 40px;}
.MyPetinfo li:last-of-type{padding-top: 5px;}
.Mycontent .MyPetinfo li a{text-decoration: none; color: transparent;}
.Mycontent .MyPetinfo li:first-of-type{font-size: 1.6em; line-height: 70px;}
.Mycontent .MyPetinfo li a{padding: 15px; background-origin:content-box}
.Mycontent .MyPetinfo li a:nth-of-type(1){background-image:url(/today/img/community/instagram.png); background-size: cover; background-repeat: no-repeat;}
.Mycontent .MyPetinfo li a:nth-of-type(2){background-image:url(/today/img/community/youtube.png); background-size: cover; background-repeat: no-repeat;}
.MyPetinfo ul li{overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
.nameTitle{font-size: 21px; font-weight: bold;}
.infoTitle{font-size: 16px; font-weight: bold;}

.otherP{width: 100%; height: 130px; border-left: 5px solid #7AB730; margin: 100px 20px 50px; margin-left: 50px; padding-left:30px}
.otherP p{font-size: 24px; color:#5CAC3D; font-family: 'Nanum Pen Script', cursive;}
.otherP h1{font-size: 60px; font-family: 'Nanum Pen Script', cursive; margin:20px 0}

a{text-decoration: none;}
ul{list-style: none;} 


.contents{width: 1050px; /*height: 800px;*/ margin: 100px auto;}
#tabMenu{width: 1000px; /*height: 100%;*/ margin: 0 auto; min-height:300px}
#tabMenu input[type="radio"]{display: none;}
#tabMenu label{width: 44.5%; display: inline-block; margin: 0; color: #aaa; 
    padding: 15px 25px; text-align: center; border: 1px solid transparent;}
#tabMenu label:hover{color: #222; cursor: pointer;}
#tabMenu input:checked + label{color: #b00; border: 1px solid #ddd; background: #eee; /*background:rgba(122, 183, 48, 0.5)*/}

/* 공지사항은 checked 이므로 처음주터 보이고 갤러리는 숨김 */
.tabContent{display: none; padding: 20px 0 0; border-top: 1px solid #ddd;}
.tabContent h2{display: none;}
#lifetime ul{list-style: square; margin-left: 30px;}
#lifetime ul li{font-size: 16px; line-height: 2.5;}
#gallery ul li{display: inline;}

/* 임시 */
#gallery .card{float: left}
#galler .card_in img{width:100%}

/* 형제 선택자 '~', 부모는 tabMenu */
#tab1:checked ~ #lifetime,
#tab2:checked ~ #gallery{display: block;}

.lifetimeBox{width:550px; margin: 50px auto;}
.lifetimeCard{width:550px; height: 200px; position: relative; display: flex; justify-content: space-evenly; margin-bottom:80px}
.lifecardbullet{width:45px; height: 45px; position: absolute; top: 75px; left:-85px; background-image: url(/today/img/community/cbullet.png); background-size: contain; background-repeat: no-repeat; text-indent: -9999px;}
.modifyCardBtn{display:none; width:16px; position: absolute; top: 15px; right:30px; border:none; background-color: transparent; background-image: url(/today/img/mypet/modify.png); background-size: contain; background-repeat: no-repeat; color: transparent; cursor: pointer;}
.deleteCardBtn{display:none; width:16px; position: absolute; top: 15px; right:7px; border:none; background-color: transparent; background-image: url(/today/img/mypet/delete.png); background-size: contain; background-repeat: no-repeat; color: transparent; cursor: pointer;}
.lifetimeCard img{width:200px; height:200px;  object-fit: cover; border-radius: 7px;}
.cardInfo{width:350px; height: 200px; box-shadow: 0 0 15px 0 #e8e8e8; background: #F7F7F7; padding: 20px; margin-left: 25px; box-sizing: border-box;}
.cardInfo p{background-image: url(/today/img/mypet/cal.png); background-size: contain; background-repeat: no-repeat; padding-left: 27px;}
.InfoText{background:none; font-family: 'Nanum Pen Script'; font-size: 24px;  line-height: 1.7em; padding: 20px 15px 0; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}

.galleryBox{width:100%; min-height:500px; height:1070px; padding: 40px 30px; margin-top: 70px; background:#f5f6fa; /* display: flex; justify-content: space-between;*/  box-sizing: border-box;}
.gcardWrap{ width:290px; height:295px; background:#fff; float: left; padding:10px; margin:0 30px 50px 0; border:none; box-sizing: border-box; position: relative; }
.gcardWrap:nth-of-type(3n){margin-right:0}
.imgBox img{width: 100%; height:225px; object-fit: cover;}
.imgInfo{padding:10px 20px 10px}
.imgInfo h3{font-size: 28px; font-family: 'Nanum Pen Script'; text-align: center; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
.imgInfo p{display:none ;word-wrap: break-word;width: 100%; line-height: 1.3em; font-size: 20px; font-family: 'Nanum Pen Script'; margin-top:10px; ; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}

.paging{padding: 40px 0 0; text-align: center;}
.paging ul li{list-style: none; display: inline-block;}
.paging ul li a{text-decoration: none; color: transparent;}
.paging ul li:nth-of-type(1){background-image: url(/today/img/community/prev.png); background-size: contain; background-repeat: no-repeat;}
.paging ul li:nth-of-type(2){margin: 0 15px;}
.paging ul li:nth-of-type(3){background-image: url(/today/img/community/next.png); background-size: contain; background-repeat: no-repeat;}
/* 갤러리 상세조회 */
#showGallery{display:none; width:700px; height: 610px; overflow-y: auto; background:#fff; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8; z-index:7;}
.pop_list li {padding:20px 35px 0px; box-sizing: border-box;}
.pop_list li h2.pop_title{padding:10px 0 24px; text-align:center; font-weight:bold; font-size:32px; font-family: 'Jua', sans-serif; letter-spacing:2px;}
.pop_list li img.pop_img{width:100%;}
.pop_list li .pop_content{width:100%; overflow: visible; padding:15px 10px; line-height:1.8; font-size:18.5px; font-family: 'Jua', sans-serif; box-sizing: border-box;}
.closeShowGal{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 15px; right: 15px; background-image: url(/today/img/common/close.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}
.gcardWrap:hover{background: #ddd; cursor: pointer;}

</style>
</head>
<body>
<div class="container">   
	<jsp:include page="../common/header.jsp" />
	<main>
	
		<div class="siteInfo">
	        <div class="infoText">
	            <p>반려견 소개하기</p>
	            <p>우리의 사랑스러운 아이 보러 놀러오세요!</p>
	        </div>
	    </div>
	    <div class="siteNav">
	        <a href="<c:url value='/'/>"><div class="homeLogo">1</div></a>
	        <ul>
	            <li class="checked"><a href="<c:url value='/community/intro'/>">반려견 소개하기</a></li>
	            <li><a href="<c:url value='/community/list'/>">커뮤니티 게시판</a></li>
	        </ul>
	    </div>
		
		
		<div class="Myintro">
	        <h2>${pet.petName} 소개란</h2>
	        <div class="Mycontent">
	            <div class="MyPetPhoto">
		            <img src="<c:url value='${pet.imagePath}'/>">
		        </div>
	            <div class="MyPetinfo">
	                <ul>
	                    <li><span class="nameTitle">이름:</span> ${pet.petName}</li>
	                    <li><span class="infoTitle">견종:</span> ${pet.petSpecies}</li>
	                    <li><span class="infoTitle">나이:</span> ${pet.age}살</li>
	                    <li><span class="infoTitle">성별:</span> ${pet.gender}</li>
	                    <li><span class="infoTitle">성격:</span> ${pet.feature}</li>
	                <!--<li>공개 여부: <c:if test="${pet.open == 1}">
	                    				<label>공개</label> <input type="radio" checked onclick="return(false);">&nbsp;
                                		<label>비공개</label> <input type="radio" onclick="return(false);">
									</c:if>
									<c:if test="${pet.open == 0}">
	                    				<label>공개</label> <input type="radio" onclick="return(false);">&nbsp; 
                                		<label>비공개</label> <input type="radio" checked onclick="return(false);">
									</c:if>
	                    </li> -->   
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
	        </div>       
	    </div>
		
		
	    <div class="otherWrap" style="width: 1150px;">
	        <div class="otherP">
	            <P>보러 와주셔서 감사합니다</P>
	            <!--<h1>다른 반려동물 보러 놀러가기</h1> -->
	            <p>'${pet.petName}' 공간에 오신걸 환영해요!</p>
	    	</div>
	    </div>
		
	
	    <div class="contents">
            <div id="tabMenu">
                <input type="radio" id="tab1" name="tabs" checked>
                <label for="tab1">생애 기록</label>
                <input type="radio" id="tab2" name="tabs">
                <label for="tab2">갤러리</label>
                
                <div id="lifetime" class="tabContent">
                	<!-- 생애기록 카드가 들어갈 공간 -->
				    <div class="lifetimeBox">
				    	<c:if test="${cardList.size() <= 0}">
							<span>등록된 생애 기록이 없습니다.</span>
						</c:if>
					    <c:if test="${cardList.size() > 0}">
								<c:forEach var="card" items="${cardList}">
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
								                <p style="margin:0"><fmt:formatDate value="${card.date}" pattern="yyyy. MM. dd" /></p>
								                <div class="InfoText">
								                    ${card.content}
								                </div>  
								            </div>			            
								        </div>					        
							        </div>
						        </c:forEach>
						</c:if>
					</div>	
                   	
                </div>
                
                <div id="gallery" class="tabContent">
                	<!-- 갤러리 들어갈 공간 -->	                	   		     
			        <div class="galleryBox">
			        	<c:if test="${galleryList.size() <= 0}">
	                		<span>등록된 게시물이 없습니다.</span>
	                	</c:if>
						<c:if test="${galleryList.size() > 0}">
							<c:forEach var="imgCard" items="${galleryList}">			
					            <div class="gcardWrap">		              
				                    <div class="imgBox">
				                        <img alt="${imgCard.imgId}" src="<c:url value='${imgCard.imagePath}'/>">			                        
				                    </div>
				                    <div class="imgInfo">
										<h3>${imgCard.title}</h3>
										<p>${imgCard.content}</p>			                       		                        
				                    </div>				                    	                    					         	                    		               
					            </div>
							</c:forEach>
						</c:if>	
					</div>
					
					<!-- 페이징 처리 -->
					<div class="paging">
						<ul>
							<!-- 이전 버튼 -->
					        <li>
								<a href="javascript:;" class="pre_link">이전</a>
							</li>						
							
							<!-- 페이지 정보 -->
							<li class="pageInfo">
							
							</li>				
							  
						   <!-- 다음 버튼 -->
						   <li>
						       <a href="javascript:;" class="next_link">다음</a>
						   </li>
						</ul>
					</div>
					<!-- 페이징 처리 끝 -->
					
		            
                </div>
            </div>
        </div>

	
	</main>
</div>



<!-- 갤러리 상세조회 모달 -->
<div class="mdpop" style="position: fixed; top: 0; left: 0; width:100%; height:100%; background:rgba(0,0,0,0.7); display:none; text-indent:-9999px"></div>			
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




<jsp:include page="../common/footer.jsp" />
</body>


<script type="text/javascript">
	
	$(function(){
		 $(".mainMenu.mainMenu3").addClass("checked");
		 
		 $(".pageInfo").html(1 + " / " + ${pc.lastPage});
	})

	
        
        // 페이징 + 갤러리 불러오기
        let page = 1;
        
        $(document).on("click", ".next_link", function () {
		
			//초기화
			$('.galleryBox').empty();
	   				
	   		let petId = "${pet.petId}";
	   		
	   		page += 1;
	   		if(page > ${pc.lastPage}){
	   			alert("마지막 페이지입니다.");
	   			page = ${pc.lastPage};
	   		}   		
	   		
	   		let data = {
	   				petId: petId,
	   				page: page
	                   };
	   		   		
	   		$.ajax({
	               type: 'post',
	               dataType : "json",
	               contentType: 'application/json',
	               url: '/today/community/getGalleries',
	               data: JSON.stringify(data),
	               //data: JSON.stringify({petId: pet_Id, page: pa_ge}),
	               success: function (response) {
	                    console.log(response); // 리스트 
	               	   
	               		for(let i = 0; i < response.length; i++){
	               		   let imgId = response[i]['imgId'];
	                 	   let src = "/today" + response[i]['imagePath'];
	                 	   let title = response[i]['title'];
	                 	   let content = response[i]['content'];
	                 	   
	                        let temp_html = "<div class='gcardWrap'><div class='imgBox'><img alt='" + imgId + "' src='" + src + "'></div><div class='imgInfo'><h3>" + title + "</h3><p>" + content + "</p></div></div>";
	 						                      
	                        $('.galleryBox').append(temp_html);
	                        $(".pageInfo").html(page + " / " + ${pc.lastPage});
	                    } 
	               	   	   	                 
	               }, 
	               error: function() {
	                   console.log("통신 실패!");
	               } 
	        });
    		 	
        })
        
        
        
        // 이전 버튼
        $(document).on("click", ".pre_link", function () {
		
			//초기화
			$('.galleryBox').empty();	
	            				
	   		let petId = "${pet.petId}";
	   		console.log(petId);
	   		page -= 1;
	   		if(page <= 0){
	   			alert("마지막 페이지입니다.");
	   			page = 1;
	   		}
	   		console.log(page);
	 		
	   		let data = {
	   				petId: petId,
	   				page: page
	                   };
	   		   		
	   		$.ajax({
	               type: 'post',
	               dataType : "json",
	               contentType: 'application/json',
	               url: '/today/community/getGalleries',
	               data: JSON.stringify(data),
	               //data: JSON.stringify({petId: pet_Id, page: pa_ge}),
	               success: function (response) {
	               		console.log(response); // 리스트 
	               	   
		               		for(let i = 0; i < response.length; i++){
		               		   let imgId = response[i]['imgId'];
		                 	   let src = "/today" + response[i]['imagePath'];
		                 	   let title = response[i]['title'];
		                 	   let content = response[i]['content'];
		                 	   
		                        let temp_html = "<div class='gcardWrap'><div class='imgBox'><img alt='" + imgId + "' src='" + src + "'></div><div class='imgInfo'><h3>" + title + "</h3><p>" + content + "</p></div></div>";
		 						                      
		                        $('.galleryBox').append(temp_html);
		                        $(".pageInfo").html(page + " / " + ${pc.lastPage});
		                    } 
	               	   	   	                 
	               }, 
	               error: function() {
	                   console.log("통신 실패!");
	               } 
	           });
    		 	
        })
        
        
        
        
        // 이미지 클릭시 상세 조회
        $(document).on("click", ".gcardWrap", function () {
        	$("#showGallery").css("display", "block");
        	
        	//초기화
			$(".pop_content").html("");			
			
			let imgId = $(this).children(".imgBox").children().attr("alt");            
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
        })
		
        
        /*
        // 갤러리 hover 이벤트
        $(document).on({
                mouseenter: function () {
                	$(this).parent().css("background", "#ddd");
                },
                mouseleave: function () {
                	$(this).parent().css("background", "#fff");
                }
        }, '.imgBox');*/
        
        
     	// 상세조회 모달 닫기
        $(".closeShowGal").click(function(){
        	$("#showGallery").css("display", "none");
        	$(".mdpop").css("display","none");
        })
        
        
</script>


</html>