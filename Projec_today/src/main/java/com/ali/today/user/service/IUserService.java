package com.ali.today.user.service;

import java.util.Date;
import java.util.List;

import com.ali.today.common.SearchVO;
import com.ali.today.user.model.PetVO;
import com.ali.today.user.model.UserVO;

public interface IUserService {
	
	// 회원가입 기능
	void register(UserVO user);
	
	// 아이디 중복체크 기능
	Integer checkId(String userId);
	
	// 이메일 중복체크 기능
	Integer checkEmail(String email);
	
	// 회원정보 수정
	void modifyUser(UserVO user);
	
	// 비밀번호 변경
	void modifyPw(UserVO user);
			
	// 회원탈퇴 기능
	void delete(String userId);
	
	// 회원정보 조회기능
	UserVO selectOne(String userId);
	
	// 전체회원 조회기능
	List<UserVO> selectAll(SearchVO search); // 관리자 페이지
	
	// 전체 회원 수
	Integer countUsers(SearchVO search); // 관리자 페이지
	
	// 자동로그인 쿠키값 DB저장 처리
	void keepLogin(String sessionId, Date limitDate, String userId);

	// 세션아이디를 통한 회원정보 조회기능
	UserVO getUserWithSessionId(String sessionId);	
	
	// 아이디 찾기 - 이메일, 이름 일치 확인
	UserVO emailName(String email);
	
	// 비밀번호 찾기 - 아이디, 이름, 이메일 일치 확인
	Integer findPwInfo(UserVO user);
	
	
	///////////////////////////////////////////////////////////////////
	
	
	// 새로운 반려동물 등록
	void registerPet(PetVO pet);
	
	// 특정 반려동물 조회
	PetVO selectOnePet(Integer petId);
	
	// 반려동물 정보 수정
	void modifyPet(PetVO pet);
	
	// 특정 반려동물 삭제
	void deletePet(Integer petId);
	
	// 내 계정에 등록된 반려동물 조회
	List<PetVO> selectAllPet(String userId);
	
	// 유저, 반려동물 세션정보 
	UserVO UserPetInfo(PetVO pet);
	
	// 공개 상태인 모든 반려동물 조회(페이징, 검색처리)
	List<PetVO> selectOpenPet(Integer page, String condition, String keyword);
	
	// 공개 상태인 반려견 수 조회(페이징, 검색처리)
	Integer countOpenPet(String condition, String keyword);
	
	// 특정 계정 첫 번째 반려견 조회
	PetVO firstPet(String userId);
	
	// 특정 계정 가장 최근 등록한 반려견 petId 조회
	Integer recentPet(String userId);
	
	
	// 전체 반려견 조회
	List<PetVO> AllPet(SearchVO search); // 관리자 페이지
			
	// 공개 상태인 반려견 수 조회
	Integer countAllPet(SearchVO search);  // 관리자 페이지
	
	// 특정 반려견 공개/비공개 전환
	void offPet(PetVO pet); // 관리자 페이지 
}
