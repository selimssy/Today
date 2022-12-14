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
	
	// 회원정보 수정
	void modifyUser(UserVO user);
	
	// 비밀번호 변경
	void modifyPw(UserVO user);
	
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
	
	// 반려동물 정보 수정
	void modifyPet(PetVO pet);
	
	// 특정 반려동물 조회
	PetVO selectOnePet(Integer petId);
	
	// 특정 반려동물 삭제
	void deletePet(Integer petId);
	
	// 내 계정에 등록된 반려동물 조회
	List<PetVO> selectAllPet(String userId);
	
	//회원 탈퇴시 내 계정의 모든 반려동물 삭제
	void deleteUserPet(String userId);
	
	// 유저, 반려동물 세션정보 
	UserVO UserPetInfo(PetVO pet);
	
	// 공개 상태인 모든 반려동물 조회
	List<PetVO> selectOpenPet(Map<String, Object> datas);
	
	// 공개 상태인 반려견 수 조회
	Integer countOpenPet(Map<String, Object> datas);
	
	// 특정 계정 첫 번째 반려견 조회
	PetVO firstPet(String userId);
	
	// 특정 계정 가장 최근 등록한 반려견 petId 조회
	Integer recentPet(String userId);
	
}
