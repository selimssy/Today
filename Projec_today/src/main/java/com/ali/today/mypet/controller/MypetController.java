package com.ali.today.mypet.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ali.today.mypet.model.GalleryVO;
import com.ali.today.mypet.model.LifetimeVO;
import com.ali.today.mypet.service.IMypetService;
import com.ali.today.user.model.UserVO;


@Controller
@RequestMapping("/mypet")
public class MypetController {
	
	
	@Autowired
	private IMypetService service;
	
	
	
	// 나의 반려동물 생애기록 전체 조회
	@GetMapping("/lifetime")
	public void mypet(HttpSession session, Model model) {
		
		UserVO user = (UserVO)session.getAttribute("login");

		Integer petId = user.getPet().getPetId();
		
		List<LifetimeVO> list = service.getLifetimeCardList(petId);
		model.addAttribute("cards", list);
		
	}
	
	
	

	
	/*
	// 생애기록 추가
	@PostMapping("/uploadCard")
	public String uploadCard(LifetimeVO lifetimeVO, MultipartFile file, HttpServletRequest request,
			@RequestParam("Ldate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date) throws Exception {
		
		System.out.println(lifetimeVO.toString());
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/lifetimeCard"); //저장경로
		
		//파일 원본 이름 저장
        String originalName = file.getOriginalFilename();     
        // uuid 생성 
        UUID uuid = UUID.randomUUID();     
        //savedName 변수에 uuid + 원래 이름 추가
        String savedName = uuid.toString() + "_" + originalName;      
        //uploadPath경로의 savedName 파일에 대한 file 객체 생성
        File target = new File(uploadPath, savedName);      
        //fileData의 내용을 target에 복사함
        FileCopyUtils.copy(file.getBytes(), target);
        originalName = savedName;
        
        lifetimeVO.setImagePath("/resources/images/lifetimeCard/" + originalName);  // 앞에 경로에 /today 처리는 jsp c:url태그에서
        lifetimeVO.setDate(date);
		
        service.insertCard(lifetimeVO);
        
		return "redirect:/mypet/lifetime";
	}
	*/
	
	
	
	
	
	
	// 내 반려동물 갤러리 조회
	@GetMapping("/gallery")
	public void gallery(HttpSession session, Model model) {
			
		UserVO user = (UserVO)session.getAttribute("login");

		Integer petId = user.getPet().getPetId();
		
		List<GalleryVO> list = service.getGalleryList(petId);
		model.addAttribute("galleryList", list);
		
	}
	
	
	
	// 갤러리 추가
	@PostMapping("/regGallery")
	public String regGallery(GalleryVO galleryVO, MultipartFile file, HttpServletRequest request) throws Exception {
		
		System.out.println(galleryVO.toString());
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/gallery"); 
		
		//파일 원본 이름 저장
        String originalName = file.getOriginalFilename();     
        // uuid 생성 
        UUID uuid = UUID.randomUUID();     
        //savedName 변수에 uuid + 원래 이름 추가
        String savedName = uuid.toString() + "_" + originalName;      
        //uploadPath경로의 savedName 파일에 대한 file 객체 생성
        File target = new File(uploadPath, savedName);      
        //fileData의 내용을 target에 복사함
        FileCopyUtils.copy(file.getBytes(), target);
        originalName = savedName;
        
        galleryVO.setImagePath("/resources/images/gallery/" + originalName);  
  
		
        service.register(galleryVO);
		
		return "redirect:/mypet/gallery";
	}
	
	
	
	
	
	
	
	
	
}
