package com.ali.today.messenger.repository;

import com.ali.today.messenger.model.MessengerVO;

public interface IMessengerMapper {
	
	//쪽지 보내기
	void sendMsg(MessengerVO message);
	
}
