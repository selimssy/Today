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
	.content img{width:100px; object-fit: cover;}
	.reset, #searchBtn, .deleteCardBtn, .delGallery{cursor:pointer;}
	
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
                    <li><a href="<c:url value='/admin/pet'/>">반려견 관리</a>
                    	<ul class="sub_menu">
                        	<li><a href="<c:url value='/admin/pet'/>">반려견 관리</a></li>
                            <li><a href="<c:url value='/admin/petContent'/>">반려견 콘텐츠</a></li>                            
                        </ul>
                    </li>
                    <li><a href="<c:url value='/admin/content'/>"  class="checked">컨텐츠 관리</a>
                        <ul class="sub_menu">
                        	<li><a href="<c:url value='/admin/content'/>">컨텐츠 현황</a></li>
                            <li><a href="<c:url value='/admin/lifetime'/>">반려견 생애기록</a></li>
                            <li><a href="<c:url value='/admin/gallery'/>">갤러리</a></li>
                            <li><a href="<c:url value='/admin/calendar'/>">캘린더</a></li>
                            <li><a href="#">견주 일기</a></li>
                            <li><a href="#">커뮤니티 게시판</a></li>
                        </ul>
                    </li>               
                    <li><a href="#">통계</a></li>    
                </ul>
            </nav>

            <div class="content">
                <h3>컨텐츠 현황&nbsp;&nbsp; | 갤러리&nbsp;&nbsp;
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
                            <th>갤러리 ID</th>
                            <th>userId</th>
                            <th>petId</th>                           
                            <th>이미지</th>    
                            <th>제목</th>
                            <th>내용</th>      
                            <th>관리</th>  
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${galleryList.size() > 0}">
                    		<c:forEach var="gallery" items="${galleryList}">
                    			<tr>
		                            <td>${gallery.imgId}</td>
		                            <td>${gallery.userId}</td>
		                            <td>${gallery.petId}</td>
		                            <td> <img alt="lifetime_img" src="<c:url value='${gallery.imagePath}'/>"> </td>
		                            <td>${gallery.title}</td>
		                            <td>${gallery.content}</td>
		                            <td><span href="${gallery.imgId}" class="delGallery">삭제</span></td>
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
								<a href="<c:url value='/admin/gallery${pc.makeURI(pc.beginPage - 1)}'/>">이전</a>
							</li>
						</c:if>
						
						<!-- 페이지 버튼 -->
						<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
							<li>                                                       
							   <a href="<c:url value='/admin/gallery${pc.makeURI(pageNum)}' />" class="${(pc.paging.page == pageNum) ? 'page-active' : ''}">${pageNum}</a>
							</li>
						</c:forEach>
						  
					   <!-- 다음 버튼 -->
					   <c:if test="${pc.next}">
						   <li>
						       <a href="<c:url value='/admin/gallery${pc.makeURI(pc.endPage + 1)}'/>">다음</a>
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
					
			location.href="/admin/gallery?keyword=" + encodeURI(keyword) + "&condition=" + condition;
		})
				
		// 엔터키 입력 이벤트
		$("#keywordInput").keydown(function(key){ 
			
			if(key.keyCode == 13){  // 누른 key가 13(=엔터키)라면
				$("#searchBtn").click();
			}
			
		})
		
		
		
		// 검색 초기화(전체 콘텐츠 조회)
		$(".reset").click(function(){
			location.href="/admin/gallery";
		})		
		
		
		
		
		// 갤러리 삭제	
		$(document).on("click", ".delGallery", function () {
			
			if(confirm("갤러리(imgId: " + $(this).attr('href') + ")를 삭제하시겠습니까?")){
				
				let imgId = $(this).attr("href");	 
				let userId = $(this).parent().prev().prev().prev().prev().prev().text();
	    		let gallery = {
	    				"imgId": imgId,
	    				"userId": userId
	    				};
	    		
	    		$.ajax({
	                type: 'post',
	                dataType : "text",
	                contentType: 'application/json',
	                url: '/mypet/deleteGallery',
	                data: JSON.stringify(gallery),
	                success: function (response) {
	         			if(response === 'success'){
	         				alert("갤러리가 삭제되었습니다.");
	         				window.location.reload();
	         			}else{
	         				alert("갤러리 삭제에 실패했습니다.");
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
