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
	.header_move p:nth-of-type(1){margin-right:30px; padding-left:28px; background-image:url(/img/common/ad_logout.png); background-size: contain; background-repeat: no-repeat; cursor:pointer;}
	.header_move p:nth-of-type(2){padding-left:22px; background-image:url(/img/common/tohome.png); background-size: contain; background-repeat: no-repeat; cursor:pointer;}
	.header_logo{font-size: 1.25em; font-family: 'Nanum Pen Script', cursive; padding-left: 15px; color: #fff; margin-right: 10px; cursor:pointer;}
</style>
</head>

 <header>
    <div class="header_inner">
        <h3><span class="header_logo">오늘의 너</span>관리자 페이지</h3> 
        <div class="header_move">
        	<p class="admin_logout">관리자 로그아웃</p>
        	<p class="to_home">홈으로 이동</p>
        </div>
    </div>
</header>


<script type="text/javascript">

	//홈으로 이동
	$(".header_logo").add(".to_home").click(function(){
		location.href="/";
	})
	
	
	// 관리자 로그아웃
	$(".admin_logout").click(function(){			
		if(confirm("관리자 계정에서 로그아웃 하시겠습니까?")){
						
    		$.ajax({
                type: 'get',
                dataType : "text",
                contentType: 'application/json',
                url: '/user/logout',
                success: function (response) {
         			if(response === 'success'){
         				alert("로그아웃 되었습니다.");
         				location.href="/";
         				//window.location.reload();
         			}else{
         				alert("로그아웃에 실패했습니다.");
         			}
                }, 
                error: function() {
                    console.log("통신 실패"); 
                } 
            });
		}
	})


</script>