<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">
    <title>Document</title>
    <style>
        *{margin: 0; padding: 0;}
        .container{width: 100%; margin: 0 auto;}
        header {width: 100%; height: 115px;  /*position: absolute; top: 0; left: 0; display: block; */z-index: 100; background: #fff; }
        .header_innerBox{width: 1200px; margin: 0 auto}
        .header_innerBox h1{float: left; padding-top: 35px;}
        .header_innerBox h1 a{width:220px; height:70px; background-image:url(/today/img/common/mainlogo.png); background-size: contain; background-repeat: no-repeat; overflow:hidden; display:block; text-indent: -999px;}
        .header_cont {float:right; width:750px; display: block;}
        .header_cont ul{list-style: none;}
        .header_cont ul li a{text-decoration: none;}
        .header_cont .user_nav{text-align: right; padding-top:10px;}
        .header_cont .user_nav li{display:inline;}
        .header_cont .user_nav li:after {content:"|"; display:inline-block; padding:0 10px; font-size:10px; color:#555; position:relative; top:-2px;}
        .header_cont .user_nav li:last-child:after {content:""; display:none;}
        .header_cont .user_nav li a {font-size:14px; color:#555;}
        .header_cont .main_nav {float:right; box-sizing:border-box; padding-top:5px; /*height:113px;*/}
        .header_cont .main_nav li {float: left;}
        .header_cont .main_nav li a {display:block; padding:20px 33px; font-size:20px; color:#000;}
        .header_cont .main_nav li .mainMenu:hover{color: #7AB730;}
        .header_cont .main_nav li a.checked{color: #7AB730; font-weight: bold;}
        .header_cont .main_nav li:last-child a {padding-right:0;}
    
        .submenu{position:absolute; left:0; top:115px; width:100%; background:#7AB730;; z-index:100; display:none;}
        .submenu .submenu_list {width:1200px; margin:0 auto; text-align:left;}
        .sub_1 .submenu_list {box-sizing:border-box; padding-left:450px;}
        .sub_2 .submenu_list {box-sizing:border-box; padding-left:610px;}
        .sub_3 .submenu_list {box-sizing:border-box; padding-left:820px;}
        .sub_4 .submenu_list {box-sizing:border-box; padding-left:960px;}
        .submenu .submenu_list li {display:inline;}
        .submenu .submenu_list li a {display:inline-block; padding:20px; color: #fff; font-size: 18.5px;}
        .submenu .submenu_list li:last-child a {padding-right:0;}
        .submenu .submenu_list li a.on {color:#fff;}
    
        .siteInfo{width: 1200px; height: 450px; background-image: url(/today/img/common/mainbg1.png); margin: 0 auto;  position: relative;}
        .infoText{position: absolute; top: 150px; left: 100px; z-index: 999;}
        .infoText p:nth-of-type(1){font-size: 84px; font-family: 'Nanum Pen Script';}
        .infoText p:nth-of-type(2){font-size: 36px; font-family: 'Nanum Pen Script';}
        .siteNav{width: 1200px; height: 80px; margin: 0 auto; border: 3.5px solid #7AB730; box-sizing: border-box; position: relative;}
        .homeLogo{width: 78px; height: 75px; background-image: url(/today/img/common/homeLogo2.png); background-size: cover; float: left; text-indent: -999px; position: absolute; top: -1px; left: -3px;}
        .siteNav ul{list-style: none; width: 90%; display: flex; justify-content: space-evenly; padding-left: 100px;}
        .siteNav ul li{width: 180px; display: inline-block; padding: 17px 60px 10px; border-bottom: 1px solid #000; text-align: center;}
        .siteNav ul li.checked{border-bottom: 2px solid #7AB730;}
        .siteNav ul li a{text-decoration: none; color: #000; font-size: 1.3em; color: #000;}
        .siteNav ul li.checked a{color: #7AB730;}


        .otherWrap{width: 1200px; margin: 0 auto; padding-left: 200px;}
        .otherP{width: 1200px; height: 155px; border-left: 5px solid #7AB730; margin: 120px 0 120px;  padding-left:55px}
        .otherP p{font-size: 42px; color:#5CAC3D; font-family: 'Nanum Pen Script', cursive; /*letter-spacing:1px; word-spacing:2px;*/}
        .otherP h1{font-size: 60px; font-family: 'Nanum Pen Script'; margin:20px 0; /*letter-spacing:5px; word-spacing:7px*/}
        .otherP p:last-of-type{font-size: 85px; font-family: 'Nanum Pen Script'; margin:20px 0; /*letter-spacing:3px; word-spacing:5px;*/ color: #000;}
        
        .mainContent{width: 1000px; margin: 0 auto; min-height: 250px;}
        .mainContent .conTitle{width: 1000px; margin: 0 auto; background:#BBD996;}
        .mainContent .conTitle .contWrap{width: 350px; display: flex; margin: 0 auto;}
        .mainContent .conTitle span{line-height: 70px; font-size: 45px; font-family: 'Nanum Pen Script'; padding-left: 25px;}
        .mainContent .conTitle .contImg{width: 65px; height: 65px; text-indent: -9999px;  background-image: url(/today/img/common/infoPhoto.png); background-size: contain; background-repeat: no-repeat;}
    
        .uploadCard{/*display: none;*/ width: 650px; height: 320px; margin: 50px auto; border: 3.5px solid #7AB730; border-radius: 15px; padding: 20px; position: relative; display: flex; justify-content: space-evenly;}
        .openUCard{display: none; width: 125px; height: 50px; margin-top: 35px; border: none; border-radius: 7px; font-size: 32px; font-family: 'Nanum Pen Script'; background: #7AB730; float: right; cursor: pointer;}
        .closeUCard{width: 70px; height: 33px; border: none; border-radius: 7px; background: #fff; border: 3px solid #7AB730; color: #7AB730;font-weight: bolder; position:absolute; bottom: 15px; right: 15px; cursor: pointer;}
        .uploadCardBtn{width: 70px; height: 33px; border: none; border-radius: 7px; background: #7AB730; position:absolute; bottom: 15px; right: 100px; cursor: pointer;}
        .lifeCardInfo{width: 350px; padding-top: 20px;}
        .lifeCardInfo input[type=date]{width: 230px; font-size: 18px; font-family: "NanumSquare","맑은 고딕", sans-serif; text-align: center; margin-left: 65px;}
        .lifeCardInfo input[type=text]{width: 100%; border: 2px solid #eee; font-size: 21px; font-family: 'Nanum Pen Script'}
        .InfoList{width: 350px; height: 165px; background: #f3f3f3; border-radius: 10px; margin-top: 25px; padding: 10px 30px; box-sizing: border-box;}
        .InfoList ul{padding-left: 10px;}
        .InfoList ul li{margin: 30px 0;}
        

        /*footer*/
        footer{width: 1200px; margin: 30px auto; border-top: 2px solid #222;}
        #bottomMenu{list-style: none; margin: 10px 10px 10px 30px;}
        #bottomMenu li{display: inline-block; margin: 10px 0; border-right: 1px solid #aaa; padding: 0 10px;}
        #bottomMenu li:last-child{border:none}
        #bottomMenu li a{text-decoration: none; color: #333;}


        /* 파일업로드(사이즈, btn 제외 중복) */
        .flex-container {display: flex;}
        .wrapper {text-align: center;flex-grow: 1;}        
        .image-box {width: 220px;height: 220px;object-fit: cover;display: block;margin: 20px auto;}
        .upload-btn {font-size: 18px; border: 1px solid #ddd; padding:10px 20px;display: inline-block; cursor: pointer; }
        .upload-btn input[type=file] {display: none;}
    </style>
</head>
<body>
    
<div class="container">
    <header id="header">
		<div class="header_innerBox">	
			<h1><a href="javascript:;">Tourist in tour</a></h1>
			<!-- 모바일메뉴
			<p class="openMOgnb"><a href="#"><b class="hdd">메뉴</b> <span></span><span></span><span></span></a></p>
			-->
			<!-- header_cont -->
			<div class="header_cont">
				<ul class="user_nav">
					<li><a href="javascript:;">로그인</a></li>
					<li><a href="javascript:;">회원가입</a></li>
				</ul>	
				<nav>
				<ul class="main_nav">
					<li><a href="javascript:;" class="mainMenu mainMenu1 checked">나의 반려견</a>

                        <div class="submenu sub_1">
                            <ul class="submenu_list">
                                <li><a href="javascript:;">반려견 생애 기록</a></li>
                                <li><a href="javascript:;">갤러리</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="javascript:;" class="mainMenu mainMenu2">반려견 다이어리</a>
				        <div class="submenu sub_2">
                            <ul class="submenu_list">
                                <li><a href="javascript:;">반려견 전용 캘린더</a></li>
                                <li><a href="javascript:;">견주 일기</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="javascript:;" class="mainMenu mainMenu3">커뮤니티</a>
                        <div class="submenu sub_3">
                            <ul class="submenu_list">
                                <li><a href="javascript:;">내 반려견 소개</a></li>
                                <li><a href="javascript:;">커뮤니티 게시판</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="javascript:;" class="mainMenu mainMenu4">마이페이지</a>
                        <div class="submenu sub_4">
                            <ul class="submenu_list">
                                <li><a href="javascript:;">개인정보 수정</a></li>
                                <li><a href="javascript:;">내 게시물</a></li>
                            </ul>
                        </div>
					</li>
				</ul>
                </nav>
				
			</div>
			<!-- //header_cont -->


		</div>
	</header>


    <main>
        <div class="siteInfo">
            <div class="infoText">
                <p>반려견 생애 기록</p>
                <p>잊을 수 없는 너의 특별했던 순간</p>
            </div>
        </div>
        <div class="siteNav">
            <a href="#"><div class="homeLogo">1</div></a>
            <ul>
                <li class="checked"><a href="#">반려견 생애 기록</a></li>
                <li><a href="#">갤러리</a></li>
            </ul>
        </div>

        <div class="otherWrap">
            <div class="otherP">
                <P>기억하고 싶은 너의 시간</P>
                <!--<h1>다른 반려동물 보러 놀러가기</h1> -->
                <p>우리 아이의 특별했던 순간들</p>
        </div>
        </div>


        <div class="mainContent">
            <div class="conTitle">
                <div class="contWrap">
                    <div class="contImg">img</div>
                    <span>짜장이 생애 기록</span>
                </div>
            </div>

            <div><button class="openUCard">+ 기록추가</button></div>

            <div class="uploadCard">
                <button class="uploadCardBtn">등록</button>
                <button class="closeUCard">접기</button>
                <div class="flex-container">       
                    <div class="wrapper">
                        <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" class="image-box" />
                        <label for="file" class="upload-btn">
                            <input id="file" type="file" accept="image/*" />
                            <span>Upload Image</span>
                        </label>
                    </div>
                </div>
                <div class="lifeCardInfo">
                    <input type="date" required>
                    <div class="InfoList">
                        <ul>
                            <li><input type="text" required></li>
                            <li><input type="text"></li>
                        </ul>
                    </div>  
                </div>
            </div>


            <!--
            <div class="lifetimeCard">
                <button class="modifyCardBtn">수정</button>
                <button class="deleteCardBtn">삭제</button>   
                <div class="petImage">
                    <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width="220px" height="220px" />
                </div>
                <div class="lifeCardInfo">
                    <p>2020.01.01</p>
                    <div class="InfoList">
                        <ul>
                            <li>처음 만난 날</li>
                            <li>가족이 된 꼬물이</li>
                        </ul>
                    </div>  
                </div>
            </div>
            -->



        </div>

    </main>


    <footer>
        
        <ul id="bottomMenu">
            <li><a href="#">회사 소개</a> </li>
            <li><a href="#">개인정보 처리방침</a> </li>
            <li><a href="#">여행 약관</a> </li>
            <li><a href="#">사이트맵</a> </li>
        </ul>
            <h5>투어리스트인투어</h5>
            <p class="addr">서울특별시 종로구 혜화동 9길 청운빌딩 5층 <span class="gubun">/</span>        
				<span class="br_line">대표전화 <span class="space0">02-1234-5678</span> <span class="gubun">/</span>        
					<span class="br_line">E-mail : <span class="space0"> titour@touristintour.com</span></span>
				</span>
			</p>
			<p class="copy box_inner">Copyright(c) TouristInTour all right reserved</p>
      </footer>



</div>



<script>

        // 등록카드 여닫기
        $(".openUCard").click(function(){           
            $(".uploadCard").css("display","flex");
            $(".uploadCard").css("justify-content","space-evenly");
            $(this).css("display","none");
        })

        $(".closeUCard").click(function(){
            $(".uploadCard").css("display","none");
            $(".openUCard").css("display","inline-block");
        })


        // 파일업로드(중복!!)
        const fileDOM = document.querySelector('#file');
        const previews = document.querySelectorAll('.image-box');

        fileDOM.addEventListener('change', () => {
        const imageSrc = URL.createObjectURL(fileDOM.files[0]);
        previews[0].src = imageSrc;
        });



    let isOver1 = [false, false, false, false]
    let isOver2 = [false, false, false, false]

    // fadeOut() 시간 설정
    function goHide(){
        for(let i=0; i <4; i++){
            if(!isOver1[i] && !isOver2[i])  // 상위와 하위 둘 다 마우스가 닿았을 때만      // 깜빡이는거 없어진다
            $(".sub_" + (i+1)).fadeOut("fast")
        }
    }



    for(let i = 1; i <=4; i++){
        $(".mainMenu" + i).mouseover(function(){
            // 서브메뉴 나타나기(header 너비가 800보다 클 때만
            if(parseInt($("header").css("width")) > 800){   // parseInt 해줘야 인식한다!!
                $(".sub_" + i).fadeIn("fast")
                isOver1[i - 1] = true
            }
        }).focus(function(){
            if(parseInt($("header").css("width")) > 800){
                $(".sub_" + i).fadeIn("fast")
                isOver1[i - 1] = true
            }
        }).mouseout(function(){
            // $(".gnb_depth2_1").fadeOut("fast")
            setTimeout(goHide, 100)  // 0.5초 뒤에 사라지도록
            isOver1[i - 1] = false
        }).blur(function(){
            setTimeout(goHide, 100)    // mouseover는 mouseout으로, focus는 blur로
            isOver1[i - 1] = false
    
        })
    
    
        // 하위메뉴
        $(".sub_" + i).mouseover(function(){
            isOver2[i - 1] = true
        }).focus(function(){
            isOver2[i - 1] = true
        }).mouseout(function(){
            isOver2[i - 1] = false
            setTimeout(goHide, 200)
        }).blur(function(){
            isOver2[i - 1] = false
            setTimeout(goHide, 200)
        })
    }

</script>  



</body>
</html>