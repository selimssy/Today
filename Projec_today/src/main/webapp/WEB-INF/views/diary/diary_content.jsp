<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/diary/mainbg6.png); background-size: contain; margin: 0 auto;  position: relative;}       

.contentBox{width:850px; min-height: 550px; margin: 100px auto; border: 2px solid #d1d1d1; padding: 25px 30px; box-sizing: border-box; /*position: relative;*/}
.contentTop{width:100%; border-bottom: 2px solid #bbb; padding-bottom: 20px; position: relative;}
.contentTop h1{line-height: 55px; margin:0; font-family: 'Jua', sans-serif;}
.contentTop span{font-size: 18px; position: absolute; top: 40px; right: 50px;}
.navBox{position: absolute; bottom: 15px; right: -10px;}
.navBox input{width:75px; height: 30px; border:none; cursor: pointer;}
.contentBody{padding-top: 40px; }
/*.contentBody img{display: block; margin : auto;}*/
.boardcontent{min-height:300px}
.boardcontent p{font-family: 'Jua', sans-serif; font-size:17px;}

/*반응형*/
@media all and (max-width:1065px) {			
	.siteInfo{width:100%; height:auto; position: relative;}
	.siteInfo:before {content: ""; display: block; padding-top: 35.7143%; /* 일정 비율 유지*/}
	.ratio_content {position: absolute; top: 0; right: 0; bottom: 0; left: 0;}		
	.contentBox{width:90%; margin: 9vw auto; padding:25px 20px;}
	
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
	            <p>견주 다이어리</p>
	            <p>네가 있기에 여전히 따듯한 오늘</p>
	        </div>
	    </div>
	    <div class="siteNav">   
	        <table>
		        <tr>
		            <td><a href="<c:url value='/'/>"><div class="homeLogo">home</div></a></td>
		            <td><a href="<c:url value='/diary/calendar'/>">캘린더</a></td>
		            <td class="checked"><a href="<c:url value='/diary/list'/>">견주 다이어리</a></td>
		        </tr>
		    </table>
	    </div>
		<div class="otherWrap">
	        <div class="otherP">
	            <P>너와의 오늘, 우리의 시간</P>
	            <!--<h1>다른 반려동물 보러 놀러가기</h1> -->
	            <p>'너'이기에 행복한 견주의 일기</p>
	    	</div>
	    </div>
		
		
		
		<div class="contentBox">
			<div class="contentTop">
				<h1>${diary.title}</h1>
				<!-- <span><fmt:formatDate value="${diary.regDate}" pattern="yyyy.MM.dd"/></span>  -->
				<p><fmt:formatDate value="${diary.regDate}" pattern="yyyy.MM.dd"/></p>
												
				<!-- 게시물 수정, 삭제, 목록 -->
				<div class="navBox">
					<form id="formObj"  role="form" action="<c:url value='/diary/delete'/>" method="post">  
					
						<input type="hidden" name="diaryNo" value="${diary.diaryNo}">
						<input type="hidden" name="page" value="${p.page}">
					
						        										
						<c:if test="${login.userId == diary.writer}">
					         <input id="modBtn" type="button" value="수정" >&nbsp;&nbsp;	         
					         <input type="submit" value="삭제" onclick="return confirm('다이어리를 삭제하시겠습니까?')">&nbsp;&nbsp;
				      	 </c:if>
						<input type="button" value="목록" class="btn"  id="list-btn">&nbsp;&nbsp;
					</form>	
				</div>				
			</div>
			
			<div class="contentBody">
				<div class="boardcontent">
					${diary.content}
				</div>					
			</div>
		</div>
		
		
		
		
		<!-- 
		<div>
		
			<div>
		        <label>작성자</label>
		        <input type="text" name='writer' value="${diary.writer}" readonly>
	        </div>
	        
	        <div>
		        <label>날짜</label>
		        <fmt:formatDate value="${diary.regDate}" pattern="yyyy년 MM월 dd일" />
	        </div>
	        
	        <div>
		        <label>제목</label>
		        <input type="text" name='title' value="${diary.title}" readonly>
	        </div>
	
	        <div>
		        <label>내용</label>
		        <div style="background-color: #ddd">${diary.content}</div>
	        </div>
		 -->
	
	
	
	 		<!-- POST 방식으로 삭제 -->	
	 		<!-- 
	       <form id="formObj"  role="form" action="<c:url value='/diary/delete'/>" method="post">  
	        
		       <input type="hidden" name="diaryNo" value="${diary.diaryNo}">
		       <input type="hidden" name="page" value="${p.page}">
		 	   <input type="hidden" name="countPerPage" value="${p.countPerPage}">
	         
	           <input type="button" value="목록" class="btn"  id="list-btn"
				style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">&nbsp;&nbsp;
	          -->
	         <!-- 이런식으로 location.href 경로를 통해 가는거는 get방식이다! -->
	         <!-- 그래서 목록, 수정은 get방식이 되고 boardNo hidden이랑 삭제는 post 방식이 된다 -->
	         
	         <!-- 
		         <c:if test="${login.userId == diary.writer}">
			         <input id="modBtn" type="button" value="수정" >&nbsp;&nbsp;	         
			         <input type="submit" value="삭제" onclick="return confirm('정말로 삭제하시겠습니까?')">&nbsp;&nbsp;
		      	 </c:if>
	      </form>
	
		</div>
		-->
		
	</main>
	
</div>
	
	
	
	<script type="text/javascript">
	
	
		//수정 완료 알림창 처리(바닐라 자바스크립트)
		const msg = "${msg}"
		if(msg === "modSuccess"){
			alert("다이어리가 수정되었습니다.")
		}
		
		
		
		$(function(){		
			imgMax();
			
			$(".mainMenu.mainMenu2").addClass("checked");
			
			
			// 목록버튼 클릭이벤트 처리
			$("#list-btn").click(function(){
				console.log("목록버튼 클릭");
				location.href='/today/diary/list?page=${p.page}&keyword=${p.keyword}&condition=${p.condition}';
			})
			
			
			// 수정버튼 클릭이벤트 처리
			const forElement = $("#formObj");
			let modifyBtn = $("#modBtn"); 
			
			modifyBtn.click(function(){
				console.log("수정버튼 클릭");
				forElement.attr("action", "/today/diary/modify");
				forElement.attr("method", "get");
				forElement.submit();
			})
			
			
			
			// 이미지 크기 max 초과할 경우
			function imgMax(){
				let imgElements = document.getElementsByTagName('img');
				for(let i=0; i<imgElements.length; i++){

					let img = imgElements[i];
					let path = img.src;

					if (parseInt($('header').css('width')) > 1047){ // pc버전
						if(img.width > 787){
					    	img.alt = "maxWidth";
					    	let width = img.width;
					    	let height = img.height;
					    	let ratio = height / width;
					    	let modifyHgt = 787 * ratio;
					    	img.style="width:787px; height:" + modifyHgt + "px";
					    }
					}else{ // 태블릿, 모바일 버전
						let now_width = parseInt($('.contentBody').css('width'));
						if(img.width > now_width){
					    	img.alt = "maxWidth";
					    	let width = img.width;
					    	let height = img.height;
					    	let ratio = height / width;
					    	let modifyHgt = now_width * ratio;
					    	img.style="width:" + now_width + "px; height:" + modifyHgt + "px";
					    }
					}
					
				}
			}
			
			$(window).resize(function() {
				imgMax();
		    });
			
			
		});
		
	</script>	

<jsp:include page="../common/footer.jsp" /> 
</body>
</html>