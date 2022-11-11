package com.ali.today.user.repository;

import java.util.List;
import java.util.Map;

import com.ali.today.user.model.PetVO;
import com.ali.today.user.model.UserVO;

public interface IUserMapper {
	
	// 회원가입 기능
	void register(UserVO user);
	
	// 아이디 중복체크 기능
	Integer checkId(String userId);
	
	// 회원탈퇴 기능
	void delete(String userId);
	
	// 회원정보 조회기능
	UserVO selectOne(String userId);
	
	// 전체회원 조회기능
	List<UserVO> selectAll();
	
	// 자동로그인 쿠키값 DB저장 처리
	void keepLogin(Map<String, Object> datas);
	
	// 세션아이디를 통한 회원정보 조회기능
	UserVO getUserWithSessionId(String sessionId);

	
	
	
	
	///////////////////////////////////////////////////////////
	
	
	// 새로운 반려동물 등록
	void registerPet(PetVO pet);
	
	// 내 계정에 등록된 반려동물 조회
	List<PetVO> selectAllPet(String userId);
	
	
	// 유저, 반려동물 세션정보 
	UserVO UserPetInfo();
	
}
