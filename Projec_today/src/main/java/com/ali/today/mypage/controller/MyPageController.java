package com.ali.today.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ali.today.user.model.UserVO;
import com.ali.today.user.repository.IUserMapper;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	IUserMapper mapper;
	
	// 마이페이지 홈
	@GetMapping("/profile")
	public void profile(HttpSession session, Model model) {
		UserVO user = (UserVO)session.getAttribute("login");
		String userId = user.getUserId();
		UserVO dbUser = mapper.selectOne(userId);
		model.addAttribute("user", dbUser);
	}
	

	// 개인정보 수정 페이지
	@GetMapping("/modifyUser")
	public void modifyUser(HttpSession session, Model model) {
		UserVO user = (UserVO)session.getAttribute("login");
		String userId = user.getUserId();
		UserVO dbUser = mapper.selectOne(userId);
		model.addAttribute("user", dbUser);
	}
	
}
