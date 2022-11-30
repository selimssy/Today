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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ali.today.mypet.model.GalleryPageCreator;
import com.ali.today.mypet.model.GalleryPageVO;
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
	
	
	//생애기록 추가
	@PostMapping("/uploadCard")
	@ResponseBody
	public String uploadCard(
			@RequestPart(value = "petData") LifetimeVO lifetime, HttpServletRequest request,
			@RequestPart(value = "petImg",required = false) MultipartFile file) throws Exception {
		
		System.out.println(lifetime.toString());
		
			try { // 사진 업로드				
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
		        lifetime.setImagePath("/resources/images/lifetimeCard/" + originalName);  // 앞에 경로에 /today 처리는 jsp c:url태그에서
			
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
			
        service.insertCard(lifetime);
        
		return "success";
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
	
	
	// 생애기록 수정 화면 요청
	@PostMapping("/modifyGet")
	@ResponseBody
	public LifetimeVO modifyGet(@RequestBody LifetimeVO lifetimeVO) {
		
		LifetimeVO card = service.getLifeCard(lifetimeVO.getCardId());	
		return card;
	}	
	
	
	
	
	
	//생애기록 수정
	@PostMapping("/modifyCard")
	@ResponseBody
	public String modifyCard(
			@RequestPart(value = "petData") LifetimeVO lifetime, HttpServletRequest request,
			@RequestPart(value = "petImg",required = false) MultipartFile file) throws Exception {
		
			//System.out.println(lifetime.toString());
		
			try { // 사진 업로드				
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
		        lifetime.setImagePath("/resources/images/lifetimeCard/" + originalName);  // 앞에 경로에 /today 처리는 jsp c:url태그에서
			
			} catch (NullPointerException e) { // 사진 변경 안할 경우
				String originalImage = service.getLifeCard(lifetime.getCardId()).getImagePath();
				lifetime.setImagePath(originalImage);
				e.getMessage();
			}

        service.updateCard(lifetime);
        
		return "success";
	}

	
	
	
	// 생애기록 삭제
	@PostMapping("/deleteCard")
	@ResponseBody
	public String deleteCard(@RequestBody LifetimeVO lifetimeVO) {
		service.deleteCard(lifetimeVO.getCardId());
		return "success";
	}	
	
	
	
	
	
	
	// 내 반려동물 갤러리 조회
	@GetMapping("/gallery")
	public void gallery(HttpSession session, GalleryPageVO paging, Model model) {
			
		UserVO user = (UserVO)session.getAttribute("login");
		Integer petId = user.getPet().getPetId();		
		List<GalleryVO> list = service.getGalleryList(petId, paging);
		
		GalleryPageCreator pc = new GalleryPageCreator();
		pc.setPaging(paging);
		pc.setArticleTotalCount(service.countGalleries(petId));
		
		model.addAttribute("galleryList", list);
		model.addAttribute("pc", pc);
		
	}
	
	
	
	

	/*
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
	*/
	
	//갤러리 추가
	@PostMapping("/regGallery")
	@ResponseBody
	public String regGallery(
			@RequestPart(value = "petData") GalleryVO gallery, HttpServletRequest request,
			@RequestPart(value = "petImg",required = false) MultipartFile file) throws Exception {
		
		System.out.println(gallery.toString());
		
			try { // 사진 업로드				
				String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/gallery"); //저장경로		
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
		        gallery.setImagePath("/resources/images/gallery/" + originalName);  
			
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
			
		service.register(gallery);
        
		return "success";
	}
	
	
	
	
	
	// 갤러리 수정 화면 요청
	@PostMapping("/modifyGalleryGet")
	@ResponseBody
	public GalleryVO modifyGalleryGet(@RequestBody GalleryVO gallery) {		
		GalleryVO galleryVO = service.getOneGallery(gallery.getImgId());	
		return galleryVO;
	}	
	
	
	
	
	//갤러리 수정
	@PostMapping("/modifyGallery")
	@ResponseBody
	public String modifyGallery(
			@RequestPart(value = "petData") GalleryVO gallery, HttpServletRequest request,
			@RequestPart(value = "petImg",required = false) MultipartFile file) throws Exception {
		
			System.out.println(gallery.toString());
		
			try { // 사진 업로드				
				String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/gallery"); //저장경로		
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
		        gallery.setImagePath("/resources/images/gallery/" + originalName);  // 앞에 경로에 /today 처리는 jsp c:url태그에서
			
			} catch (NullPointerException e) { // 사진 변경 안할 경우
				String originalImage = service.getOneGallery(gallery.getImgId()).getImagePath();
				gallery.setImagePath(originalImage);
				e.getMessage();
			}

        service.modifyGallery(gallery);
        
		return "success";
	}
	
	
	
	
	// 갤러리 삭제
	@PostMapping("/deleteGallery")
	@ResponseBody
	public String deleteGallery(@RequestBody GalleryVO gallery) {
		service.deleteGallery(gallery.getImgId());
		return "success";
	}	
	
	
	
	
	// 갤러리 포스터 사진 전체 조회
	@PostMapping("/posterGallery")
	@ResponseBody
	public List<GalleryVO> posterGallery(@RequestBody GalleryVO gallery){
		return service.posterGallery(gallery.getPetId());
	}
	
	
	
	
}
