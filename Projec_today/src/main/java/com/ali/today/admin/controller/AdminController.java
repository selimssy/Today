package com.ali.today.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ali.today.admin.service.IAdminService;
import com.ali.today.common.PageCreator;
import com.ali.today.common.SearchVO;
import com.ali.today.diary.model.ScheduleVO;
import com.ali.today.diary.service.IDiaryService;
import com.ali.today.user.model.PetVO;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.service.IUserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	IUserService uservice;
	@Autowired
	IAdminService adService;
	@Autowired
	IDiaryService dService;
	
	
	// 회원관리 페이지 열기
	@GetMapping("/member")
	public void member(SearchVO search, Model model) {
		
		search.setCountPerPage(20);
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 
		List<UserVO> userList = uservice.selectAll(search);
		pc.setArticleTotalCount(uservice.countUsers(search));
		
		model.addAttribute("userList", userList);
		model.addAttribute("pc", pc);
	}
	
	
	// 반려견 관리 페이지 열기
	@GetMapping("/pet")
	public void pet(SearchVO search, Model model) {
		search.setCountPerPage(20);
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 	
		List<PetVO> petList = uservice.AllPet(search);
		pc.setArticleTotalCount(uservice.countAllPet(search));
		
		model.addAttribute("petList", petList);
		model.addAttribute("pc", pc);
	}
	
	
	// 특정 반려견 비공개 전환 요청
	@PostMapping("/offPet")
	@ResponseBody
	public String offPet(@RequestBody PetVO pet) {
		
		uservice.offPet(pet.getPetId());				
		return "success"; 
	} 
	
	
	// 특정 반려견 컨텐츠 현황 페이지 열기
	@GetMapping("/petContent")
	public void petContent(SearchVO search, Model model) {
		
		
		System.out.println("petId : " + search.getKeyword());
		Map<String, Object> petContent = adService.petContent(search);	
		if(!search.getKeyword().equals("")) { // petId 검색한 경우 반려견 이름 같이 전달
			Integer petId = Integer.valueOf(search.getKeyword()); 
			if(uservice.selectOnePet(petId) == null) { // 없는 반려견 검색한 경우
				model.addAttribute("msg", "noPet");
			}else {
				petContent.put("petName", uservice.selectOnePet(petId).getPetName());	
				model.addAttribute("petContent", petContent);
			}
		}else { // petId 검색 안 한 경우(전체 조회)
			model.addAttribute("petContent", petContent);
		}		
		
	}
	
	
	// 컨텐츠 관리(컨텐츠 현황) 페이지 열기
	@GetMapping("/content")
	public void content(SearchVO search, Model model) {
		Map<String, Integer> contentStats = adService.contentStats(search);		
		model.addAttribute("contentStats", contentStats);
	}
	
	
	/*
	// 생애기록 관리 페이지 열기
	@GetMapping("/lifetime")
	public void lifetime(SearchVO search, Model model) {
		
		search.setCountPerPage(20);
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 
		//List<UserVO> userList = uservice.selectAll(search);
		//pc.setArticleTotalCount(uservice.countUsers(search));
		
		model.addAttribute("userList", userList);
		model.addAttribute("pc", pc);
	}*/
	
	
	// 캘린더 관리 페이지 열기
	@GetMapping("/calendar")
	public void calendar(SearchVO search, Model model) {		
		search.setCountPerPage(20);
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 
		List<ScheduleVO> calendarList = dService.adAllSchedule(search);
		pc.setArticleTotalCount(dService.scheduleCnt(search));

		model.addAttribute("calendarList", calendarList);
		model.addAttribute("pc", pc);
	}
	
	
}
