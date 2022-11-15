package com.ali.today.diary.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ali.today.common.SearchVO;
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


	// 일기 삭제
	@Override
	public void delete(Integer diaryNo) {
		mapper.delete(diaryNo);
	}


	
	// 전체 일기 리스트
	@Override
	public List<DiaryVO> getDiaryList(SearchVO search) {
		
		List<DiaryVO> list = mapper.getDiaryList(search);
		
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
	public Integer countDiaries(SearchVO search) {
		return mapper.countDiaries(search);
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
