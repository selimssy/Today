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
	.content table, td{font-size: 12px; padding: 5px 2px;}
	.content table th:nth-of-type(1){width:6%;}
	.content table th:nth-of-type(2){width:12%;}
	.content table th:nth-of-type(3){width:15%;}
	.content table th:nth-of-type(4){width:20%;}
	.content table th:nth-of-type(5){width:8%;}
	.content table th:nth-of-type(6){width:5%;}
	.content table th:nth-of-type(7){width:5%;}
	.content table th:nth-of-type(8){width:10%;}
	.content table th:nth-of-type(9){width:5%;}
	.content table th:nth-of-type(10){width:14%;}
	.content table button{margin: 5px 2px; font-size:12px;}
	.content img{width:300px; object-fit: cover;}
	.deletePlan, .reset, .delDiary, .offBoard, .delBoard{cursor:pointer;}
	
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
                    <li><a href="<c:url value='/admin/member'/>" class="checked">회원 관리</a></li>
                    <li><a href="<c:url value='/admin/pet'/>"  class="checked">반려견 관리</a>
                    	<ul class="sub_menu">
                        	<li><a href="<c:url value='/admin/pet'/>">반려견 관리</a></li>
                            <li><a href="<c:url value='/admin/petContent'/>">반려견 콘텐츠</a></li>                            
                        </ul>
                    </li>
                    <li><a href="<c:url value='/admin/content'/>">컨텐츠 관리</a>
                        <ul class="sub_menu">
                        	<li><a href="<c:url value='/admin/content'/>">컨텐츠 현황</a></li>
                            <li><a href="<c:url value='/admin/lifetime'/>">반려견 생애기록</a></li>
                            <li><a href="<c:url value='/admin/gallery'/>">갤러리</a></li>
                            <li><a href="<c:url value='/admin/calendar'/>">캘린더</a></li>
                            <li><a href="<c:url value='/admin/diary'/>">견주 일기</a></li>
                            <li><a href="<c:url value='/admin/board'/>">커뮤니티 게시판</a></li>
                            <li><a href="<c:url value='/admin/reply'/>">댓글</a></li>
                        </ul>
                    </li>                   
                </ul>
            </nav>

            <div class="content">
                <h3>커뮤니티 게시판 현황&nbsp;&nbsp; | &nbsp;&nbsp;
                	<c:choose>
                		<c:when test="${param.keyword == null || param.keyword ==''}">전체 게시글 현황</c:when>
                		<c:otherwise> <button type="button" class="reset">초기화</button> </c:otherwise>
                	</c:choose>               	
                </h3> 
                <div class="search">	       
                	<select class="select" id="condition" name="condition">                            	                           	                        
                         <option value="userId" ${param.condition == 'userId' ? 'selected' : ''}>계정(userId)</option>
                         <option value="open" ${param.condition == 'open' ? 'selected' : ''}>공개 여부</option>                                                                                
                    </select>	                                      	            
                    <div class="keyword">
                        <input type="text" name="keyword" id="keywordInput" value="${param.keyword}" placeholder="계정(userId) 검색">
                        <span>
                            <input type="button" value="조회" id="searchBtn">                                       
                        </span>
                    </div>	 
                    <select class="select" id="order" name="order">                         	                           	
                        <option value="regDate" ${param.order == 'regDate' ? 'selected' : ''}>등록일순</option>
                        <option value="viewCnt" ${param.order == 'viewCnt' ? 'selected' : ''}>조회순</option>  
                        <option value="replyCnt" ${param.order == 'replyCnt' ? 'selected' : ''}>댓글순</option>    
                   </select>	                                 	            
                </div>    
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>작성자</th>
                            <th>제목</th>
                            <th>내용</th>
                            <th>작성일</th>    
                            <th>조회</th>
                            <th>댓글</th>
                            <th>해시태그</th>  
                            <th>공개여부</th>                        
                            <th>관리</th>                           
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${boardList.size() > 0}">
                    		<c:forEach var="board" items="${boardList}">
                    			<tr>
		                            <td>${board.boardNo}</td>
		                            <td>${board.writer}</td>
		                            <td>${board.title}</td>		 
		                            <td>${board.content}</td>
		                            <td><fmt:formatDate value="${board.regDate}" pattern="yyyy.MM.dd" /></td>
		                            <td>${board.viewCnt}</td>
		                            <td>${board.replyCnt}</td>		                           
		                            <td>${board.hashtag}</td>		 
		                            <td>
		                            	<c:if test="${board.open == 0}">비공개</c:if>
		                            	<c:if test="${board.open == 1}">공개</c:if>
		                            </td>                           
		                            <td>
		                            	<c:if test="${board.open == 0}">
		                            		<button type="button" href="${board.boardNo}" class="offBoard on">공개 전환</button>
		                            	</c:if>
		                            	<c:if test="${board.open == 1}">
		                            		<button type="button" href="${board.boardNo}" class="offBoard">비공개 전환</button>
		                            	</c:if>
		                            	<button type="button" href="${board.boardNo}" class="delBoard">삭제</button>
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
								<a href="<c:url value='/admin/board${pc.makeURI(pc.beginPage - 1)}'/>">이전</a>
							</li>
						</c:if>
						
						<!-- 페이지 버튼 -->
						<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
							<li>                                                        <!-- 조건부로 클래스 추가하는 코드! 홀따옴표 주의하자ㅠ -->
							   <a href="<c:url value='/admin/board${pc.makeURI(pageNum)}' />" class="${(pc.paging.page == pageNum) ? 'page-active' : ''}">${pageNum}</a>
							</li>
						</c:forEach>
						  
					   <!-- 다음 버튼 -->
					   <c:if test="${pc.next}">
						   <li>
						       <a href="<c:url value='/admin/board${pc.makeURI(pc.endPage + 1)}'/>">다음</a>
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
		
		// 이미지 크기 처리
		$("img").css("width", "180px").css("height", "120px");
		
		// 검색 버튼 이벤트 처리
		$("#searchBtn").click(function(){
			let keyword = $("#keywordInput").val();
			let condition = $("#condition option:selected").val(); 
			let order = $("#order option:selected").val();
			
			location.href="/admin/board?keyword=" + encodeURI(keyword) + "&condition=" + condition + "&order=" + order;
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
			location.href="/admin/board?keyword=" + encodeURI(keyword) + "&condition=" + condition + "&order=" + order;          
        });
		
		
		
		// 검색조건 변경 이벤트
		$("#condition").change(function(){
			let condition = $("#condition option:selected").val(); 
			if(condition == "open"){
				$("#keywordInput").attr("placeholder", "공개 : 1  ,  비공개 : 0");
			}else if(condition == "userId"){
				$("#keywordInput").attr("placeholder", "계정(userId) 검색");
			}       
        });
		
		
		
		// 게시글 공개/비공개 전환
        $(document).on("click", ".offBoard", function () {          	
        	let open = 0, text="";
        	if($(this).hasClass("on")){ // 공개전환 요청
				open = 1; text="공개";
			}else{ //비공개전환 요청
				open = 0; text="비공개";
			}
			if(confirm("게시글(boardNo=" + $(this).attr("href") + ")을 " + text + "로 전환하시겠습니까?")){	
				
				let boardNo = $(this).attr("href");				
	    		let BoardVO = {boardNo: boardNo, open: open};

	    		$.ajax({
	                type: 'post',
	                dataType : "text",
	                contentType: 'application/json',
	                url: '/admin/offBoard',
	                data: JSON.stringify(BoardVO),
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
		
		
		
		// 게시글 삭제
		$(".delBoard").click(function(){
		    if(confirm("해당 게시글(boardNo= " + $(this).attr('href') + ")를 삭제하시겠습니까?")){
		    	
		    	let boardNo = $(this).attr("href");   
		    	let writer = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
		   		let BoardVO = {
		   			boardNo: boardNo,
		   			writer: writer
		        };
		   		
		   		$.ajax({
		               type: 'post',
		               dataType : "text",
		               contentType: 'application/json',
		               url: '/admin/delBoard',
		               data: JSON.stringify(BoardVO),
		               success: function (response) {
		            	   if(response === "success"){
		         				alert("게시글이 삭제되었습니다.");
		         				window.location.reload();
		         			}else{
		         				alert("게시글 삭제에 실패했습니다.");
		         			}                           
		               }, 
		               error: function() {
		                   console.log("통신 실패!"); 
		               } 
		           });					   	   
		    }    
	   });
		
		
		
		// 검색 초기화(전체 콘텐츠 조회)
		$(".reset").click(function(){
			location.href="/admin/board";
		})
		
		
		
	})
	
	
</script>
</html>