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

import com.ali.today.common.ImgUpload;
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
			
			if(file == null) { // 이미지 업로드 안 한 경우
				pet.setImagePath("/resources/images/noticeImg/infoPhoto.png");  // 앞에 경로에 /today 처리는 jsp c:url태그에서
				//pet.setImagePath(null); // db비용상 고민
			}else {
				String fileName = ImgUpload.ImgFileUpload("petRegister", file, request);
				pet.setImagePath("/resources/images/petRegister/" + fileName);  
			}		
			
			service.registerPet(pet);
	        Integer petId = service.recentPet(pet.getUserId());
	        
			return Integer.toString(petId);
	}
	
	
	
	
	// 펫 수정모달 불러오기
	@PostMapping("/modifyGet")
	public PetVO modifyGet(@RequestBody PetVO pet) {
		return service.selectOnePet(pet.getPetId());
	}	
		
	
	
	
	// 펫 정보 수정 요청
	@PostMapping("/modifyPet")
	public String modifyPet(
			@RequestPart(value="petData") PetVO pet, HttpServletRequest request,
			@RequestPart(value = "petImg",required = false) MultipartFile file) throws Exception {
			
			if(file != null) { // 이미지 변경한 경우			
				String fileName = ImgUpload.ImgFileUpload("petRegister", file, request);
				pet.setImagePath("/resources/images/petRegister/" + fileName);
			}	
			service.modifyPet(pet);	        
			return "success";		
	}
	
	
	
	
	// 반려동물 리스트창
	@PostMapping("/petList")
	public List<PetVO> petList(@RequestBody UserVO user) {
		
		//System.out.println("아이디: " + user.getUserId());	
		List<PetVO> list = service.selectAllPet(user.getUserId());
		//System.out.println(list.size());
		
		return list;
	}
	
	
	
	
	// 반려동물 삭제
	@PostMapping("/deletePet")
	public String deletePet(@RequestBody PetVO pet, HttpSession session) {
		
		UserVO user = (UserVO)session.getAttribute("login");
		Integer petId = user.getPet().getPetId(); 
		
		if(petId.equals(pet.getPetId())) { // 현재 세션에 있는 반려견을 삭제할 경우 세션도 같이 수정
			service.deletePet(pet.getPetId());
			PetVO otherPet = service.firstPet(pet.getUserId());
			user.setPet(otherPet);
			session.setAttribute("login", user);
		}else {
			service.deletePet(pet.getPetId());
		}
				
		return "success"; 
	}
	
	
	
	
	// 반려동물 선택과 세션정보
	@PostMapping("/selectPet")
	public String selectPet(@RequestBody PetVO pet, HttpSession session) {
		
		//System.out.println(pet);
		UserVO dbUser = service.UserPetInfo(pet); // 반려동물 객체 포함된 userVO
		//System.out.println(dbUser);
		
		session.setAttribute("login", dbUser); // 위의 새로운 userVO로 세션 재등록 
				
		return "success";  
	}
	
}
