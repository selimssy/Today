package com.ali.today.mypet.repository;

import java.util.List;

import com.ali.today.mypet.model.GalleryVO;



public interface IGalleryMapper {

	// 갤러리 사진 추가
	void register(GalleryVO galleryVO);  
	
	// 갤러리 사진 목록 조회
	List<GalleryVO> getGalleryList();   // 이건 페이징처리 해야될듯?
	
	
}
