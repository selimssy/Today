package com.ali.today.messenger.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MessengerVO {
	
	private Integer msgNo;
	private String senderId;
	private String nick;
	private String recvId;
	private String content;
	private Integer readChk;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date sendTime;
	
	
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
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
	@Override
	public String toString() {
		return "MessengerVO [msgNo=" + msgNo + ", senderId=" + senderId + ", nick=" + nick + ", recvId=" + recvId
				+ ", content=" + content + ", readChk=" + readChk + ", sendTime=" + sendTime + ", getMsgNo()="
				+ getMsgNo() + ", getSenderId()=" + getSenderId() + ", getRecvId()=" + getRecvId() + ", getSendTime()="
				+ getSendTime() + ", getContent()=" + getContent() + ", getReadChk()=" + getReadChk() + ", getNick()="
				+ getNick() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
}
