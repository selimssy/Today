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
	.content table a{background:#aaa; color: #fff; text-decoration: none; padding: 3px 5px; font-size:11px; margin-left:15px;}
	.content table button{margin: 5px 2px; font-size:12px;}
	.deletePetBtn, .offPet{cursor:pointer;}
	.offPet{width:80px;}
	
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
                <h3>반려견 관리</h3>
                <div class="search">	           
                    <select class="select" id="condition" name="condition">                            	                           	                        
                         <option value="petName" ${param.condition == 'petName' ? 'selected' : ''}>반려견 이름</option>
                         <option value="userId" ${param.condition == 'userId' ? 'selected' : ''}>계정</option>
                         <option value="open" ${param.condition == 'open' ? 'selected' : ''}>공개 여부</option>
                         <option value="petSpecies" ${param.condition == 'petSpecies' ? 'selected' : ''}>견종</option>                                                                                 
                    </select>	            	            
                    <div class="keyword">
                        <input type="text" name="keyword" id="keywordInput" value="${param.keyword}" placeholder="검색어">
                        <span>
                            <input type="button" value="조회" id="searchBtn">                                       
                        </span>
                    </div>	    
                    <select class="select" id="order" name="order">    
                    	<!--  <option value="regDate">--- 정렬 ---</option>   -->                      	                           	
                        <option value="regDate" ${param.order == 'regDate' ? 'selected' : ''}>등록일순</option>
                        <option value="contents" ${param.order == 'contents' ? 'selected' : ''}>컨텐츠순</option> 
                        <option value="updateDate" ${param.order == 'updateDate' ? 'selected' : ''}>업데이트순</option>      
                   </select>	          	            
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>petID</th>
                            <th>반려견 이름</th>
                            <th>계정</th>
                            <th>견종</th>
                            <th>나이</th>
                            <th>성별</th>
                            <th>인스타그램</th>
                            <th>유튜브</th>
                            <th>컨텐츠 수</th>
                            <th>펫편지</th>
                            <th>공개 여부</th>                          
                            <th>관리</th>                            
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${petList.size() > 0}">
                    		<c:forEach var="pet" items="${petList}">
                    			<tr>
		                            <td>${pet.petId}</td>
		                            <td>${pet.petName}</td>
		                            <td>${pet.userId}</td>
		                            <td>${pet.petSpecies}</td>
		                            <td>${pet.age}</td>
		                            <td>${pet.gender}</td>
		                            <td>${pet.instagram}</td>
		                            <td>${pet.youtube}</td>
		                            <td>${pet.contents}<a href="<c:url value='/admin/petContent?keyword=${pet.petId}&condition=petId'/>">상세</a></td>
		                            <td>
		                            	<c:if test="${pet.petLetter == 0}"></c:if>
		                            	<c:if test="${pet.petLetter == 1}">
		                            		<button type="button" class="petLetterOpen" data-user="${pet.userId}" data-petName="${pet.petName}" data-petId="${pet.petId}">펫편지 발송</button>
		                            	</c:if>
		                            </td>
		                            <td>
		                            	<c:if test="${pet.open == 0}">비공개</c:if>
		                            	<c:if test="${pet.open == 1}">공개</c:if>
		                            </td>
		                            <td>		                                
		                                <c:if test="${pet.open == 0}">
		                            		<button type="button" href="${pet.petId}" class="offPet on">공개 전환</button>
		                            	</c:if>
		                            	<c:if test="${pet.open == 1}">
		                            		<button type="button" href="${pet.petId}" class="offPet">비공개 전환</button>
		                            	</c:if>		                                
		                            	
		                            	<button type="button" href="${pet.petId}" class="deletePetBtn">삭제</button>
		                            </td>
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
								<a href="<c:url value='/admin/pet${pc.makeURI(pc.beginPage - 1)}'/>">이전</a>
							</li>
						</c:if>
						
						<!-- 페이지 버튼 -->
						<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
							<li>                                                        <!-- 조건부로 클래스 추가하는 코드! 홀따옴표 주의하자ㅠ -->
							   <a href="<c:url value='/admin/pet${pc.makeURI(pageNum)}' />" class="${(pc.paging.page == pageNum) ? 'page-active' : ''}">${pageNum}</a>
							</li>
						</c:forEach>
						  
					   <!-- 다음 버튼 -->
					   <c:if test="${pc.next}">
						   <li>
						       <a href="<c:url value='/admin/pet${pc.makeURI(pc.endPage + 1)}'/>">다음</a>
						   </li>
					   </c:if>
					</ul>
				</div>
				<!-- 페이징 처리 끝 -->
                
                
            </div>

        </div>
    </main>
	
	<jsp:include page="./admin_pet_msg.jsp" />
	
</body>

<script type="text/javascript">

	$(function(){
		
		// 검색 버튼 이벤트 처리
		$("#searchBtn").click(function(){
			let keyword = $("#keywordInput").val();
			let condition = $("#condition option:selected").val(); 
			let order = $("#order option:selected").val();
			//const condition = $("#condition").val();
			
			location.href="/admin/pet?keyword=" + encodeURI(keyword) + "&condition=" + condition + "&order=" + order;
		})
				
		// 엔터키 입력 이벤트
		$("#keywordInput").keydown(function(key){ 
			
			if(key.keyCode == 13){  // 누른 key가 13(=엔터키)라면
				$("#searchBtn").click();
			}
			
		})
		
		// 정렬 기준 변경 이벤트
		$("#order").change(function(){
			let keyword = $("#keywordInput").val();
			let condition = $("#condition option:selected").val(); 
			let order = $("#order option:selected").val();   
			location.href="/admin/pet?keyword=" + encodeURI(keyword) + "&condition=" + condition + "&order=" + order;          
        });
		
		
		
		// 검색조건 변경 이벤트
		$("#condition").change(function(){
			let condition = $("#condition option:selected").val(); 
			if(condition == "open"){
				$("#keywordInput").attr("placeholder", "공개 : 1  ,  비공개 : 0");
			}else{
				$("#keywordInput").attr("placeholder", "검색어");
			}       
        });
		
		
		
		// 반려견 삭제
        $(document).on("click", ".deletePetBtn", function () {       	
			if(confirm("반려견(petId=" + $(this).attr("href") + ")을 삭제하시겠습니까?")){	
				
				let userId = "${login.userId}";	
				let petId = $(this).attr("href");
	    		let petVO = {
	    				petId: petId,
	    				userId: userId
	    				};
	    		
	    		$.ajax({
	                type: 'post',
	                dataType : "text",
	                contentType: 'application/json',
	                url: '/user/deletePet',
	                data: JSON.stringify(petVO),
	                success: function (response) {
	         			if(response === 'success'){
	         				alert("반려견이 삭제되었습니다.");
	         				window.location.reload();
	         				//$("#petList-open").click();
	         			}else{
	         				alert("반려견 삭제에 실패했습니다.");
	         			}
	                }, 
	                error: function() {
	                    console.log("통신 실패"); 
	                } 
	            });
	    		
			}
        })
        
        
        // 반려견 공개/비공개 전환
        $(document).on("click", ".offPet", function () { 
        	let open = 0, text="";
        	if($(this).hasClass("on")){ // 공개전환 요청
				open = 1; text="공개";
			}else{ //비공개전환 요청
				open = 0; text="비공개";
			}
			if(confirm("반려견(petId=" + $(this).attr("href") + ")을 " + text + "로 전환하시겠습니까?")){	
				
				let petId = $(this).attr("href");
	    		let petVO = {petId: petId, open: open};
	    		
	    		$.ajax({
	                type: 'post',
	                dataType : "text",
	                contentType: 'application/json',
	                url: '/admin/offPet',
	                data: JSON.stringify(petVO),
	                success: function (response) {
	         			if(response === '0'){
	         				alert("비공개로 전환되었습니다.");
	         				window.location.reload();
	         			}else if(response === '1'){
	         				alert("공개로 전환되었습니다.");
	         				window.location.reload();
	         			}else{
	         				alert("비공개 전환에 실패했습니다.");
	         			}
	                }, 
	                error: function() {
	                    console.log("통신 실패"); 
	                } 
	            });
	    		
			}
        })
        
        
        
        // 펫편지 모달 열기
		$(".petLetterOpen").click(function(){
			reset(); // 초기화
			let recvId = $(this).attr("data-user"); // 수신인
			let petName = $(this).attr("data-petName"); // 반려견명
			let petId = $(this).attr("data-petId"); // petId
			$("#msgSendPet #toUser").val(recvId).attr("readonly", true);
			$("#msgSendPet #fromPet").val(petName + ' (petId=' + petId + ')').attr("data-petId", petId).attr("readonly", true);
			$("#msgSendPet").css("display", "block");									
		})
        
        
		
		
		
	})
	
	
	
	
	
</script>
</html>