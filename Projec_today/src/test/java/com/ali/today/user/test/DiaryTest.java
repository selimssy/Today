package com.ali.today.user.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ali.today.diary.model.DiaryVO;
import com.ali.today.diary.repository.IDiaryMapper;


@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/mvc-config.xml"})
public class DiaryTest {

	@Autowired
	IDiaryMapper mapper;
	
	
	// 게시글 등록 테스트
	@Test
	public void insertTest() {
		
		for(int i=1; i<=320; i++) {
		
			DiaryVO diary = new DiaryVO();
			diary.setTitle("테스트" + i);
			diary.setWriter("sarang");
			diary.setContent("테스트 게시물 컨텐츠" + i);
			mapper.insert(diary);
		
		}
		
		System.out.println("게시물 등록 성공!");
	}
	
	
}
