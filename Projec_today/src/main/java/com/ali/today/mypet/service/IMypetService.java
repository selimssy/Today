package com.ali.today.mypet.service;

import java.util.List;

import com.ali.today.mypet.model.GalleryVO;
import com.ali.today.mypet.model.LifetimeVO;

public interface IMypetService {
	
	// 생애기록 카드 추가
	void insertCard(LifetimeVO LifetimeVO);  
	
	// 생애기록 카드 목록 조회
	List<LifetimeVO> getLifetimeCardList();
	
	// 갤러리 사진 추가
	void register(GalleryVO galleryVO);  
	
	// 갤러리 사진 목록 조회
	List<GalleryVO> getGalleryList(); 
}
