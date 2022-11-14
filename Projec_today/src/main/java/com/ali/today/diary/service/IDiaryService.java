package com.ali.today.diary.service;

import com.ali.today.diary.model.DiaryVO;

public interface IDiaryService {
	
	
	
	
	
	
	
	/////////////////////////////////////////////////
	
	
	// 일기 추가
	void insert(DiaryVO diary);
	
	// 게시글 상세 조회
	DiaryVO getDiary(Integer diaryNo);
	
	// 일기 삭제
	void delete(Integer diaryNo);
	
	
	
}
