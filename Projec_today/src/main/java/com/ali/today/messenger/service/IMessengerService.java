package com.ali.today.messenger.service;

import com.ali.today.messenger.model.MessengerVO;

public interface IMessengerService {

	//쪽지 보내기
	void sendMsg(MessengerVO message);
	
}
