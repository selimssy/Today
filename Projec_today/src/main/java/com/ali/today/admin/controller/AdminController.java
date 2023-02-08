package com.ali.today.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ali.today.common.PageCreator;
import com.ali.today.common.SearchVO;
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
	
}
