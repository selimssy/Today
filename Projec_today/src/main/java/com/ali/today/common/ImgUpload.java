package com.ali.today.common;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class ImgUpload {
	
	public static String ImgFileUpload(String pathFolder, MultipartFile file, HttpServletRequest request) throws IOException {
						
		// 저장경로	
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/" + pathFolder);		
		//파일 원본 이름 저장
		String fileName = file.getOriginalFilename();     
        // uuid 생성 
        UUID uuid = UUID.randomUUID();     
        //savedName 변수에 uuid + 원래 이름 추가
        String savedName = uuid.toString() + "_" + fileName;      
        //uploadPath경로의 savedName 파일에 대한 file 객체 생성
        File target = new File(uploadPath, savedName);      
        //fileData의 내용을 target에 복사함
        FileCopyUtils.copy(file.getBytes(), target);
        fileName = savedName;	
        
        return fileName;
	}
	
}
