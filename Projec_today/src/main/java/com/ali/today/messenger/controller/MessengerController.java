package com.ali.today.messenger.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ali.today.common.PageCreator;
import com.ali.today.common.SearchVO;
import com.ali.today.messenger.model.MessengerVO;
import com.ali.today.messenger.service.IMessengerService;
import com.ali.today.user.model.UserVO;

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
		service.sendMsg(message);  
		
		return "success";
	}
	
	
	//받은 쪽지함 리스트
	@PostMapping("recvMsg")
	@ResponseBody
	public List<MessengerVO> getRecvMsg(@RequestBody SearchVO search, HttpSession session){
		if(session.getAttribute("login") == null) {  //로그인 안 한 경우			
			return null;			
		}else {	 //로그인 한 경우	
			UserVO user = (UserVO)session.getAttribute("login");
			String userId = user.getUserId();
			PageCreator pc = new PageCreator();
			pc.setPaging(search);  
			pc.setArticleTotalCount(service.countRecvMsg(userId, search));					
			List<MessengerVO> list = service.getRecvMsg(userId, search);
			
			return list;					
		}
		
		
		
	}
	
	
}
