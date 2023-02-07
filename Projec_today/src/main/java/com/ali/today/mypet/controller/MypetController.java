package com.ali.today.mypet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ali.today.common.ImgUpload;
import com.ali.today.mypet.model.GalleryPageCreator;
import com.ali.today.mypet.model.GalleryPageVO;
import com.ali.today.mypet.model.GalleryVO;
import com.ali.today.mypet.model.LifetimeVO;
import com.ali.today.mypet.service.IMypetService;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.service.IUserService;


@Controller
@RequestMapping("/mypet")
public class MypetController {
	
	
	@Autowired
	private IMypetService service;
	@Autowired
	private IUserService uservice;
	
	
	
	// 나의 반려동물 생애기록 전체 조회
	@GetMapping("/lifetime")
	public void mypet(HttpSession session, Model model) {
	
			if(session.getAttribute("login") == null) { //로그인 안 한 경우
				model.addAttribute("msg", "notLogin");
			}else { //로그인 한 경우				
				UserVO user = (UserVO)session.getAttribute("login");				
				if(user.getPet() == null) {   //등록된 반려견 없는 경우
					model.addAttribute("msg", "petNone");						
				}else {   //등록된 반려견 있는 경우
					Integer petId = user.getPet().getPetId(); 
					List<LifetimeVO> list = service.getLifetimeCardList(petId);
					model.addAttribute("cards", list);
					model.addAttribute("pet", uservice.selectOnePet(petId));
				}			
			}		
	}
	
	
	
	
	//생애기록 추가
	@PostMapping("/uploadCard")
	@ResponseBody
	public String uploadCard(
			@RequestPart(value = "petData") LifetimeVO lifetime, HttpServletRequest request,
			@RequestPart(value = "petImg",required = false) MultipartFile file) throws Exception {							

			if(file == null) { // 이미지 업로드 안 한 경우
				lifetime.setImagePath("/resources/images/noticeImg/no_image.webp");  // 앞에 경로에 /today 처리는 jsp c:url태그에서
				//lifetime.setImagePath(null); // db비용상 고민
			}else {
				String fileName = ImgUpload.ImgFileUpload("lifetimeCard", file, request);
		        lifetime.setImagePath("/resources/images/lifetimeCard/" + fileName);  
			}		
	        
	        service.insertCard(lifetime);
	        return "success";
	}

	
	
	
	
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
			
			if(file != null) { // 이미지 변경한 경우			
				String fileName = ImgUpload.ImgFileUpload("lifetimeCard", file, request);
		        lifetime.setImagePath("/resources/images/lifetimeCard/" + fileName);
			}

			service.updateCard(lifetime);
			return "success";
	}

	
	
	
	// 생애기록 삭제
	@PostMapping("/deleteCard")
	@ResponseBody
	public String deleteCard(@RequestBody LifetimeVO lifetimeVO) {
		service.deleteCard(lifetimeVO);
		return "success";
	}	
	
	
	
	// 내 반려동물 갤러리 조회
	@GetMapping("/gallery")
	public void gallery(HttpSession session, GalleryPageVO paging, Model model) {
		
		if(session.getAttribute("login") == null) { //로그인 안 한 경우
			model.addAttribute("msg", "notLogin");

		}else { //로그인 한 경우				
			UserVO user = (UserVO)session.getAttribute("login");				
			if(user.getPet() == null) {   //등록된 반려견 없는 경우
				model.addAttribute("msg", "petNone");						
			}else {   //등록된 반려견 있는 경우
				Integer petId = user.getPet().getPetId(); 
				List<GalleryVO> list = service.getGalleryList(petId, paging);				
				GalleryPageCreator pc = new GalleryPageCreator();
				pc.setPaging(paging);
				pc.setArticleTotalCount(service.countGalleries(petId));
				
				model.addAttribute("pet", uservice.selectOnePet(petId));
				model.addAttribute("galleryList", list);
				model.addAttribute("pc", pc);
			}			
		}
				
	}
	
	
	
	
	
	//갤러리 추가
	@PostMapping("/regGallery")
	@ResponseBody
	public String regGallery(
			@RequestPart(value = "petData") GalleryVO gallery, HttpServletRequest request,
			@RequestPart(value = "petImg",required = false) MultipartFile file) throws Exception {
			
			if(file == null) { // 이미지 업로드 안 한 경우
				gallery.setImagePath("/resources/images/noticeImg/no_image.webp");  // 앞에 경로에 /today 처리는 jsp c:url태그에서
				//gallery.setImagePath(null);
			}else {
				String fileName = ImgUpload.ImgFileUpload("gallery", file, request);
				gallery.setImagePath("/resources/images/gallery/" + fileName);  
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
		
			if(file != null) { // 이미지 변경한 경우			
				String fileName = ImgUpload.ImgFileUpload("gallery", file, request);
				gallery.setImagePath("/resources/images/gallery/" + fileName);
			}
	
			service.modifyGallery(gallery);
			return "success";					
	}
	
	
	
	
	// 갤러리 삭제
	@PostMapping("/deleteGallery")
	@ResponseBody
	public String deleteGallery(@RequestBody GalleryVO gallery) {
		service.deleteGallery(gallery);
		return "success";
	}	
	
	
	
	
	// 갤러리 포스터 사진 전체 조회
	@PostMapping("/posterGallery")
	@ResponseBody
	public List<GalleryVO> posterGallery(@RequestBody GalleryVO gallery){
		return service.posterGallery(gallery.getPetId());
	}
	
	
	
	
}
