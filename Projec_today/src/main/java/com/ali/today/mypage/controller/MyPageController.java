package com.ali.today.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {


	// 개인정보 수정 페이지
	@GetMapping("/modifyUser")
	public void modifyUser() {}
	
}
