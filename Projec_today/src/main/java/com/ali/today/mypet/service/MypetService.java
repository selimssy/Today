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
	public List<LifetimeVO> getLifetimeCardList() {
		return mapper.getLifetimeCardList();
	}
	
	
	@Override
	public void register(GalleryVO galleryVO) {
		gmapper.register(galleryVO);

	}

	@Override
	public List<GalleryVO> getGalleryList() {
		return gmapper.getGalleryList(); // 페이징처리 후 수정하자~
	}

}
