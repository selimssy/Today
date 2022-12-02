package com.ali.today.diary.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ali.today.common.PageCreator;
import com.ali.today.common.PageVO;
import com.ali.today.common.SearchVO;
import com.ali.today.diary.model.DateData;
import com.ali.today.diary.model.DiaryVO;
import com.ali.today.diary.model.ScheduleVO;
import com.ali.today.diary.service.IDiaryService;
import com.ali.today.user.model.UserVO;
import com.google.gson.JsonObject;


@Controller
@RequestMapping("/diary")
public class DiaryController {
	
	@Autowired
	IDiaryService service;
	
	
	
	@GetMapping("/calendar")
	public String calendar(Model model, HttpServletRequest request, DateData dateData){
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
		dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null,null);
		}

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();

		//검색 날짜 end
		
		
		
		UserVO user = (UserVO)request.getSession().getAttribute("login");
		String userId = user.getUserId();
		List<ScheduleVO> Schedule_list = service.getOnedaySchedules(userId, dateData);

		

		//달력데이터에 넣기 위한 배열 추가
		ScheduleVO[][] schedule_data_arr = new ScheduleVO[32][4];
		if(Schedule_list.isEmpty()!=true){
			
		}
		
		int j = 0;
		for(int i=0; i<Schedule_list.size(); i++){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			String strDate = simpleDateFormat.format(Schedule_list.get(i).getScheduleDate()); 			
			int date = Integer.parseInt(strDate.substring(strDate.length()-2, strDate.length()));

			if(i>0){
				String str_preDate = simpleDateFormat.format(Schedule_list.get(i-1).getScheduleDate()); 
				int date_before = Integer.parseInt(str_preDate.substring(str_preDate.length()-2, str_preDate.length()));
				if(date_before==date){
					j=j+1;
					schedule_data_arr[date][j] = Schedule_list.get(i);
				}else{
					j=0;
					schedule_data_arr[date][j] = Schedule_list.get(i);
				}
			}else{
				schedule_data_arr[date][j] = Schedule_list.get(i);
			}

		}
		
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
		calendarData= new DateData(null, null, null, null, null);
		dateList.add(calendarData);
		}
		
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
		ScheduleVO[] schedule_data_arr3 = new ScheduleVO[4];
		schedule_data_arr3 = schedule_data_arr[i];

		
		if(i==today_info.get("today")){
			calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), 1000, schedule_data_arr3);
			}else{
			calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), 0, schedule_data_arr3);
			}
			dateList.add(calendarData);

			}

		//달력 빈 곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;

		if(dateList.size()%7!=0){

			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null, null);
				dateList.add(calendarData);
			}
		}
		
		String monthEng[] = {"January", "February", "March", "April", "May" ,"June" ,"july", "august", "september", "october" ,"november", "december"};
		
		//배열에 담음
		model.addAttribute("dateList", dateList); //날짜 데이터 배열
		model.addAttribute("today_info", today_info);	
		model.addAttribute("monthEng", monthEng);
		return "diary/calendar2";
	
	}	
	
	
	
	
	@PostMapping("/calendarChg")
	@ResponseBody
	public Map<String, Object> calendarChg(Model model, HttpServletRequest request, @RequestBody DateData dateData){
		System.out.println(dateData);
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
		dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null,null);
		}

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();

		//검색 날짜 end
		
		
		
		UserVO user = (UserVO)request.getSession().getAttribute("login");
		String userId = user.getUserId();
		List<ScheduleVO> Schedule_list = service.getOnedaySchedules(userId, dateData);

		

		//달력데이터에 넣기 위한 배열 추가
		ScheduleVO[][] schedule_data_arr = new ScheduleVO[32][4];
		if(Schedule_list.isEmpty()!=true){
			
		}
		
		int j = 0;
		for(int i=0; i<Schedule_list.size(); i++){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			String strDate = simpleDateFormat.format(Schedule_list.get(i).getScheduleDate()); 			
			int date = Integer.parseInt(strDate.substring(strDate.length()-2, strDate.length()));

			if(i>0){
				String str_preDate = simpleDateFormat.format(Schedule_list.get(i-1).getScheduleDate()); 
				int date_before = Integer.parseInt(str_preDate.substring(str_preDate.length()-2, str_preDate.length()));
				if(date_before==date){
					j=j+1;
					schedule_data_arr[date][j] = Schedule_list.get(i);
				}else{
					j=0;
					schedule_data_arr[date][j] = Schedule_list.get(i);
				}
			}else{
				schedule_data_arr[date][j] = Schedule_list.get(i);
			}

		}
		
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
		calendarData= new DateData(null, null, null, null, null);
		dateList.add(calendarData);
		}
		
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
		ScheduleVO[] schedule_data_arr3 = new ScheduleVO[4];
		schedule_data_arr3 = schedule_data_arr[i];

		
		if(i==today_info.get("today")){
			calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), 1000, schedule_data_arr3);
			}else{
			calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), 0, schedule_data_arr3);
			}
			dateList.add(calendarData);

			}

		//달력 빈 곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;

		if(dateList.size()%7!=0){

			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null, null);
				dateList.add(calendarData);
			}
		}
		
		String monthEng[] = {"January", "February", "March", "April", "May" ,"June" ,"july", "august", "september", "october" ,"november", "december"};
		
		//배열에 담음
		Map<String, Object> calData = new HashMap<>();
		calData.put("dateList", dateList);
		calData.put("today_info", today_info);
		calData.put("monthEng", monthEng);
		return calData;
	
	}	
	
	
	
	
	
	
	@PostMapping("/scheduleAdd")
	@ResponseBody
	public String schedule_add(@RequestBody ScheduleVO scheduleVO){
	
		int count = service.countSchedule(scheduleVO);			
		if(count>=4){
			return "fullSchedule";
		}else{
			service.insertSchedule(scheduleVO);
			return "success";
		}

	}
	
	
	
	@PostMapping("/onePlan")
	@ResponseBody
	public ScheduleVO onePlan(@RequestBody ScheduleVO scheduleVO) {
		ScheduleVO plan = service.getOnePlan(scheduleVO.getScheduleId());
		System.out.println(plan.getScheduleDate());
		return plan;
	}
	
	
	
	
	
	// 일기쓰기 페이지 요청
	@GetMapping("/write")
	public String writeDiary() {
		
		return "/diary/diary_write";
	}
	
	
	// 새로운 일기 등록 요청
	@PostMapping("/write")
	public String writeDiary(DiaryVO diary, RedirectAttributes ra) {
		
		service.insert(diary);		
		ra.addFlashAttribute("msg", "regSuccess");
		
		return "redirect:/diary/list";
	}
	
	
	
	// 일기 상세보기 요청
	@GetMapping("/content/{diaryNo}")
	public String content(@PathVariable Integer diaryNo, SearchVO search, Model model) {
		
		System.out.println(diaryNo + "번 게시물 조회 요청");
		
		model.addAttribute("diary", service.getDiary(diaryNo));
		model.addAttribute("p", search);  	
		
		return "diary/diary_content";
	}
	
	
	
	// 게시물 수정페이지 요청
	@GetMapping("/modify")
	public String modify(Integer diaryNo, PageVO paging, Model model) {
		System.out.println(diaryNo + "번 게시물 수정 요청 : GET");
		model.addAttribute("diary", service.getDiary(diaryNo));
		model.addAttribute("p", paging); 
		return "diary/diary_modify";
	}
	
	// 게시물 수정 요청
	@PostMapping("/modify")
	public String modify(Integer diaryNo, DiaryVO diary, RedirectAttributes ra) { 
		System.out.println(diaryNo + "번 게시물 수정 요청 : POST");
		service.update(diary);
		ra.addFlashAttribute("msg", "modSuccess");
		return "redirect:/diary/content/" + diary.getDiaryNo();
	}
	
	
	
	
	
	// 일기 삭제 요청
	@PostMapping("/delete")
	public String delete(Integer diaryNo, PageVO paging, RedirectAttributes ra) {  
		
		System.out.println(diaryNo + "번 게시물 삭제 요청");
		service.delete(diaryNo);
		ra.addFlashAttribute("msg", "delSuccess");
		
		ra.addAttribute("page", paging.getPage());   
		ra.addAttribute("countPerPage", paging.getCountPerPage());
		
		return "redirect:/diary/list";
	}
	
	
	
	
	
	// 일기 전체 리스트 조회 요청(페이징, 검색 포함)
	@GetMapping("/list")
	public String list(SearchVO search, Model model) { 
		
		//String condition = search.getCondition();
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search);  
		
		List<DiaryVO> list = service.getDiaryList(search);
		pc.setArticleTotalCount(service.countDiaries(search));
		
		model.addAttribute("diaryList", list);
		model.addAttribute("pc", pc);		
		
		return "diary/diaryList";
	}  
	
	
	
	
	
	// ckeditor
	@ResponseBody
	@PostMapping("/fileupload")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() >0 &&  StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/petDiary"); //저장경로
			            System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;
			            
			            out = new FileOutputStream(new File(uploadPath)); 
			            out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            //String fileUrl = req.getContextPath() + "/resources/images/petDiary/" +fileName2 +fileName; // ContextPath 포함 url경로
			            String fileUrl = req.getContextPath() + "/resources/images/petDiary/" +fileName2 +fileName; //url경로
			            System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			 
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally {
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}
			
		}
		
	}
	}
	
	
	
}
