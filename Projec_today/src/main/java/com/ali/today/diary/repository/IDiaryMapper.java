package com.ali.today.diary.repository;

import java.util.List;
import java.util.Map;

import com.ali.today.common.SearchVO;
import com.ali.today.diary.model.DiaryVO;
import com.ali.today.diary.model.ScheduleVO;



public interface IDiaryMapper {
		
	// 스케줄 추가
	void insertSchedule(ScheduleVO scheduleVO);
	
	// 특정 날짜 스케줄 조회
	List<ScheduleVO> getOnedaySchedules(Map<String, Object> datas);
	
	// 특정 스케줄 조회
	ScheduleVO getOnePlan(Integer scheduleId);
	
	// 특정 날짜 스케줄 수
	Integer countSchedule(ScheduleVO scheduleVO);
	
	// 스케줄 수정
	void modifySchedule(ScheduleVO scheduleVO);
	
	// 스케줄 삭제
	void deleteSchedule(Integer scheduleId);
	
	// 회원 탈퇴시 모든 스케줄 삭제
	void deleteAllSchedule(String userId);
	
	// 전체(특정 계정) 스케줄 갯수
	Integer scheduleCnt(String userId); // 관리자 페이지
	
	
	/////////////////////////////////////////////////
	
	
	// 일기 추가
	void insert(DiaryVO diary);
	
	// 일기 상세 조회
	DiaryVO getDiary(Integer diaryNo);
	
	// 일기 목록 조회기능(검색, 페이징 기능 포함)
	List<DiaryVO> getDiaryList(Map<String, Object> datas);
	
	// 일기 삭제
	void delete(Integer diaryNo);
	
	// 일기 수정
	void update(DiaryVO diary);
	
	// 게시물 수 조회(검색, 페이징 기능 포함)
	Integer countDiaries(Map<String, Object> datas);
	
	// 회원탈퇴시 모든 일기 삭제
	void deleteAllDiary(String userId);
	
	// 전체(특정 계정) 일기 갯수
	Integer diaryCnt(String userId); // 관리자 페이지
	
}
