package com.ali.today.community.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ali.today.user.model.PetVO;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.service.IUserService;


@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	IUserService userService;
	
	@GetMapping("/intro")
	public String intro(HttpSession session, Model model) {
		
		UserVO user = (UserVO)session.getAttribute("login");
		Integer perId = user.getPet().getPetId();
		PetVO pet = userService.selectOnePet(perId);
		model.addAttribute("pet", pet);
		
		return "community/introduce";
	}
	
	

	
}
