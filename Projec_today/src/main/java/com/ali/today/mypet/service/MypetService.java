package com.ali.today.mypet.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ali.today.mypet.model.GalleryPageVO;
import com.ali.today.mypet.model.GalleryVO;
import com.ali.today.mypet.model.LifetimeVO;
import com.ali.today.mypet.repository.IGalleryMapper;
import com.ali.today.mypet.repository.IMypetMapper;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.repository.IUserMapper;


@Service
public class MypetService implements IMypetService {
	
	@Autowired
	private IMypetMapper mapper;	
	@Autowired
	private IGalleryMapper gmapper;
	@Autowired
	private IUserMapper umapper;

	
	
	// 생애기록 추가
	@Transactional
	@Override
	public void insertCard(LifetimeVO LifetimeVO) {						
		mapper.insertCard(LifetimeVO);	
		umapper.upContentsCnt(LifetimeVO.getUserId()); // 컨텐츠 수 증가
	}
	
	
	// 특정 반려동물 생애기록 조회
	@Override
	public List<LifetimeVO> getLifetimeCardList(Integer petId) {
		return mapper.getLifetimeCardList(petId);
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

	
	// 생애기록 삭제
	@Transactional
	@Override
	public void deleteCard(LifetimeVO lifetimeVO) {
		mapper.deleteCard(lifetimeVO.getCardId());
		umapper.downContentsCnt(lifetimeVO.getUserId()); // 컨텐츠 수 감소
	}

	
	
	
	//////////////////////////////////////////////////////////
	
	
	
	// 갤러리 추가
	@Transactional
	@Override
	public void register(GalleryVO galleryVO) {
		gmapper.register(galleryVO);
		umapper.upContentsCnt(galleryVO.getUserId()); // 컨텐츠 수 증가
	}
	
	
	// 특정 반려동물 갤러리 조회
	@Override
	public List<GalleryVO> getGalleryList(Integer petId, GalleryPageVO paging) {
		
		Map<String, Integer> data = new HashMap<>();
		data.put("petId", petId);
		data.put("pageStart", paging.getPageStart());
		
		return gmapper.getGalleryList(data); 
	}

		
	
	// 특정 사진 조회
	@Override
	public GalleryVO getOneGallery(Integer imgId) {
		return gmapper.getOneGallery(imgId);
	}

	
	// 갤러리 수정
	@Override
	public void modifyGallery(GalleryVO gallery) {
		gmapper.modifyGallery(gallery);
	}

	
	// 갤러리 삭제
	@Transactional
	@Override
	public void deleteGallery(GalleryVO gallery) {
		gmapper.deleteGallery(gallery.getImgId());
		umapper.downContentsCnt(gallery.getUserId());
	}

	
	// 특정 반려동물 갤러리 수 조회
	@Override
	public Integer countGalleries(Integer petId) {
		return gmapper.countGalleries(petId);
	}

	
	// 갤러리 포스터용 전체 조회
	@Override
	public List<GalleryVO> posterGallery(Integer petId) {
		return gmapper.posterGallery(petId);
	}

}
