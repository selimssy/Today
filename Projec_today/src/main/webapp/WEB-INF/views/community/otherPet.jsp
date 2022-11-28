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
.Myintro{width: 700px; height: 380px; border: 1px solid #7AB730; margin: 100px auto 0;}
.Myintro h2{background: rgba(122, 183, 48, 0.5); margin: 0; padding: 10px; text-align: center;}
.Myintro .modify{float: right;}
.Myintro .modify img{width:25px; height:25px;}
.Myintro .MyPetPhoto img{border-radius: 50%; padding:20px}
.Mycontent{display: flex; justify-content:space-between; padding:20px;}
.Mycontent .MyPetinfo{padding-right: 50px;}
.Mycontent .MyPetinfo li{font-size: 1.3em; line-height: 40px;}
.MyPetinfo li:last-of-type{padding-top: 15px; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
.Mycontent .MyPetinfo li a{text-decoration: none; color: transparent;}
.Mycontent .MyPetinfo li:first-of-type{font-size: 1.6em; line-height: 80px;}
.Mycontent .MyPetinfo li a{padding: 15px; background-origin:content-box}
.Mycontent .MyPetinfo li a:nth-of-type(1){background-image:url(/today/img/community/instagram.png); background-size: cover; background-repeat: no-repeat;}
.Mycontent .MyPetinfo li a:nth-of-type(2){background-image:url(/today/img/community/youtube.png); background-size: cover; background-repeat: no-repeat;}

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

.galleryBox{width:100%; min-height:500px; height:1760px; padding: 40px 30px; margin-top: 70px; background:#f5f6fa; /* display: flex; justify-content: space-between;*/  box-sizing: border-box;}
.gcardWrap{ width:290px; height:295px; background:#fff; float: left; padding:10px; margin:0 30px 50px 0; border:none; box-sizing: border-box; position: relative; }
.gcardWrap:nth-of-type(3n){margin-right:0}
.imgBox img{width: 100%; height:225px; object-fit: cover;}
.imgInfo{padding:10px 20px 10px}
.imgInfo h3{font-size: 28px; font-family: 'Nanum Pen Script'; text-align: center; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
.imgInfo p{display:none ;word-wrap: break-word;width: 100%; line-height: 1.3em; font-size: 20px; font-family: 'Nanum Pen Script'; margin-top:10px; ; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}

.paging{padding: 60px 0 0; text-align: center;}
.paging ul li{list-style: none; display: inline-block;}
.paging ul li a{text-decoration: none; color: #000; padding: 3px 8px;}
.paging ul li a.page-active{color: #fff; background: #384d75; border-radius: 10px}
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
	            <li class="checked"><a href="#">반려견 소개하기</a></li>
	            <li><a href="#">커뮤니티 게시판</a></li>
	        </ul>
	    </div>
		
		
		<div class="Myintro">
	        <h2>${pet.petName} 소개란</h2>
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
				                        <img alt="gallery_image" src="<c:url value='${imgCard.imagePath}'/>">			                        
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
						<!--  이건 진짜로 ajax로 해와야 할듯ㅠ-->
					</div>
					<!-- 페이징 처리 끝 -->
					
		            
                </div>
            </div>
        </div>

	
	</main>
</div>





	

	
	
	
	

<jsp:include page="../common/footer.jsp" />
</body>
</html>