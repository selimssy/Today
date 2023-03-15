<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">    
<style type="text/css">
	.content table, th, td{border: 1px solid #aaa; border-collapse: collapse;}
	.content table, th{font-size: 15px; padding: 8px 0;}
	.content table, td{font-size: 12px; padding: 5px 0;}
	.content table button{margin: 3px 2px; font-size:12px;}
	.content img{width:100px; object-fit: cover;}
	.reset, #searchBtn, .deleteCardBtn{cursor:pointer;}
	
	.paging{padding: 10px 0 0; text-align: center;}
	.paging ul li{list-style: none; display: inline-block;}
	.paging ul li a{text-decoration: none; color: #000; padding: 3px 8px;}
	.paging ul li a.page-active{color: #fff; background: #384d75; border-radius: 15px}

	@media all and (max-width:1065px){	
	    /*.header_inner, .main_inner{width: 100%;}*/
	}
</style>
</head>
<body>
    <jsp:include page="./admin_header.jsp" />   
    <main>
        <div class="main_inner">
            <jsp:include page="./admin_nav.jsp" />

            <div class="content">
                <h3>컨텐츠 현황&nbsp;&nbsp; | 반려견 생애기록&nbsp;&nbsp;
                	<c:choose>
                		<c:when test="${param.keyword == null || param.keyword ==''}">전체 조회</c:when>
                		<c:when test="${param.condition == 'userId' && param.keyword !=''}">(계정 : ${param.keyword}) <button type="button" class="reset">초기화</button></c:when>
                		<c:when test="${param.condition == 'petId' && param.keyword !=''}">petId : ${param.keyword}(${petName}) <button type="button" class="reset">초기화</button></c:when>
                		
                		
                	</c:choose>              	
                </h3>           
                <div class="search">	            
                	<select class="select" id="condition" name="condition">                        
                	 <option value="userId" ${param.condition == 'userId' ? 'selected' : ''}>계정(userId)</option>    	                           	
                     <option value="petId" ${param.condition == 'petId' ? 'selected' : ''}>반려견번호(petId)</option>                         
                </select>                            	            
                    <div class="keyword">
                        <input type="text" name="keyword" id="keywordInput" value="${param.keyword}" placeholder="검색어">
                        <span>
                            <input type="button" value="조회" id="searchBtn">                                       
                        </span>
                    </div>	                                  	            
                </div>    
                <table>
                    <thead>
                        <tr>
                            <th>생애기록 ID</th>
                            <th>userId</th>
                            <th>petId</th>                           
                            <th>이미지</th>    
                            <th>날짜</th>
                            <th>내용</th>      
                            <th>관리</th>  
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${lifetimeList.size() > 0}">
                    		<c:forEach var="lifetime" items="${lifetimeList}">
                    			<tr>
		                            <td>${lifetime.cardId}</td>
		                            <td>${lifetime.userId}</td>
		                            <td>${lifetime.petId}</td>
		                            <td> <img alt="lifetime_img" src="<c:url value='${lifetime.imagePath}'/>"> </td>
		                            <td><fmt:formatDate value="${lifetime.date}" pattern="yyyy.MM.dd" /></td>
		                            <td>${lifetime.content}</td>
		                            <td><button type="button" href="${lifetime.cardId}" class="deleteCardBtn">삭제</button></td>		                            
		                        </tr>
                    		</c:forEach>
                    	</c:if>   
                    </tbody>
                </table>
                
                <!-- 페이징 처리 부분  -->
			    <div class="paging">
					<ul>
						<!-- 이전 버튼 -->
						<c:if test="${pc.prev}">
					        <li>
								<a href="<c:url value='/admin/lifetime${pc.makeURI(pc.beginPage - 1)}'/>">이전</a>
							</li>
						</c:if>
						
						<!-- 페이지 버튼 -->
						<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
							<li>                                                       
							   <a href="<c:url value='/admin/lifetime${pc.makeURI(pageNum)}' />" class="${(pc.paging.page == pageNum) ? 'page-active' : ''}">${pageNum}</a>
							</li>
						</c:forEach>
						  
					   <!-- 다음 버튼 -->
					   <c:if test="${pc.next}">
						   <li>
						       <a href="<c:url value='/admin/lifetime${pc.makeURI(pc.endPage + 1)}'/>">다음</a>
						   </li>
					   </c:if>
					</ul>
				</div>
				<!-- 페이징 처리 끝 -->
                
              
                
            </div>

        </div>
    </main>

</body>

<script type="text/javascript">

	$(function(){
		
		// 존재하지 않는 반려견번호 조회한 경우
		if("${msg}" === "noPet"){
			alert("존재하지 않는 반려견입니다.");
		}else if("${msg}" === "noUserId"){
			alert("존재하지 않는 사용자입니다.");
		}
		
	
		// 검색 버튼 이벤트 처리
		$("#searchBtn").click(function(){
			const keyword = $("#keywordInput").val();
			const condition = $("#condition option:selected").val(); 
			
			if(condition == "petId"){ // petId로 검색하는 경우 숫자만 입력하도록 정규식 체크
				let check = /^[0-9]+$/;  // 숫자 체크 정규식
				
				if (!check.test(keyword)) { // 숫자 외 입력값 있는 경우
					alert("숫자만 입력 가능합니다.");
				    return false;
				}
			}
					
			location.href="/admin/lifetime?keyword=" + encodeURI(keyword) + "&condition=" + condition;
		})
				
		// 엔터키 입력 이벤트
		$("#keywordInput").keydown(function(key){ 
			
			if(key.keyCode == 13){  // 누른 key가 13(=엔터키)라면
				$("#searchBtn").click();
			}
			
		})
		
		
		
		// 검색 초기화(전체 콘텐츠 조회)
		$(".reset").click(function(){
			location.href="/admin/lifetime";
		})		
		
		
		
		
		// 생애기록 삭제
		$(document).on("click", ".deleteCardBtn", function () {
			if(confirm("생애기록(cardId: " + $(this).attr('href') + ")을 삭제하시겠습니까?")){
				
				let cardId = $(this).attr("href");	 
				let userId = $(this).parent().prev().prev().prev().prev().prev().text();
	    		let lifetimeCard = {
	    				"cardId": cardId,
	    				"userId": userId
	    				};
	    		
	    		$.ajax({
	                type: 'post',
	                dataType : "text",
	                contentType: 'application/json',
	                url: '/mypet/deleteCard',
	                data: JSON.stringify(lifetimeCard),
	                success: function (response) {
	         			if(response === 'success'){
	         				alert("생애기록이 삭제되었습니다.");
	         				window.location.reload();
	         			}else{
	         				alert("생애기록 삭제에 실패했습니다.");
	         			}
	                }, 
	                error: function() {
	                    console.log("통신 실패"); 
	                } 
	            });
			}
		    
        })
		
		
		
		
	})
	
	
	
	
	
</script>
</html>
