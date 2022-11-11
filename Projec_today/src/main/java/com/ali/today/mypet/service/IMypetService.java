package com.ali.today.mypet.service;

import java.util.List;

import com.ali.today.mypet.model.GalleryVO;
import com.ali.today.mypet.model.LifetimeVO;

public interface IMypetService {
	
	// 생애기록 카드 추가
	void insertCard(LifetimeVO LifetimeVO);  
	
	// 지정한 반려동물 생애기록 카드 목록 조회
	List<LifetimeVO> getLifetimeCardList(Integer petId);
	
	// 갤러리 사진 추가
	void register(GalleryVO galleryVO);  
	
	// 지정한 반려동물 갤러리 사진 목록 조회
	List<GalleryVO> getGalleryList(Integer petId); 
}
