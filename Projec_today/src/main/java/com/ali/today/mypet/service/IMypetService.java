package com.ali.today.mypet.service;

import java.util.List;

import com.ali.today.mypet.model.GalleryPageVO;
import com.ali.today.mypet.model.GalleryVO;
import com.ali.today.mypet.model.LifetimeVO;

public interface IMypetService {
	
	// 생애기록 카드 추가
	void insertCard(LifetimeVO LifetimeVO);  
		
	// 특정 생애기록 카드 조회
	LifetimeVO getLifeCard(Integer cardId);
		
	// 지정한 반려동물 생애기록 카드 목록 조회
	List<LifetimeVO> getLifetimeCardList(Integer petId);
	
	// 생애기록 카드 수정
	void updateCard(LifetimeVO lifetime);
	
	// 생애기록 카드 삭제
	void deleteCard(LifetimeVO lifetimeVO);
	
	
	
	
	
	//////////////////////////////////////////////////////////////////////////
	
	
	// 갤러리 사진 추가
	void register(GalleryVO galleryVO);  
	
	// 지정한 반려동물 갤러리 사진 목록 조회
	List<GalleryVO> getGalleryList(Integer petId, GalleryPageVO paging); 
	
	// 특정 사진 조회
	GalleryVO getOneGallery(Integer imgId);
	
	// 갤러리 수정
	void modifyGallery(GalleryVO gallery);
	
	//갤러리 삭제
	void deleteGallery(GalleryVO gallery);
	
	// 특정 반려동물 갤러리 수 조회
	Integer countGalleries(Integer petId);
	
	// 갤러리 포스터용 전체 조회
	List<GalleryVO> posterGallery(Integer petId);
}
