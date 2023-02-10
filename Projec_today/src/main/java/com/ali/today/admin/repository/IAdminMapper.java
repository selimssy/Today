package com.ali.today.admin.repository;

import java.util.List;

import com.ali.today.user.model.UserVO;

public interface IAdminMapper {
	
	// 전체 컨텐츠 현황 조회
	List<UserVO> getUserList(String userId);
	
	
	
}
