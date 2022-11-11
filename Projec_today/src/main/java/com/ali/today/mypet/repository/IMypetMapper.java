package com.ali.today.mypet.repository;

import java.util.List;

import com.ali.today.mypet.model.LifetimeVO;



public interface IMypetMapper {
	
	// 생애기록 카드 추가
	void insertCard(LifetimeVO LifetimeVO);  
	
	// 특정 반려동물 생애기록 카드 목록 조회
	List<LifetimeVO> getLifetimeCardList(Integer petId);
	
}
