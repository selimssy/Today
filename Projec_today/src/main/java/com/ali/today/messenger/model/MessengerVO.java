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
	private String classify;
	private String imagePath;
	
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
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}	
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	@Override
	public String toString() {
		return "MessengerVO [msgNo=" + msgNo + ", senderId=" + senderId + ", nick=" + nick + ", recvId=" + recvId
				+ ", content=" + content + ", readChk=" + readChk + ", classify=" + classify + ", imagePath="
				+ imagePath + ", sendTime=" + sendTime + "]";
	}
	
}
