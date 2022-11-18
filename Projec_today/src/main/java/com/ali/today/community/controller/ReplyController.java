package com.ali.today.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ali.today.community.model.ReplyVO;
import com.ali.today.community.service.IBoardService;



@RestController
@RequestMapping("/community")
public class ReplyController {
	
	@Autowired
	IBoardService service;
	
	
	
	// Ajax 방식으로 댓글 등록
	@PostMapping("/reply")
	public String reply(@RequestBody ReplyVO replyVO) {
		System.out.println(replyVO.toString());
		System.out.println("댓글등록 요청 : POST");
		
		service.register(replyVO);  
		
		return "replySuccess";
	}
	
	
	
	
	// 댓글 수정
	@PostMapping("/modifyReply")
	public String modifyReply(@RequestBody ReplyVO replyVO) {
		
		service.modifyReply(replyVO);
		
		return "modifySuccess";
	}
	
	
	// 댓글 삭제
	@PostMapping("/deleteReply")
	public String deleteReply(@RequestBody ReplyVO replyVO) {
		
		service.deleteReply(replyVO);
		
		return "deleteSuccess";
	}
		
	
	
	
	
}
