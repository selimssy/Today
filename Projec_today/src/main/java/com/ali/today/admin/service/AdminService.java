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
	public Map<String, Integer> contentStats(SearchVO search) {
		Integer lifetimeCnt = lMapper.lifetimeCnt(search);  // 전체 생애기록 카드 수
		Integer galleryCnt = gMapper.galleryCnt(search); // 갤러리
		Integer scheduleCnt = dMapper.scheduleCnt(search); // 캘린더
		Integer diaryCnt = dMapper.diaryCnt(search); // 견주일기
		Integer boardCnt = bMapper.boardCnt(search); // 게시판
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
	public Map<String, Object> petContent(SearchVO search) {
		Integer lifePetCnt = lMapper.lifetimeCnt(search);
		Integer galleryPetCnt = gMapper.galleryCnt(search);
		
		Map<String, Object> petContent = new HashMap<>();
		petContent.put("lifePetCnt", lifePetCnt);
		petContent.put("galleryPetCnt", galleryPetCnt);
		return petContent;
	}
	
	
	
	

	
	
	
}
