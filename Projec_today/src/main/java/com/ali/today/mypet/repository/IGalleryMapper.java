package com.ali.today.mypet.repository;

import java.util.List;
import java.util.Map;

import com.ali.today.mypet.model.GalleryVO;



public interface IGalleryMapper {

	// 갤러리 사진 추가
	void register(GalleryVO galleryVO);  
	
	// 특정 반려동물 갤러리 사진 목록 조회
	List<GalleryVO> getGalleryList(Map<String, Integer> data);   
	
	// 특정 사진 조회
	GalleryVO getOneGallery(Integer imgId);
	
	// 갤러리 수정
	void modifyGallery(GalleryVO gallery);
	
	//갤러리 삭제
	void deleteGallery(Integer imgId);
	
	// 특정 반려동물 갤러리 수 조회
	Integer countGalleries(Integer petId);
	
	// 갤러리 포스터용 전체 조회
	List<GalleryVO> posterGallery(Integer petId);
	
    // 회원 탈퇴시 갤러리 전체 삭제
	void deleteAllGallery(String userId);
	
	// 반려견 삭제시 해당 반려견 갤러리 전부 삭제
	void deleteAllPetGallery(Integer petId);
	
	// 전체(특정 계정) 갤러리 갯수
	Integer galleryCnt(String userId); // 관리자 페이지
}
