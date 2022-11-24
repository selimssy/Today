package com.ali.today.mypet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ali.today.mypet.model.GalleryVO;
import com.ali.today.mypet.model.LifetimeVO;
import com.ali.today.mypet.repository.IGalleryMapper;
import com.ali.today.mypet.repository.IMypetMapper;


@Service
public class MypetService implements IMypetService {
	
	@Autowired
	private IMypetMapper mapper;
	
	@Autowired
	private IGalleryMapper gmapper;
	
	
	// 생애기록 추가
	@Override
	public void insertCard(LifetimeVO LifetimeVO) {
		
		mapper.insertCard(LifetimeVO);
	}
	
	
	// 특정 반려동물 생애기록 조회
	@Override
	public List<LifetimeVO> getLifetimeCardList(Integer petId) {
		return mapper.getLifetimeCardList(petId);
	}
	
	
	
	// 갤러리 추가
	@Override
	public void register(GalleryVO galleryVO) {
		gmapper.register(galleryVO);

	}
	
	
	// 특정 반려동물 갤러리 조회
	@Override
	public List<GalleryVO> getGalleryList(Integer petId) {
		return gmapper.getGalleryList(petId); // 페이징처리 후 수정하자~
	}

	
	// 특정 생애카드 조회
	@Override
	public LifetimeVO getLifeCard(Integer cardId) {
		return mapper.getLifeCard(cardId);
	}

	
	// 생애카드 수정
	@Override
	public void updateCard(LifetimeVO lifetime) {
		mapper.updateCard(lifetime);
	}

}
