package com.ali.today.user.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ali.today.user.model.PetVO;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.service.IUserService;

@RestController
@RequestMapping("/user")
public class UserPetController {
	
	@Autowired
	IUserService service;
	

	
	//새로운 펫 등록 요청
	@PostMapping("/registerPet")
	public String registerPet(
			@RequestPart(value="petData") PetVO pet, HttpServletRequest request,
			@RequestPart(value = "petImg",required = false) MultipartFile file) throws Exception {
		
		// 사진 등록했을 경우
		try {
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/petRegister"); //저장경로
			
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
	        
	        pet.setImagePath("/resources/images/petRegister/" + originalName);
		} catch (Exception e) {
			pet.setImagePath("/resources/images/noticeImg/infoPhoto.png");
		}
		
		
        service.registerPet(pet);
        
		return "success";
	}
	
	
	
	
	// 펫 정보 수정 요청
	@PostMapping("/modifyPet")
	public String modifyPet(
			@RequestPart(value="petData") PetVO pet, HttpServletRequest request,
			@RequestPart(value = "petImg",required = false) MultipartFile file) throws Exception {
			
			System.out.println(pet.toString());
		
			HttpSession session = request.getSession();
		
		try {
			// 사진 변경했을 경우
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/petRegister"); //저장경로			
	        String originalName = file.getOriginalFilename();     	        
	        UUID uuid = UUID.randomUUID();     	     
	        String savedName = uuid.toString() + "_" + originalName;           
	        File target = new File(uploadPath, savedName);          
	        FileCopyUtils.copy(file.getBytes(), target);
	        originalName = savedName;        
	        pet.setImagePath("/resources/images/petRegister/" + originalName);
		} catch (NullPointerException e) {
			// 사진 변경 안했을 경우
			UserVO user = (UserVO)session.getAttribute("login");
			Integer petId = user.getPet().getPetId();
			String originalImage = service.selectOnePet(petId).getImagePath();
			pet.setImagePath(originalImage);			
		}
		
        service.modifyPet(pet);
        
		return "success";
	}
	
	
	
	
	// 반려동물 리스트창
	@PostMapping("/petList")
	public List<PetVO> petList(@RequestBody UserVO user) {
		
		System.out.println("아이디: " + user.getUserId());
		
		List<PetVO> list = service.selectAllPet(user.getUserId());
		
		System.out.println(list.size());
		
		return list;
	}
	
	
	
	// 반려동물 삭제
	@PostMapping("/deletePet")
	public String deletePet(@RequestBody PetVO pet) {
		service.deletePet(pet.getPetId());
		return "success"; 
	}
	
	
	
	
	// 반려동물 선택과 세션정보
	@PostMapping("/selectPet")
	public String selectPet(@RequestBody PetVO pet, HttpSession session) {
		
		//System.out.println(pet);
		UserVO dbUser = service.UserPetInfo(pet); // 반려동물 객체 포함된 userVO
		System.out.println(dbUser);
		
		session.setAttribute("login", dbUser); // 위의 새로운 userVO로 세션 재등록 
				
		return "success";  
	}
	
}
