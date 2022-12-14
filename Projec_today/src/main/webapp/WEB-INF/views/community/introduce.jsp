<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
	.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/community/bg12.png);  background-size: contain; margin: 0 auto;  position: relative;}       
	.container{width: 1000px; margin: 0 auto; position: relative;}
    .Myintro{width: 700px; height: 380px; border: 1px solid #7AB730; margin: 100px auto; position: relative;}
    .Myintro h2{background: rgba(122, 183, 48, 0.5); margin: 0; padding: 10px; text-align: center;}  
    .Mycontent{width:100%; display: flex; justify-content:space-between; padding:20px; position: relative; box-sizing: border-box;}
    .MyPetPhoto{width:43%; margin: 0 20px; box-sizing: border-box; position: relative; background-image:url(/today/img/community/ring2.png); background-size: contain; background-repeat: no-repeat; }
    .MyPetPhoto::after {display: block; content: ""; padding-bottom: 100%;}
    .ring{width:100%; height:100%; }
    .Myintro .MyPetPhoto img{width:100%; height: 100%; position: absolute; top: 0; left: 0; object-fit: cover; border-radius: 50%; padding:20px; box-sizing: border-box; display: block;} 
    .Mycontent .MyPetinfo{padding-left: 15px; width:52%; box-sizing: border-box;}
    .Mycontent .MyPetinfo li{font-size: 19px; line-height: 40px;}
    .MyPetinfo li:last-of-type{padding-top: 5px;}
    .Mycontent .MyPetinfo li a{text-decoration: none; color: transparent;}
    .Mycontent .MyPetinfo li:first-of-type{font-size: 1.6em; line-height: 70px;}
    .Mycontent .MyPetinfo li a{padding: 15px; background-origin:content-box}
    .Mycontent .MyPetinfo li a:nth-of-type(1){background-image:url(/today/img/community/instagram.png); background-size: cover; background-repeat: no-repeat;}
    .Mycontent .MyPetinfo li a:nth-of-type(2){background-image:url(/today/img/community/youtube.png); background-size: cover; background-repeat: no-repeat;}
	.MyPetinfo ul li{overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
	.nameTitle{font-size: 21px; font-weight: bold;}
	.infoTitle{font-size: 16px; font-weight: bold;}
	.modifyIcon{width: 25px; height: 25px; text-indent: -9999px; position: absolute; top: 15px; right: 15px; background-image: url(/today/img/community/modify.png); background-size: contain; background-repeat: no-repeat; cursor: pointer;}
	#petMf_modal{display:none}
	
    .search{width: 1000px; margin:0 auto; text-align: right; padding-right: 110px;}	
	.select_con{display: inline-block; height: 30px; border:1px solid #aaa; box-sizing: border-box;}
	.keyword{display: inline-block;}
	.keyword input[type=text]{width:200px; height: 30px; border:1px solid #aaa; box-sizing: border-box;}
	.keyword input[type=button]{width:45px; height: 30px; border:none; background: #ddd; cursor: pointer;}
    .PCards{width:1000px; height:1250px; margin:0 auto; padding: 20px;  /*display: flex; justify-content: space-between;*/  box-sizing: border-box;}
    .PCards .cardWrap{width: 33%; float: left; padding: 20px; box-sizing: border-box;}
     .PCards .cardWrap .OPcard{width: 100%;  box-sizing: border-box; border: 5px solid #BCDB97; border-radius: 20px; }
    .PCards .cardWrap .OPcard .cardTop{height:55px; background: rgba(188, 219, 151, 0.5); display: flex; justify-content: space-between; box-sizing: border-box; position: relative;}
    .PCards .cardTop h3{margin: 0; line-height: 55px; width: 45%; text-align: center; font-size: 1.5em; overflow: hidden; text-overflow : ellipsis; white-space: nowrap; position: absolute; left: 70px;}
     .PCards .cardTop .cBullet{width: 20%; height: 40px; background-image: url(/today/img/community/cbullet.png); background-size: contain; background-repeat: no-repeat; margin-left: 10px; margin-top: 5px;}
    .cLink{list-style: none; padding-left: 0; position: absolute; top:20px; right:10px}
    .cLink li{display: inline-block; margin: 0 5px;}
    .cLink li a{text-decoration: none; color: transparent;}
     .cLink li:nth-of-type(1){padding: 0 5px; background-image:url(/today/img/community/instagram.png); background-size: contain; background-repeat: no-repeat;}
    .cLink li:nth-of-type(2){padding: 0 5px; background-image:url(/today/img/community/youtube.png); background-size: contain; background-repeat: no-repeat;}
    .PCards .cardBody a{text-decoration: none; color: #000;}
    .PCards .cardBody img{width: 100%; height: 160px; object-fit: cover;  box-sizing: border-box;}
    .PCards .cardBody ul{padding-left: 0; margin:5px 0 10px 30px; list-style: none;}
    .cardTitle{font-size: 16px; font-weight: bold;}
    .PCards .cardBody ul li{font-size: 19px; padding: 3px; overflow: hidden; text-overflow : ellipsis; white-space: nowrap;}
    .PCards .cardBody ul li::before{content: "??? "; font-size: 25px;}
   
    /* ????????? */
    .paging{width:1000px; margin:0 auto; padding: 50px 0 0; text-align: center; display: flex;}
    .pageBox{margin:0 auto; display: flex;}
	.paging ul li{list-style: none; display: inline-block;}
	.paging ul li a{text-decoration: none; color: #000;}
	.pre_link{display:none; width:20px; height:20px; border:none; background: none; background-image: url(/today/img/community/prev.png); background-size: contain; background-repeat: no-repeat; text-indent: -9999px; cursor: pointer;}
	.next_link{width:20px; height:20px; border:none; background: none; background-image: url(/today/img/community/next.png); background-size: contain; background-repeat: no-repeat; text-indent: -9999px; cursor: pointer;}
	.page_link{padding:0 5px; margin: 0 5px;}
	.page_link.active{background: #BCDB97; color: #fff; border-radius: 50%;}
	
	.noneMsgBox{width:35%; position: relative; margin: 100px auto 120px;}
	.noneMsg{width:100%;font-family: 'Nanum Pen Script'; text-align: center; font-size: 40px; margin: 50px 0 30px; position: absolute; top: 70px;}
	.noneMsgBox img{width:100%; display: block; margin: auto; opacity: 0.85; box-shadow: 0 0 25px 0 #e8e8e8; border-radius: 15px;}

	/*?????????*/
@media all and (max-width:1065px) {			
	.siteInfo{width:100%; height:auto; position: relative;}
	.siteInfo:before {content: ""; display: block; padding-top: 35.7143%; /* ?????? ?????? ??????*/}
	.ratio_content {position: absolute; top: 0; right: 0; bottom: 0; left: 0;}		
	.Myintro{margin:9.39vw auto;}
	.PCards{width:100%; height:117.37vw; padding:1.8vw;}
	.PCards .cardWrap{padding:1.8vw;}
	.search{width:100%; padding-right:3.6vw; box-sizing: border-box;}
	.paging{width:100%;}
}

@media all and (max-width:900px) {			
	.Myintro{width:80%; height:42.22vw;}
	.MyPetPhoto{margin:0 2.222vw;}
	.Myintro h2{font-size:2.5vw; padding:1.111vw;}
	.Mycontent{padding:2.222vw;}	
	.Mycontent .MyPetinfo li:first-of-type{font-size: 2.5vw; line-height: 7.778vw;}
	.nameTitle{font-size:2.333vw;}
	.Mycontent .MyPetinfo li{font-size:2.111vw; line-height:4.445vw;}
	.infoTitle{font-size:1.778vw;}
	.Myintro .MyPetPhoto img{padding:2.222vw;}
	.modifyIcon{width:20px; height:20px; top:10px; right:10px;}
}
</style>
</head>
<body>
<div class="container">   
	<jsp:include page="../common/header.jsp" />
	<main>
		<div class="siteInfo">
	        <div class="infoText">
	            <p>????????? ????????????</p>
	            <p>????????? ??????????????? ?????? ?????? ???????????????!</p>
	        </div>
	    </div>
	    <div class="siteNav">   
	        <table>
		        <tr>
		            <td><a href="<c:url value='/'/>"><div class="homeLogo">home</div></a></td>
		            <td class="checked"><a href="<c:url value='/community/intro'/>">????????? ????????????</a></td>
		            <td><a href="<c:url value='/community/list'/>">???????????? ?????????</a></td>
		        </tr>
		    </table>
	    </div>
	     
	    <!-- ????????? ??? ??? ?????? -->
	    <c:if test="${msg eq 'notLogin'}"> 
	    		<div class="noneMsgBox">		        	
		        	<img alt="noticeImg" src="<c:url value='/img/community/intro2.png'/>">
		        	<p class="noneMsg">????????? ??? ???????????? ????????? ?????????!</p>
	        	</div>
	    </c:if>
	    <!-- ????????? ?????? ??? ??? ?????? -->
	    <c:if test="${msg eq 'petNone'}"> 
	    	<div class="noneMsgBox">		        	
	        	<img alt="noticeImg" src="<c:url value='/img/community/intro2.png'/>">
	        	<p class="noneMsg">???????????? ???????????? ?????? ????????? ????????? ?????????!</p>
	        	<button type="button" id="petList-open" title="???????????? ??????" class="changePet"></button>
        	</div>
        </c:if>
	    
    
	    <div class="Myintro">
	        <h2>??? ????????? ?????????</h2>
	        <div class="Mycontent">
	            <div class="MyPetPhoto">	            	
		            <img src="<c:url value='${pet.imagePath}'/>">
		        </div>
	            <div class="MyPetinfo">
	                <ul>
	                    <li><span class="nameTitle">??????:</span> ${pet.petName}</li>
	                    <li><span class="infoTitle">??????:</span> ${pet.petSpecies}</li>
	                    <li><span class="infoTitle">??????:</span> ${pet.age}??? (${pet.gender})</li>
	                    <li><span class="infoTitle">??????:</span> ${pet.feature}</li>
	                    <li><span class="infoTitle">?????? ??????:</span> <c:if test="${pet.open == 1}">
	                    				<label>??????</label> <input type="radio" checked onclick="return(false);">
                                		<label>?????????</label> <input type="radio" onclick="return(false);">
									</c:if>
									<c:if test="${pet.open == 0}">
	                    				<label>??????</label> <input type="radio" onclick="return(false);">
                                		<label>?????????</label> <input type="radio" checked onclick="return(false);">
									</c:if>
	                    </li>
	                    <li>
	                    	<c:if test="${empty pet.instagram}">
							</c:if>
							<c:if test="${not empty pet.instagram}">
								<a href="${pet.instagram}" target="_blank"><span>1</span></a>
							</c:if>
							<c:if test="${empty pet.youtube}">
							</c:if>
							<c:if test="${not empty pet.youtube}">
								<a href="${pet.youtube}" target="_blank"><span>1</span></a>
							</c:if>                    	
	                    </li>
	                </ul>
	            </div>
	            <div class="modifyPetBtn" href="${pet.petId}"><span class="modifyIcon">modify</span></div>
	        </div>     
	        <button type="button" id="petList-open" title="???????????? ??????" class="changePet"></button>
	    </div>
	    
	    
	    
		<div class="otherWrap">
	        <div class="otherP">
	            <P>?????? ?????? ?????? ???????????????~</P>
	            <p>?????? ???????????? ?????? ????????????</p>
	    	</div>
	    </div>	
	    
	    
	    
	    <!-- ?????? ?????? -->
		<div class="search">	           
               <select class="select_con" id="condition" name="condition">                            	
                   <option value="petName">????????? ??????</option>
                   <option value="petSpecies">??????</option>
                   <option value="feature">??????</option>
               </select>	            	            
               <div class="keyword">
                   <input type="text" id="keywordInput" placeholder="?????????">
                   <span>
                       <input type="button" value="??????" id="searchBtn">                                       
                   </span>
               </div>	            	            
		</div>
	    
	    
	    
	    <!-- ???????????? ????????? ????????? ?????? -->	
		<div class="PCards">
			
		</div>		
		
		
		<!-- ????????? ?????? -->
		
		
		
		<div class="paging">
			<div class="pageBox">
				<!-- ?????? ?????? -->
				<button type="button" class="pre_link">??????</button>
				<ul class="pageNumBox">				
					<!-- ????????? ?????? -->
				</ul>
				<!-- ?????? ?????? -->
				<button type="button" class="next_link">??????</button>	
			</div>
		</div>
		<!-- ????????? ?????? ??? -->
	    
	    
	</main>
</div>
	
	
<jsp:include page="../common/pet_modal.jsp" />			
<jsp:include page="../common/footer.jsp" /> 
</body>	
	
	
	<script type="text/javascript">
	
		 let countPet = 0;
		 let condition = "petName";
		 let keyword = "";
	
		$(function(){
			 
			 
			 $(".mainMenu.mainMenu3").addClass("checked");
			 
			 // ????????? ???????????? ??????
			 paging(1, condition, keyword);
			 //paging(1, "petName", "");
			 
			 countPetList(condition, keyword);
			 pageNum(countPet)
		})	 
			 
		
	
		
		// ?????????, ???????????? ?????? ????????? ?????? ?????????
		let noAccess = "${noAccess}"
		if(noAccess === "closed"){
			alert("????????? ??????????????????.");
		}else if(noAccess === "null"){
			alert("?????????????????? ???????????? ?????? ??????????????????.");
		}
		
	
		// ?????????, ????????? ?????? ????????? ?????? ?????? ?????????
		if("${msg}" === 'notLogin'){ // ????????? ?????? ??????
			$("#petList-open").add($(".Myintro")).css("display", "none");
	    }
		if("${msg}" === 'petNone'){ // ????????? ?????? ?????? ??????
			$(".Myintro").css("display", "none");
	    }
		
		
	
		// ???????????? ?????? hover ?????????
		$(document).on({
                mouseenter: function () {
                    $(this).parent().css("border", "5px solid #7AB730");
                },
                mouseleave: function () {
                    $(this).parent().css("border", "5px solid #BCDB97");
                }
        }, '.cardBody');
        

	    
	    // ?????? ??????
	    $("#searchBtn").click(function(){
	    	condition = $("#condition option:selected").val(); // ?????? ??????
			keyword = $("#keywordInput").val().trim();	// ?????????		
			
			paging(1, condition, keyword); // ????????? ?????????
			countPetList(condition, keyword); // ????????? ??? ??????
			pageNum(countPet); // ????????? ??????
	    })
	    
	    
	    
	    // ????????? ?????? ????????? ???????????? ?????? 
	    function paging(page, condition, keyword){
			
			$('.PCards').empty(); // ?????????
			let data = {
					page: page,
					condition: condition,
					keyword: keyword
					};
	   		
	   		$.ajax({
	               type: 'post',
	               dataType : "json",
	               contentType: 'application/json',
	               url: '/today/community/openPetList',
	               data: JSON.stringify(data),
	               success: function (response) {
	                    console.log(response); // ????????? 
	               	   
	                    for(let i = 0; i < response.length; i++){
	                    	
	                    	let petId = response[i]["petId"];
	                    	let petName = response[i]["petName"];
	                    	let petSpecies = response[i]["petSpecies"];
	                    	let age = response[i]["age"];
	                    	let gender = response[i]["gender"];
	                    	let feature = response[i]["feature"];
	                    	let imagePath = "/today" + response[i]['imagePath'];
	                    	let instagram = response[i]["instagram"];
	                    	let youtube = response[i]["youtube"];

	                        let html ='<div class="cardWrap">'
	                        html += '<div class="OPcard">'
	                        html += '<div class="cardTop">'
	                        html += '<div class="cBullet"></div><h3>'
	                        html += petName
	                        html += '</h3>'
	                        html += '<ul class="cLink">'
	                        if(response[i]['instagram']){
	                            html += '<li><a href="' + instagram + '" target="_blank">1</a></li>'
	                        }
	                        if(response[i]['youtube']){
	                            html += '<li><a href="' + youtube + '" target="_blank">1</a></li>'
	                        }
	                        html += '</ul></div>'
	                        html += '<div class="cardBody">'
	                        html += '<a href="/today/community/otherPet/' + petId + '">'
	                        html += '<img src="' + imagePath + '">'
	                        html += '<ul>'
	                        html += '<li><span class="cardTitle">??????: </span>' + petSpecies + '</li>'
	                        html += '<li><span class="cardTitle">??????: </span>' + age + '??? (' + gender + ')</li>'
	                        html += '<li><span class="cardTitle">??????: </span>' + feature + '</li> '
	                        html += '</ul></a>'
	                        html += '</div></div></div>'
	                   		
	                        $('.PCards').append(html);
	                    }    
	               	   	   	                 
	               }, 
	               error: function() {
	                   console.log("?????? ??????!");
	               } 
	           });
		}
	    
	    
	    
	    // ????????? ??? ?????? ??????
	    function countPetList(cond, keyw){
	    	
	    	let data = {
					condition: cond,
					keyword: keyw
					};
	    	
	    	$.ajax({
	               type: 'post',
	               dataType : "json",
	               async:false, // ?????????????????? ??????????????? ??????
	               contentType: 'application/json',
	               url: '/today/community/countPet',
	               data: JSON.stringify(data),
	               success: function (response) {
	                    console.log(response); // ????????? 
	                    countPet = response["countPet"];	 
	               }, 
	               error: function() {
	                   console.log("?????? ??????");
	               } 
	           });
	    }
	    
	    
	    
	    // ????????? ?????? ??????
	    function pageNum(countPet){
	    	 $(".pageNumBox").empty(); //?????????
			 if(countPet <= 90){
				 for(let i=1; i<=parseInt(countPet/9)+1; i++){
					 $(".pageNumBox").append('<li><a href="javascript:;" class="page_link">' + i + '</a></li>');
				 }
				 $(".next_link").css("display", "none");
			 }else{
				 for(let i=1; i<=10; i++){
					 $(".pageNumBox").append('<li><a href="javascript:;" class="page_link">' + i + '</a></li>');
				 }
			 }
			 $(".page_link:eq(0)").addClass("active");
	    }
	    
	    
		
	    // ????????? ?????? ?????? ?????????
	    $(document).on("click", ".page_link", function () {	
			//?????????
			$('.page_link').removeClass("active");
			$(this).addClass("active");
			
			let page = $(this).text();	
			if(!keyword || keyword.replace(/\s| /gi, "").length==0){ // null???????????? ????????? ??????
				paging(page, "petName", ""); 
			}else{ // ????????? ?????? ??????
				paging(page, condition, keyword); 
			}
	    	
        })
        
        
        
        // ??????????????? ?????? ??????
        $(document).on("click", ".next_link", function () {
        	$(".pre_link").css("display", "inline-block"); // ???????????? ?????????      	
        	
        	let lastPage = parseInt($(".page_link:eq(9)").text()); // ?????? ????????? ?????????  	
        	let re_count = countPet -(9*lastPage); // ?????? ????????? ?????? ???
        	console.log(re_count);
        	$(".pageNumBox").empty(); //?????????
        	
        	if(re_count <= 90){ // ???????????? ??????
        		if(re_count % 9 != 0){ // 9??? ??????????????? ?????? ??????(?????????+1)
        			for(let i=lastPage+1; i<=lastPage+parseInt(re_count/9)+1; i++){	
            			$(".pageNumBox").append('<li><a href="javascript:;" class="page_link">' + i + '</a></li>');
            		}
        		}else{
        			for(let i=lastPage+1; i<=lastPage+parseInt(re_count/9); i++){ // ???????????? ??????
            			$(".pageNumBox").append('<li><a href="javascript:;" class="page_link">' + i + '</a></li>');
            		}
        		}
        		
        		$(".next_link").css("display", "none"); // ???????????? ????????????;
        	}else{
        		for(let i=lastPage+1; i<=lastPage+10; i++){
        			$(".pageNumBox").append('<li><a href="javascript:;" class="page_link">' + i + '</a></li>');
        		}
        	}
        	
        	$(".page_link:eq(0)").addClass("active");
        		
			if(!keyword || keyword.replace(/\s| /gi, "").length==0){ // null???????????? ????????? ??????
				paging(lastPage + 1, "petName", ""); 
			}else{ // ????????? ?????? ??????
				paging(lastPage + 1, condition, keyword); 
			}
        	
        })
        
        
        // ??????????????? ?????? ??????
        $(document).on("click", ".pre_link", function () {
        	$(".next_link").css("display", "inline-block"); // ???????????? ?????????      	
        	
        	let firstPage = parseInt($(".page_link:eq(0)").text()); // ?????? ??? ?????? ?????????  	
        	console.log(firstPage);
        	$(".pageNumBox").empty(); //?????????
        	
        	for(let i=firstPage-10; i<=firstPage-1; i++){	
    			$(".pageNumBox").append('<li><a href="javascript:;" class="page_link">' + i + '</a></li>');
    		}
        	
        	// ????????? ??????
        	if(firstPage-10 == 1){
        		$(".pre_link").css("display", "none");
        	}else{
        		$(".pre_link").css("display", "inline-block");
        	}
        	
        	$(".page_link:eq(9)").addClass("active"); // ??????????????? ??????
        	
        	// ????????? ??????
        	if(!keyword || keyword.replace(/\s| /gi, "").length==0){ // null???????????? ????????? ??????
				paging(firstPage - 1, "petName", ""); 
			}else{ // ????????? ?????? ??????
				paging(firstPage - 1, condition, keyword); 
			}
        	
        })
        
	
	</script>
	
	
	

</html>