package com.ali.today.diary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ali.today.common.SearchVO;
import com.ali.today.diary.model.DateData;
import com.ali.today.diary.model.DiaryVO;
import com.ali.today.diary.model.ScheduleVO;
import com.ali.today.diary.repository.IDiaryMapper;
import com.ali.today.user.repository.IUserMapper;



@Service
public class DiaryService implements IDiaryService{
	
	@Autowired
	private IDiaryMapper mapper;
	@Autowired
	private IUserMapper umapper;
	
		
	// 스케줄 추가
	@Override
	public void insertSchedule(ScheduleVO scheduleVO) {
		mapper.insertSchedule(scheduleVO);
		umapper.upContentsCnt(scheduleVO.getUserId()); // 컨텐츠 수 증가
	}
		
	// 해당 날짜 스케줄 수
	@Override
	public Integer countSchedule(ScheduleVO scheduleVO) {
		return mapper.countSchedule(scheduleVO);
	}
		
	// 특정 날짜 스케줄 조회
	@Override
	public List<ScheduleVO> getOnedaySchedules(String userId, DateData dateData) {
		
		Map<String, Object> datas = new HashMap<>();
		datas.put("userId", userId);
		datas.put("db_startDate", dateData.getDb_startDate());
		datas.put("db_endDate", dateData.getDb_endDate());
		
		return mapper.getOnedaySchedules(datas);
	}
		
	// 특정 스케줄 조회
	@Override
	public ScheduleVO getOnePlan(Integer scheduleId) {
		return mapper.getOnePlan(scheduleId);
	}
		
	// 스케줄 수정
	@Override
	public void modifySchedule(ScheduleVO scheduleVO) {
		mapper.modifySchedule(scheduleVO);
	}
	
	// 스케줄 삭제
	@Override
	public void deleteSchedule(ScheduleVO scheduleVO) {
		mapper.deleteSchedule(scheduleVO.getScheduleId());
		umapper.downContentsCnt(scheduleVO.getUserId()); // 컨텐츠 수 감소
	}
	
	
	
	// 캘린더(계정별) 조회
	@Override
	public List<ScheduleVO> adAllSchedule(SearchVO search) {
		return mapper.adAllSchedule(search);
	}
		
	// 캘린더(계정별) 갯수 조회
	@Override
	public Integer scheduleCnt(SearchVO search) {
		return mapper.scheduleCnt(search);
	}
	
	///////////////////////////////////////////////////////////////////////////
	
	
	
	
	// 일기 추가
	@Override
	public void insert(DiaryVO diary) {
		
		// 썸네일 경로 넣는 작업
		String content = diary.getContent();
		String imgReg = "(<img[^>]*src\s*=\s*[\"']?([^>\"\']+)[\"']?[^>]*>)";
		Pattern pattern = Pattern.compile(imgReg);
		Matcher matcher = pattern.matcher(content);
		if(matcher.find()) {
			diary.setThumbImg(matcher.group(2));
		}		
		
		mapper.insert(diary);
		umapper.upContentsCnt(diary.getWriter()); // 컨텐츠 수 증가
	}

	
	
	// 일기 상세조회
	@Override
	public DiaryVO getDiary(Integer diaryNo) {
		return mapper.getDiary(diaryNo);
	}


	// 일기 삭제
	@Override
	public void delete(DiaryVO diary) {
		mapper.delete(diary.getDiaryNo());
		umapper.downContentsCnt(diary.getWriter()); // 컨텐츠 수 감소
	}


	
	// 전체 일기 리스트
	@Override
	public List<DiaryVO> getDiaryList(String userId, SearchVO search) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("userId", userId);
		datas.put("pageStart", search.getPageStart());
		datas.put("condition", search.getCondition());
		datas.put("keyword", search.getKeyword());
		List<DiaryVO> list = mapper.getDiaryList(datas);
		
		// 1일 이내 신규 글 new마크 처리 로직
		for(DiaryVO diary : list) {
			// 현재시간
			long now = System.currentTimeMillis();
			// 각 게시물들의 작성 시간
			long regTime = diary.getRegDate().getTime();
			
			if(now - regTime < 60 * 60 * 24 * 1000) {
				diary.setNewMark(true);
			}
		}
		
		return list;
	}


	
	// 총 일기 갯수
	@Override
	public Integer countDiaries(String userId, SearchVO search) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("userId", userId);
		datas.put("pageStart", search.getPageStart());
		datas.put("condition", search.getCondition());
		datas.put("keyword", search.getKeyword());
		return mapper.countDiaries(datas);
	}



	@Override
	public void update(DiaryVO diary) {
		
		// 썸네일 경로 수정 작업
		String content = diary.getContent();
		String imgReg = "(<img[^>]*src\s*=\s*[\"']?([^>\"\']+)[\"']?[^>]*>)";
		Pattern pattern = Pattern.compile(imgReg);
		Matcher matcher = pattern.matcher(content);
		if(matcher.find()) {
			diary.setThumbImg(matcher.group(2));
		}		
		
		mapper.update(diary);
		
	}

}
