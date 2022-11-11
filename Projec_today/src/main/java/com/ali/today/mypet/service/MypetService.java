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
	
	
	
	@Override
	public void insertCard(LifetimeVO LifetimeVO) {
		mapper.insertCard(LifetimeVO);
	}

	@Override
	public List<LifetimeVO> getLifetimeCardList(Integer petId) {
		return mapper.getLifetimeCardList(petId);
	}
	
	
	@Override
	public void register(GalleryVO galleryVO) {
		gmapper.register(galleryVO);

	}

	@Override
	public List<GalleryVO> getGalleryList(Integer petId) {
		return gmapper.getGalleryList(petId); // 페이징처리 후 수정하자~
	}

}
