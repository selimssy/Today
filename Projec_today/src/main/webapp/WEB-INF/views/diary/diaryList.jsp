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
	.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/diary/mainbg6.png); margin: 0 auto;  position: relative;}       

	.page-active{
		background-color: #ff52a0;
	}
</style>
</head>
<body>
<div class="container">   
	<jsp:include page="../common/header.jsp" />
	<main>
	
		<div class="siteInfo">
	        <div class="infoText">
	            <p>견주 다이어리</p>
	            <p>네가 있기에 여전히 아름다운 오늘</p>
	        </div>
	    </div>
	    <div class="siteNav">
	        <a href="#"><div class="homeLogo">1</div></a>
	        <ul>
	            <li><a href="#">캘린더</a></li>
	            <li class="checked"><a href="#">견주 다이어리</a></li>
	        </ul>
	    </div>
	
	    <div class="otherWrap" style="width: 1150px;">
	        <div class="otherP">
	            <P>너와의 오늘, 우리의 시간</P>
	            <!--<h1>다른 반려동물 보러 놀러가기</h1> -->
	            <p>'너'이기에 행복한 견주의 일기</p>
	    	</div>
	    </div>
	    
	    
	    
	</main>
	
	
</div>	
	
	
	<div>

		<table>
			<thead>
				<tr>
					<th>#번호</th>
					<th>작성자</th>
					<th>썸네일테스트</th> 
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<c:if test="${diaryList.size() <= 0}">
				<tr>
					<td colspan="5" align="center">
						<strong>검색 결과가 없습니다.</strong>
					</td>
				</tr>
			</c:if>
		
		
			<!-- 게시물이 들어갈 공간 -->
			<c:if test="${diaryList.size() > 0}">
				<c:forEach var="diary" items="${diaryList}">
					<tr>
						<td>${diary.diaryNo}</td>
						<td>${diary.writer}</td>
						
						<td>
							<c:if test="${empty diary.thumbImg}">
								<img alt="thumb_image" src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width="40px" height="40px">
							</c:if>
							<c:if test="${not empty diary.thumbImg}">
								<img alt="thumb_image" src="${diary.thumbImg}" width="40px" height="40px">	
							</c:if>											
						</td>
																					<!-- 처음 게시판 들어가면 page 파라미터가 없으니까 -->
						<td><a href="<c:url value='/diary/content/${diary.diaryNo}${param.page == null ? pc.makeURI(1) : pc.makeURI(param.page)}' />">
								${diary.title}		
							</a>
							&nbsp; 
							<c:if test="${diary.newMark}">    
								<span>new</span>
							</c:if>       <!-- 부트스트랩 클래스 -->
						</td>
				
						<td>
							<fmt:formatDate value="${diary.regDate}" pattern="yyyy년 MM월 dd일" />							
						</td>
					</tr>
				</c:forEach>
			</c:if>
			
		</table>
		
		
		
		<!-- 페이징 처리 부분  -->
		<ul class="pagination justify-content-center">
			<!-- 이전 버튼 -->
			<c:if test="${pc.prev}">
		        <li class="page-item">
					<a class="page-link" href="<c:url value='/diary/list${pc.makeURI(pc.beginPage - 1)}'/>" 
					style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">이전</a>
				</li>
			</c:if>
			
			<!-- 페이지 버튼 -->
			<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
				<li class="page-item">                                                        <!-- 조건부로 클래스 추가하는 코드! 홀따옴표 주의하자ㅠ -->
				   <a href="<c:url value='/diary/list${pc.makeURI(pageNum)}' />" class="page-link ${(pc.paging.page == pageNum) ? 'page-active' : ''}" style="margin-top: 0; height: 40px; color: pink; border: 1px solid pink;">${pageNum}</a>
				</li>
			</c:forEach>
			  
		   <!-- 다음 버튼 -->
		   <c:if test="${pc.next}">
			   <li class="page-item">
			       <a class="page-link" href="<c:url value='/diary/list${pc.makeURI(pc.endPage + 1)}'/>" 
			       style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">다음</a>
			   </li>
		   </c:if>
		</ul>
		<!-- 페이징 처리 끝 -->
		
		
		
		
		<!-- 검색 버튼 -->
		<div class="row">
			<div class="col-sm-2"></div>
                  <div class="form-group col-sm-2">
                      <select id="condition" class="form-control" name="condition">                            	
                          <option value="title" ${param.condition == 'title' ? 'selected' : ''}>제목</option>
                          <option value="content" ${param.condition == 'content' ? 'selected' : ''}>내용</option>
                          <option value="titleContent" ${param.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
                      </select>
                  </div>
                  <div class="form-group col-sm-4">
                      <div class="input-group">
                          <input type="text" class="form-control" name="keyword" id="keywordInput" value="${param.keyword}" placeholder="검색어">
                          <span class="input-group-btn">
                              <input type="button" value="검색" class="btn btn-izone btn-flat" id="searchBtn">                                       
                          </span>
                      </div>
                  </div>
                  <div class="col-sm-2">
				<a href="<c:url value='/diary/write' />">글쓰기</a>
			</div>
			<div class="col-sm-2"></div>
		</div>

	
	</div>
	
	
	
	
	
	<script type="text/javascript">
	
		// 글쓰기 성공시 띄울 알림창
		const result = "${msg}"
		
		if(result === "regSuccess"){
			alert("일기 등록이 완료되었습니다.")
		} else if(result === "delSuccess"){
			alert("일기가 삭제되었습니다.")
		}
		
		
		
		
		$(function(){
			
			// 검색 버튼 이벤트 처리
			$("#searchBtn").click(function(){
				console.log("검색 버튼이 클릭됨!")
				const keyword = $("#keywordInput").val();
				const condition = $("#condition option:selected").val();  // 라디오박스는 checked... 근데 아래처럼 해도 되는 것 같은데.....
				//const condition = $("#condition").val();
				console.log(condition)
				
				location.href="/today/diary/list?keyword=" + keyword + "&condition=" + condition;
			})
			
			
			// 엔터키 입력 이벤트
			$("#keywordInput").keydown(function(key){ // 검색어창(id="keywordInput")에서 keydown이 일어났을 때
				
				if(key.keyCode == 13){  // 누른 key가 13(=엔터키)라면
					$("#searchBtn").click();
				}
				
			})
			
		})
		
	
	</script>
<jsp:include page="../common/footer.jsp" /> 	
</body>
</html>