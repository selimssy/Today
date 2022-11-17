package com.ali.today.community.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ali.today.common.PageCreator;
import com.ali.today.common.SearchVO;
import com.ali.today.community.model.BoardVO;
import com.ali.today.community.service.IBoardService;
import com.ali.today.diary.model.DiaryVO;
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
	@Autowired
	IBoardService boardService;
	
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
	
	
	
	
	// 검색처리 이후 게시글 목록 불러오기 요청
	@GetMapping("/list")
	public String list(SearchVO search, Model model) { 
	
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 
		
		List<BoardVO> boardList = boardService.getArticleList(search);
		pc.setArticleTotalCount(boardService.countArticles(search));

		model.addAttribute("boardList", boardList);
		model.addAttribute("pc", pc);
		
		
		return "community/boardList";
	}  
	
	
	
	// 글쓰기 화면 띄우기 요청
	@GetMapping("/write")
	public String write(HttpSession session, RedirectAttributes ra) {
		
	  // 이젠 인터셉터가 이걸 처리하도록!!
//		if(session.getAttribute("login") == null) {
//			ra.addFlashAttribute("msg", "notLogin");
//			return "redirect:/";
//		}
		
		return "community/boardWrite";
	}
	
	
	
	// 글쓰기 처리 요청
	@PostMapping("/write")
	public String write(BoardVO article, RedirectAttributes ra) {
		
		System.out.println("parameter : " + article);  // t) 이런 파라미터 잘 들어오는지 확인하는습관 들이는게 좋다!
		System.out.println("이게 되려나 : " + Arrays.toString(article.getHashList()));

		boardService.insert(article);	
		ra.addFlashAttribute("msg", "regSuccess");
		return "redirect:/community/list";
	}
	
	
	
	
	
}
