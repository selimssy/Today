package com.ali.today.admin.service;

import java.util.List;
import java.util.Map;

import com.ali.today.common.SearchVO;
import com.ali.today.diary.model.ScheduleVO;

public interface IAdminService {
	
	// 컨텐츠 현황(계정별) 조회
	Map<String, Integer> contentStats(String userId);
	
	// 컨텐츠 현황(반려견별) 조회
	Map<String, Object> petContent(Integer petId);
	
	
	
	
}
