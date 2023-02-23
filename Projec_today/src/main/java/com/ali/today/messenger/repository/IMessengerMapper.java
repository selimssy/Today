package com.ali.today.messenger.repository;

import java.util.List;
import java.util.Map;

import com.ali.today.messenger.model.MessengerVO;

public interface IMessengerMapper {
	
	//쪽지 보내기
	void sendMsg(MessengerVO message);
	
	//받은 쪽지함 리스트
	List<MessengerVO> getRecvMsg(Map<String, Object> datas);
			
	//받은 쪽지 갯수
	Integer countRecvMsg(Map<String, Object> datas);
	
	//쪽지 삭제
	void delMsg(Integer msgNo);
	
	//읽은 쪽지 마크 해제
	void readChk(Integer msgNo);
	
	//새쪽지 여부
	Integer newMsg(String userId);
	
}
