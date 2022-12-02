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

		td {font-family: "돋움"; font-size: 9pt; color:#595959;}
		th {font-family: "돋움"; font-size: 9pt; color:#000000;}
		select {font-family: "돋움"; font-size: 9pt; color:#595959;}


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
		.scheduleBox p{margin:5px 0; font-family: 'Jua', sans-serif; font-size:1.2em; cursor:pointer;}
		.scheduleBox p:hover{background-color: green;}
		
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
			background-color:rgba(255, 255, 255, 0.85);
			vertical-align: top;
			text-align: left;
		}
		
		/*.top_tr{border-bottom: 3px solid #7AB730;}*/
		
		.before_after_month{
			margin: 10px;
			font-weight: bold;
		}
		.before_after_year{
			font-weight: bold;
		}
		.this_month{
			margin: 10px;
		}
		
		
		.scheduleRgModal{display:none;width: 300px; height: 350px;  border: 3.5px solid #7AB730; border-radius: 15px; padding: 15px; position: relative;
			background: #fff; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index:10;}
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
	    	<div class="calendar" >

				<!--날짜 네비게이션  -->
				<div class="navigation">
					
					
					<a class="before_after_year" href="/today/diary/calendar?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
						&lt;&lt;
					<!-- 이전해 -->
					</a> 
					<span class="this_year">
						${today_info.search_year}						
					</span>
					<a class="before_after_year" href="/today/diary/calendar?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
						<!-- 다음해 -->
						&gt;&gt;
					</a>
					
					
					<a class="before_after_month" href="/today/diary/calendar?year=${today_info.before_year}&month=${today_info.before_month}">
						&lt;
					<!-- 이전달 -->
					</a> 					
					<span class="this_month"> 
						<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
					</span>	
					<span class="month_eng">${monthEng[today_info.search_month - 1]}</span>				
					<a class="before_after_month" href="/today/diary/calendar?year=${today_info.after_year}&month=${today_info.after_month}">
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
					<tbody>
						<tr>
							<c:forEach var="dateList" items="${dateList}" varStatus="date_status"> 
								<c:choose>
									
									<c:when test="${date_status.index%7==6}">
										<td class="sat_day" style="<c:if test='${dateList.value == 1000}'>background-color:#eee</c:if>">
											<div class="sat">
												${dateList.date}
												<div class="scheduleBox">
													<c:forEach var="scheduleList" items="${dateList.schedule_data_arr}" varStatus="schedule_data_arr_status"> 
														<p class="date_subject">${scheduleList.scheduleTitle}</p>
													</c:forEach>
												</div>
											<div>
											</div>
										</td>
									</c:when>
									<c:when test="${date_status.index%7==0}">
						</tr>
						<tr>	
							<td class="sun_day"  style="<c:if test='${dateList.value == 1000}'>background-color:#eee</c:if>">
								<div class="sun">
									${dateList.date}
									<div class="scheduleBox">
										<c:forEach var="scheduleList" items="${dateList.schedule_data_arr}" varStatus="schedule_data_arr_status"> 
											<p class="date_subject">${scheduleList.scheduleTitle}</p>
										</c:forEach>
									</div>
								</div>
								<div>
								</div>
							</td>
									</c:when>
									<c:otherwise>
							<td class="normal_day" style="<c:if test='${dateList.value == 1000}'>background-color:#eee</c:if>">
								<div class="date">
									${dateList.date}
									<div class="scheduleBox">
										<c:forEach var="scheduleList" items="${dateList.schedule_data_arr}" varStatus="schedule_data_arr_status"> 
											<p class="date_subject">${scheduleList.scheduleTitle}</p>
										</c:forEach>
									</div>
								</div>
								<div>
								
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










	<div class="scheduleRgModal">
		<div class="top" style="">			
			<button type="button" class="closeSchedule">x</button>
			<div class="subject">
				일정 등록
			</div>
		</div>
		
		<div class="bottom">
			<div class="info">
				* 순번은 해당 날짜안에서 순서데로 입력이 됩니다.(하루에 최대 4개의 일정만 등록할 수 있습니다.)
			</div>
			<div>
				<input type="hidden" name="year" value="${today_info.search_year}" />
				<input type="hidden" name="month" value="${today_info.search_month-1}" />
				<div class="contents">
					<ul>
						<li>
							<div class="text_subject">순번 :</div> 
							<div class="text_desc">
								<input type="text" id="schedule_num"  class="text_type1" />
							</div>
						</li>
						<li>
							<div class="text_subject">날짜 :</div> 
							<div class="text_desc">
								<input type="date" id="schedule_date" class="text_type1"/>
							</div>
						</li>
						<li>	
							<div class="text_subject">제목 :</div> 
							<div class="text_desc">
								<input type="text" id="schedule_title" class="text_type1" />
							</div>
						</li>	
						<li>
							<div class="text_subject">내용 :</div> 
							<div class="text_area_desc">
								<textarea id="schedule_desc" class="textarea_type1" rows="7"></textarea>
							</div>
						</li>																			
					</ul>
					
				</div>
			</div>
			<button type="button" id="scheRgBtn">저장</button>
		</div>
	</div>


</body>

<script type="text/javascript">
	
	// 스케줄 모달 여닫기
	$(".scheModal_open").click(function(){
		$(".scheduleRgModal").css("display","block");
	})
	$(".closeSchedule").click(function(){
		$(".scheduleRgModal").css("display","none");
	})

	
	
	// 스케줄 등록
	$("#scheRgBtn").click(function(){
		
		let userId = "${login.userId}";
		let scheduleNum = $("#schedule_num").val();		
		let scheduleTitle = $("#schedule_title").val();
		let scheduleDesc = $("#schedule_desc").val();
		let scheduleDate = $("#schedule_date").val();		
		
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
					alert("일정이 등록되었습니다..")				
					window.location.reload();
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
	
	
	// 월 변경
	$("#scheRgBtn").click(function(){
		
		let userId = "${login.userId}";
		let scheduleNum = $("#schedule_num").val();		
		let scheduleTitle = $("#schedule_title").val();
		let scheduleDesc = $("#schedule_desc").val();
		let scheduleDate = $("#schedule_date").val();		
		
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
					alert("일정이 등록되었습니다..")				
					window.location.reload();
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
	
	

</script>


</html>
