package com.ali.today.messenger.service;

import java.util.List;

import com.ali.today.common.SearchVO;
import com.ali.today.messenger.model.BlockVO;
import com.ali.today.messenger.model.MessengerVO;
import com.ali.today.user.model.UserVO;

public interface IMessengerService {

	//쪽지 보내기
	void sendMsg(MessengerVO message);
	
	//받은 쪽지함 리스트
	List<MessengerVO> getRecvMsg(String userId, SearchVO search);
	
	//받은 쪽지 갯수
	Integer countRecvMsg(String userId, SearchVO search);
	
	//쪽지 삭제
	void delMsg(Integer msgNo);
	
	//읽은 쪽지 마크 해제
	void readChk(Integer msgNo);
	
	//새쪽지 여부
	Integer newMsg(String userId);
	
	//펫편지 수신 여부
	Integer petLetter(String userId);
	
	//쪽지 차단
	void blockUser(BlockVO blockVO);
	
	//차단한 회원 목록 조회
	List<BlockVO> blockList(String userId);
	
}
