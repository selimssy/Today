<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    #container{width: 1200px; height: auto;}
    #register_form{display: none }
    .image-box {width: 200px; height: 200px; object-fit: cover; display: block; margin: 20px auto;}
    .upload-btn {border: 1px solid #ddd; padding: 6px 12px; display: inline-block; cursor: pointer;}
    input[type=file] {display: none;}

    #cards-box{display: flex;}
    .card{width: 25%; }
    
    .card_in img{width: 100%;}
    
    </style>
</head>
<body>
    
    <div>
        <div id="container">

	
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




            <h3>우리아이 사진전</h3>

            <button id="uploadBtn">사진 추가</button>

            <div id="register_form">
                <button id="closeForm">X</button>
                <form action="<c:url value='/mypet/regGallery'/>" method="post" id="gform" enctype="multipart/form-data">
                    <div class="photo">
                        <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
                        <label for="file" class="upload-btn">
                            <input id="file" type="file" name="file" accept="image/*" />
                            <span>Upload Image</span>
                        </label>
                    </div>
                    <input type="text" name="title" placeholder="title" required>
                    <input type="submit" value="등록">
                </form>
            </div>



            <!-- 사진들 들어갈 공간 -->   <!-- 사진크기 400 * 300 정도로 지정해서 제목까지 정사각형보다 살짝 길게하자   그리고 누르면 커지게....?--> 
			<!-- 사진 4개씩 안된다...... 이건 나중에 해결하자ㅠㅠ 그리고 제목 required 말고 그냥 디폴드값으로 하고싶다 title="" 이면 디폴드로??-->
			
				
			<div class="photocards">
                <div id="cards-box">
                
	                <c:if test="${galleryList.size() > 0}">
						<c:forEach var="imgCard" items="${galleryList}">
		                    <div class="card">
		                        <div class="card_in">
		                            <img alt="gallery_image" src="<c:url value='${imgCard.imagePath}'/>" width="400px" height="300px">
		                            <div>
		                                <h5>${imgCard.title}</h5>
		                            </div>
		                        </div>
		                    </div>  
                   	    </c:forEach>
					</c:if>
                                    
                </div>
            </div>
				
				
			
            
        </div>
    </div>



    <script type="text/javascript">      

        const fileDOM = document.querySelector('#file');
        const previews = document.querySelectorAll('.image-box');

        fileDOM.addEventListener('change', () => {
        const imageSrc = URL.createObjectURL(fileDOM.files[0]);
        previews[0].src = imageSrc;
        });



        $(function(){

            $("#uploadBtn").click(function(){
                $("#register_form").css("display", "flex");
            })

            $("#closeForm").click(function(){
                $("#register_form").css("display", "none");
                $("#gform")[0].reset();
                $(".image-box").attr("src","https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg")
            })

        })



        


    </script>   
</html>