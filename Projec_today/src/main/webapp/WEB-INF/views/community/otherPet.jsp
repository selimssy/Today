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
.container{width: 1000px; margin: 0 auto;}
.Myintro{width: 700px; height: 380px; border: 1px solid #7AB730; margin: 0 auto;}
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


#contents{width: 100%; /*height: 800px;*/ margin-top: 100px;}
#tabMenu{width: 100%; /*height: 100%;*/ min-height:300px}
#tabMenu input[type="radio"]{display: none;}
#tabMenu label{width: 44.5%; display: inline-block; margin: 0; color: #aaa; 
    padding: 15px 25px; text-align: center; border: 1px solid transparent;}
#tabMenu label:hover{color: #222; cursor: pointer;}
#tabMenu input:checked + label{color: #b00; border: 1px solid #ddd; background: #eee;}

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
</style>
</head>
<body>


	<div class="container">
	
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
	    
	        
	    
	    <div class="otherP">
            <P>보러 와주셔서 감사합니다</P>
            <h1>'${pet.petName}' 공간에 오신걸 환영해요!</h1>
        </div>	    
	    
	    
	    
	    <div id="contents">
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
                	<!-- 생애기록 카드가 들어갈 공간 -->
                    <div class="photocards">
		                <div id="cards-box">
		                	<c:if test="${galleryList.size() <= 0}">
		                		<span>등록된 게시물이 없습니다.</span>
		                	</c:if>
			                <c:if test="${galleryList.size() > 0}">
								<c:forEach var="imgCard" items="${galleryList}">
				                    <div class="card">
				                        <div class="card_in">
				                            <img alt="gallery_image" src="<c:url value='${imgCard.imagePath}'/>" width="400px" height="300px">
				                            <div>
				                                <h5>${imgCard.title}</h5>
				                            </div>
				                        </div>
				                    </div>  
		                   	    </c:forEach>
							</c:if>
		                                    
		                </div>
		            </div>
                </div>
            </div>
        </div>
	    
	    
	    
	    
    </div>

	
	
	
	

<jsp:include page="../common/footer.jsp" />
</body>
</html>