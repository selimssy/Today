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
	.header_inner{width: 90%; position: relative;}
	.header_inner h3{display:inline-block;}
	.header_move{text-align:right; position: absolute; top:10px; right: 0;}
	.header_move p{ display:inline-block; color:fff; font-size:14px;}
	.header_move p:nth-of-type(1){margin-right:30px; padding-left:28px; background-image:url(/img/common/ad_logout.png); background-size: contain; background-repeat: no-repeat;}
	.header_move p:nth-of-type(2){padding-left:22px; background-image:url(/img/common/tohome.png); background-size: contain; background-repeat: no-repeat;}
	/*.header_inner, .main_inner{width: 1050px; margin: 0 auto;}*/
	.header_logo{font-size: 1.25em; font-family: 'Nanum Pen Script', cursive; padding-left: 15px; color: #fff; margin-right: 10px; cursor:pointer;}
	.main_inner{display: flex; align-content: space-between;}
	.main_nav{width: 220px; background: #545456; padding-top: 10px; border-right: 1px solid #aaa; height: 100%; /*float: left;*/}
	.main_nav ul{list-style: none;}
	.main_nav li{padding: 20px 0;}
	.main_nav li a{text-decoration: none; color: #fff;}
	.sub_menu li{padding: 15px 0;}
	.sub_menu li a{font-size: 14px;}
	.content{width: calc(100% - 220px); margin-top: 20px; position: relative;/*float: left;*/}
	.content h3{padding-left: 10%;}
	.content .emailOpen{margin-right:30px; cursor:pointer;}
	.content .search{position: absolute; top: 15px; right: 10%;} 
	.content .search .select{height: 25px; display: inline-block;}
	.content .search .select[name='order']{margin-left: 20px;}
	.content .search .keyword{height: 25px; display: inline-block;}
	.content input[type='checkbox']{cursor:pointer;}
	.content input[type='text']{height: 20px;}
	.content table{width: 80%; text-align: center; margin: 20px auto; }
	.content table, th, td{border: 1px solid #aaa; border-collapse: collapse;}
	.content table, th{font-size: 15px; padding: 8px 0;}
	.content table, td{font-size: 12px; padding: 5px 0;}
	.content table a{background:#aaa; color: #fff; text-decoration: none; padding: 3px 5px; font-size:11px; margin-left:15px;}
	.content table button{margin: 3px 2px; font-size:12px;}
	.deleteUser{cursor:pointer;}
	
	.paging{padding: 10px 0 0; text-align: center;}
	.paging ul li{list-style: none; display: inline-block;}
	.paging ul li a{text-decoration: none; color: #000; padding: 3px 8px;}
	.paging ul li a.page-active{color: #fff; background: #384d75; border-radius: 15px}
	

	#emailSendModal{display:none; width:400px; height: 550px; border: 3.5px solid #777; border-radius: 15px; position: relative; box-shadow: 0 0 15px 0 #e8e8e8;
			background: #fff; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index:10;}	
	.closeEmail{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 25px; right: 25px; background-image: url(/img/common/close.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}	
	#emailSendModal input:focus{outline: none;}, #emailSendModal textarea:focus{outline: none;}
	.modal_header{border-bottom: 1px solid #dee2e6; padding: 15px 0; display: flex; position: relative;}
	.modal-title{font-family: 'Jua', sans-serif; font-size:1.4em; margin:0;}
	.modal_logo{font-size: 1.4em; font-family: 'Nanum Pen Script', cursive; padding-left: 15px;}
	.modal_body{padding: 0 20px; display: block; width:100%; box-sizing: border-box;}
	.modal_body ul{list-style: none; padding-left: 0; margin:0;}
	.mlabel{margin-top:15px;}
	.mlabel p{margin:10px 0;}
	.modal_input{border: 1px solid #d9d9de; box-sizing: border-box; width: 100%; height: 40px; padding-left: 10px;}
	.m_button{margin-top: 20px; width: 45%; height: 35px; padding: 0 20px; border: none; border-radius: 5px; cursor:pointer}
	.m_button:nth-of-type(1){margin-right: 20px;}
	.modal_textarea{resize: none; width: 100%; background: none; border: 1px solid #d9d9de; line-height: 22px; font-family: "NanumSquare","맑은 고딕", sans-serif; box-sizing: border-box; padding: 10px;}
	.modal_input, .modal_textarea{margin-top:5px;}


	.buttonBox{display:flex; justify-content: space-evenly;;}
	
	
	
	
	@media all and (max-width:1065px){	
	    /*.header_inner, .main_inner{width: 100%;}*/
	}
</style>
</head>
<body>
    
    <header>
        <div class="header_inner">
            <h3><span class="header_logo">오늘의 너</span>관리자 페이지</h3> 
            <div class="header_move">
            	<p>관리자 로그아웃</p>
            	<p>홈으로 이동</p>
            </div>
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
                <h3>회원 관리</h3>                	
                <div class="search">	 
                	<button type="button" class="emailOpen">메일 발송</button>         
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
                        <option value="contents" ${param.order == 'contents' ? 'selected' : ''}>컨텐츠순</option>  
                        <option value="replyCnt" ${param.order == 'replyCnt' ? 'selected' : ''}>댓글순</option>     
                   </select>	          	            
                </div>
                <table>
                    <thead>
                        <tr>
                        	<th></th>
                            <th>아이디</th>
                            <th>가입일</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>이메일</th>
                            <th>반려견 수</th>
                            <th>컨텐츠 수</th>
                            <th>댓글</th>
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
                    				<td><input type='checkbox' name='emailSend' value='${member.email}' /></td>
		                            <td>${member.userId}</td>
		                            <td><fmt:formatDate value="${member.regDate}" pattern="yyyy.MM.dd" /></td>
		                            <td>${member.name}</td>
		                            <td>${member.nickname}</td>
		                            <td>${member.email}</td>
		                            <td>${member.petCnt}<a href="<c:url value='/admin/pet?keyword=${member.userId}&condition=userId'/>">상세</a></td>
		                            <td>${member.contentsCnt}<a href="<c:url value='/admin/content?keyword=${member.userId}&condition=userId'/>">상세</a></td>
		                            <td>${member.replyCnt}<a href="<c:url value='/admin/reply?keyword=${member.userId}&condition=userId'/>">상세</a></td>
		                            <td><button type="button" href="${member.userId}" class="deleteUser">삭제</button></td>		                            
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
    
     
    
    
    <!-- 메일 발송 모달 -->
	<div id="emailSendModal">
		<div class="modal_header">			
			<p class="modal-title">
                <span class="modal_logo">오늘의 너</span> 메일 발송
            </p>
            <div class="closeEmail">close</div>
		</div>
				
		<div class="modal_body">
	        <ul>	    
	        	<li class="mlabel">
                    <p>
                        <strong>받는 사람</strong>
                    </p>
	            </li>
	            <li>
	                <input type="text" id="toMail" class="modal_input" disabled/>
	            </li>	        
	            <li class="mlabel">
                    <p>
                        <strong>제목</strong>
                    </p>
	            </li>
	            <li>
	                <input type="text" id="emailTitle" class="modal_input" placeholder="메일 제목"/>
	            </li>	            
	            <li class="mlabel">
                    <p>
                        <strong>내용</strong>
                    </p>
	            </li>
	            <li>
	                <textarea id="emailCont" class="modal_textarea" rows="7" spellcheck="false"></textarea>
	            </li>
	            
	            <li>
                   	<div class="buttonBox">
                        <button type="button" id="adminEmail" class="m_button">발송</button>
                        <button type="button" id="emailCancle" class="m_button">취소</button>
                    </div>
                </li>
	        </ul>
    	</div>
	</div>
    
    

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
		
		
		
		// 메일 발송 모달 여닫기
		$(".emailOpen").click(function(){
			let emailList = [];
			$('input[name="emailSend"]:checked').each(function(){ //체크된 리스트 저장
				emailList.push($(this).val());
            });
			
			if(emailList.length == 0){ // 받는 사람 체크 안 한 경우
				alert("수신인을 체크해주세요.");
				return false;
			}
			
			let firstPerson = emailList[0];
			$("#emailSendModal input").val("");
			$("#emailSendModal textarea").val("");
			$("#toMail").val(firstPerson + "외 " + parseInt(emailList.length-1) + "명");
			$("#emailSendModal").css("display","block");
		})
		
		$("#emailCancle").add(".closeEmail").click(function(){
			$("#emailSendModal").css("display","none");
		})
		
		
		
		// 단체 메일 발송
		$("#adminEmail").click(function(){
			let emailList = [];
			$('input[name="emailSend"]:checked').each(function(){ //체크된 리스트 저장
				emailList.push($(this).val());
            });
			
			let content = $("#emailCont").val().replace(/(?:\r\n|\r|\n)/g, '<br>');
			let emailSend = {
				"title": $("#emailTitle").val(),
				"content": content,
				"emailList" : emailList
				};

			$.ajax({
				type : "POST",
				url : "/admin/adminEmail",
				headers: {
                    "Content-Type": "application/json"
                }, 
				dataType: "text",
				data: JSON.stringify(emailSend),
				success: function(response){
					if(response === 'success'){
         				alert("메일이 발송되었습니다.");
         				window.location.reload();
         			}else{
         				alert("메일 발송에 실패했습니다.");
         			}									
				},
				error: function(data){
					alert("메일 발송에 실패했습니다.");
				}
			});
			
			
			
			
		})
		
		
		// 홈으로 이동
		$(".header_logo").click(function(){
			location.href="/";
		})
		
		
	})
	
	
</script>
</html>