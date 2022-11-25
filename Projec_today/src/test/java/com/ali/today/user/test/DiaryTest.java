package com.ali.today.user.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ali.today.diary.model.DiaryVO;
import com.ali.today.diary.repository.IDiaryMapper;
import com.ali.today.mypet.model.GalleryVO;
import com.ali.today.mypet.repository.IGalleryMapper;


@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/mvc-config.xml"})
public class DiaryTest {

	@Autowired
	IDiaryMapper mapper;
	
	@Autowired
	IGalleryMapper gmapper;
	
	
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
	
	
	
	// 갤러리 더미데이터
	@Test
	public void insertGallery() {
		
		for(int i=1; i<=200; i++) {
			GalleryVO gallery = new GalleryVO();
			gallery.setTitle("갤러리 테스트" + i);
			gallery.setContent("갤러리 테스트" + i);
			gallery.setImagePath("/resources/images/noticeImg/infoPhoto.png");
			gallery.setPetId(59);
			
			gmapper.register(gallery);
		}
		System.out.println("갤러리 등록 성공");
	}
	
	
}
