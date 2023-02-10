package com.ali.today.mypet.repository;

import java.util.List;

import com.ali.today.common.SearchVO;
import com.ali.today.mypet.model.LifetimeVO;



public interface IMypetMapper {
	
	// 생애기록 카드 추가
	void insertCard(LifetimeVO LifetimeVO);  
	
	// 특정 생애기록 카드 조회
	LifetimeVO getLifeCard(Integer cardId);
	
	// 특정 반려동물 생애기록 카드 목록 조회
	List<LifetimeVO> getLifetimeCardList(Integer petId);
	
	// 생애기록 카드 수정
	void updateCard(LifetimeVO lifetime);
	
	// 생애기록 카드 삭제
	void deleteCard(Integer cardId);
	
	// 회원탈퇴시 생애기록 전체 삭제
	void deleteAllCard(String userId);
	
	// 반려견 삭제시 해당 반려견 생애기록 전부 삭제
	void deleteAllPetCard(Integer petId);
	
	// 전체(특정 계정) 생애기록 갯수
	Integer lifetimeCnt(SearchVO search); // 관리자 페이지
	
	// 전체(반려견별) 생애기록 갯수
	//Integer lifePetCnt(SearchVO search); // 관리자 페이지
}
