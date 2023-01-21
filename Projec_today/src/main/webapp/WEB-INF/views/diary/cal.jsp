<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
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
		
		
		.this_month{
			margin: 10px;
		}
		

</style>
</head>
<body>

			<div class="calendar" >
				<button type="button" class="scheModal_open">일정등록</button>
				<!--날짜 네비게이션  -->
				<div class="navigation">
					
					
					<a class="move prev_year" href="/diary/calendar?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
						&lt;&lt;
					<!-- 이전해 -->
					</a> 
					<span class="this_year">
						${today_info.search_year}						
					</span>
					<a class="move next_year" href="/diary/calendar?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
						<!-- 다음해 -->
						&gt;&gt;
					</a>
					
					
					<a class="move prev_month" href="/diary/calendar?year=${today_info.before_year}&month=${today_info.before_month}">
						&lt;
					<!-- 이전달 -->
					</a> 					
					<span class="this_month"> 
						<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
					</span>	
					<span class="month_eng">${monthEng[today_info.search_month - 1]}</span>				
					<a class="move next_month" href="/diary/calendar?year=${today_info.after_year}&month=${today_info.after_month}">
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


</body>

<script type="text/javascript">

	//스케줄 모달 여닫기
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
			url: "/diary//scheduleAdd", 
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