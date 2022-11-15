package com.ali.today.user.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ali.today.user.model.PetVO;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.repository.IUserMapper;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/mvc-config.xml"})
public class UserTest {

	@Autowired
	IUserMapper mapper;
	
	
	@Test
	public void register() {
		
		UserVO user = new UserVO();
		user.setUserId("abc1234");
		user.setPassword("abc1234!!");
		user.setName("홍길동");
		
		mapper.register(user);
		System.out.println("회원가입 성공!");
	}
	
	
	
	@Test
	public void registerPet() {
		
		for(int i=1; i<=50; i++) {
			
			PetVO pet = new PetVO();
			pet.setUserId("rupong");
			pet.setPetName("아롱이");
			pet.setAge(3);
			pet.setGender("여");
			pet.setFeature("솜뭉치");
			pet.setImagePath("/resources/images/noticeImg/infoPhoto.png");
			pet.setOpen(1);
			
			mapper.registerPet(pet);
			
		}
		
		System.out.println("반려동물 등록 성공");
	}
	
	
	
	
//	@Test
//	public void deletePet() {
//		for(int i=7; i<=56; i++) {
//			mapper.deletePet(i);
//		}
//	}
	
	
	
	
	
}
