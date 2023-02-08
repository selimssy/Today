package com.ali.today.admin.repository;

import java.util.List;

import com.ali.today.user.model.UserVO;

public interface IAdminMapper {
	
	// 회원 조회
	List<UserVO> getUserList();
}
