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
	.deleteUser{cursor:pointer;}
	
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
                <h3>회원 관리</h3>
                <div class="search">	           
                    <select class="select" id="condition" name="condition">                            	                           	
                         <option value="userId" ${param.condition == 'userId' ? 'selected' : ''}>아이디</option>
                         <option value="name" ${param.condition == 'name' ? 'selected' : ''}>이름</option>
                         <option value="nickname" ${param.condition == 'nickname' ? 'selected' : ''}>닉네임</option>
                         <option value="email" ${param.condition == 'email' ? 'selected' : ''}>이메일</option>        
                    </select>	            	            
                    <div class="keyword">
                        <input type="text" name="keyword" id="keywordInput" value="${param.keyword}" placeholder="검색어">
                        <span>
                            <input type="button" value="조회" id="searchBtn">                                       
                        </span>
                    </div>	    
                    <select class="select" id="order" name="order">    
                    	<!--  <option value="regDate">--- 정렬 ---</option>   -->                      	                           	
                        <option value="regDate" ${param.order == 'regDate' ? 'selected' : ''}>가입일순</option>
                        <option value="contents" ${param.order == 'contents' ? 'selected' : ''}>활동순</option>       
                   </select>	          	            
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>가입일</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>이메일</th>
                            <th>반려견 수</th>
                            <th>컨텐츠 수</th>
                            <th>관리</th>
                            <!--이거 다 하고싶은데 일단 보류ㅠ 뭐 하나 할때마다 커뮤니티 업데이트도 해야하니까 업데이트날짜 하면서 같이 회원테이블의
                                컨텐츠 수 +1할까?? 그리고 정렬도 가입일 순 활동순(비용 문제상 5개 컬럼 다 만들지는 말고 그냥 컨텐츠 수로?
                                해결: 컨텐츠필드만 만들어서 컨텐츠수+1을 하고 상세버튼 누르면 각 테이블에서 갯수 각각 구해와서 출력하는걸로)?
                            <th>생애 기록</th>
                            <th>갤러리</th>
                            <th>캘린더</th>
                            <th>견주 일기</th>
                            <th>게시판</th>-->
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${userList.size() > 0}">
                    		<c:forEach var="member" items="${userList}">
                    			<tr>
		                            <td>${member.userId}</td>
		                            <td><fmt:formatDate value="${member.regDate}" pattern="yyyy.MM.dd" /></td>
		                            <td>${member.name}</td>
		                            <td>${member.nickname}</td>
		                            <td>${member.email}</td>
		                            <td>${member.petCnt}&nbsp;&nbsp;(<a href="<c:url value='/admin/pet?keyword=${member.userId}&condition=userId'/>">상세</a>)</td>
		                            <td>${member.contentsCnt}&nbsp;&nbsp;(<a href="<c:url value='/admin/content?keyword=${member.userId}&condition=userId'/>">상세</a>)</td>
		                            <td><span href="${member.userId}" class="deleteUser">삭제</span></td>
		                            <!--<td>3</td>
		                            <td>3</td>
		                            <td>3</td>
		                            <td>3</td>
		                            <td>3</td>-->
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
								<a href="<c:url value='/admin/member${pc.makeURI(pc.beginPage - 1)}'/>">이전</a>
							</li>
						</c:if>
						
						<!-- 페이지 버튼 -->
						<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
							<li>                                                        <!-- 조건부로 클래스 추가하는 코드! 홀따옴표 주의하자ㅠ -->
							   <a href="<c:url value='/admin/member${pc.makeURI(pageNum)}' />" class="${(pc.paging.page == pageNum) ? 'page-active' : ''}">${pageNum}</a>
							</li>
						</c:forEach>
						  
					   <!-- 다음 버튼 -->
					   <c:if test="${pc.next}">
						   <li>
						       <a href="<c:url value='/admin/member${pc.makeURI(pc.endPage + 1)}'/>">다음</a>
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
			
			location.href="/admin/member?keyword=" + encodeURI(keyword) + "&condition=" + condition + "&order=" + order;
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
			location.href="/admin/member?keyword=" + encodeURI(keyword) + "&condition=" + condition + "&order=" + order;          
        });
		
		
		
		
		// 회원 삭제
		$(".deleteUser").click(function(){			
			if(confirm("회원 삭제시 모든 반려견 정보와 기록이 삭제됩니다. 그래도 삭제하시겠습니까?")){
				
				let userId = $(this).attr("href");           
	    		let user = {userId: userId};
	    		
	    		$.ajax({
	                type: 'post',
	                dataType : "text",
	                contentType: 'application/json',
	                url: '/user/deleteUser',
	                data: JSON.stringify(user),
	                success: function (response) {
	         			if(response === 'success'){
	         				alert("회원 삭제가 완료되었습니다.");
	         				window.location.reload();
	         			}else{
	         				alert("회원 삭제에 실패했습니다.");
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