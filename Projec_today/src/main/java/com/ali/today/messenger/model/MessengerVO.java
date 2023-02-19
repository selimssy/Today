package com.ali.today.messenger.model;

import java.util.Date;

public class MessengerVO {
	
	private Integer msgNo;
	private String senderId;
	private String recvId;
	private Date sendTime;
	private String content;
	private Integer readChk;
	
	
	public Integer getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(Integer msgNo) {
		this.msgNo = msgNo;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getRecvId() {
		return recvId;
	}
	public void setRecvId(String recvId) {
		this.recvId = recvId;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getReadChk() {
		return readChk;
	}
	public void setReadChk(Integer readChk) {
		this.readChk = readChk;
	}
	
	
	@Override
	public String toString() {
		return "MessengerVO [msgNo=" + msgNo + ", senderId=" + senderId + ", recvId=" + recvId + ", sendTime="
				+ sendTime + ", content=" + content + ", readChk=" + readChk + "]";
	}
	
	
}
