package com.ali.today.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ali.today.common.SearchVO;
import com.ali.today.diary.repository.IDiaryMapper;
import com.ali.today.mypet.repository.IGalleryMapper;
import com.ali.today.mypet.repository.IMypetMapper;
import com.ali.today.user.model.PetVO;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.repository.IUserMapper;

@Service
public class UserService implements IUserService{
	
	@Autowired
	private IUserMapper mapper;
	@Autowired
	private IMypetMapper pmapper;
	@Autowired
	private IGalleryMapper gmapper;
	@Autowired
	private IDiaryMapper dmapper;
	
	
	@Override
	public void register(UserVO user) {
		
		// 회원 비밀번호 암호화 인코딩
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		//System.out.println("암호화 전 PW : " + user.getPassword());
		
		// 비밀번호를 암호화하여 다시 user 객체에 저장
		String securePw = encoder.encode(user.getPassword());
		user.setPassword(securePw);
		//System.out.println("암호화 후 PW : " + securePw);
		
		mapper.register(user);		
		
	}

	@Override
	public Integer checkId(String userId) {
		return mapper.checkId(userId);
	}
	
	
	// 회원정보 수정
	@Override
	public void modifyUser(UserVO user) {
		mapper.modifyUser(user);
	}
	
	
	// 비밀번호 변경
	@Override
	public void modifyPw(UserVO user) {
		// 비밀번호 암호화 인코딩
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// 암호화된 비밀번호 user 객체에 저장
		String securePw = encoder.encode(user.getPassword());
		user.setPassword(securePw);

		mapper.modifyPw(user);
	}

	
	// 회원탈퇴와 모든 정보 삭제
	@Transactional
	@Override
	public void delete(String userId) {		
		pmapper.deleteAllCard(userId);  // 생애기록
		gmapper.deleteAllGallery(userId); // 갤러리
		dmapper.deleteAllSchedule(userId); // 캘린더
		dmapper.deleteAllDiary(userId); // 일기
		mapper.deleteUserPet(userId);  // 반려견
		mapper.delete(userId);
		// 게시판은 알 수 없음으로?
	}
	
	
	// 회원정보 조회기능
	@Override
	public UserVO selectOne(String userId) {
		return mapper.selectOne(userId);
	}
	
	
	// 전체회원 조회기능
	@Override
	public List<UserVO> selectAll(SearchVO search) {
		return mapper.selectAll(search);
	}
	
	// 전체회원 수
	@Override
	public Integer countUsers(SearchVO search) {		
		return mapper.countUsers(search);
	}
	
	
	// 자동로그인 쿠키값 DB저장 처리
	@Override
	public void keepLogin(String sessionId, Date limitDate, String userId) {
		
		Map<String, Object> datas = new HashMap<>();
		datas.put("sessionId", sessionId);
		datas.put("limitTime", limitDate);
		datas.put("userId", userId);
		
		// Mapper에게 데이터 여러개를 보내줄 때는 1.객체 2.Map 둘 중 하나로
		mapper.keepLogin(datas);  // 이 경우는 service와 IMapper의 매개변수가 다른 경우이다
	}

	
	// 세션아이디를 통한 회원정보 조회기능
	@Override
	public UserVO getUserWithSessionId(String sessionId) {
		return mapper.getUserWithSessionId(sessionId);
	}

	@Override
	public void registerPet(PetVO pet) {
		mapper.registerPet(pet);
	}

	@Override
	public List<PetVO> selectAllPet(String userId) {
		return mapper.selectAllPet(userId);
	}	
	
	@Override
	public UserVO UserPetInfo(PetVO pet) {
		return mapper.UserPetInfo(pet);
	}

	@Override
	public void modifyPet(PetVO pet) {
		mapper.modifyPet(pet);
	}

	@Override
	public PetVO selectOnePet(Integer petId) {
		return mapper.selectOnePet(petId);
	}

	@Override
	public void deletePet(Integer petId) {
		mapper.deletePet(petId);
	}
	
	// 공개 상태 반려견 조회
	@Override
	public List<PetVO> selectOpenPet(Integer page, String condition, String keyword) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("pageStart", (page - 1) * 9);
		datas.put("condition", condition);
		datas.put("keyword", keyword);
		//Integer pageStart = (page - 1) * 9;
		
		return mapper.selectOpenPet(datas);
	}
	
	// 공개 상태인 반려견 수 조회
	@Override
	public Integer countOpenPet(String condition, String keyword) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("condition", condition);
		datas.put("keyword", keyword);
		return mapper.countOpenPet(datas);
	}
	
	// 특정 계정 첫 번째 반려견 조회
	@Override
	public PetVO firstPet(String userId) {
		return mapper.firstPet(userId);
	}	
	
	// 특정 계정 가장 최근 등록한 반려견 petId 조회
	@Override
	public Integer recentPet(String userId) {
		return mapper.recentPet(userId);
	}
	
}
