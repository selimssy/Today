package com.ali.today.admin.service;

import java.util.Map;

public interface IAdminService {
	
	// 컨텐츠 현황 조회
	Map<String, Integer> contentStats(String userId);

}
