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
	body{margin: 0; padding:0;}
	header{background: #111; color: #fff; padding: 5px;}
	/*.header_inner, .main_inner{width: 1050px; margin: 0 auto;}*/
	.modal_logo{font-size: 1.25em; font-family: 'Nanum Pen Script', cursive; padding-left: 15px; color: #fff; margin-right: 10px;}
	.main_inner{display: flex; align-content: space-between;}
	.main_nav{width: 220px; background: #545456; padding-top: 10px; border-right: 1px solid #aaa; height: 100%; /*float: left;*/}
	.main_nav ul{list-style: none;}
	.main_nav li{padding: 20px 0;}
	.main_nav li a{text-decoration: none; color: #fff;}
	.sub_menu li{padding: 15px 0;}
	.sub_menu li a{font-size: 14px;}
	.content{width: calc(100% - 220px); margin-top: 20px; position: relative;/*float: left;*/}
	.content h3{padding-left: 10%;}
	.content .search{position: absolute; top: 15px; right: 10%;} 
	.content .search .select{height: 25px; display: inline-block;}
	.content .search .select[name='order']{margin-left: 20px;}
	.content .search .keyword{height: 25px; display: inline-block;}
	.content .search input[type='text']{height: 20px;}
	.content table{width: 80%; text-align: center; margin: 20px auto; }
	.content table, th, td{border: 1px solid #aaa; border-collapse: collapse;}
	.content table, th{font-size: 15px; padding: 8px 0;}
	.content table, td{font-size: 12px; padding: 5px 0;}
	.deletePetBtn, .offPet{cursor:pointer;}
	
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
    
    <header>
        <div class="header_inner">
            <h3><span class="modal_logo">오늘의 너</span>관리자 페이지</h3> 
        </div>
    </header>
    <main>
        <div class="main_inner">
            <nav class="main_nav">
                <ul>
                    <li><a href="<c:url value='/admin/member'/>">회원 관리</a></li>
                    <li><a href="<c:url value='/admin/pet'/>"  class="checked">반려견 관리</a></li>
                    <li><a href="<c:url value='/admin/content'/>">컨텐츠 관리</a>
                        <ul class="sub_menu">
                        	<li><a href="<c:url value='/admin/content'/>">컨텐츠 현황</a></li>
                            <li><a href="#">반려견 생애기록</a></li>
                            <li><a href="#">갤러리</a></li>
                            <li><a href="#">캘린더</a></li>
                            <li><a href="#">견주 일기</a></li>
                            <li><a href="#">커뮤니티 게시판</a></li>
                        </ul>
                    </li>               
                    <li><a href="#">통계</a></li>    
                </ul>
            </nav>

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
		                            <td>${pet.contents}</td>
		                            <td>
		                            	<c:if test="${pet.open == 0}">비공개</c:if>
		                            	<c:if test="${pet.open == 1}">공개</c:if>
		                            </td>
		                            <td><span href="${pet.petId}" class="offPet">비공개 전환</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                <span href="${pet.petId}" class="deletePetBtn">삭제</span>
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
        
        
        // 반려견 비공개 전환
        $(document).on("click", ".offPet", function () {       	
			if(confirm("반려견(petId=" + $(this).attr("href") + ")을 비공개로 전환하시겠습니까?")){	
				
				let petId = $(this).attr("href");
	    		let petVO = {petId: petId};
	    		
	    		$.ajax({
	                type: 'post',
	                dataType : "text",
	                contentType: 'application/json',
	                url: '/admin/offPet',
	                data: JSON.stringify(petVO),
	                success: function (response) {
	         			if(response === 'success'){
	         				alert("비공개로 전환되었습니다.");
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
		
		
		
	})
	
	
	
	
	
</script>
</html>