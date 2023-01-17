<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin: 0; padding: 0;}
footer h4{margin:10px 0;}
.addr{margin-top: 10px;}
footer{margin: 30px auto; border-top: 2px solid #222;}
.footer_inner{width: 100%; margin: 0 auto; box-sizing: border-box;}
#bottomMenu{padding-left:0; list-style: none; margin: 10px 10px 10px 0;}
#bottomMenu li{display: inline-block; margin: 10px 0; border-right: 1px solid #aaa; padding: 0 10px;}
#bottomMenu li:nth-of-type(1){padding: 0 10px 0 0;}
#bottomMenu li:last-child{border:none}
#bottomMenu li a{text-decoration: none; color: #333;}
.copy.box_inner{margin-top: 10px;}

/*
@media all and (max-width:1200px) {			
.footer_inner{width:100%;}
}*/
</style>
</head>
<body>


	  <footer>
	  	<div class="footer_inner">
         
        <ul id="bottomMenu">
            <li><a href="#">회사 소개</a> </li>
            <li><a href="#">개인정보 처리방침</a> </li>
            <li><a href="#">여행 약관</a> </li>
            <li><a href="#">사이트맵</a> </li>
        </ul>
        
            <h4>오늘의 너</h4>
            <p class="addr">서울특별시 종로구 혜화동 9길 청운빌딩 5층 <span class="gubun">/</span>        
				<span class="br_line">대표전화 <span class="space0">02-1234-5678</span> <span class="gubun">/</span>        
					<span class="br_line">E-mail : <span class="space0"> today.auth@gmail.com</span></span>
				</span>
			</p>
			<p class="copy box_inner">Copyright(c) Today_You Ali all right reserved</p>
			</div>
      </footer>



</body>
</html>