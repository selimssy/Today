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

            <div class="content statistics">
                <h3>반려견 컨텐츠 현황&nbsp;&nbsp; | &nbsp;&nbsp;
                	<c:choose>
                		<c:when test="${param.keyword == null || param.keyword ==''}">전체 반려견 컨텐츠 현황</c:when>
                		<c:otherwise> petID : ${param.keyword}(${petContent.petName})의 컨텐츠 현황 <button type="button" class="reset">초기화</button> </c:otherwise>
                	</c:choose>              	
                </h3>           
                <div class="search">	                                        	            
                    <div class="keyword">
                        <input type="text" name="keyword" id="keywordInput" value="${param.keyword}" placeholder="반려견 번호(petId) 검색">
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
                            <th>합계</th>
                            <!--<th>댓글</th> -->                          
                        </tr>
                    </thead>
                    <tbody>                   	
              			<tr>
	                        <td>${petContent.lifePetCnt}<a href="<c:url value='/admin/lifetime?keyword=${param.keyword}&condition=petId'/>">상세</a></td>
	                        <td>${petContent.galleryPetCnt}<a href="<c:url value='/admin/gallery?keyword=${param.keyword}&condition=petId'/>">상세</a></td>	                        
	                        <td>${petContent.lifePetCnt + petContent.galleryPetCnt}</td>
             		   </tr>   
                    </tbody>
                </table>
                
                
              
                
            </div>

        </div>
    </main>

</body>

<script type="text/javascript">

	$(function(){
		
		// 존재하지 않는 반려견번호 조회한 경우
		if("${msg}" === "noPet"){
			alert("존재하지 않는 반려견입니다.");
		}
		
	
		// 검색 버튼 이벤트 처리
		$("#searchBtn").click(function(){
			let petId = $("#keywordInput").val().trim();	
			let check = /^[0-9]+$/;  // 숫자 체크 정규식
			
			if (!check.test(petId)) { // 숫자 외 입력값 있는 경우
				alert("숫자만 입력 가능합니다.");
			    return false;
			}
			
			location.href="/admin/petContent?keyword=" + petId + "&condition=petId";
		})
				
		// 엔터키 입력 이벤트
		$("#keywordInput").keydown(function(key){ 
			
			if(key.keyCode == 13){  // 누른 key가 13(=엔터키)라면
				$("#searchBtn").click();
			}
			
		})
		
		
		
		// 검색 초기화(전체 콘텐츠 조회)
		$(".reset").click(function(){
			location.href="/admin/petContent?";
		})		
		
		
	})
	
	
	
	
	
</script>
</html>
