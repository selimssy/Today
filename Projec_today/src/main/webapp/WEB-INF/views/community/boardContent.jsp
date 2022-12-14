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
.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/community/bg12.png); margin: 0 auto;  position: relative;}       

.contentBox{width:850px; margin: 145px auto; border: 1.5px solid #d1d1d1; padding: 25px 30px; box-sizing: border-box; }
.contentTop{width:100%; border-bottom: 1.5px solid #d1d1d1; padding-bottom: 10px; position: relative;}
.contentTop h1{line-height: 55px; margin:0;}
.contentTop p{background: url(/today/img/community/boarduser.png); background-size: contain; background-repeat: no-repeat; padding-left: 25px;}
.contentTop span{padding-left: 30px;}
.countBox{position: absolute; bottom: 25px; right: 0;}
.countBox span:nth-of-type(1){background: url(/today/img/community/view.png); background-size: contain; background-repeat: no-repeat; padding-left: 25px;}
.countBox span:nth-of-type(2){background: url(/today/img/community/reply.png); background-size: contain; background-repeat: no-repeat; padding-left: 25px; margin-left: 20px;}
.navBox{position: absolute; top: -70px; right: -35px;}
.navBox input{width:75px; height: 30px; border:none; cursor: pointer;}
.contentBody{padding-top: 20px}
/*.contentBody img{display: block; margin : auto;}*/
.boardcontent{min-height:300px; padding-bottom:15px;}
.boardcontent p{line-height:28px;}
.boardcontent img{margin: 10px 0; /*max-width:100%;*/}
.hashList{width:100%; margin: 20px auto 0;  border-top:1.5px solid #d1d1d1; padding:0 25px 15px; box-sizing: border-box; }
.hashList span{background: #F3F3F3; border-radius: 20px; padding: 5px 10px; margin-right: 15px; margin-top: 15px; display: inline-block;}
.hashList span:hover{background: #c3c3c3;}
.hashList span a{text-decoration: none; color: #000;}
.hashnull{display:none}
.comment{border-top:1.5px solid #d1d1d1;}
.comment h3{padding-top:20px}
.comment ul{list-style:none; padding-right:40px}
.comment ul li{margin-top:25px}
.comment p{font-size:0.9em}
.comment .rpyW{margin-bottom:7px; background: url(/today/img/community/cbullet.png); background-size: contain; background-repeat: no-repeat; padding-left: 25px;}
.comment #replyList span{font-size:0.9em; color:#aaa}
.comment button{width:35px; height: 20px; font-size:0.6em; padding: 2px; border-radius: 5px; border: none; cursor: pointer;}
.replyRgBox{width:750px; height: 125px; margin-top:40px; position: relative; display:block; margin-bottom: 40px}
.replyRgBox textarea{width:700px; height: 100px; position: absolute; top: 10px; right:0; resize: none; overflow-y:auto; font-family: "NanumSquare","?????? ??????", sans-serif; padding: 10px 10px 20px; box-sizing: border-box;}
.replyRgBox button{position: absolute; bottom: -30px; right:0; width:85px; height: 30px; border:none; background: #F0F0F0; cursor: pointer;}
.comment textarea{width:700px; height: 100px; resize: none; overflow-y:auto; font-family: 'NanumSquare','?????? ??????', sans-serif;}
.modifyBox{position: relative;width:700px; height:120px}
.modifyBox .mdButton{width:78px; position: absolute; top:-30px; right:0; display:block}
.replyRgBox .count {position:absolute; right:20px; bottom:20px; color:#666; font-family:"ht_r"; font-size:15px; }

/* ?????? ????????? */
.paging{width:100%; margin:0 auto; padding: 50px 0 0; text-align: center; display: flex;}
.pageBox{margin:0 auto; display: flex;}
.paging ul li{list-style: none; display: inline-block;}
.paging ul li a{text-decoration: none; color: #000;}
.pre_link{display:none; width:20px; height:20px; border:none; background: none; background-image: url(/today/img/community/prev.png); background-size: contain; background-repeat: no-repeat; text-indent: -9999px; cursor: pointer;}
.next_link{width:20px; height:20px; border:none; background: none; background-image: url(/today/img/community/next.png); background-size: contain; background-repeat: no-repeat; text-indent: -9999px; cursor: pointer;}
.page_link{padding:0 5px; margin: 0 5px;}
.page_link.active{background: #BCDB97; color: #fff; border-radius: 50%;}
</style>
</head>
<body>

<div class="container">   
	<jsp:include page="../common/header.jsp" />
	<main>
		<div class="siteInfo">
	        <div class="infoText" style="top: 110px;">
	            <p>???????????? ?????????</p>
	            <p>?????? ???, ?????? ?????? ??????</p>
	        </div>
	    </div>
	    <div class="siteNav">
	        <a href="#"><div class="homeLogo">1</div></a>
	        <ul>
	            <li><a href="<c:url value='/community/intro'/>">????????? ????????????</a></li>
	            <li class="checked"><a href="<c:url value='/community/list'/>">???????????? ?????????</a></li>
	        </ul>
	    </div>
		<div class="otherWrap" style="width: 1150px; padding-left:310px">
	        <div class="otherP">
	            <P>????????? ??????, ????????? ??????</P>
	            <p>'???'????????? ????????? ????????? ??????</p>
	    	</div>
	    </div>	
	
	
	
		<div class="contentBox">
			<div class="contentTop">
				<h1>${article.title}</h1>
				<p>${article.nickname}<span><fmt:formatDate value="${article.regDate}" pattern="yyyy.MM.dd"/></span></p>
				
				<div class="countBox">
					<span>????????? <b>${article.viewCnt}</b></span>
					<span>?????? <b class="replyCnt">${article.replyCnt}</b></span>
				</div>
				
				<!-- ????????? ??????, ??????, ?????? -->
				<div class="navBox">
					<form id="formObj"  role="form" action="<c:url value='/community/delete'/>" method="post">  
					
						<input type="hidden" name="boardNo" value="${article.boardNo}">
						<input type="hidden" name="page" value="${p.page}">
						<input type="hidden" name="countPerPage" value="${p.countPerPage}">
						        										
						<c:if test="${login.userId == article.writer}">				   
							<input id="modBtn" type="button" value="??????">&nbsp;&nbsp;				
							<input type="submit" value="??????" onclick="return confirm('???????????? ?????????????????????????')">&nbsp;&nbsp;					
						</c:if>
						<input type="button" value="??????" class="btn"  id="list-btn">&nbsp;&nbsp;
					</form>	
				</div>				
			</div>
			
			<div class="contentBody">
				<div class="boardcontent">
					${article.content}
				</div>
			
				
				<c:if test="${hashtagList.size() <= 0}">
					<div class="hashnull">1</div>
				</c:if>
				<c:if test="${hashtagList.size() > 0}">
					<div class="hashList">
						<c:forEach var="hashtag" items="${hashtagList}">						
								<span>#<a href="<c:url value='/community/list?keyword=${hashtag}&condition=hashtag'/>">${hashtag}</a></span>					
						</c:forEach>
					</div>
				</c:if>						
			</div>
			  
			 
			
			<!-- ???????????? -->
			<div class="comment">
				<h3>??????[<span class="replyCnt">${article.replyCnt}</span>]</h3>
				<ul id="replyList">
					<c:if test="${replyList.size() > 0}">
						<c:forEach var="reply" items="${replyList}">
							<li>							
								<p class="rpyW"><b>${reply.nickname}</b> &nbsp; &nbsp; &nbsp; &nbsp;
								    <span><fmt:formatDate value="${reply.replyDate}" pattern="yyyy.MM.dd. HH:mm" /></span>
								    <c:if test="${login.userId == reply.replyer}">
								    	&nbsp;<button href="${reply.replyNo}" type="button" class="replyModify">??????</button>&nbsp;<button href="${reply.replyNo}" type="button" class="replyDelete">??????</button>
									</c:if>
								</p>
								<div id="reply${reply.replyNo}" class="rpyContentBox">
									<p>${reply.content}</p>
								</div>
							</li>
						</c:forEach>
					</c:if>	
				</ul>
			</div>
			
			
			<!-- ?????? ????????? ?????? 
			<div class="comment">
				
			</div>		-->	
			
			
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
			
			
			
			
			<!-- ?????? ?????? ??? -->
			<div class="replyRgBox">	
				<c:if test="${login == null}" >  <!-- ????????? ??????????????? ?????? -->
					<textarea readonly="readonly" placeholder="????????? ??? ?????? ???????????????."></textarea>
				</c:if>		
				<c:if test="${login != null}">  <!-- ????????? ???????????? ?????? -->
					<input type="hidden" name="boardNo" value="${article.boardNo}">						
					<textarea name="content" id="replyContent" placeholder="????????? ??????????????????."></textarea>
					<div class="count"><span>0</span>/500</div>
					<button type="button" id="replyBtn">?????? ??????</button>	
				</c:if>					
			</div>		
				
		</div>
		
	
	</main>
</div>		
		
	
		
		

		
		
		
	
	
	<script type="text/javascript">
	
		$(function(){
			 $(".mainMenu.mainMenu3").addClass("checked");
			 
			 pageNum(); // ????????? ?????? ??????
		})
		
		
		// ?????????
		let msg = "${msg}"
		if(msg === "modSuccess"){
			alert("???????????? ?????????????????????.")
		}
		
		
		
		// ????????? ?????? max ????????? ??????
		let imgElements = document.getElementsByTagName('img');
		for(let i=0; i<imgElements.length; i++){

			let img = imgElements[i];
			let path = img.src;

		    if(img.width > 787){
		    	img.alt = "maxWidth";
		    	let width = img.width;
		    	let height = img.height;
		    	let ratio = height / width;
		    	let modifyHgt = 787 * ratio;
		    	img.style="width:787px; height:" + modifyHgt + "px";
		    }
		}
		
		
		
		
		
		// ???????????? ??????????????? ??????
		$("#list-btn").click(function(){
			console.log("???????????? ??????");
			location.href='/today/community/list?page=${p.page}&keyword=${p.keyword}&condition=${p.condition}';
		})
		
		
		
		// ?????? ?????? ??????
		let forElement = $("#formObj");; 

		$("#modBtn").click(function(){
			console.log("??????????????? ?????????!");
			forElement.attr("action", "/today/community/modify");
			forElement.attr("method", "get");
			forElement.submit();
		})
	
		
		
		// ?????? ?????????
		$('.replyRgBox textarea').keyup(function(){
	        var content = $(this).val();
	        $('.replyRgBox .count span').html(content.length);
	        if (content.length > 500){
	           alert("?????? 500????????? ?????? ???????????????.");
	           $(this).val(content.substring(0, 500));
	           $('.replyRgBox .count span').html(500);
	        }
	    });
		
		
		
	
		// Ajax?????? ???????????? 
		$("#replyBtn").click(function(){
					
			let boardNo = ${article.boardNo};			
			let replyContent = $("#replyContent").val();
			let replyer = "${login.userId}";
			
			let replyVO = {
				boardNo: boardNo,
				content: replyContent,
				replyer: replyer
			};
			
				
			$.ajax({
				type: "POST", 
				url: "/today/community/reply", 
				headers: {
					"Content-Type": "application/json"
				}, 
				dataType: "text", 
				data: JSON.stringify(replyVO), 
				success: function(result){
					console.log("?????? ??????!");				
					//window.location.reload();
					let replyCnt = result; // ??? ?????? ???
					$(".replyCnt").html(replyCnt); // ?????? ??? ????????????					
					let page = Math.ceil(replyCnt / 10);
					paging(page);
					$(".pageNumBox").empty(); //????????? ?????????
					for(let i=Math.floor(page/10)*10 +1; i<=page; i++){	
		    			$(".pageNumBox").append('<li><a href="javascript:;" class="page_link">' + i + '</a></li>');	            			
		   		    }
					let pageNum = (page%10)-1; //eq ??????
		   			$(".page_link:eq(" + pageNum + ")").addClass("active"); // ?????? ????????? ??????
		   			$(".count span").html(0); //?????? ????????? ?????????
		   			
				}, 
				error: function() {
					console.log("?????? ??????!");
				} 
			});
			
			$("#replyContent").val("");
		})
		
		
		
		
		// ?????? ?????? ???????????? ??????		
		$(document).on("click", ".replyModify", function () {
			
			//?????????
            $(".rpyContentBox p").css("display","block");
            $(".rpyW button").css( 'display', 'inline-block' );
            $(".modifyBox").remove();
			
            $(this).css("display","none");
            $(this).next().css("display","none");
            
            let replyNo = $(this).attr("href");
            console.log(replyNo);
            
    		let reply = {
    				replyNo: replyNo
                    };
    		
    		$.ajax({
                type: 'post',
                dataType : "json",
                contentType: 'application/json',
                url: '/today/community/modifReplyGet',
                data: JSON.stringify(reply),
                success: function (response) {
                	console.log(response); // replyVO 
                   		
                    	let replyContent = response['content'];
                		let replyNo = response['replyNo'];
                    	console.log(replyContent);
                        let temp_html = "<div class='modifyBox'><div class='mdButton'><button href='" + replyNo + "' type='button' class='rpyMBtn'>??????</button>&nbsp;<button href='" + replyNo + "' type='button' class='rpyMCancel'>??????</button></div><textarea id='mdcont'>" + replyContent + "</textarea></div>";
						
                        $('#reply' + replyNo + ' p').css("display", "none");
                        $('#reply' + replyNo).append(temp_html);
                    
                }, 
                error: function() {
                    console.log("?????? ??????!");
                } 
            });
        })
		
		
		
        
        //?????? ?????? ??????  
        $(document).on("click", ".rpyMCancel", function () {
        	$(this).parent().parent().prev().css( 'display', 'block' );
        	$(this).parent().parent().prev().parent().prev().children('button').css( 'display', 'inline-block' );
        	$(this).parent().parent().remove();
        })
        
        
        
        
        // ?????? ?????? 
        $(document).on("click", ".rpyMBtn", function () {
			
			let replyContent = $("#mdcont").val();
			console.log("????????????: " + replyContent);

			let replyNo = $(this).attr("href");
			console.log("????????????: " + replyNo);
			
			let replyVO = {
				content: replyContent,
				replyNo: replyNo
			};  
						
			$.ajax({
				type: "POST", 
				url: "/today/community/modifyReply", 
				headers: {
					"Content-Type": "application/json"
				}, 
				dataType: "text", 
				data: JSON.stringify(replyVO), 
				success: function(result){
					if(result === "modifySuccess"){
						console.log("?????? ??????!")				
						window.location.reload();
					}else{
						console.log("?????? ??????");
					}													
				}, 
				error: function() {
					console.log("?????? ??????!");
				} 
			});
			
        })
        
       
        
        
				
		// ?????? ??????
		$(document).on("click", ".replyDelete", function () {
			if(confirm("????????? ?????????????????????????")){
				let boardNo = ${article.boardNo};
				let replyNo = $(this).attr("href");
				let replyVO = {
						boardNo: boardNo,
						replyNo: replyNo
					};
				
				$.ajax({
					type: "POST", 
					url: "/today/community/deleteReply", 
					headers: {
						"Content-Type": "application/json"
					}, 
					dataType: "text", 
					data: JSON.stringify(replyVO), 
					success: function(result){
		
						console.log("?????? ??????!");
						//$(".replyModify[href=" + replyNo + "]").prev().prev().parent().parent().remove();
						//$(this).prev().prev().css("border", "3px solid red");
						//$(this).prev().prev().prev().parent().parent().remove();
						//alert("????????? ?????????????????????.");
						let replyCnt = result; // ??? ?????? ???
						$(".replyCnt").html(replyCnt); // ?????? ??? ????????????					
						let page = Math.ceil(replyCnt / 10);
						paging(page);
						$(".pageNumBox").empty(); //????????? ?????????
						for(let i=Math.floor(page/10)*10 +1; i<=page; i++){	
			    			$(".pageNumBox").append('<li><a href="javascript:;" class="page_link">' + i + '</a></li>');	            			
			   		    }
						let pageNum = (page%10)-1; //eq ??????
			   			$(".page_link:eq(" + pageNum + ")").addClass("active"); // ?????? ????????? ??????
				   																					
					}, 
					error: function() {
						console.log("?????? ??????!");
					} 
				});
			}		
			
        })
		
		
        
        
        // ?????? ????????? ?????? ???????????? ??????
	    function paging(page){
			let boardNo  = ${article.boardNo};
			
			$('#replyList').empty(); // ?????????
			let data = {
					page: page,
					boardNo: boardNo
					};
	   		
	   		$.ajax({
	               type: 'post',
	               dataType : "json",
	               contentType: 'application/json',
	               url: '/today/community/getReplyList',
	               data: JSON.stringify(data),
	               success: function (response) {
	                    console.log(response); // ????????? 
	               	   
	                    for(let i = 0; i < response.length; i++){
	                    	
	                    	let userId = "${login.userId}";
	                    	let replyer = response[i]["replyer"];
	                    	let replyDate = response[i]["replyDate"];
	                    	let replyNo = response[i]["replyNo"];
	                    	let content = response[i]["content"];
	                    	
	                    	let html ='<li>';
                            html += '<p class="rpyW"><b>' + replyer + '</b> &nbsp; &nbsp; &nbsp; &nbsp;';
                            html += '<span>' + replyDate +  '</span>';
                            if(userId === replyer){
                                html += '&nbsp;<button href="' + replyNo + '" type="button" class="replyModify">??????</button>&nbsp;<button href="' + replyNo + '" type="button" class="replyDelete">??????</button>'  ;             
                            }
                            html += '</p>';
                            html += '<div id="reply' + replyNo + '" class="rpyContentBox">';
                            html += '<p>' + content + '</p>';
                            html += '</div>';
                            html += '</li>';
	                   		
	                        $('#replyList').append(html);
	                    }    
	               	   	   	                 
	               }, 
	               error: function() {
	                   console.log("?????? ??????!");
	               } 
	           });
		}
        
		
		
		// ????????? ?????? ??????
	    function pageNum(){
	    	 $(".pageNumBox").empty(); //?????????
			 if(${article.replyCnt} <= 100){
				 if(${article.replyCnt} % 10 != 0){ // 10?????? ??????????????? ?????? ??????(?????????+1)
	        			for(let i=1; i<=parseInt(${article.replyCnt}/10)+1; i++){	
	            			$(".pageNumBox").append('<li><a href="javascript:;" class="page_link">' + i + '</a></li>');
	            		}
	        		}else{
	        			for(let i=1; i<=parseInt(${article.replyCnt}/10); i++){ // ???????????? ??????
	            			$(".pageNumBox").append('<li><a href="javascript:;" class="page_link">' + i + '</a></li>');
	            		}
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
			 paging(page);   	
	    })
		
    
    
	     // ??????????????? ?????? ??????
	     $(document).on("click", ".next_link", function () {
	       	$(".pre_link").css("display", "inline-block"); // ???????????? ?????????      	
	       	
	       	let lastPage = parseInt($(".page_link:eq(9)").text()); // ?????? ????????? ?????????  	
	       	let re_count = ${article.replyCnt} -(10*lastPage); // ?????? ????????? ?????? ???
	       	console.log(re_count);
	       	$(".pageNumBox").empty(); //?????????
	       	
	       	if(re_count <= 100){ // ???????????? ??????
	       		if(re_count % 10 != 0){ // 10?????? ??????????????? ?????? ??????(?????????+1)
	       			for(let i=lastPage+1; i<=lastPage+parseInt(re_count/10)+1; i++){	
	           			$(".pageNumBox").append('<li><a href="javascript:;" class="page_link">' + i + '</a></li>');
	           		}
	       		}else{
	       			for(let i=lastPage+1; i<=lastPage+parseInt(re_count/10); i++){ // ???????????? ??????
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
	        paging(lastPage + 1);       	
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
	     	
	     	
		    paging(firstPage - 1); 	     	
	     })
	    
	
	</script>
		
		
	
	
</body>
</html>