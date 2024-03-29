package com.ali.today.admin.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ali.today.admin.model.EmailVO;
import com.ali.today.admin.service.IAdminService;
import com.ali.today.common.PageCreator;
import com.ali.today.common.SearchVO;
import com.ali.today.community.model.BoardVO;
import com.ali.today.community.model.ReplyVO;
import com.ali.today.community.service.IBoardService;
import com.ali.today.diary.model.DiaryVO;
import com.ali.today.diary.model.ScheduleVO;
import com.ali.today.diary.service.IDiaryService;
import com.ali.today.mypet.model.GalleryVO;
import com.ali.today.mypet.model.LifetimeVO;
import com.ali.today.mypet.service.IMypetService;
import com.ali.today.user.model.PetVO;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.service.IUserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	IUserService uservice;
	@Autowired
	IAdminService adService;
	@Autowired
	IDiaryService dService;
	@Autowired
	IMypetService lService;
	@Autowired
	IBoardService bService;
	
	
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
	
	
	// 반려견 관리 페이지 열기
	@GetMapping("/pet")
	public void pet(SearchVO search, Model model) {
		search.setCountPerPage(20);
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 	
		List<PetVO> petList = uservice.AllPet(search);
		pc.setArticleTotalCount(uservice.countAllPet(search));
		
		model.addAttribute("petList", petList);
		model.addAttribute("pc", pc);
	}
	
	
	// 특정 반려견 비공개 전환 요청
	@PostMapping("/offPet")
	@ResponseBody
	public Integer offPet(@RequestBody PetVO pet) {
		
		uservice.offPet(pet);				
		return pet.getOpen(); 
	} 
	
	
	// 특정 반려견 컨텐츠 현황 페이지 열기
	@GetMapping("/petContent")
	public void petContent(SearchVO search, Model model) {
		
		
		//System.out.println("petId : " + search.getKeyword());
		Map<String, Object> petContent = adService.petContent(search);	
		if(!search.getKeyword().equals("")) { // petId 검색한 경우 반려견 이름 같이 전달
			Integer petId = Integer.valueOf(search.getKeyword()); 
			if(uservice.selectOnePet(petId) == null) { // 없는 반려견 검색한 경우
				model.addAttribute("msg", "noPet");
			}else {
				petContent.put("petName", uservice.selectOnePet(petId).getPetName());	
				model.addAttribute("petContent", petContent);
			}
		}else { // petId 검색 안 한 경우(전체 조회)
			model.addAttribute("petContent", petContent);
		}		
		
	}
	
	
	// 컨텐츠 관리(컨텐츠 현황) 페이지 열기
	@GetMapping("/content")
	public void content(SearchVO search, Model model) {
		Map<String, Integer> contentStats = adService.contentStats(search);		
		model.addAttribute("contentStats", contentStats);
	}
	
	
	
	// 생애기록 관리 페이지 열기
	@GetMapping("/lifetime")
	public void lifetime(SearchVO search, Model model) {
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 
		
		List<LifetimeVO> lifetimeList = lService.adLifeSelect(search);
		pc.setArticleTotalCount(lService.lifetimeCnt(search));

		if(search.getCondition().equals("petId") && !search.getKeyword().equals("")) { // petId 검색한 경우: 반려견 이름 같이 전달
			Integer petId = Integer.valueOf(search.getKeyword()); 
			if(uservice.selectOnePet(petId) == null) { // 없는 반려견 검색한 경우
				model.addAttribute("msg", "noPet");
			}else { // 존재하는 petId로 검색
				model.addAttribute("petName", uservice.selectOnePet(petId).getPetName());
				model.addAttribute("lifetimeList", lifetimeList);
				model.addAttribute("pc", pc);
			}
		}else if(search.getCondition().equals("userId") && !search.getKeyword().equals("")){  //userId 검색
			if(uservice.selectOne(search.getKeyword()) == null) { // 없는 userId 검색한 경우
				model.addAttribute("msg", "noUserId");
			}else { // 존재하는 userId로 검색
				model.addAttribute("lifetimeList", lifetimeList);
				model.addAttribute("pc", pc);
			}
		}else { // 전체조회
			model.addAttribute("lifetimeList", lifetimeList);
			model.addAttribute("pc", pc);
		}					
	}
	
	
	
	
	// 갤러리 관리 페이지 열기
	@GetMapping("/gallery")
	public void gallery(SearchVO search, Model model) {
		
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 
		
		List<GalleryVO> galleryList = lService.adGalSelect(search);
		pc.setArticleTotalCount(lService.galleryCnt(search));

		if(search.getCondition().equals("petId") && !search.getKeyword().equals("")) { // petId 검색한 경우: 반려견 이름 같이 전달
			Integer petId = Integer.valueOf(search.getKeyword()); 
			if(uservice.selectOnePet(petId) == null) { // 없는 반려견 검색한 경우
				model.addAttribute("msg", "noPet");
			}else { // 존재하는 petId로 검색
				model.addAttribute("petName", uservice.selectOnePet(petId).getPetName());
				model.addAttribute("galleryList", galleryList);
				model.addAttribute("pc", pc);
			}
		}else if(search.getCondition().equals("userId") && !search.getKeyword().equals("")){  //userId 검색
			if(uservice.selectOne(search.getKeyword()) == null) { // 없는 userId 검색한 경우
				model.addAttribute("msg", "noUserId");
			}else { // 존재하는 userId로 검색
				model.addAttribute("galleryList", galleryList);
				model.addAttribute("pc", pc);
			}
		}else { // 전체조회
			model.addAttribute("galleryList", galleryList);
			model.addAttribute("pc", pc);
		}					
	}

	
	
	
	// 캘린더 관리 페이지 열기
	@GetMapping("/calendar")
	public void calendar(SearchVO search, Model model) {		
		search.setCountPerPage(20);
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 
		List<ScheduleVO> calendarList = dService.adAllSchedule(search);
		pc.setArticleTotalCount(dService.scheduleCnt(search));

		model.addAttribute("calendarList", calendarList);
		model.addAttribute("pc", pc);
	}
	
	
	
	// 견주일기 관리 페이지 열기
	@GetMapping("/diary")
	public void diary(SearchVO search, Model model) {		
		//search.setCountPerPage(20);
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 
		List<DiaryVO> diaryList = dService.adAllDiary(search);
		pc.setArticleTotalCount(dService.diaryCnt(search));

		model.addAttribute("diaryList", diaryList);
		model.addAttribute("pc", pc);
	}
	
		
	// 견주일기 삭제 
	@PostMapping("/delDiary")
	@ResponseBody
	public String delete(@RequestBody DiaryVO diary) {  		
		dService.delete(diary);		
		return "success";
	}
	
	
	
	// 커뮤니티 게시판 관리 페이지 열기
	@GetMapping("/board")
	public void board(SearchVO search, Model model) {		
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 
		List<BoardVO> boardList = bService.adAllBoard(search);
		pc.setArticleTotalCount(bService.boardCnt(search));

		model.addAttribute("boardList", boardList);
		model.addAttribute("pc", pc);
	}
	
	
	// 특정 게시글 비공개 전환 요청
	@PostMapping("/offBoard")
	@ResponseBody
	public Integer offBoard(@RequestBody BoardVO board) {
		bService.offBoard(board);				
		return board.getOpen(); 
	} 
	
	
	// 게시글 삭제 
	@PostMapping("/delBoard")
	@ResponseBody
	public String delete(@RequestBody BoardVO board) {  		
		bService.delete(board);		
		return "success";
	}
	
	
	// 커뮤니티 게시판 관리 페이지 열기
	@GetMapping("/reply")
	public void reply(SearchVO search, Model model) {	
		search.setCountPerPage(20);
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 
		List<ReplyVO> replyList = bService.adAllReply(search);
		pc.setArticleTotalCount(bService.replyCnt(search));

		model.addAttribute("replyList", replyList);
		model.addAttribute("pc", pc);
	}
	
	
	// 특정 게시글 비공개 전환 요청
	@PostMapping("/offReply")
	@ResponseBody
	public Integer offReply(@RequestBody ReplyVO reply) {
		bService.offReply(reply);				
		return reply.getOpen(); 
	} 
	
	
	
	// 단체 메일 발송
	@Autowired
	private JavaMailSenderImpl mailSender;	
	@PostMapping("/adminEmail")
	@ResponseBody
	public String adminEmail(@RequestBody EmailVO emailSend) {	
		try {
		System.out.println(emailSend.toString());
		
        String setFrom = "today.auth@gmail.com";
        String[] toMail = emailSend.getEmailList();
        String title = emailSend.getTitle();
        String content = emailSend.getContent();
   
        //try {
            
        	MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return "success";
 
	}
	
	
	
	
	// 쪽지 관리 페이지 열기
	@GetMapping("/admin_pet_msg")
	public void admin_pet_msg() {	
		
	}
	
	
	
	
}
