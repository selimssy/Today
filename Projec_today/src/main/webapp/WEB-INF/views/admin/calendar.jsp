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
	.content table button{margin: 3px 2px; font-size:12px;}
	.deletePlan, .reset{cursor:pointer;}
	
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
                <h3>캘린더 현황&nbsp;&nbsp; | &nbsp;&nbsp;
                	<c:choose>
                		<c:when test="${param.keyword == null || param.keyword ==''}">전체 캘린더 현황</c:when>
                		<c:otherwise> ID : ${param.keyword}의 캘린더 현황 <button type="button" class="reset">초기화</button> </c:otherwise>
                	</c:choose>              	
                </h3> 
                <div class="search">	                                        	            
                    <div class="keyword">
                        <input type="text" name="keyword" id="keywordInput" value="${param.keyword}" placeholder="계정(userId) 검색">
                        <span>
                            <input type="button" value="조회" id="searchBtn">                                       
                        </span>
                    </div>	                                  	            
                </div>    
                <table>
                    <thead>
                        <tr>
                            <th>NUM</th>
                            <th>userId</th>
                            <th>일정명</th>
                            <th>일정 날짜</th>
                            <th>순번</th>
                            <th>메모</th>                            
                            <th>관리</th>                           
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${calendarList.size() > 0}">
                    		<c:forEach var="plan" items="${calendarList}">
                    			<tr>
		                            <td>${plan.scheduleId}</td>
		                            <td>${plan.userId}</td>
		                            <td>${plan.scheduleTitle}</td>
		                            <td><fmt:formatDate value="${plan.scheduleDate}" pattern="yyyy.MM.dd" /></td>
		                            <td>${plan.scheduleNum}</td>
		                            <td>${plan.scheduleDesc}</td>
		                            <td><button type="button" href="${plan.scheduleId}" class="deletePlan">삭제</button></td>				                                                        
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
								<a href="<c:url value='/admin/calendar${pc.makeURI(pc.beginPage - 1)}'/>">이전</a>
							</li>
						</c:if>
						
						<!-- 페이지 버튼 -->
						<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
							<li>                                                        <!-- 조건부로 클래스 추가하는 코드! 홀따옴표 주의하자ㅠ -->
							   <a href="<c:url value='/admin/calendar${pc.makeURI(pageNum)}' />" class="${(pc.paging.page == pageNum) ? 'page-active' : ''}">${pageNum}</a>
							</li>
						</c:forEach>
						  
					   <!-- 다음 버튼 -->
					   <c:if test="${pc.next}">
						   <li>
						       <a href="<c:url value='/admin/calendar${pc.makeURI(pc.endPage + 1)}'/>">다음</a>
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
			let keyword = $("#keywordInput").val().trim();	
			location.href="/admin/calendar?keyword=" + encodeURI(keyword);
		})
				
		// 엔터키 입력 이벤트
		$("#keywordInput").keydown(function(key){ 
			
			if(key.keyCode == 13){  // 누른 key가 13(=엔터키)라면
				$("#searchBtn").click();
			}
			
		})
		
		
		// 일정 삭제
		$(".deletePlan").click(function(){
		    if(confirm("해당 일정(일정 번호: " + $(this).attr('href') + ")을 삭제하시겠습니까?")){
		    	
		    	let scheduleId = $(this).attr("href");   
		    	let userId = $(this).parent().prev().prev().prev().prev().prev().text();
		   		let ScheduleVO = {
		   			scheduleId: scheduleId,
		   			userId: userId
		        };
		   		
		   		$.ajax({
		               type: 'post',
		               dataType : "text",
		               contentType: 'application/json',
		               url: '/diary/deleteSchedule',
		               data: JSON.stringify(ScheduleVO),
		               success: function (response) {
		            	   if(response === "success"){
		         				alert("일정이 삭제되었습니다.");
		         				window.location.reload();
		         			}else{
		         				alert("일정 삭제에 실패했습니다.");
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
			location.href="/admin/calendar";
		})
		
		
		
	})
	
	
</script>
</html>