package com.ali.today.diary.repository;

import com.ali.today.diary.model.DiaryVO;


public interface IDiaryMapper {
	
	
	
	
	
	
	
	/////////////////////////////////////////////////
	
	
	// 일기 추가
	void insert(DiaryVO diary);
	
	// 게시글 상세 조회기능
	DiaryVO getDiary(Integer diaryNo);
	
	// 일기 삭제
	void delete(Integer diaryNo);
	
	
	
}
