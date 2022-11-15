package com.ali.today.diary.service;

import java.util.List;

import com.ali.today.common.SearchVO;
import com.ali.today.diary.model.DiaryVO;

public interface IDiaryService {
	
	
	
	
	
	
	
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
