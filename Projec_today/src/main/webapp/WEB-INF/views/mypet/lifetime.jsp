<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <style>

        #uploadcard {display: flex;}
        .photo {/*text-align: center; flex-grow: 1;*/}     
        .image-box {width: 200px; height: 200px; object-fit: cover; display: block; margin: 20px auto;}
        .upload-btn {border: 1px solid #ddd; padding: 6px 12px; display: inline-block; cursor: pointer;}
        input[type=file] {display: none;}

    </style>
</head>

<body>
    
    <nav>
        <ul>
            <li><a href="#">나의 반려동물</a></li>
            <li><a href="#">반려견 다이어리</a></li>
            <li><a href="#">커뮤니티</a></li>
            <li><a href="#">마이페이지</a></li>
        </ul>
    </nav>


    <nav>
        <ul>
            <li><a href="<c:url value='/mypet/lifetime'/>">반려견 생애기록</a></li>
            <li><a href="<c:url value='/mypet/gallery'/>">갤러리</a></li>
        </ul>
    </nav>



	<form action="<c:url value='/mypet/uploadCard'/>" method="post" enctype="multipart/form-data">

	     <div id="uploadcard">       
	        <div class="photo">
	            <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
	            <label for="file" class="upload-btn">
	                <input id="file" name="file" type="file" accept="image/*" />
	                <span>Upload Image</span>
	            </label>
	        </div>
	        <div>
	            <!--   <button id="lifeBtn">등록</button> <br>-->
	            <input type="submit" value="등록"><br>
	            <input type="date" id="date" name="Ldate" required> <br>
	            <textarea rows="5" cols="15" id="content" name="content" required></textarea>
	        </div>
	    </div>
	    
	</form>
	
	
	
	
	
	<!-- 생애기록 카드가 들어갈 공간 -->
	<table>
		<c:if test="${cards.size() > 0}">
			<c:forEach var="card" items="${cards}">
				<tr style="color: #ff52a0;">
										
					<td>
						<img alt="pet_image" src="<c:url value='${card.imagePath}'/>" width="40px" height="40px">
					</td>
																																  
					<td>${card.content}</td>
			
					<td>
						<fmt:formatDate value="${card.date}" pattern="yyyy. MM. dd" />							
					</td>
		
				</tr>
			</c:forEach>
		</c:if>
		
	</table>
	
	
	

     <script type="text/javascript">      

        const fileDOM = document.querySelector('#file');
        const previews = document.querySelectorAll('.image-box');

        fileDOM.addEventListener('change', () => {
        const imageSrc = URL.createObjectURL(fileDOM.files[0]);
        previews[0].src = imageSrc;
        });
        // 이거 가능하면 제이쿼리로 바꿔보자ㅠ
     </script>



</body>
</html>