<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
        .mob_menu{display: none;}
        .mob_close{display: none;}
        .container{width: 100%; margin: 0 auto; padding-bottom:70px}
        header{width: 100%; height: 115px;  /*position: absolute; top: 0; left: 0; display: block; */z-index: 100; background: #fff; }
        .header_innerBox{width: 1050px; margin: 0 auto}
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
        .sub_1 .submenu_list {box-sizing:border-box; padding-left:370px;}
        .sub_2 .submenu_list {box-sizing:border-box; padding-left:520px;}
        .sub_3 .submenu_list {box-sizing:border-box; padding-left:740px;}
        .sub_4 .submenu_list {box-sizing:border-box; padding-left:950px;}
        .submenu .submenu_list li {display:inline;}
        .submenu .submenu_list li a {display:inline-block; padding:20px; color: #fff; font-size: 18.5px;}
        .submenu .submenu_list li:last-child a {padding-right:0;}
        .submenu .submenu_list li a.on {color:#fff;}
    
        .infoText{position: absolute; top: 140px; left: 100px; /*z-index: 5;*/}
        .infoText p:nth-of-type(1){font-size: 72px; font-family: 'Nanum Pen Script';}
        .infoText p:nth-of-type(2){font-size: 30px; font-family: 'Nanum Pen Script';}
        /*.siteNav{width: 1050px; height: 80px; margin: 0 auto; border: 3.5px solid #7AB730; box-sizing: border-box; position: relative;}
        .homeLogo{width: 78px; height: 75px; background-image: url(/today/img/common/homeLogo2.png); background-size: cover; float: left; text-indent: -999px; position: absolute; top: -1px; left: -3px;}
        .siteNav ul{list-style: none; width: 90%; display: flex; justify-content: space-evenly; padding-left: 100px;}
        .siteNav ul li{width: 180px; display: inline-block; padding: 17px 60px 10px; border-bottom: 1px solid #000; text-align: center;}
        .siteNav ul li.checked{border-bottom: 2px solid #7AB730;}
        .siteNav ul li a{text-decoration: none; color: #000; font-size: 1.3em; color: #000;}
        .siteNav ul li.checked a{color: #7AB730;}*/
        
        .siteNav table{border-collapse: collapse; border: 3px solid #7AB730; width: 1050px; height: 80px; margin: 0 auto; border: 3.5px solid #7AB730; box-sizing: border-box;}
        .homeLogo{width: 100%; height: 100%;}
        .siteNav table tr td{box-sizing: content-box;}
        .siteNav table tr td:nth-of-type(1){width: 7.5%; background-image: url(/today/img/common/homeLogo2.png); background-size: cover; text-indent: -999px;}
        .siteNav table tr td:nth-of-type(2), .siteNav table tr td:nth-of-type(3){width: 46%; text-align: center;}
        .siteNav table tr td a{text-decoration: none; color: #000; font-size: 1.3em; color: #000;}
        .siteNav table tr td.checked a{color: #7AB730;}
        /*.siteNav2 table tr td:nth-of-type(3){width: 46%;}*/


        .otherWrap{width: 1050px; margin: 0 auto; padding-left: 225px;}
        .otherP{width: 1050px; height: 140px; border-left: 5px solid #7AB730; margin: 100px 0 100px;  padding-left:55px;}
        .otherP p{font-size: 36px; color:#5CAC3D; font-family: 'Nanum Pen Script', cursive; /*letter-spacing:1px; word-spacing:2px;*/}
        .otherP p:last-of-type{font-size: 72px; font-family: 'Nanum Pen Script'; margin:20px 0; /*letter-spacing:3px; word-spacing:5px;*/ color: #000;}
        

        /* 파일업로드(사이즈, btn 제외 중복) */       
        .flex-container {display: flex;}
        .wrapper {text-align: center;flex-grow: 1;}             
        .image-box{width: 220px;height: 220px;object-fit: cover;display: block;margin: 20px auto;}
         #mdImage-box{width: 220px;height: 220px;object-fit: cover;display: block;margin: 20px auto;}
        .upload-btn {font-size: 18px; border: 1px solid #ddd; padding:10px 20px;display: inline-block; cursor: pointer; }
        .upload-btn input[type=file] {display:none}
        
        
        /* 태블릿 기준 */
@media all and (max-width:1065px) {			/* ipad가로, ipadPro가로세로, gallexyTab가로 */
	header{height:80px;}
	.header_innerBox h1{padding-top:15px;}
	.mob_menu{display: block; position: absolute; top: 20px; left: 20px; width: 45px; height: 45px; background-color: transparent; border: none; background-image:url(/today/img/common/menu.png); background-size: contain; background-repeat: no-repeat; text-indent: -9999px; cursor: pointer;}
	.mob_close{display: block; width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 20px; right: 20px; background-image: url(/today/img/common/close.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}
	.header_innerBox{width:100%;}
	.header_innerBox h1{float:none; text-align: center;}
	.header_innerBox h1 a{display:inline-block; width:200px;}
	.header_cont{display: none; float:left; width:300px; height:100%; background-color: #fff; position: fixed; top:0; left:0; z-index: 30; box-shadow: 0 0 20px 0 #e8e8e8;}
	.header_cont .submenu{display: none;}
	.header_cont .user_nav{height:70px; background-color: #7AB730; padding-top:25px; box-sizing: border-box; text-align: center;}
	.header_cont .main_nav{float: none; }
	.header_cont .main_nav li{display:block; float: none; border-bottom: 1px solid #e1e1e1; padding-left:50px;}
	.infoText{top: 37.3333%; left: 9.524%; /*z-index: 5;*/}
	.infoText p:nth-of-type(1){font-size: 6.76vw;}
    .infoText p:nth-of-type(2){font-size: 2.82vw;}
    .siteNav table{width:100%; height:auto; border: 2.5px solid #7AB730;}
    .siteNav table tr td:nth-of-type(1){position: relative; padding-bottom: 7.5%;}
    .siteNav table tr td a{font-size: 1.955vw;}
    .homeLogo{position: absolute;}
	.otherWrap{width:100%; padding-left:70px; box-sizing: border-box;}
	.otherP{width:90%;}	
	.mainContent{width:100%;}
	
	
}


/* 모바일 기준 : 800px 미만 */
@media all and (max-width:800px) {
	header{height:50px; position: relative;}
	.mob_menu{width: 25px; height: 25px; left:10px; top:50%; transform: translate(0, -50%);}
	.siteNav table{border: 1.5px solid #7AB730;}
	.header_innerBox h1{padding-top:10px;}
	.header_innerBox h1 a{width:120px;}
    .otherWrap{padding-left:7.5%;}
    .otherP{height:15%; margin:12.5% 0 12.5%; padding-left:6.5%;}
    .otherP p{font-size: 4.5vw;}
    .otherP p:last-of-type{font-size: 9vw;}
	
	.flex-container{display:block;}
    .image-box{width: 70%; height: auto; margin: 10px auto;}
    #mdImage-box{width:100%; height: 100%; ;position: absolute; top: 0; left: 0; object-fit: cover;  box-sizing: border-box; display: block; margin: 0 auto;}
    .img_wrapper{width:70%; position: relative; box-sizing: border-box; margin:20px auto;}
    .img_wrapper::after {display: block; content: ""; padding-bottom: 100%;}
    </style>
</head>
<body>
    

    <header id="header">
		<div class="header_innerBox">	
			<!-- 모바일메뉴	-->
			<button type="button" class="mob_menu">menu</button>
			
			<!-- logo -->
			<h1><a href="<c:url value='/'/>">오늘의 너</a></h1>
					
			<!-- header_cont -->
			<div class="header_cont">
				<!-- 모바일메뉴	-->
				<div class="mob_close">close</div>
				<ul class="user_nav">
				    <c:if test="${login == null}" >  <!-- 로그인 안되어있을 경우 -->
						<li><a href="javascript:;" id="login">로그인</a></li>
						<li><a href="javascript:;" id="join">회원가입</a></li>
					</c:if>
					<c:if test="${login != null}">  <!-- 로그인 되어있을 경우 -->
	           			<ul>
	           				<li><a href="<c:url value='/user/logout'/>" id="logout" onclick="return confirm('로그아웃 하시겠습니까?')">로그아웃</a></li>
	           			</ul>
		           </c:if>
				</ul>	
				
				<nav>
				<ul class="main_nav">
					<li><a href="<c:url value='/mypet/lifetime'/>" class="mainMenu mainMenu1">나의 반려견</a>

                        <div class="submenu sub_1">
                            <ul class="submenu_list">
                                <li><a href="<c:url value='/mypet/lifetime'/>">반려견 생애기록</a></li>
                                <li><a href="<c:url value='/mypet/gallery'/>">갤러리</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="<c:url value='/diary/calendar'/>" class="mainMenu mainMenu2">반려견 다이어리</a>
				        <div class="submenu sub_2">
                            <ul class="submenu_list">
                                <li><a href="<c:url value='/diary/calendar'/>">반려견 전용 캘린더</a></li>
                                <li><a href="<c:url value='/diary/list'/>">견주 일기</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="<c:url value='/community/intro'/>" class="mainMenu mainMenu3">커뮤니티</a>
                        <div class="submenu sub_3">
                            <ul class="submenu_list">
                                <li><a href="<c:url value='/community/intro'/>">반려견 소개하기</a></li>
                                <li><a href="<c:url value='/community/list'/>">커뮤니티 게시판</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="<c:url value='/mypage/profile'/>" class="mainMenu mainMenu4">마이페이지</a>
                        <div class="submenu sub_4">
                            <ul class="submenu_list">
                            	<li><a href="<c:url value='/mypage/profile'/>">프로필</a></li>
                                <li><a href="<c:url value='/mypage/modifyUser'/>">개인정보 수정</a></li>                              
                            </ul>
                        </div>
					</li>
				</ul>
                </nav>
				
			</div>
			<!-- //header_cont -->


		</div>
	</header>





    




<script type="text/javascript">

        


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
            // 서브메뉴 나타나기(header 너비가 1065보다 클 때만
            if(parseInt($("header").css("width")) > 1065){   // parseInt 해줘야 인식한다!!
                $(".sub_" + i).fadeIn("fast")
                isOver1[i - 1] = true
            }
        }).focus(function(){
            if(parseInt($("header").css("width")) > 1065){
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
    
    
    
  	//모바일 메뉴 띄움
	$('.mob_menu').click(function(){
		//$('header').addClass('on');
		$('header .header_cont').fadeIn("fast")
		$('header .mob_close').show();			
		// $("body").bind('touchmove', function(e){e.preventDefault()});   // 이제는 그냥 onclick으로 해도 된다 
	});
	$('.header_cont .mob_close').click(function(){
        $('.header_cont').fadeOut("fast");
        //$('header').removeClass('on');
        // $("body").unbind('touchmove');
	});
	
	
	$(document).ready(function(){
	    // PC브라우저에서 좁혀서 메뉴 닫고 다시 넓힐 때 상단메뉴 노출되게.
	    $(window).resize(function() {
	        if ( parseInt($('header').css('width')) > 1065 ) $('.header_cont').show();
	    }); 	    	   
	   
	});

</script>  



</body>
</html>