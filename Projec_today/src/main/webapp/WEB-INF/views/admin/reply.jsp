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
	.content table, td{font-size: 12px; padding: 5px 2px;}	
	.content table th:nth-of-type(1){width:7%;}
	.content table th:nth-of-type(2){width:9%;}
	.content table th:nth-of-type(3){width:15%;}
	.content table th:nth-of-type(4){width:30%;}
	.content table th:nth-of-type(5){width:16%;}
	.content table th:nth-of-type(6){width:7%;}
	.content table th:nth-of-type(7){width:16%;}	
	.content table button{margin: 5px 2px; font-size:12px;}
	.content img{width:300px; object-fit: cover;}
	.deletePlan, .reset, .delDiary, .offBoard, .delBoard, .offReply, .delReply{cursor:pointer;}
	.offReply{width:80px;}
	
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
                <h3>댓글 현황&nbsp;&nbsp; | &nbsp;&nbsp;
                	<c:choose>
                		<c:when test="${param.keyword == null || param.keyword ==''}">전체 댓글 현황</c:when>
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
                    <!-- 
                    <select class="select" id="order" name="order">                         	                           	
                        <option value="regDate" ${param.order == 'regDate' ? 'selected' : ''}>등록일순</option>
                        <option value="viewCnt" ${param.order == 'viewCnt' ? 'selected' : ''}>조회순</option>  
                        <option value="replyCnt" ${param.order == 'replyCnt' ? 'selected' : ''}>댓글순</option>    
                   </select>	      
                    -->                           	            
                </div>    
                <table>
                    <thead>
                        <tr>
                            <th>댓글 번호</th>
                            <th>게시글 번호</th>
                            <th>작성자</th>
                            <th>내용</th>
                            <th>작성일</th>                                
                            <th>공개여부</th>                        
                            <th>관리</th>                           
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${replyList.size() > 0}">
                    		<c:forEach var="reply" items="${replyList}">
                    			<tr>
		                            <td>${reply.replyNo}</td>
		                            <td>${reply.boardNo}</td>
		                            <td>${reply.replyer}</td>		 
		                            <td>${reply.content}</td>
		                            <td><fmt:formatDate value="${reply.replyDate}" pattern="yyyy.MM.dd" /></td>		 
		                            <td>
		                            	<c:if test="${reply.open == 0}">비공개</c:if>
		                            	<c:if test="${reply.open == 1}">공개</c:if>
		                            </td>                           
		                            <td>
		                            	<c:if test="${reply.open == 0}">
		                            		<button type="button" href="${reply.replyNo}" class="offReply on">공개 전환</button>
		                            	</c:if>
		                            	<c:if test="${reply.open == 1}">
		                            		<button type="button" href="${reply.replyNo}" class="offReply">비공개 전환</button>
		                            	</c:if>
		                            	<button type="button" href="${reply.replyNo}" class="delReply">삭제</button>
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
								<a href="<c:url value='/admin/reply${pc.makeURI(pc.beginPage - 1)}'/>">이전</a>
							</li>
						</c:if>
						
						<!-- 페이지 버튼 -->
						<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
							<li>                                                        
							   <a href="<c:url value='/admin/reply${pc.makeURI(pageNum)}' />" class="${(pc.paging.page == pageNum) ? 'page-active' : ''}">${pageNum}</a>
							</li>
						</c:forEach>
						  
					   <!-- 다음 버튼 -->
					   <c:if test="${pc.next}">
						   <li>
						       <a href="<c:url value='/admin/reply${pc.makeURI(pc.endPage + 1)}'/>">다음</a>
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
			
			location.href="/admin/reply?keyword=" + encodeURI(keyword) + "&condition=" + condition;
		})
				
		// 엔터키 입력 이벤트
		$("#keywordInput").keydown(function(key){ 
			
			if(key.keyCode == 13){  // 누른 key가 13(=엔터키)라면
				$("#searchBtn").click();
			}
			
		})
		
		
		// 검색조건 변경 이벤트
		$("#condition").change(function(){
			let condition = $("#condition option:selected").val(); 
			if(condition == "open"){
				$("#keywordInput").attr("placeholder", "공개 : 1  ,  비공개 : 0");
			}else if(condition == "userId"){
				$("#keywordInput").attr("placeholder", "계정(userId) 검색");
			}       
        });
		
		
		
		// 댓글 공개/비공개 전환
        $(document).on("click", ".offReply", function () {          	
        	let open = 0, text="";
        	if($(this).hasClass("on")){ // 공개전환 요청
				open = 1; text="공개";
			}else{ //비공개전환 요청
				open = 0; text="비공개";
			}
			if(confirm("댓글(replyNo=" + $(this).attr("href") + ")을 " + text + "로 전환하시겠습니까?")){	
				
				let replyNo = $(this).attr("href");				
	    		let ReplyVO = {replyNo: replyNo, open: open};

	    		$.ajax({
	                type: 'post',
	                dataType : "text",
	                contentType: 'application/json',
	                url: '/admin/offReply',
	                data: JSON.stringify(ReplyVO),
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
		
		
		
		// 댓글 삭제
		$(".delReply").click(function(){
		    if(confirm("해당 댓글(replyNo= " + $(this).attr('href') + ")를 삭제하시겠습니까?")){
		    	
		    	let replyNo = $(this).attr("href");   
		    	let boardNo = $(this).parent().prev().prev().prev().prev().prev().text();
		   		let ReplyVO = {replyNo: replyNo, boardNo: boardNo};
		   		
		   		$.ajax({
		               type: 'post',
		               dataType : "text",
		               contentType: 'application/json',
		               url: '/community/deleteReply',
		               data: JSON.stringify(ReplyVO),
		               success: function (response) {
		            	   alert("댓글이 삭제되었습니다.");       
		            	   window.location.reload();
		               }, 
		               error: function() {
		                   console.log("통신 실패!"); 
		               } 
		           });					   	   
		    }    
	   });
		
		
		
		// 검색 초기화(전체 콘텐츠 조회)
		$(".reset").click(function(){
			location.href="/admin/reply";
		})
		
		
		
	})
	
	
</script>
</html>