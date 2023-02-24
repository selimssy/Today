package com.ali.today.messenger.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ali.today.messenger.model.BlockVO;
import com.ali.today.messenger.model.MessengerVO;
import com.ali.today.messenger.service.IMessengerService;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.service.IUserService;

@Controller
@RequestMapping("/msg")
public class MessengerController {
	
	@Autowired
	IMessengerService service;
	@Autowired
	IUserService uService;
	
	
	
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
	public Map<String, Object> getRecvMsg(@RequestBody SearchVO search, HttpSession session){

		UserVO user = (UserVO)session.getAttribute("login");
		String userId = user.getUserId();
				 
		Integer totalMsg =  service.countRecvMsg(userId, search);	
		Integer lastPage = (int)Math.ceil(totalMsg / (double)10);  // 마지막 페이지
		List<MessengerVO> list = service.getRecvMsg(userId, search); // 쪽지 리스트
		Integer petLetter = service.petLetter(userId); // 펫편지 수신 여부
	
		Map<String, Object> data = new HashMap<>();
		data.put("list", list);
		data.put("lastPage", lastPage);
		data.put("petLetter", petLetter);
		
		return data;					
	}
	
	
	
	// 읽은 쪽지 마크 해제
	@PostMapping("/readChk")
	@ResponseBody
	public String readChk(@RequestBody Integer msgNo) {
		service.readChk(msgNo);  		
		return "success";
	}
	
	
	
	// 새쪽지 여부
	@PostMapping("/newMsg")
	@ResponseBody
	public String newMsg(@RequestBody String userId) {
		Integer newMsg = service.newMsg(userId);  		
		return Integer.toString(newMsg);
	}
	
	
	
	
	
	//쪽지 삭제
	@PostMapping("/delMsg")
	@ResponseBody
	public String delMsg(@RequestBody Integer msgNo) {
		service.delMsg(msgNo);  		
		return "success";
	}
	
	
	
	// 펫편지 수신여부 변경
	@PostMapping("/mdPetLetter")
	@ResponseBody
	public String mdPetLetter(@RequestBody UserVO user) {
		uService.mdPetLetter(user);
		return Integer.toString(user.getPetLetter());
	}
	
	
	
	//쪽지 차단
	@PostMapping("/blockUser")
	@ResponseBody
	public String blockUser(@RequestBody BlockVO blockVO) {
		service.blockUser(blockVO);
		return "success";
	}
	
	
	
	//차단한 회원 목록 조회
	@PostMapping("/blockList")
	@ResponseBody
	public List<BlockVO> blockList(@RequestBody String userId) {
		List<BlockVO> blockList = service.blockList(userId);
		return blockList;
	}
	
	
	
}
