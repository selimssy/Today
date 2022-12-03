<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>          
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%!String monthEng[] = {"January", "February", "March", "April", "May" ,"June" ,"july", "august", "september", "october" ,"november", "december"};%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>캘린더</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Dongle&family=Jua&family=Maven+Pro:wght@500&family=Nanum+Pen+Script&family=Nunito&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<style TYPE="text/css">
	.siteInfo{width: 1050px; height: 375px; background-image: url(/today/img/diary/mainbg6.png); margin: 0 auto;  position: relative;}       
		body {
		scrollbar-face-color: #F6F6F6;
		scrollbar-highlight-color: #bbbbbb;
		scrollbar-3dlight-color: #FFFFFF;
		scrollbar-shadow-color: #bbbbbb;
		scrollbar-darkshadow-color: #FFFFFF;
		scrollbar-track-color: #FFFFFF;
		scrollbar-arrow-color: #bbbbbb;
		margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
		}

		.calendar td {font-size: 9pt; color:#595959;}



		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}

		.calendar A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		.calendar A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		.calendar A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
		.calendar A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}
		.day{
			width:100px; 
			height:30px;
			font-weight: bold;
			font-size:15px;
			font-weight:bold;
			text-align: center;
		}
		
		.today_button_div{
			float: right;
		}
		.today_button{
			width: 100px; 
			height:30px;
		}
		.calendar{width:1000px; padding:30px; box-shadow: 0 0 20px 0 #e8e8e8; border-radius:10px; margin:auto; position: relative; /*background-color:#F9F8E7;*/ background-color:rgba(249, 248, 231,0.5);}
		
		.scheduleBox{padding-top:5px;}
		.scheduleBox p{/*margin:5px 0;*/ height:22px; line-height:22px; font-family: 'Jua', sans-serif; font-size:1.2em; cursor:pointer;}
		.scheduleBox p:hover{background-color: #BBD996;;}
		
		.navigation{			
			margin:40px auto 50px;
			text-align: center;
			font-size: 25px;
			vertical-align: middle;
		}
		
		
		.calendar_top{width:900px; margin:0 auto; display:flex; border-bottom:5px solid #7AB730; /*position: absolute; top: 50px; left: 0;*/}
		.calendar_top p{width:14.29%; text-align: center; padding-bottom:10px; font-family: 'Jua', sans-serif; font-size:1.2em;}
		
		
		.calendar_body{
			width:900px;
			margin:0 auto;
			background-color: #FFFFFF;
			border:1px solid white;
			border-bottom: 5px solid #7AB730;
			margin-bottom: 50px;
			border-collapse: collapse;
		}
		
		
		.calendar_body .date{
			/*font-weight: bold;
			font-size: 15px;*/
			padding-left: 8px;
			padding-top: 8px;
		}
		
		.calendar_body .sat_day .sat{
			/*color: #529dbc;*/
			padding-left: 8px;
			padding-top: 8px;
		}
		
		.calendar_body .sun_day .sun{
			/*color: red; */
			padding-left: 8px;
			padding-top: 8px;
		}
		
		.calendar_body td{
			width: 14.29%;
			border:1px solid #ddd;
			height:120px;
			vertical-align: top;
			text-align: left;
		}
		
		/*.top_tr{border-bottom: 3px solid #7AB730;}*/
		
		
		.this_month{
			margin: 10px;
		}
		
		.today{background-color:#eee}
		
		.scheduleRgModal{display:none;width: 350px; height: 480px;  border: 3.5px solid #BBD996; border-radius: 15px; position: relative;
			background: #fff; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index:10;}			
		.closeSchedule{width:20px; height: 20px; position: absolute; top: 20px; right: 15px;}
		#plan_modal, #plan_MFmodal{display: none; width: 350px; height: 470px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 20px 0 #e8e8e8;background: #fff; border-radius: 10px; z-index:10;}    
		
		#plan_modal input:focus{outline: none;}
		#plan_modal textarea:focus{outline: none;}
		.modal_header{border-bottom: 1px solid #dee2e6; padding: 10px 0; display: flex; position: relative;}
		.modal-title{font-family: 'Jua', sans-serif; font-size:1.4em;}
		.modal_logo{font-size: 1.4em; font-family: 'Nanum Pen Script', cursive; padding-left: 15px;}
		.modal_close{width:20px; height: 20px; position: absolute; top: 20px; right: 15px;}
		.eachPlan{border-collapse: collapse; width: 100%;}
		.modal_body{padding: 0 20px; display: block;}
		.mlabel{padding-top: 10px;}
		.modal_input{border: 1px solid #d9d9de; box-sizing: border-box; width: 100%; height: 40px; padding-left: 10px;}
		.m_button{margin-top: 20px; width: 45%; height: 35px; padding: 0 20px; border: none; border-radius: 5px; cursor:pointer}
		.m_button:nth-of-type(1){margin-right: 20px;}
		.modal_textarea{resize: none; width: 100%; background: none; border: 1px solid #d9d9de; line-height: 22px; font-family: "NanumSquare","맑은 고딕", sans-serif; box-sizing: border-box; padding: 10px;}
		.modal_input, .modal_textarea{margin-top:5px;}
		input[type=date]{font-family: "NanumSquare","맑은 고딕", sans-serif; text-align: center; padding-right:10px;}
		.add_button{margin-top: 15px; width: 100%; height: 40px; padding: 0 20px; border: none; border-radius: 5px; cursor:pointer}
		.buttonBox{display:flex; justify-content: space-evenly;;}
		
		.contents{width:100%}
	</style>
</head>
<body>

<div class="container">   
	<jsp:include page="../common/header.jsp" />
	<main>
		<div class="siteInfo">
	        <div class="infoText">
	            <p>견주 다이어리</p>
	            <p>네가 있기에 여전히 따듯한 오늘</p>
	        </div>
	    </div>
	    <div class="siteNav">
	        <a href="#"><div class="homeLogo">1</div></a>
	        <ul>
	            <li class="checked"><a href="#">캘린더</a></li>
	            <li><a href="#">견주 다이어리</a></li>
	        </ul>
	    </div>
		<div class="otherWrap" style="width: 1150px; padding-left:310px; margin: 100px 0 70px;">
	        <div class="otherP">
	            <P>너와의 오늘, 우리의 시간</P>
	            <!--<h1>다른 반려동물 보러 놀러가기</h1> -->
	            <p>'너'이기에 행복한 견주의 일기</p>
	    	</div>
	    </div>
	    
	    <div class="calendarBox">
	    	<button type="button" class="scheModal_open">일정등록</button>
	    	<button type="button" id="redirect" class="move" style="display:none">re</button>
	    	<div class="calendar" >

				<!--날짜 네비게이션  -->
				<div class="navigation">
					
					
					<a class="move prev_year" href="javascript:;">
						&lt;&lt;
					<!-- 이전해 -->
					</a> 
					<span class="this_year">${today_info.search_year}</span>
					<a class="move next_year" href="javascript:;">
						<!-- 다음해 -->
						&gt;&gt;
					</a>
					
					
					<a class="move prev_month" href="javascript:;">
						&lt;
					<!-- 이전달 -->
					</a> 					
					<span class="this_month"> 
						<c:if test="${today_info.search_month<10}">0</c:if><span class="monthInt">${today_info.search_month}</span>
					</span>	
					<span class="month_eng">${monthEng[today_info.search_month - 1]}</span>				
					<a class="move next_month" href="javascript:;">
					<!-- 다음달 -->
						&gt;
					</a> 
										
				</div>
				
				<div class="calendar_top">
					<p style="color:red">SUN</p>
					<p>MON</p>
					<p>TUE</p>
					<p>WED</p>
					<p>THU</p>
					<p>FRI</p>
					<p style="color: #529dbc;">SAT</p>
				</div>
				
				<table class="calendar_body">	
					<!--  		
					<thead>
						<tr class="top_tr">
							<td class="day sun" >
								일
							</td>
							<td class="day" >
								월
							</td>
							<td class="day" >
								화
							</td>
							<td class="day" >
								수
							</td>
							<td class="day" >
								목
							</td>
							<td class="day" >
								금
							</td>
							<td class="day sat" >
								토
							</td>
						</tr>
					</thead>
					-->
					<tbody class="tbody">
						<tr>
							<c:forEach var="dateList" items="${dateList}" varStatus="date_status"> 
								<c:choose>
									
									<c:when test="${date_status.index%7==6}">
										<td class="sat_day ${(dateList.value == 1000) ? 'today' : ''}">
											<div class="sat">
												${dateList.date}
												<div class="scheduleBox">
													<c:forEach var="scheduleList" items="${dateList.schedule_data_arr}" varStatus="schedule_data_arr_status"> 
														<p id="${scheduleList.scheduleId}" class="plan">${scheduleList.scheduleTitle}</p>
													</c:forEach>
												</div>
											</div>	
										</td>
									</c:when>
									<c:when test="${date_status.index%7==0}">
						</tr>
						<tr>	
							<td class="sun_day ${(dateList.value == 1000) ? 'today' : ''}">
								<div class="sun">
									${dateList.date}
									<div class="scheduleBox">
										<c:forEach var="scheduleList" items="${dateList.schedule_data_arr}" varStatus="schedule_data_arr_status"> 
											<p id="${scheduleList.scheduleId}" class="plan">${scheduleList.scheduleTitle}</p>
										</c:forEach>
									</div>
								</div>								
							</td>
									</c:when>
									<c:otherwise>
							<td class="normal_day ${(dateList.value == 1000) ? 'today' : ''}">
								<div class="date">
									${dateList.date}
									<div class="scheduleBox">
										<c:forEach var="scheduleList" items="${dateList.schedule_data_arr}" varStatus="schedule_data_arr_status"> 
											<p id="${scheduleList.scheduleId}" class="plan">${scheduleList.scheduleTitle}</p>
										</c:forEach>
									</div>
								</div>
							</td>
									</c:otherwise>
								</c:choose>
								
							</c:forEach>
					</tbody>				
				</table>
			</div>
	    	
	    </div>
	    
	</main>
</div>









	<!-- 스케줄 등록 모달 -->
	<div class="scheduleRgModal">
		<div class="modal_header">			
			<p class="modal-title">
                <span class="modal_logo">오늘의 너</span> 일정 등록
            </p>
            <button type="button" class="closeSchedule">X</button>
		</div>
				
		<div class="modal_body">
	        <table class="contents">
	            <tr>
	                <td class="mlabel">
	                    <p>
	                        <strong>날짜</strong>
	                    </p>
	                </td>
	            </tr>
	            <tr>
	                <td><input type="date" id="schedule_date" class="modal_input"/></td>
	            </tr>
	        
	            <tr>
	                <td class="mlabel">
	                    <p>
	                        <strong>순번</strong>
	                    </p>
	                </td>
	            </tr>
	            <tr>
	                <td><input type="text" id="schedule_num"  class="modal_input" /></td>
	            </tr>		        
	            
	            <tr>
	                <td class="mlabel">
	                    <p>
	                        <strong>제목</strong>
	                    </p>
	                </td>
	            </tr>
	            <tr>
	                <td><input type="text" id="schedule_title" class="modal_input" /></td>
	            </tr>
	            <tr>
	                <td class="mlabel">
	                    <p>
	                        <strong>메모</strong>
	                    </p>
	                </td>
	            </tr>
	            <tr>
	                <td><textarea id="schedule_desc" class="modal_textarea" rows="2"></textarea></td>
	            </tr>
	            
	            <tr>
	                <td>
	                    <button type="button" id="scheRgBtn" class="add_button">저장</button>
	                </td>
	            </tr>
	        </table>
    	</div>
	</div>
	
	
	<!-- 스케줄 상세조회 모달 -->
    <div id="plan_modal">
        <div class="modal_header">
            <p class="modal-title">
                <span class="modal_logo">오늘의 너</span> 스케줄
            </p>
            <button type="button" class="modal_close">X</button> <!--닫기 버튼-->
        </div>
        <div class="modal_body">
            <table class="eachPlan">
            	<tr>
		            <td class="mlabel">
		                <p>
		                    <strong>날짜</strong>
		                </p>
		            </td>
		        </tr>
            	<tr>
            		<td><input type="date" class="modal_input" id="planDate" value="" readonly></td>
		        </tr>
            
            	<tr>
		            <td class="mlabel">
		                <p>
		                    <strong>순번</strong>
		                </p>
		            </td>
		        </tr>
				<tr>
		            <td><input class="modal_input" id="planNum" value="" readonly></td>
		        </tr>		        
		        
		        <tr>
		            <td class="mlabel">
		                <p>
		                    <strong>제목</strong>
		                </p>
		            </td>
		        </tr>
		        <tr>
		            <td><input class="modal_input" id="planTitle" value="" readonly></td>
		        </tr>
		        <tr>
		            <td class="mlabel">
		                <p>
		                    <strong>메모</strong>
		                </p>
		            </td>
		        </tr>
		        <tr>
		        	<td><textarea id="planDesc" class="modal_textarea" rows="2" readonly></textarea></td>
		        </tr>
		        
		        <tr>
                    <td>
                    	<div class="buttonBox">
	                        <button type="button" id="modifyPlan" class="m_button">수정</button>
	                        <button type="button" id="deletePlan" class="m_button">삭제</button>
                        </div>
                    </td>
                </tr>
    		</table>
        </div>
    </div>
	
	
	<!-- 스케줄 수정 모달 -->
	<div class="mdpop" style="position: fixed; top: 0; left: 0; width:100%; height:100%; background:rgba(0,0,0,0.7); display:none; text-indent:-9999px"></div>
    <div id="plan_MFmodal">
        <div class="modal_header">
            <p class="modal-title">
                <span class="modal_logo">오늘의 너</span> 스케줄 수정
            </p>
            <button type="button" class="modal_close">X</button> <!--닫기 버튼-->
        </div>
        <div class="modal_body">
            <table class="eachPlan">
            	<tr>
		            <td class="mlabel">
		                <p>
		                    <strong>날짜</strong>
		                </p>
		            </td>
		        </tr>
            	<tr>
            		<td><input type="date" class="modal_input" id="MplanDate" value=""></td>
		        </tr>
            
            	<tr>
		            <td class="mlabel">
		                <p>
		                    <strong>순번</strong>
		                </p>
		            </td>
		        </tr>
				<tr>
		            <td><input type="text" class="modal_input" id="MplanNum" value=""></td>
		        </tr>		        
		        
		        <tr>
		            <td class="mlabel">
		                <p>
		                    <strong>제목</strong>
		                </p>
		            </td>
		        </tr>
		        <tr>
		            <td><input type="text" class="modal_input" id="MplanTitle" value=""></td>
		        </tr>
		        <tr>
		            <td class="mlabel">
		                <p>
		                    <strong>메모</strong>
		                </p>
		            </td>
		        </tr>
		        <tr>
		        	<td><textarea id="MplanDesc" class="modal_textarea" rows="2"></textarea></td>
		        </tr>
		        
		        <tr>
                    <td>
                    	<div class="buttonBox">
	                        <button type="button" id="modifyBtn" class="m_button">저장</button>
	                        <button type="button" id="modifyCancle" class="m_button">취소</button>
                        </div>
                    </td>
                </tr>
    		</table>
        </div>
    </div>

</body>

<script type="text/javascript">

	$(function(){
		$("#redirect").click();
	})
	
	// 스케줄 모달 여닫기
	$(".scheModal_open").click(function(){
		$(".scheduleRgModal").css("display","block");
	})
	$(".closeSchedule").click(function(){
		$("#schedule_date").val("");
		$("#schedule_title").val("");
		$("#schedule_desc").val("");
		$("#schedule_num").val("");
		$(".scheduleRgModal").css("display","none");
	})

	
	
	// 스케줄 등록
	$("#scheRgBtn").click(function(){
		
		let userId = "${login.userId}";
		let scheduleNum = $("#schedule_num").val();		
		let scheduleTitle = $("#schedule_title").val();	
		if(!scheduleTitle || scheduleTitle.replace(/\s| /gi, "").length==0){ // null값이거나 공백만 입력한 경우
			alert("제목을 입력해주세요.");
			$("#schedule_title").focus();
		    return false;
		}
		let scheduleDate = $("#schedule_date").val();
		if(!scheduleDate){ // 날짜 null값
			alert("날짜를 입력해주세요.");
		    return false;
		}
		let scheduleDesc = $("#schedule_desc").val();
		scheduleDesc = scheduleDesc.replace(/(?:\r\n|\r|\n)/g, '<br>');
		
		let ScheduleVO = {
			userId: userId,
			scheduleNum: scheduleNum,
			scheduleTitle: scheduleTitle,
			scheduleDesc: scheduleDesc,
			scheduleDate: scheduleDate
		};
		
			
		$.ajax({
			type: "POST", 
			url: "/today/diary//scheduleAdd", 
			headers: {
				"Content-Type": "application/json"
			}, 
			dataType: "text", 
			data: JSON.stringify(ScheduleVO), 
			success: function(result){
				if(result === "success"){
					alert("일정이 등록되었습니다.")	
					$("#redirect").click();
					$("#schedule_date").val("");
					$("#schedule_title").val("");
					$("#schedule_desc").val("");
					$("#schedule_num").val("");
					$(".scheduleRgModal").css("display","none");
					//window.location.reload();
				}else if(result=== "fullSchedule"){
					alert("최대 4개까지 등록 가능합니다.")
				}else{
					console.log("통신 실패");
				}													
			}, 
			error: function() {
				console.log("통신 실패!");
			} 
		});
		
		
	})
	
	
	
	
	
	// 년, 월 변경
	$(".move").click(function(){
		
		let year = parseInt($(".this_year").text());
		let month = (parseInt($(".monthInt").text()) - 1);

		let today = new Date();  
		if(isNaN(year)){year = today.getFullYear();}
		if(isNaN(month)){month = today.getMonth();}
		
		if($(this).hasClass("prev_year")){
			year -= 1
		}else if($(this).hasClass("next_year")){
			year += 1
		}else if($(this).hasClass("prev_month")){
			month -= 1
			if(month < 0){				
				year -= 1;
				month = 11;
			}			
		}else if($(this).hasClass("next_month")){
			month += 1;
			if(month == 12){
				year += 1;
				month = 0;
			}
		}
							
		let dateData = {
			year: year,
			month: month
		};
		
			
		$.ajax({
			type: "POST", 
			url: "/today/diary//calendarChg", 
			headers: {
				"Content-Type": "application/json"
			}, 
			dataType: "json", 
			data: JSON.stringify(dateData), 
			success: function (response) {
                console.log(response); // Map 
           	   
               	let dateList =  response["dateList"]; // 리스트
                let monthEng = response["monthEng"]; // 리스트
                let today_info = response["today_info"]; // map
                console.log(dateList); 
                console.log(monthEng);  
                console.log(today_info); 
                
                let searchYear = today_info["search_year"];
                $(".this_year").text(searchYear);
                
                let searchMonth = today_info["search_month"];
                $(".this_month").empty();
                if(searchMonth < 10){                	
                	$(".this_month").append("0<span class='monthInt'>" + searchMonth + "</span>");
                }else{
                	$(".this_month").append("<span class='monthInt'>" + searchMonth + "</span>");
                }
                
                $(".month_eng").text(monthEng[searchMonth - 1]);
                
                
                let html ="<tr>"
               	for(let i = 0; i < dateList.length; i++){

                    if(i % 7 == 6){
                        html += "<td class='sat_day'><div class='sat'>" + dateList[i]["date"] + "<div class='scheduleBox'>";
                        for(let j=0; j<dateList[i]["schedule_data_arr"].length; j++){
                            if(dateList[i]['schedule_data_arr'][j]){
                                html += "<p id='" + dateList[i]['schedule_data_arr'][j]['scheduleId'] + "' class='plan'>" + dateList[i]['schedule_data_arr'][j]['scheduleTitle'] + "</p>"; 
                            }                             
                        }
                        html += "</div></div></td>";
                    }else if(i % 7 == 0){
                        html += "</tr><tr><td class='sun_day'><div class='sun'>" + dateList[i]["date"] + "<div class='scheduleBox'>";
                        for(let j=0; j<dateList[i]["schedule_data_arr"].length; j++){
                            if(dateList[i]['schedule_data_arr'][j]){
                            	html += "<p id='" + dateList[i]['schedule_data_arr'][j]['scheduleId'] + "' class='plan'>" + dateList[i]['schedule_data_arr'][j]['scheduleTitle'] + "</p>";  
                            }                             
                        }
                        html += "</div></div></td>";  
                    }else{
                        html += "<td class='normal_day'><div class='date'>" + dateList[i]["date"] + "<div class='scheduleBox'>";
                        for(let j=0; j<dateList[i]["schedule_data_arr"].length; j++){
                            if(dateList[i]['schedule_data_arr'][j]){
                            	html += "<p id='" + dateList[i]['schedule_data_arr'][j]['scheduleId'] + "' class='plan'>" + dateList[i]['schedule_data_arr'][j]['scheduleTitle'] + "</p>";  
                            }                             
                        }
                        html += "</div></div></td>"; 
                    }                  
              }
              $(".tbody").empty();
              $(".tbody").append(html);
           	   	   	                 
           }, 
			error: function() {
				console.log("통신 실패!");
			} 
		});
		
		
	})
	
	
	
	// 스케줄 상세보기	
	$(document).on("click", ".plan", function () {		
		
	    let scheduleId = $(this).attr("id");
           console.log(scheduleId);
           
   		let ScheduleVO = {
   				scheduleId: scheduleId
                   };
   		
   		$.ajax({
               type: 'post',
               dataType : "json",
               contentType: 'application/json',
               url: '/today/diary/onePlan',
               data: JSON.stringify(ScheduleVO),
               success: function (response) {
               	console.log(response); // ScheduleVO 
                  		
               		let scheduleId = response['scheduleId'];
                   	let scheduleNum = response['scheduleNum'];
               		let scheduleTitle = response['scheduleTitle'];
               		let scheduleDate = response['scheduleDate'];
               		let scheduleDesc = response['scheduleDesc'];
               		scheduleDesc = scheduleDesc.replaceAll("<br>", "\r\n");

                    $("#plan_modal").css("display","block");
                    $("#planDate").attr('value',scheduleDate);
                    console.log(scheduleDate);
                    $("#planNum").attr('value',scheduleNum);
                    $("#planTitle").attr('value',scheduleTitle);                                              
                    $("#planDesc").val(scheduleDesc);
                    $("#modifyPlan").attr('href',scheduleId); 
                    $("#deletePlan").attr('href',scheduleId); 
               }, 
               error: function() {
                   console.log("통신 실패!"); 
               } 
           });
       })
		
       
       // 스케줄 상세조회, 스케줄 수정 모달 닫기
       $(".modal_close").click(function(){
    	   $("#plan_modal").css("display","none");
    	   $("#plan_MFmodal").css("display","none");
    	   $(".mdpop").css("display","none");
       })
	   $(document).mouseup(function (e){
	    	let LayerPopup = $("#plan_modal");
	    	if(LayerPopup.has(e.target).length === 0){
	    		$("#plan_modal").css("display","none");
	    	}
	    }); 
	
		
	       
	   // 스케줄 수정 창 열기
	   $("#modifyPlan").click(function(){
		   $("#plan_modal").css("display","none");
		   $("#plan_MFmodal").css("display","block");
		   
		   let scheduleId = $(this).attr("href");
           console.log(scheduleId);
           
   		let ScheduleVO = {
   				scheduleId: scheduleId
                   };
   		
   		$.ajax({
               type: 'post',
               dataType : "json",
               contentType: 'application/json',
               url: '/today/diary/onePlan',
               data: JSON.stringify(ScheduleVO),
               success: function (response) {
               	console.log(response); // ScheduleVO 
                  		
               		let scheduleId = response['scheduleId'];
                   	let scheduleNum = response['scheduleNum'];
               		let scheduleTitle = response['scheduleTitle'];
               		let scheduleDate = response['scheduleDate'];
               		console.log(scheduleDate);
               		let scheduleDesc = response['scheduleDesc'];
               		scheduleDesc = scheduleDesc.replaceAll("<br>", "\r\n");
					
               		$(".mdpop").css("display","block");
               		$("#modifyBtn").attr('href',scheduleId); 
                    $("#MplanDate").attr('value',scheduleDate);
                    $("#MplanNum").attr('value',scheduleNum);
                    $("#MplanTitle").attr('value',scheduleTitle);                                              
                    $("#MplanDesc").val(scheduleDesc);                              
               }, 
               error: function() {
                   console.log("통신 실패!"); 
               } 
           });
	   });
	   
	   
	   // 스케줄 수정 취소
	   $("#modifyCancle").click(function(){
		   $(".mdpop").css("display","none");
		   $("#plan_MFmodal").css("display","none");
		   $("#plan_modal").css("display","block");
	   })
	   
	   
	   // 스케줄 수정
	   $("#modifyBtn").click(function(){
			
		   let scheduleId = $(this).attr("href");
		   let scheduleNum = $("#MplanNum").val();		
		   let scheduleTitle = $("#MplanTitle").val();	
		   if(!scheduleTitle || scheduleTitle.replace(/\s| /gi, "").length==0){ // null값이거나 공백만 입력한 경우
			   alert("제목을 입력해주세요.");
			   $("#MplanTitle").focus();
			   return false;
			}
			let scheduleDate = $("#MplanDate").val();
			if(!scheduleDate){ // 날짜 null값
				alert("날짜를 입력해주세요.");
			    return false;
			}
			let scheduleDesc = $("#MplanDesc").val();
			scheduleDesc = scheduleDesc.replace(/(?:\r\n|\r|\n)/g, '<br>');
			
			let ScheduleVO = {
				scheduleId : scheduleId,
				scheduleNum: scheduleNum,
				scheduleTitle: scheduleTitle,
				scheduleDesc: scheduleDesc,
				scheduleDate: scheduleDate
			};			
				
			$.ajax({
				type: "POST", 
				url: "/today/diary//modifySchedule", 
				headers: {
					"Content-Type": "application/json"
				}, 
				dataType: "text", 
				data: JSON.stringify(ScheduleVO), 
				success: function(result){
					if(result === "success"){
						alert("일정이 수정되었습니다.")	
						$("#redirect").click();						
						$("#plan_MFmodal").css("display","none");
						$(".mdpop").css("display","none");

					}else{
						console.log("통신 실패");
					}													
				}, 
				error: function() {
					console.log("통신 실패!");
				} 
			});
						
		})	    
	   
	   
		
	    // 스케줄 삭제
	    $("#deletePlan").click(function(){
		    if(confirm("일정을 삭제하시겠습니까?")){
		    	let scheduleId = $(this).attr("href");          
		   		let ScheduleVO = {
		   			scheduleId: scheduleId
		        };
		   		
		   		$.ajax({
		               type: 'post',
		               dataType : "text",
		               contentType: 'application/json',
		               url: '/today/diary/deleteSchedule',
		               data: JSON.stringify(ScheduleVO),
		               success: function (response) {
		            	   if(response === "success"){
		         				alert("일정이 삭제되었습니다.");
		         				$("#plan_modal").css("display","none");
		         				$("#redirect").click();
		         			}else{
		         				alert("일정 삭제에 실패했습니다.");
		         			}                           
		               }, 
		               error: function() {
		                   console.log("통신 실패!"); 
		               } 
		           });					   	   
		    }    
	   });		
		
	   
</script>


</html>