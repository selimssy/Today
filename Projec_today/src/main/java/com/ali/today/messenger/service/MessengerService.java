package com.ali.today.messenger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
