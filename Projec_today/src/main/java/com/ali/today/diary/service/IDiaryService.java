package com.ali.today.diary.service;

import java.util.List;

import com.ali.today.common.SearchVO;
import com.ali.today.diary.model.DateData;
import com.ali.today.diary.model.DiaryVO;
import com.ali.today.diary.model.ScheduleVO;

public interface IDiaryService {
	
	// 스케줄 추가
	void insertSchedule(ScheduleVO scheduleVO);
	
	// 특정 날짜 스케줄 조회
	List<ScheduleVO> getOnedaySchedules(String userId, DateData dateData);
	
	// 해당 날짜 스케줄 수
	Integer countSchedule(ScheduleVO scheduleVO);
	
	
	
	
	
	/////////////////////////////////////////////////
	
	
	// 일기 추가
	void insert(DiaryVO diary);
	
	// 게시글 상세 조회
	DiaryVO getDiary(Integer diaryNo);
	
	// 일기 목록 조회기능(검색, 페이징 기능 포함)
	List<DiaryVO> getDiaryList(SearchVO search);	
	
	// 일기 삭제
	void delete(Integer diaryNo);
	
	// 일기 수정
	void update(DiaryVO diary);
	
	// 게시물 수 조회(검색, 페이징 기능 포함)
	Integer countDiaries(SearchVO search);
	
	
	
}
