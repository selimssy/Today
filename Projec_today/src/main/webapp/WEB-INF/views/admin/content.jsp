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
	.content .search .keyword{height: 25px; display: inline-block;}
	.content .search input[type='text']{height: 20px;}
	.content table{width: 80%; text-align: center; margin: 20px auto; }
	.content table, th, td{border: 1px solid #aaa; border-collapse: collapse;}
	.content table, th{font-size: 15px; padding: 8px 0;}
	.content table, td{font-size: 12px; padding: 10px 0;}
	.content table a{background:#aaa; color: #fff; text-decoration: none; padding: 3px 5px; font-size:11px; margin-left:15px;}
	.reset, #searchBtn{cursor:pointer;}

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
                <h3>컨텐츠 현황&nbsp;&nbsp; | &nbsp;&nbsp;
                	<c:choose>
                		<c:when test="${param.keyword == null || param.keyword ==''}">전체 컨텐츠 현황</c:when>
                		<c:otherwise> ID : ${param.keyword}의 컨텐츠 현황 <button type="button" class="reset">초기화</button> </c:otherwise>
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
                            <th>생애기록</th>
                            <th>갤러리</th>
                            <th>캘린더</th>
                            <th>견주 일기</th>
                            <th>게시판</th>
                            <th>합계</th>
                            <!--<th>댓글</th> -->                          
                        </tr>
                    </thead>
                    <tbody>                   	
              			<tr>
	                        <td>${contentStats.lifetimeCnt}<a href="<c:url value='/admin/lifetime?keyword=${param.keyword}&condition=userId'/>">상세</a></td>
	                        <td>${contentStats.galleryCnt}<a href="<c:url value='/admin/gallery?keyword=${param.keyword}&condition=userId'/>">상세</a></td>
	                        <td>${contentStats.scheduleCnt}<a href="<c:url value='/admin/calendar?keyword=${param.keyword}&condition=userId'/>">상세</a></td>
	                        <td>${contentStats.diaryCnt}<a href="<c:url value='/admin/diary?keyword=${param.keyword}&condition=userId'/>">상세</a></td>
	                        <td>${contentStats.boardCnt}<a href="<c:url value='/admin/board?keyword=${param.keyword}&condition=userId'/>">상세</a></td>
	                        <td>${contentStats.lifetimeCnt + contentStats.galleryCnt + contentStats.scheduleCnt + contentStats.diaryCnt + contentStats.boardCnt}</td>
	                        <!-- <td>${contentStats.replyCnt}</td> -->
             		   </tr>   
                    </tbody>
                </table>
                
                
              
                
            </div>

        </div>
    </main>

</body>

<script type="text/javascript">

	$(function(){
	
		// 검색 버튼 이벤트 처리
		$("#searchBtn").click(function(){
			let userId = $("#keywordInput").val();	
			location.href="/admin/content?keyword=" + encodeURI(userId) + "&condition=userId";
		})
				
		// 엔터키 입력 이벤트
		$("#keywordInput").keydown(function(key){ 
			
			if(key.keyCode == 13){  // 누른 key가 13(=엔터키)라면
				$("#searchBtn").click();
			}
			
		})
		
		
		
		// 검색 초기화(전체 콘텐츠 조회)
		$(".reset").click(function(){
			location.href="/admin/content";
		})		
		
		
	})
	
	
	
	
	
</script>
</html>
