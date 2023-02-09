package com.ali.today.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ali.today.common.PageCreator;
import com.ali.today.common.SearchVO;
import com.ali.today.user.model.PetVO;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.service.IUserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	IUserService uservice;
	

	
	
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
	
	
	
	
	
}
