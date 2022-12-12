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
	.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/community/bg12.png); margin: 0 auto;  position: relative;}       
	.container{width: 1000px; margin: 0 auto; position: relative;}
    .Myintro{width: 700px; height: 380px; border: 1px solid #7AB730; margin: 100px auto; position: relative;}
    .Myintro h2{background: rgba(122, 183, 48, 0.5); margin: 0; padding: 10px; text-align: center;}  
    .Mycontent{width:100%; display: flex; justify-content:space-between; padding:20px; position: relative; box-sizing: border-box;}
    .MyPetPhoto{width:43%; box-sizing: border-box; position: relative;}
    .MyPetPhoto::after {display: block; content: ""; padding-bottom: 100%;}
    .Myintro .MyPetPhoto img{width:100%; height: 100%; position: absolute; top: 0; left: 0; object-fit: cover; border-radius: 50%; padding:20px; box-sizing: border-box;} 
    .Mycontent .MyPetinfo{padding-left: 15px; width:52%; box-sizing: border-box;}
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
	.modifyIcon{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 15px; right: 15px; background-image: url(/today/img/community/modify.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}
	#petMf_modal{display:none}
	
    
    .PCards{width:1000px; height:2000px; margin:0 auto; padding: 20px;  /*display: flex; justify-content: space-between;*/  box-sizing: border-box;}
    .PCards .cardWrap{width: 33%; float: left; padding: 20px; box-sizing: border-box;}
     .PCards .cardWrap .OPcard{width: 100%;  box-sizing: border-box; border: 5px solid #BCDB97; border-radius: 20px; }
    .PCards .cardWrap .OPcard .cardTop{height:55px; background: rgba(188, 219, 151, 0.5); display: flex; justify-content: space-between; box-sizing: border-box; position: relative;}
    .PCards .cardTop h3{margin: 0; line-height: 55px; width: 45%; text-align: center; font-size: 1.5em; overflow: hidden; text-overflow : ellipsis; white-space: nowrap; position: absolute; left: 70px;}
     .PCards .cardTop .cBullet{width: 20%; height: 40px; background-image: url(/today/img/community/cbullet.png); background-size: contain; background-repeat: no-repeat; margin-left: 10px; margin-top: 5px;}
    .cLink{list-style: none; padding-left: 0; position: absolute; top:20px; right:10px}
    .cLink li{display: inline-block; margin: 0 5px;}
    .cLink li a{text-decoration: none; color: transparent;}
     .cLink li:nth-of-type(1){padding: 0 5px; background-image:url(/today/img/community/instagram.png); background-size: contain; background-repeat: no-repeat;}
    .cLink li:nth-of-type(2){padding: 0 5px; background-image:url(/today/img/community/youtube.png); background-size: contain; background-repeat: no-repeat;}
    .PCards .cardBody a{text-decoration: none; color: #000;}
    .PCards .cardBody img{width: 100%; height: 160px; object-fit: cover;  box-sizing: border-box;}
    .PCards .cardBody ul{padding-left: 0; margin:5px 0 10px 30px; list-style: none;}
    .cardTitle{font-size: 16px; font-weight: bold;}
    .PCards .cardBody ul li{font-size: 19px; padding: 3px; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
    .PCards .cardBody ul li::before{content: "• "; font-size: 25px;}
   
    /* 페이징 */
    .paging{padding: 100px 0 0; text-align: center;}
	.paging ul li{list-style: none; display: inline-block;}
	.paging ul li a{text-decoration: none; color: #000;}
	.pre_link{width:20px; height:20px; border:none; background: none; background-image: url(/today/img/community/prev.png); background-size: contain; background-repeat: no-repeat; text-indent: -9999px;}
	.next_link{width:20px; height:20px; border:none; background: none; background-image: url(/today/img/community/next.png); background-size: contain; background-repeat: no-repeat; text-indent: -9999px;}
	.page_link{padding: 0 5px;}
	.page_link.active{background: #BCDB97; color: #fff; border-radius: 50%;}
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
	        <a href="#"><div class="homeLogo">1</div></a>
	        <ul>
	            <li class="checked"><a href="<c:url value='/community/intro'/>">반려견 소개하기</a></li>
	            <li><a href="<c:url value='/community/list'/>">커뮤니티 게시판</a></li>
	        </ul>
	    </div>
	    
	    
	    
	    <div class="Myintro">
	        <h2>내 반려견 소개란</h2>
	        <div class="Mycontent">
	            <div class="MyPetPhoto">
		            <img src="<c:url value='${pet.imagePath}'/>">
		        </div>
	            <div class="MyPetinfo">
	                <ul>
	                    <li><span class="nameTitle">이름:</span> ${pet.petName}</li>
	                    <li><span class="infoTitle">견종:</span> ${pet.petSpecies}</li>
	                    <li><span class="infoTitle">나이:</span> ${pet.age}살 (${pet.gender})</li>
	                    <li><span class="infoTitle">성격:</span> ${pet.feature}</li>
	                    <li><span class="infoTitle">공개 여부:</span> <c:if test="${pet.open == 1}">
	                    				<label>공개</label> <input type="radio" checked onclick="return(false);">
                                		<label>비공개</label> <input type="radio" onclick="return(false);">
									</c:if>
									<c:if test="${pet.open == 0}">
	                    				<label>공개</label> <input type="radio" onclick="return(false);">
                                		<label>비공개</label> <input type="radio" checked onclick="return(false);">
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
	            <div class="modifyPetBtn" href="${pet.petId}"><span class="modifyIcon">modify</span></div>
	        </div>     
	        <button type="button" id="petList-open" title="반려동물 변경" class="changePet"></button>  
	    </div>
	    
	    
	    
		<div class="otherWrap" style="width: 1150px; padding-left:310px;">
	        <div class="otherP">
	            <P>우리 아이 보러 놀러오세요~</P>
	            <p>다른 반려동물 보러 놀러가기</p>
	    	</div>
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
			                            <li><span class="cardTitle">견종:</span> ${petVO.petSpecies}</li>
			                            <li><span class="cardTitle">나이:</span> ${petVO.age}살 (${petVO.gender})</li>
			                            <li><span class="cardTitle">성격:</span> ${petVO.feature}</li>                        
			                        </ul>
		                        </a>
		                    </div>  	                    
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
					<button type="button" class="pre_link">이전</button>
				</li>						
					
							
				<!-- 페이지 버튼 -->
				<c:forEach var="pageNum" begin="1" end="10">
					<li>                                                                 
					   <a href="javascript:;" class="page_link">${pageNum}</a>
					</li>
				</c:forEach>			
								
				  
			   <!-- 다음 버튼 -->
			   <li>
			       <button type="button" class="next_link">다음</button>
			   </li>
			</ul>
		</div>
		<!-- 페이징 처리 끝 -->
	    
	    
	</main>
</div>
	
	
<jsp:include page="../common/pet_modal.jsp" />			
<jsp:include page="../common/footer.jsp" /> 
</body>	
	
	
	<script type="text/javascript">
	
		$(function(){
			 $(".page_link:eq(0)").addClass("active");
			 $(".mainMenu.mainMenu3").addClass("checked");
			 })
	
		// 비공개 반려동물 접근 알림창
		let msg = "${msg}"
			if(msg === "closed"){
				alert("비공개 반려동물입니다.")
			}
		
		
		// 반려동물 카드 hover 이벤트
		$(".cardBody").hover(function(){
	        $(this).parent().css("border", "5px solid #7AB730");
	    }, function(){
	        $(this).parent().css("border", "5px solid #BCDB97");
	    })
	    
	    
	    
		
	    // 페이징
	    $(document).on("click", ".page_link", function () {
		
		//초기화
		$('.PCards').empty();
		$('.page_link').removeClass("active");
		$(this).addClass("active");
		
		let page = $(this).text();
		console.log(page);
		
		let data = {page: page};
		//console.log(data);
   		
   		/*let page = parseInt($(".page-active").text()) + 1;*/
   		/*if(parseInt($(".page-active").text()) %10 === 0){
			for(let i=0; i<10; i++){
				$(".page_link").eq(i).text(parseInt($(".page_link").eq(i).text()) + 10);
			}			
		}*/
   		/*$('.page-active').parent().next().children().addClass('page-active');  
   		$('.page-active').first().removeClass('page-active');   		*/
   		
   		
   		   		
   		$.ajax({
               type: 'post',
               dataType : "json",
               contentType: 'application/json',
               url: '/today/community/openPetList',
               data: JSON.stringify(data),
               success: function (response) {
                    console.log(response); // 리스트 
               	   
                    for(let i = 0; i < response.length; i++){
                    	
                    	let petId = response[i]["petId"];
                    	let petName = response[i]["petName"];
                    	let petSpecies = response[i]["petSpecies"];
                    	let age = response[i]["age"];
                    	let gender = response[i]["gender"];
                    	let feature = response[i]["feature"];
                    	let imagePath = "/today" + response[i]['imagePath'];
                    	let instagram = response[i]["instagram"];
                    	let youtube = response[i]["youtube"];

                        let html ='<div class="cardWrap">'
                        html += '<div class="OPcard">'
                        html += '<div class="cardTop">'
                        html += '<div class="cBullet"></div><h3>'
                        html += petName
                        html += '</h3>'
                        html += '<ul class="cLink">'
                        if(response[i]['instagram']){
                            html += '<li><a href="' + instagram + '" target="_blank">1</a></li>'
                        }
                        if(response[i]['youtube']){
                            html += '<li><a href="' + youtube + '" target="_blank">1</a></li>'
                        }
                        html += '</ul></div>'
                        html += '<div class="cardBody">'
                        html += '<a href="today/community/otherPet/' + petId + '">'
                        html += '<img src="' + imagePath + '">'
                        html += '<ul>'
                        html += '<li><span class="cardTitle">견종:</span>' + petSpecies + '</li>'
                        html += '<li><span class="cardTitle">나이:</span>' + age + '살 (' + gender + ')</li>'
                        html += '<li><span class="cardTitle">성격:</span>' + feature + '</li> '
                        html += '</ul></a>'
                        html += '</div></div></div>'
                   		
                        $('.PCards').append(html);
                    }    
               	   	   	                 
               }, 
               error: function() {
                   console.log("통신 실패!");
               } 
           });
    		 	
        })
        
	
	</script>
	
	
	

</html>