package com.ali.today.messenger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ali.today.messenger.model.MessengerVO;
import com.ali.today.messenger.service.IMessengerService;

@Controller
@RequestMapping("/msg")
public class MessengerController {
	
	@Autowired
	IMessengerService service;
	
	
	@GetMapping("/temp")
	public String temp() {
		return "/common/messenger";
	}
	
	
	//쪽지 보내기
	@PostMapping("/sendMsg")
	@ResponseBody
	public String sendMsg(@RequestBody MessengerVO message) {
		System.out.println(message.toString());
		service.sendMsg(message);  
		
		return "success";
	}
	
}
