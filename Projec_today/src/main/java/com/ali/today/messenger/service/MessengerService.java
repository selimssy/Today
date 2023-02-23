package com.ali.today.messenger.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ali.today.common.SearchVO;
import com.ali.today.messenger.model.MessengerVO;
import com.ali.today.messenger.repository.IMessengerMapper;

@Service
public class MessengerService implements IMessengerService {
	
	@Autowired
	IMessengerMapper mapper;
	
	
	//쪽지 보내기
	@Override
	public void sendMsg(MessengerVO message) {
		mapper.sendMsg(message);
	}
	
	//받은 쪽지함 리스트
	@Override
	public List<MessengerVO> getRecvMsg(String userId, SearchVO search) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("userId", userId);
		datas.put("pageStart", search.getPageStart());
		datas.put("condition", search.getCondition());
		datas.put("keyword", search.getKeyword());
		List<MessengerVO> list = mapper.getRecvMsg(datas);
		
		return list;
	}
		
	//받은 쪽지 갯수
	@Override
	public Integer countRecvMsg(String userId, SearchVO search) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("userId", userId);
		datas.put("condition", search.getCondition());
		datas.put("keyword", search.getKeyword());
		return mapper.countRecvMsg(datas);
	}
		
	//쪽지 삭제
	@Override
	public void delMsg(Integer msgNo) {
		mapper.delMsg(msgNo);
	}
		
	//읽은 쪽지 마크 해제
	@Override
	public void readChk(Integer msgNo) {
		mapper.readChk(msgNo);
	}
	
	//새쪽지 여부
	@Override
	public Integer newMsg(String userId) {
		return mapper.newMsg(userId);
	}
	
}
