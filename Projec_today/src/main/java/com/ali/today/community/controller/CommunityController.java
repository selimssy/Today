package com.ali.today.community.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ali.today.mypet.model.GalleryVO;
import com.ali.today.mypet.model.LifetimeVO;
import com.ali.today.mypet.service.IMypetService;
import com.ali.today.user.model.PetVO;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.service.IUserService;


@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	IUserService userService;
	@Autowired
	IMypetService mypetService;
	
	@GetMapping("/intro")
	public String intro(HttpSession session, Model model) {
		
		// 반려동물 데이터
		UserVO user = (UserVO)session.getAttribute("login");
		Integer perId = user.getPet().getPetId();
		PetVO pet = userService.selectOnePet(perId);
		model.addAttribute("pet", pet);
		
		// 공개상태 반려동물 리스트
		List<PetVO> petList = userService.selectOpenPet();
		model.addAttribute("petList", petList);
		
		return "community/introduce";
	}
	
	
	
	
	// 다른 반려동물 보러 놀러가기 요청
	@GetMapping("/otherPet/{petId}")
	public String otherPet(@PathVariable Integer petId, Model model) {	
		
		PetVO pet = userService.selectOnePet(petId);
		List<LifetimeVO> cardList = mypetService.getLifetimeCardList(petId);
		List<GalleryVO> galleryList = mypetService.getGalleryList(petId);
		
		model.addAttribute("pet", pet);
		model.addAttribute("cardList", cardList);
		model.addAttribute("galleryList", galleryList);	
		
		return "community/otherPet";
	}
	
	
	
	
	
}
