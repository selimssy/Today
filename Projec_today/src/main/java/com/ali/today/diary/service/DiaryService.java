package com.ali.today.diary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ali.today.diary.model.DiaryVO;
import com.ali.today.diary.repository.IDiaryMapper;


@Service
public class DiaryService implements IDiaryService{
	
	@Autowired
	IDiaryMapper mapper;
	
	
	@Override
	public void insert(DiaryVO diary) {
		mapper.insert(diary);
	}

}
