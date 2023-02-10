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
	.content .search .keyword{height: 25px; display: inline-block;}
	.content .search input[type='text']{height: 20px;}
	.content table{width: 80%; text-align: center; margin: 20px auto; }
	.content table, th, td{border: 1px solid #aaa; border-collapse: collapse;}
	.content table, th{font-size: 15px; padding: 8px 0;}
	.content table, td{font-size: 12px; padding: 5px 0;}
	.reset, #searchBtn{cursor:pointer;}

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
                    <li><a href="<c:url value='/admin/pet'/>"  class="checked">반려견 관리</a>
                    	<ul class="sub_menu">
                        	<li><a href="<c:url value='/admin/pet'/>">반려견 관리</a></li>
                            <li><a href="<c:url value='/admin/petContent'/>">반려견 콘텐츠</a></li>                            
                        </ul>
                    </li>
                    <li><a href="<c:url value='/admin/content'/>">컨텐츠 관리</a>
                        <ul class="sub_menu">
                        	<li><a href="<c:url value='/admin/content'/>">컨텐츠 현황</a></li>
                            <li><a href="#">반려견 생애기록</a></li>
                            <li><a href="#">갤러리</a></li>
                            <li><a href="<c:url value='/admin/calendar'/>">캘린더</a></li>
                            <li><a href="#">견주 일기</a></li>
                            <li><a href="#">커뮤니티 게시판</a></li>
                        </ul>
                    </li>               
                    <li><a href="#">통계</a></li>    
                </ul>
            </nav>

            <div class="content">
                <h3>반려견 컨텐츠 현황&nbsp;&nbsp; | &nbsp;&nbsp;
                	<c:choose>
                		<c:when test="${param.petId == null || param.petId ==''}">전체 반려견 컨텐츠 현황</c:when>
                		<c:otherwise> petID : ${param.petId}(${petContent.petName})의 컨텐츠 현황 <button type="button" class="reset">초기화</button> </c:otherwise>
                	</c:choose>              	
                </h3>           
                <div class="search">	                                        	            
                    <div class="keyword">
                        <input type="text" name="petId" id="petIdInput" value="${param.petId}" placeholder="반려견 번호(petId) 검색">
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
	                        <td>${petContent.lifePetCnt}</td>
	                        <td>${petContent.galleryPetCnt}</td>	                        
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
			let petId = $("#petIdInput").val().trim();	
			let check = /^[0-9]+$/;  // 숫자 체크 정규식
			
			if (!check.test(petId)) { // 숫자 외 입력값 있는 경우
				alert("숫자만 입력 가능합니다.");
			    return false;
			}
			
			location.href="/admin/petContent?petId=" + petId;
		})
				
		// 엔터키 입력 이벤트
		$("#petIdInput").keydown(function(key){ 
			
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
