package com.ali.today.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ali.today.common.SearchVO;
import com.ali.today.community.repository.IBoardMapper;
import com.ali.today.diary.model.ScheduleVO;
import com.ali.today.diary.repository.IDiaryMapper;
import com.ali.today.mypet.repository.IGalleryMapper;
import com.ali.today.mypet.repository.IMypetMapper;

@Service
public class AdminService implements IAdminService {
	
	@Autowired
	private IMypetMapper lMapper; 	 
	@Autowired
	private IGalleryMapper gMapper; 
	@Autowired
	private IBoardMapper bMapper;
	@Autowired
	private IDiaryMapper dMapper;
	
	
	// 컨텐츠 현황(계정별) 조회
	@Override
	public Map<String, Integer> contentStats(String userId) {
		Integer lifetimeCnt = lMapper.lifetimeCnt(userId);  // 전체 생애기록 카드 수
		Integer galleryCnt = gMapper.galleryCnt(userId); // 갤러리
		Integer scheduleCnt = dMapper.scheduleCnt(userId); // 캘린더
		Integer diaryCnt = dMapper.diaryCnt(userId); // 견주일기
		Integer boardCnt = bMapper.boardCnt(userId); // 게시판
		//Integer replyCnt = bMapper.replyCnt(userId); // 댓글
		
		Map<String, Integer> contentStats = new HashMap<>();
		contentStats.put("lifetimeCnt", lifetimeCnt);
		contentStats.put("galleryCnt", galleryCnt);
		contentStats.put("scheduleCnt", scheduleCnt);
		contentStats.put("diaryCnt", diaryCnt);
		contentStats.put("boardCnt", boardCnt);
		//contentStats.put("replyCnt", replyCnt);
		
		return contentStats;
	}
	
	
	// 컨텐츠 현황(반려견별) 조회
	@Override
	public Map<String, Object> petContent(Integer petId) {
		Integer lifePetCnt = lMapper.lifePetCnt(petId);
		Integer galleryPetCnt = gMapper.galleryPetCnt(petId);
		
		Map<String, Object> petContent = new HashMap<>();
		petContent.put("lifePetCnt", lifePetCnt);
		petContent.put("galleryPetCnt", galleryPetCnt);
		return petContent;
	}
	
	
	
	

	
	
	
}
