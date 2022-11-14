package com.ali.today.diary.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ali.today.diary.model.DiaryVO;
import com.ali.today.diary.repository.IDiaryMapper;


@Service
public class DiaryService implements IDiaryService{
	
	@Autowired
	IDiaryMapper mapper;
	
	
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
	}

	
	
	// 일기 상세조회
	@Override
	public DiaryVO getDiary(Integer diaryNo) {
		return mapper.getDiary(diaryNo);
	}



	@Override
	public void delete(Integer diaryNo) {
		mapper.delete(diaryNo);
	}

}
