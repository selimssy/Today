package com.ali.today.mypet.controller;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ali.today.mypet.model.LifetimeVO;
import com.ali.today.mypet.service.IMypetService;
import com.ali.today.user.model.PetVO;

@RestController
public class AjaxMypetController {
	
	@Autowired
	IMypetService mypetService;
	
	
	
	//생애기록 추가
		@PostMapping("/mypet/uploadCard")
		public String registerPet(
				@RequestPart(value = "petData") LifetimeVO lifetime, HttpServletRequest request,
				@RequestPart(value = "petImg",required = false) MultipartFile file) throws Exception {
			
			System.out.println(lifetime.toString());
			
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
	        //lifetime.setDate(date);
	        //lifetime.setDate(new Date());
			
	        mypetService.insertCard(lifetime);
	        
			return "success";
		}
		
		
	
}
