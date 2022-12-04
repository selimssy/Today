<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/community/bg12.png); margin: 0 auto;  position: relative;}       
.mainContent{width: 1050px; margin: 0 auto; min-height: 160px;}
.search{/*z-index: 999;float:right;*/text-align: right; padding-right: 125px; }	
.select{display: inline-block; height: 30px; border:1px solid #aaa; box-sizing: border-box;}
.keyword{display: inline-block;}
.keyword input[type=text]{width:200px; height: 30px; border:1px solid #aaa; box-sizing: border-box;}
.keyword input[type=button]{width:45px; height: 30px; border:none; background: #ddd; cursor: pointer;}
.diaryBox{width: 850px; padding:30px 50px 50px; margin: 0 auto; position: relative;}
.diaryTB{width: 100%; border-top: 2.5px solid #7AB730; border-collapse: collapse}
.diaryTB th, .diaryTB td{height: 55px; text-align: center; padding: 20px; box-sizing: border-box; }
.diaryTB th{background:rgba(187, 217, 150, 0.6); font-size:18px}
.diaryTB tr{border-bottom: 1px solid #ccc;}
.diaryTB th:nth-of-type(1){width:9%;}
.diaryTB th:nth-of-type(2){width:52%;}
.diaryTB th:nth-of-type(3){width:15%;}
.diaryTB th:nth-of-type(4){width:15%;}
.diaryTB th:nth-of-type(5){width:9%;}
.diaryTB td.tableTitle{text-align: left; padding-left:50px;}
.diaryTB td.tableTitle a{text-decoration: none; /*color: #333;*/ color:#000;}
.boardNew{background: #fff9d6; font-weight:bold ;font-size: 11px; line-height:11px; padding: 1px 5px 3px; border-radius: 8px; color:#678dab; }
	
.paging{padding: 60px 0 0; text-align: center;}
.paging ul li{list-style: none; display: inline-block;}
.paging ul li a{text-decoration: none; color: #000; padding: 3px 8px;}
.paging ul li a.page-active{color: #000; background:rgba(187, 217, 150, 0.8); border-radius: 10px}

.writeB{width: 60px; color: #fff; border-radius: 10px; background: #7AB730; text-decoration: none;  float:right; position: absolute; bottom:-20px; right:45px; padding: 13px 15px; font-size:19px; line-height:19px; }
</style>
</head>
<body>
<div class="container">   
	<jsp:include page="../common/header.jsp" />
	<main>
	
		<div class="siteInfo">
	        <div class="infoText">
	            <p>커뮤니티 게시판</p>
	            <p>너와 나, 우리 모두 함께</p>
	        </div>
	    </div>
	    <div class="siteNav">
	        <a href="#"><div class="homeLogo">1</div></a>
	        <ul>
	            <li><a href="<c:url value='/community/intro'/>">반려견 소개하기</a></li>
	            <li class="checked"><a href="<c:url value='/community/list'/>">커뮤니티 게시판</a></li>
	        </ul>
	    </div>
	
	    <div class="otherWrap" style="width: 1150px; padding-left:350px">
	        <div class="otherP">
	            <P>너와의 오늘, 우리의 시간</P>
	            <!--<h1>다른 반려동물 보러 놀러가기</h1> -->
	            <p>'너'이기에 행복한 견주의 일기</p>
	    	</div>
	    </div>
	    
	    
	    <div class="mainContent">
	    
	    	<!-- 검색 버튼 -->
			<div class="search">	           
                <select class="select" id="condition" name="condition">                            	                           	
                     <option value="title" ${param.condition == 'title' ? 'selected' : ''}>제목</option>
                     <option value="content" ${param.condition == 'content' ? 'selected' : ''}>내용</option>
                     <option value="titleContent" ${param.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
                     <option value="hashtag" ${param.condition == 'hashtag' ? 'selected' : ''}>해시태그</option>        
                </select>	            	            
                <div class="keyword">
                	<input type="text" name="keyword" id="keywordInput" value="${param.keyword}" placeholder="검색어">
                    <span>
                        <input type="button" value="검색" id="searchBtn">                                       
                    </span>
                </div>	            	            
			</div>
	    
	    
	    	<div class="diaryBox">
				<table class="diaryTB">
					<thead>
						<tr>
							<th>번호</th>					
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>		
							<th>조회</th>				
						</tr>
					</thead>
					
					<c:if test="${boardList.size() <= 0}">
						<tr>
							<td colspan="5" align="center">
								<strong>검색 결과가 없습니다.</strong>
							</td>
						</tr>
					</c:if>				
				
					<!-- 게시물이 들어갈 공간 -->
					<c:if test="${boardList.size() > 0}">
						<c:forEach var="article" items="${boardList}">
							<tr>
								<td>${article.boardNo}</td>																
																							<!-- 처음 게시판 들어가면 page 파라미터가 없으니까 -->
								<td class="tableTitle"><a href="<c:url value='/community/content/${article.boardNo}${param.page == null ? pc.makeURI(1) : pc.makeURI(param.page)}' />">
									${article.title}
									</a>
									<span><b>[${article.replyCnt}]</b></span>
									<c:if test="${article.newMark}">    
										<span class="boardNew">new</span>
									</c:if>      
								</td>
						
								<td>${article.writer}</td>	
						
								<td>
									<fmt:formatDate value="${article.regDate}" pattern="yyyy.MM.dd" />							
								</td>
								<td>${article.viewCnt}</td>
							</tr>
						</c:forEach>
					</c:if>			
				</table>
				
				<!-- 글쓰기 버튼 -->
	  			<a class="writeB" href="<c:url value='/community/write'/>">글쓰기</a>				
			</div>	    
	    </div>
	    
	    
	    

	    
	    
	    <!-- 페이징 처리 부분  -->
	    <div class="paging">
			<ul>
				<!-- 이전 버튼 -->
				<c:if test="${pc.prev}">
			        <li>
						<a href="<c:url value='/community/list${pc.makeURI(pc.beginPage - 1)}'/>">이전</a>
					</li>
				</c:if>
				
				<!-- 페이지 버튼 -->
				<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
					<li>                                                        <!-- 조건부로 클래스 추가하는 코드! 홀따옴표 주의하자ㅠ -->
					   <a href="<c:url value='/community/list${pc.makeURI(pageNum)}' />" class="${(pc.paging.page == pageNum) ? 'page-active' : ''}">${pageNum}</a>
					</li>
				</c:forEach>
				  
			   <!-- 다음 버튼 -->
			   <c:if test="${pc.next}">
				   <li>
				       <a href="<c:url value='/community/list${pc.makeURI(pc.endPage + 1)}'/>">다음</a>
				   </li>
			   </c:if>
			</ul>
		</div>
		<!-- 페이징 처리 끝 -->
	    
	    
	</main>
	
	
	
	
	
	
</div>

	
	
	
	
	
	
	<script type="text/javascript">
	
		// 알림창
		let result = "${msg}"
		
		if(result === "regSuccess"){
			alert("게시물 등록이 완료되었습니다.")
		} else if(result === "delSuccess"){
			alert("게시물이 삭제되었습니다.")
		}
		
		
	
		
		//수정 불가페이지 접근 알림창
		let msg = "${msg}"
		if(msg === "noAuthority"){
			alert("권한이 없습니다.")
		}
		
		
		
		$(function(){
			
			$(".mainMenu.mainMenu3").addClass("checked");
			
			// 검색 버튼 이벤트 처리
			$("#searchBtn").click(function(){
				console.log("검색 버튼이 클릭됨!")
				const keyword = $("#keywordInput").val();
				const condition = $("#condition option:selected").val(); 
				//const condition = $("#condition").val();
				console.log(condition)
				
				location.href="/today/community/list?keyword=" + keyword + "&condition=" + condition;
			})
			
			
			// 엔터키 입력 이벤트
			$("#keywordInput").keydown(function(key){ 
				
				if(key.keyCode == 13){  // 누른 key가 13(=엔터키)라면
					$("#searchBtn").click();
				}
				
			})
			
		})
		
	
	</script>

<jsp:include page="../common/footer.jsp" /> 
</body>
</html>